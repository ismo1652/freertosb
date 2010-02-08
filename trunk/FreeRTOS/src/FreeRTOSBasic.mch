/* 
FreeRTOS
Author: David Deharbe and Stephenson Galvao

This machine specefic the FreeRTOS's API.

Creation date: Wed Apr 8 2009
Universidade Federal do Rio Grande do Norte
Departamento de Informática e Matemática Aplicada
Programa de Pos-Graduacao em Sistemas e Computacao
Formal Methods and Languages Research Laboratory
*/
MACHINE
    FreeRTOSBasic
    
SEES
    Types,
    FreeRTOSConfig
    
INCLUDES
    Queue,
    Task,
    Scheduler
    
PROMOTES
    xQueueCreate
    
    
VARIABLES
    tickCount,		/** total tick count */
    tickMissed
    
INVARIANT
    tickCount: TICK &
    tickMissed:TICK &
    (schedulerRunning = active ) &
    ran(mutex_holder)<:(tasks)-{idle}  \/ {TASK_NULL}&
    !mt.(mt:queues & mt:mutexes & queue_items(mt)={} => mutex_holder(mt):tasks & mutex_holder(mt)/=idle) &
    !(que,task).(que:queues & task:TASK & task:queue_sending(que)=> task:blocked)&
    !(que,task).(que:queues & task:TASK & task:queue_receiving(que) => task:blocked) 
    /*Put the request of all task in event queue have to be blocked*/
    
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
        pxQueue:queues &  
        pvItemToQueue:ITEM  &  
        xTicksToWait:TICK &
        copy_position:COPY_POSITION &
        running /= idle &
        running:ready
    THEN
       
      	 CHOICE
           		t_delayTask(xTicksToWait,running) ||
                q_insertTaskWaitingToSend(pxQueue,running) || 
                return := pdTRUE        	
            OR
                ANY 
                    task
                WHERE 
                    task:TASK & 
                    task:blocked & 
                    task:queue_receiving(pxQueue)&
                    task/:queue_sending(pxQueue) &
 					task/:pending
                THEN
                    IF pxQueue: mutexes 
                    THEN
                        IF queue_items(pxQueue)={} 
                        THEN
                            q_sendItemMutex(pxQueue,task)||
                            t_unblockMutex(task)
                        END
                    ELSE
                        q_sendItem(pxQueue,pvItemToQueue,task,copy_position)||
                    	t_unblock(task)
                    END||
                 return := pdPASS
                END
            OR
                return := errQUEUE_FULL	
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
    return,pvBuffer<--xQueueGenericReceive(pxQueue,xTicksToWait,justPeeking)=
    PRE
        active = TRUE &
        running /= idle &
        pxQueue : QUEUE &
        pxQueue : queues & 
        xTicksToWait:TICK &
        justPeeking : BOOL
    THEN
        IF xTicksToWait > 0
        THEN
            IF (queue_items(pxQueue)={}) THEN
                IF pxQueue:mutexes THEN
                    t_PriorityInherit(xTicksToWait,mutex_holder(pxQueue))                
                ELSE
                    t_delayTask(xTicksToWait,running)
                END||
                
                q_insertTaskWaitingToReceive(pxQueue,running)||/*no futuro será necessário uma reorganização para tratar a herança de prioridade*/
                return,pvBuffer:=pdTRUE,ITEM_NULL
            ELSE
                ANY 
                    task 
                WHERE 
                    task:TASK & 
                    task:queue_sending(pxQueue) & 
                    task:blocked &
                    task/:pending
                THEN         
                    pvBuffer<--q_receivedItem(pxQueue,justPeeking,task,running)||
                    IF justPeeking = FALSE THEN t_unblock(task) END
                END|| 
                return:=pdPASS
            END
        ELSE
            IF (queue_items(pxQueue)/={})THEN
                ANY 
                    task 
                WHERE 
                    task:TASK & 
                    task:queue_sending(pxQueue) & 
                    task:blocked &
                    task/:pending
                THEN         
                    pvBuffer<--q_receivedItem(pxQueue,justPeeking,task,running)||
                    IF justPeeking = FALSE THEN t_unblock(task) END
                END|| 
                return:=pdPASS
            ELSE
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
        uxPriority : PRIORITY 
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
        pxTaskToDelete/:ran(mutex_holder)/*Essa proteção não existe no freertos, verificar o que ocorre quando 
        									é uma excluida uma tarefa mantida pelo mutex */
    THEN
        t_delete (pxTaskToDelete) ||
        q_removeFromEventListQueue(pxTaskToDelete)
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
        pxTaskToSuspend /= idle
    THEN
        IF pxTaskToSuspend /: suspended	THEN
            t_suspend(pxTaskToSuspend) ||
            IF pxTaskToSuspend:blocked THEN
                q_removeFromEventListQueue(pxTaskToSuspend)
            END||
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
        
        INCLUDE_vTaskSuspend = 1 &
        suspended /= {} & 
        pxTaskToResume : TASK & 
        pxTaskToResume : suspended &
        pxTaskToResume/:pending
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
       
        xTicksToDelay : TICK & 
        INCLUDE_vTaskDelay = 1 &
        running /= idle &
        not(TICK_INCREMENT (tickCount, xTicksToDelay)=0) &
        running:ready
    THEN
        t_delayTask (TICK_INCREMENT (tickCount, xTicksToDelay),running)
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
       
        pxPreviousWakeTime : TICK & 
        xTimeIncrement : TICK & 
        running /= idle &
        INCLUDE_vTaskDelayUntil = 1
    THEN
        IF schedulerRunning =TRUE THEN 
        	SELECT
          	  TICK_INCREMENT (pxPreviousWakeTime, xTimeIncrement) /= 0
       		THEN
            	t_delayTask (TICK_INCREMENT (pxPreviousWakeTime, xTimeIncrement),running)
        	ELSE
            	skip
        	 END
     	END
     
    END;
    
    /**
    \brief	Get Tick Count
    
    \do	
    Return the current number of tick o
    
    \returns
    numberOfTicks - The current number of ticks 
    
    
    **/
    numberOfTicks <-- xTaskGetTickCount=
    PRE
       
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
    
   
    schedulerState <-- xTaskGetSchedulerState =
    PRE
        INCLUDE_xTaskGetSchedulerState = 1
    THEN
        schedulerState <-- stateScheduler
        END;
         **/
    
    /**
    \brief	Start Scheduler
    
    \do	
    Start the scheduler and create the idle task.
    **/
    vTaskStartScheduler = 
    PRE
        
        blocked = {} & suspended = {} & ready = {} &
        active=FALSE
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
        schedulerRunning = TRUE
    THEN	
        stopScheduler ||
        t_endScheduler ||
        q_endScheduler
    END;
    
    /**
    \brief	Suspend All
    
    \do	
    Suspend the scheduler activities changing its state to suspended
    **/
    vTaskSuspendAll=
    PRE
        schedulerSuspended< MAXINT
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
        schedulerSuspended>0
    THEN
        CHOICE
            resumeScheduler ||
            ANY
                unblocked
            WHERE
                unblocked : FIN(TASK) &
                unblocked <: blocked
            THEN
                t_resumeAll(unblocked) ||
                q_resumeAll(unblocked\/pending)||
                tickCount := TICK_INCREMENT(tickCount, tickMissed)
            END
        OR
            skip
        END
        
    END;
/*
SG->DD: 

Essa função não faz parte da API do FreeRTOS. Ela apenas é usada para incrementar o tick do 
processador e verificar quais tarefas devem ser retornadas no novo tick. 

Eu achava melhor colocar essa operação em Task ou tentar passar para Task_Core, sendo essa última 
uma coisa mais complicada
*/

    
    /**
    /brief tick increment
    
    /do 
    Function used for scheduler in time interruption. It increment the tick variable and check the task
    blocked list.
    **/
    incrementTick =
    PRE
        
        schedulerRunning =TRUE
    THEN
        IF schedulerSuspended = 0 THEN 
            tickCount := TICK_INCREMENT(tickCount, 1)
            
        ELSE 
            tickMissed := TICK_INCREMENT(tickCount, 1)
        END ||
        	ANY
                unblocked
            WHERE
                unblocked : FIN(TASK) &
                unblocked <: blocked &
                unblocked/\pending={}
            THEN
                t_resumeIncrement(unblocked) ||
                q_resumeAll(unblocked)
            END        
    END;

   
	vQueueDelete(pxQueue)=
	PRE
	    pxQueue:queues
	THEN
	    q_queueDelete(pxQueue)
	END;

 	
vTaskPrioritySet(pxTask,uxNewPriority )=
PRE
    pxTask:tasks &
    uxNewPriority:PRIORITY&
    active=TRUE &
    pxTask/=idle
    
THEN
    t_setPriority(pxTask,uxNewPriority)
END;


/*Semaphore functions*/

/*
	In FreeRTOS, semaphore is a parameter. This it will to be the return of the function
*/
semaphore<--vSemaphoreCreateBinary=
BEGIN
    semaphore<--q_createSemaphore(1,1)
END
;

semaphore<--xSemaphoreCreateCounting(uxMaxCount,uxInitialCount)=
PRE
    uxMaxCount:NAT &
    uxInitialCount:NAT &
    1<=uxInitialCount &
    uxInitialCount<=uxMaxCount 
THEN
    semaphore<--q_createSemaphore(uxMaxCount,uxInitialCount)
END
;

/*Mutex functions*/

xQueueHandle<--xQueueCreateMutex=
BEGIN
   xQueueHandle<--q_createMutex
END;

xQueueHandle<-- xSemaphoreCreateRecursiveMutex=
BEGIN
   xQueueHandle<--q_createMutex
END


	
END
