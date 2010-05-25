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
    Task,
    Queue
    
    
/*
CONSTANTS
    getTask
    
PROPERTIES
    getTask: TASK *TASK --> TASK
    getTask = %(tk,ctk).(tk:TASK & ctk:TASK =
 */  

VARIABLES
    tickCount,		/** total tick count */
    tickMissed
    
INVARIANT
    tickCount: TICK &
    tickMissed:TICK &
    ran(mutex_holder)<:(tasks)-{idle}  \/ {TASK_NULL}&
    !mt.(mt:queues & mt:mutexes_busy  => mutex_holder(mt):tasks & mutex_holder(mt)/=idle) &
    !(que,task).(que:queues & task:TASK & task:queue_sending(que)=> task:blocked \/ suspended)&
    !(que,task).(que:queues & task:TASK & task:queue_receiving(que) => task:blocked \/ suspended) 
    
    /*Put the request of all task in event queue have to be blocked*/
    
    
ASSERTIONS
    !(que,task).(que:queues & task:TASK & task/:blocked & task/:suspended=> task/:queue_sending(que))&
    !(que,task).(que:queues & task:TASK & task/:blocked & task/:suspended => task/:queue_receiving(que)) 
    
INITIALISATION
    tickCount := 0 ||
    tickMissed := 0 
    
OPERATIONS
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
    **/
    result, handle <-- xTaskCreate (pvTaskCode, pcName, usStackDepth, pvParameters, uxPriority) =
    PRE
        pvTaskCode : TASK_CODE & 
        pcName : NAME & 
        usStackDepth : NAT &  
        pvParameters : POW(PARAMETER) & 
        uxPriority : PRIORITY 
    THEN 
        CHOICE /*Erro para tratar a memória*/
            handle <-- t_create (uxPriority) ||
            result := pdPASS
        OR
            result := errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ||
            handle := TASK_NULL
        END	                     
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
        running:runable
    THEN
        IF
            xTicksToDelay>0 
        THEN
            ANY
                tickWakeup
            WHERE
                tickWakeup:TICK
            THEN
                t_delayTask(tickWakeup,running)
            END
        ELSE
            IF 
                active=TRUE 
            THEN 
                t_yield 
            END
        END
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
        INCLUDE_vTaskDelayUntil = 1 &
        running:runable
    THEN
        
        IF xTimeIncrement > 0 THEN
            t_delayTask (TICK_INCREMENT (pxPreviousWakeTime, xTimeIncrement),running)
        ELSE
            IF 
                active = TRUE 
            THEN
                t_yield
            END
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
        pxTaskToDelete /:ran(mutex_holder)/*Essa proteção não existe no freertos, verificar o que ocorre quando 
        									é uma excluida uma tarefa mantida pelo mutex */
	THEN			        
        t_delete (pxTaskToDelete) ||
        q_removeFromEventListQueue(pxTaskToDelete)
    END;
   
     /**
    \brief	End Scheduler
    
    \do	
    End the task of schuler
    **/
    vTaskEndScheduler =
    PRE
        active = TRUE
    THEN	
   
        t_endScheduler ||
        q_endScheduler
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
        priority <-- t_getPriority(pxTask)
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
    
    
     /**
    \brief	Resume Task
    
    \do	
    This method resume a suspended task. If the resumed task has priority greater than current task, the resumed task will 
    be the current task and the current task will go to ready task list.
    
    \parameters 
    pxTaskToResume - Task that will be resumed
    
    **/
    vTaskResume(pxTaskToResume) =
    PRE 
        
        INCLUDE_vTaskSuspend = 1 &
        suspended /= {} & 
        pxTaskToResume : TASK & 
        pxTaskToResume : suspended 
    THEN    
        t_resume (pxTaskToResume)||
       	q_removeFromEventListQueue(pxTaskToResume)
    END;
    
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
        running:runable
    THEN
       
        CHOICE
            t_delayTask(xTicksToWait,running) ||
            q_insertTaskWaitingToSend(pxQueue,running) || 
            return := pdPASS   	
        OR
            ANY 
                task
            WHERE 
                task:TASK & 
                task:blocked & 
                task:queue_receiving(pxQueue)&
                task/:queue_sending(pxQueue)
            THEN
                /*
                This will need a special function for returne a task priority when this leave the mutex*
                */
                q_sendItem(pxQueue,pvItemToQueue,task,copy_position)||
                t_removeFromEventList(task)
            END||
            return := pdPASS
            
        OR
            t_suspend(running) ||
            q_insertTaskWaitingToSend(pxQueue,running) ||
            return := pdPASS
        OR
            
            return := pdFAIL	
        END
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
        active=FALSE
    THEN
        ANY
            unblocked
        WHERE
            unblocked : FIN(TASK) &
            unblocked <: blocked
        THEN
            t_resumeAll(unblocked) ||
            q_resumeAll(unblocked)||
            tickCount := TICK_INCREMENT(tickCount, tickMissed)
        END
        
        
    END;
    
    
       
    /**
    \brief	Start Scheduler
    
    \do	
    Start the scheduler and create the idle task.
    **/
    vTaskStartScheduler = 
    PRE
        
        /*blocked = {} & suspended = {} & runable = {} &*/
        active=FALSE
    THEN
        CHOICE
            t_startScheduler
        OR
            skip
        END
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
   vTaskSuspend(pxTaskToSuspend)=
    PRE
        INCLUDE_vTaskSuspend = 1 & 
        pxTaskToSuspend : TASK &
        pxTaskToSuspend : tasks &
        pxTaskToSuspend /= idle
    THEN
        IF pxTaskToSuspend /: suspended	THEN
            t_suspend(pxTaskToSuspend) ||
			q_removeFromEventListQueue(pxTaskToSuspend)
        END
    END;
    
    
	/**
    \brief	Suspend All
    
    \do	
    Suspend the scheduler activities changing its state to suspended
    **/
    vTaskSuspendAll=
    PRE
        active=TRUE
    THEN
        t_suspendAll
    END;
    
    
    
    
    xQueueHandle <--xQueueCreate(uxQueueLength,uxItemSize)=
    PRE
        uxQueueLength: NAT & 
        uxItemSize:NAT
    THEN
        CHOICE
            xQueueHandle<-- q_queueCreate(uxQueueLength, uxItemSize)
        OR
            xQueueHandle:=QUEUE_NULL
        END
    END;
    
    
    vQueueDelete(pxQueue)=
    PRE
        pxQueue:queues
    THEN
        q_queueDelete(pxQueue)
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
        justPeeking : BOOL &
        running:runable & 
        running/=TASK_NULL
    THEN
        
        IF queue_items(pxQueue) ={} THEN
            CHOICE
                IF pxQueue:mutexes THEN
                    IF pxQueue:mutexes_busy THEN
                        t_PriorityInherit(xTicksToWait,mutex_holder(pxQueue))||
                        q_insertTaskWaitingToReceive(pxQueue,running)
                    END
                ELSE
                    t_delayTask(xTicksToWait,running)||
                    q_insertTaskWaitingToReceive(pxQueue,running)
                END||
                return,pvBuffer:=pdPASS,ITEM_NULL
            OR
                t_suspend(running)||
                q_insertTaskWaitingToReceive(pxQueue,running)||
                return,pvBuffer:=pdPASS,ITEM_NULL
            OR
                
                return,pvBuffer:=pdFAIL,ITEM_NULL
            END
            
        ELSE
            ANY 
                task 
            WHERE 
                task:TASK & 
                task:queue_sending(pxQueue) & 
                task:blocked 
            THEN         
                pvBuffer<--q_receivedItem(pxQueue,justPeeking,task,running)||
                IF 
                    justPeeking = FALSE 
                THEN 
                    t_removeFromEventList(task) 
                END
            END|| 
            return:=pdPASS
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
        active =TRUE
    THEN
        
        tickCount := TICK_INCREMENT(tickCount, 1)||
        ANY
            unblocked
        WHERE
            unblocked:FIN(TASK) &
            unblocked <: blocked  
        THEN
            t_resumeAll(unblocked)||
            q_resumeAll(unblocked)
        END
        
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
