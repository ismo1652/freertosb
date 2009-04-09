/* FreeRTOS
* Author: david
* Creation date: Wed Apr 8 2009
*/
MACHINE
    FreeRTOS
    
SEES
    Types,
    FreeRTOSConfig,
    QueueContext
    
INCLUDES
    QueueCore,
    TaskCore,
    Scheduler
    
VARIABLES
    tickCount,		/** total tick count */
    tickMissed
    
INVARIANT
    tickCount: TICK &
    tickMissed:TICK &
    scheduler: SCHEDULER_STATE &
    (scheduler = taskSCHEDULER_NOT_STARTED <=> (active = FALSE)) &
    ((scheduler = taskSCHEDULER_RUNNING or scheduler = taskSCHEDULER_SUSPENDED) <=> (active = TRUE))
    
INITIALISATION
    tickCount := 0 ||
    tickMissed := 0 
    
OPERATIONS
    
    /**
    /brief Queue Send
    
    /do	
    Send one item for indicate queue. If the queue is full and the task can waiting for until for one space in queue
    the current task is block and insert in the set of tasks that waiting to send a item, other wise the item is insert in
    the queue
    
    /paramenters
    pxQueue - Queue that will send the item
    pvItemToQueue - Item that will be send to the queue
    xTicksToWait - Time that the task can waiting for one space in queue, wich the queue is full
    
    **/    
    return <-- xQueueGenericSend(pxQueue, pvItemToQueue, xTicksToWait,copy_position)=
    PRE
        pxQueue:queues  &  
        pvItemToQueue:ITEM  &  
        xTicksToWait:TICK &
        copy_position:COPY_POSITION &
        active = TRUE &
        running /= idle
    THEN
        IF (xTicksToWait>0) 
        THEN 
            CHOICE
                insertTaskWaitingToSend(pxQueue,running) || 
                t_delayTask(xTicksToWait) ||
                return:=pdTRUE        	
            OR
                ANY 
                    task
                WHERE 
                    task:TASK & 
                    task:blocked & 
                    task:queue_receiving(pxQueue)
                THEN
                    sendItem(pxQueue,pvItemToQueue,task,copy_position)||
                    t_unblock(task)||
                    return:=pdPASS
                END        
            END
        ELSE
            CHOICE
                ANY 
                    task
                WHERE 
                    task:TASK & 
                    task:blocked & 
                    task:queue_receiving(pxQueue) 
                    
                THEN
                    sendItem(pxQueue,pvItemToQueue,task,copy_position)||
                    t_unblock(task)||
                    return:=pdPASS
                END
            OR
                return:=errQUEUE_FULL	
            END 		
        END
    END;
    
    
    /**
    /brief Queue Recived Item
    
    /do	
    Remove and return one item of queue. If the queue is empty and the task can wainting for one item arrive in the queue
    the current task is block and insert in the set reciving, set of tasks waiting to recive one item of queue. 
    
    /paramenters
    pxQueue - Queue that will send the item
    xTicksToWait - Time that the task can waiting for one item arrive in queue, wich the queue is empty
    
    /note
    In the original implementation pvBuffer is passed as reference and if the queue is empty, nothing is change 
    in the pvBuffer. Here it's implement as return of function and if the queue is empty, the ITEM_NULL is return
    
    **/ 
    return,pvBuffer<--xQueueGenericReceive(xQueue,xTicksToWait,justPeeking)=
    PRE
        active = TRUE &
        running /= idle &
        xQueue : QUEUE &
        xQueue : queues & 
        xTicksToWait:TICK &
        justPeeking : BIT
    THEN
        IF xTicksToWait > 0
        THEN
            CHOICE
                insertTaskWaitingToRecived(xQueue,running)||
                t_delayTask(xTicksToWait)||
                return,pvBuffer:=pdTRUE,ITEM_NULL
            OR
                ANY 
                    task 
                WHERE 
                    task:TASK & 
                    task: queue_sending(xQueue) & 
                    task:blocked
                THEN         
                    pvBuffer<--receivedItem(xQueue,justPeeking,task)||
                    IF justPeeking=pdFALSE THEN t_unblock(task) END
                END|| 
                return:=pdPASS
            END
        ELSE
            CHOICE
                ANY 
                    task 
                WHERE 
                    task:TASK & 
                    task:queue_sending(xQueue) & 
                    task:blocked
                THEN         
                    pvBuffer<--receivedItem(xQueue,justPeeking,task)||
                    IF justPeeking=pdFALSE THEN t_unblock(task) END
                END|| 
                return:=pdPASS
            OR
                return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL
            END
        END
    END;
    
    /**	
    \brief Task creation
    
    \do 
    This method create a new. The created task have the state ready, if the its priority is less
    equals than the current task priority, otherwise the task will have the state running and the
    current task will change its state to ready.
    
    \parameters
    pvTaskCode - Code that will be executed by the task
    pcName - The task name
    usStackDepth - The length of task stack
    pvParameters - Then parameters use for the task code 
    uxPriority - The priority of the task
    \returns 
    result - Indicate if the task was created or not
    handle - Return the handle for created task or return NULL task if the task couldn't created.
    \note 
    The actual function takes the handled as a parameter passed by reference.
    
    */
    result, handle <-- xTaskCreate (pvTaskCode, pcName, usStackDepth, pvParameters, uxPriority) =
    PRE
        pvTaskCode : TASK_CODE & 
        pcName : NAME & 
        usStackDepth : NAT &  
        pvParameters : POW(PARAMETER) & 
        uxPriority : PRIORITY &
        scheduler = taskSCHEDULER_NOT_STARTED
    THEN 
        CHOICE 
            handle <-- t_create (uxPriority) ||
            result := pdPASS
        OR
            result := errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ||
            handle :: TASK
        END	                     
    END;
    
    /**
    \brief Delete Task
    
    \do	
    Delete a task managed by FreeRTOS. If the task deleted is the current task, a task, with the ready
    state and priority great or equals than the others tasks in ready state, will be the current task and
    change its state for running. The NULL task cannot be deleted.
    
    \parameters 
    pxTaskToDelete - Task that will be deleted
    
    **/
    vTaskDelete(pxTaskToDelete)=
    PRE
        INCLUDE_vTaskDelete = 1 & 
        pxTaskToDelete : TASK &
        pxTaskToDelete : tasks &
        pxTaskToDelete /= idle &
        scheduler = taskSCHEDULER_RUNNING
    THEN
        t_delete (pxTaskToDelete) ||
        removeFromEventListQueue(pxTaskToDelete)
    END;
    
    /**
    \brief Suspend Task
    
    \do	
    This method change the state of passed task for 'suspended'. If the task that will be suspend is 
    the current task, the task with highest priority in ready task list will be the current task
    changing its state to running.
    
    \parameters 
    pxTaskToDelete - Task that will be deleted
    
    \returns 
    rr - Return pdTRUE if the task was suspended with success and pdFALSE otherwise.
    
    **/
    rr <-- vTaskSuspend(pxTaskToSuspend)=
    PRE
        INCLUDE_vTaskSuspend = 1 & 
        pxTaskToSuspend : TASK &
        pxTaskToSuspend : tasks &
        pxTaskToSuspend /= idle &
        scheduler = taskSCHEDULER_RUNNING
    THEN
        IF pxTaskToSuspend /: suspended	THEN
            t_suspend (pxTaskToSuspend) ||
            rr := pdTRUE	    
        ELSE 
            rr := pdFALSE   
        END
    END;
    
    /**
    \brief	Resume Task
    
    \do	
    This method resume a suspended task. If the resumed task has priority greater than current task, the resumed task will be the current task and the current task will go to ready task list.
    
    \parameters 
    pxTaskToResume - Task that will be resumed
    
    **/
    vTaskResume(pxTaskToResume) =
    PRE 
        scheduler = taskSCHEDULER_RUNNING &
        INCLUDE_vTaskSuspend = 1 &
        suspended /= {} & 
        pxTaskToResume : TASK & 
        pxTaskToResume : suspended
    THEN    
        t_resume (pxTaskToResume)	
    END;
    
    /**
    \brief	Get Task Priority
    
    \do	
    Get the priority of the task passed
    
    \parameters 
    pxTask - Task that will be returned the priority
    
    \returns
    priority - Priority of the passed task
    
    **/
    priority <-- uxTaskPriorityGet(pxTask)=
    PRE
        pxTask : TASK &
        pxTask : tasks & 
        INCLUDE_uxTaskPriorityGet = 1 
    THEN 
        priority <-- t_getPriority (pxTask)
    END;
    
    /**
    \brief	Get Current Task
    
    \do	
    Return the currently running task
    
    \returns
    cTask - The currently running task
    
    **/
    cTask <-- xTaskGetCurrentTaskHandle=
    PRE
        scheduler = taskSCHEDULER_RUNNING &
        INCLUDE_xTaskGetCurrentTaskHandle = 1
    THEN
        cTask <-- t_getCurrent
    END;
    
    /**
    \brief	Get Number of Task
    
    \do	
    Get the number of tasks managed by the FreeRTOS
    
    \returns
    numberOfTasks - Priority of the passed task
    
    **/
    numberOfTasks <-- uxTaskGetNumberOfTasks =
    BEGIN
        numberOfTasks <-- t_getNumberOfTasks
    END;
    
    /**
    \brief	Delay Task
    
    \do	
    Delay the currently task for a given number of tick  and choice a new task with ready state 
    to run. The time of delay task is relative to the time at the method was called. This method 
    is not good for cyclical task.
    
    \paramenters
    xTicksToDelay - The amount of tick that the current task should block
    
    **/
    vTaskDelay(xTicksToDelay)=
    PRE
        scheduler = taskSCHEDULER_RUNNING &
        xTicksToDelay : TICK & 
        INCLUDE_vTaskDelay = 1 &
        running /= idle &
        not(TICK_INCREMENT (tickCount, xTicksToDelay)=0)
    THEN
        t_delayTask (TICK_INCREMENT (tickCount, xTicksToDelay))
    END;
    
    /**
    \brief	Delay Task
    
    \do	
    Blocked,the task currently for then number of tick, take with reference the time of last unblocked
    task, and choice a new task with ready state to run. This method is used in cyclical tasks.
    
    \parameters
    pxPreviousWakeTime - Time at which the task was last unblocked
    xTimeIncrement- Time that will increment the pxPreviousWakeTime.
    
    **/
    vTaskDelayUntil(pxPreviousWakeTime, xTimeIncrement) =
    PRE
        scheduler = taskSCHEDULER_RUNNING &
        pxPreviousWakeTime : TICK & 
        xTimeIncrement : TICK & 
        running /= idle &
        INCLUDE_vTaskDelayUntil = 1
    THEN
        SELECT
            TICK_INCREMENT (pxPreviousWakeTime, xTimeIncrement) /= 0
        THEN
            t_delayTask (TICK_INCREMENT (pxPreviousWakeTime, xTimeIncrement))
        ELSE
            skip
        END
    END;
    
    /**
    \brief	Get Tick Count
    
    \do	
    Return the current number of tick 
    
    \returns
    numberOfTicks - The current number of ticks 
    
    
    **/
    numberOfTicks <-- xTaskGetTickCount=
    PRE
        scheduler = taskSCHEDULER_RUNNING &
        INCLUDE_xTaskGetCurrentTaskHandle = 1
    THEN
        numberOfTicks := tickCount
    END;
    
    /**
    \brief	Get Scheduler State
    
    \do	
    Get the currently state of the scheduler
    
    \returns
    schedulerState - The currently state of the scheduler
    
    **/
    schedulerState <-- xTaskGetSchedulerState =
    PRE
        INCLUDE_xTaskGetSchedulerState = 1
    THEN
        schedulerState <-- stateScheduler
    END;
    
    /**
    \brief	Start Scheduler
    
    \do	
    Start the scheduler and create the idle task.
    **/
    vTaskStartScheduler = 
    PRE
        scheduler = taskSCHEDULER_NOT_STARTED &
        blocked = {} & suspended = {} & ready = {}  	
    THEN
        CHOICE
            t_startScheduler||
            startScheduler
        OR
            skip
        END
    END;
    
    /**
    \brief	End Scheduler
    
    \do	
    End the task of schuler
    **/
    vTaskEndScheduler =
    PRE
        scheduler = taskSCHEDULER_RUNNING
    THEN	
        stopScheduler ||
        t_endScheduler
    END;
    
    /**
    \brief	Suspend All
    
    \do	
    Suspend the scheduler activities changing its state to suspended
    **/
    vTaskSuspendAll=
    PRE
        scheduler = taskSCHEDULER_RUNNING
    THEN
        suspendScheduler   		
    END;
    
    /**
    \brief	Resume All
    
    \do	
    Resume the scheduler:
    increment the tick with missed ticks; 
    verify the list of blocked tasks to unblock the tasks with expired timers.
    
    
    **/
    xTaskResumeAll = 
    PRE
        scheduler = taskSCHEDULER_SUSPENDED
    THEN
        CHOICE
            resumeScheduler ||
            t_resumeAll (TICK_INCREMENT(tickCount, tickMissed)) ||
            tickCount := TICK_INCREMENT(tickCount, tickMissed)
        OR
            skip
        END
        
    END;
    
    /**
    /brief tick increment
    
    /do 
    Function used for scheduler in time interruption. It increment the tick variable and check the task
    blocked list.
    **/
    incrementTick =
    PRE
        scheduler /= taskSCHEDULER_NOT_STARTED
    THEN
        IF scheduler = taskSCHEDULER_RUNNING THEN 
            tickCount := TICK_INCREMENT(tickCount, 1)
        ELSE 
            tickMissed := TICK_INCREMENT(tickCount, 1)
        END ||
        t_resumeAll (TICK_INCREMENT(tickCount, 1)) 
    END
END