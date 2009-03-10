/* Task_Basic

 \brief Basic layer of definitions for task support in FreeRTOS.
 
 This machine defines the concept of a task in FreeRTOS and some of the core operations related to tasks that 
 do not depend on definitions in other modules, such as queues.

 Some concepts are not handled:
 	- switch context when the tick interruption occur
 	- Block of scheduler activites in the critical operation
 	- Meomry manager
 	- Task's Stack
 	- Task's function and pointer to function
 	- Priorities
 
 Author: Stephenson Galvao, David Deharbe
 Creation date: Fri Dec 5 2008
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
*/
MACHINE

    Task_Basic

SEES

    FreeRTOSConfig,
    Types
    
INCLUDES

    Task_Core,
    Queue_Core
SETS
    SCHEDULER_STATE = {taskSCHEDULER_NOT_STARTED, taskSCHEDULER_RUNNING, taskSCHEDULER_SUSPENDED}
    
VARIABLES
    
	tickCount,		/** total tick count */
	tickMissed,
	scheduler
   
INVARIANT
	tickCount: TICK &
	tickMissed:TICK &
	scheduler: SCHEDULER_STATE

INITIALISATION
    tickCount := 0 ||
    tickMissed := 0 ||
    scheduler := taskSCHEDULER_NOT_STARTED
    
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
			
	*/
	result, handle <-- xTaskCreate (pvTaskCode, pcName, usStackDepth, pvParameters, uxPriority) =
	PRE
    	pvTaskCode : TASK_CODE & 
    	pcName : NAME & 
    	usStackDepth : NATURAL &  
    	pvParameters <: PARAMETER & 
    	uxPriority : PRIORITY
	THEN 
	    CHOICE 
        	handle <-- t_create (uxPriority) ||
        	result := pdPASS
		OR
        	result, handle := errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY, TASK_NULL
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
   		pxTaskToDelete : tasks &
   		pxTaskToDelete /= TASK_NULL &
   		not(tasks = {pxTaskToDelete})
   		
	THEN
    	t_delete (pxTaskToDelete)||
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
    	pxTaskToSuspend : tasks &
    	pxTaskToSuspend /= TASK_NULL
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
			This method resume a suspended tasks. If the task resumed have the priority great than current task.
			the resumed task will be the current task and the current task will go to ready task list.
			 
		\parameters 
			pxTaskToResume - Task that will be resume
			
	**/
	vTaskResume(pxTaskToResume) =
	PRE 
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
    	pxTask : tasks & INCLUDE_uxTaskPriorityGet = 1 
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
		\brief	Get Scheduler State
		
		\do	
			Get the currently state of the scheduler
			
		\returns
			schedulerState - The currently state of the scheduler
			
	**/
	schedulerState <-- xTaskGetSchedulerState=
	PRE
    	INCLUDE_xTaskGetSchedulerState = 1
	THEN
    	schedulerState := scheduler
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
    	running /= TASK_NULL &
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
    	pxPreviousWakeTime : TICK & 
    	xTimeIncrement : TICK & 
    	running /= TASK_NULL &
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
    	INCLUDE_xTaskGetCurrentTaskHandle = 1
	THEN
    	numberOfTicks := tickCount
	END;
	
	/**
		\brief	Start Scheduler
		
		\do	
			Start the scheduler and create the idle task.
	**/
	vTaskStartScheduler = 
	PRE
    	scheduler = taskSCHEDULER_NOT_STARTED &
    	running = TASK_NULL &
    	blocked = {} & suspended = {} & ready = {}  	
	THEN
	    CHOICE
	        t_startScheduler||
	        scheduler:=taskSCHEDULER_RUNNING
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
	    t_endScheduler ||
    	scheduler := taskSCHEDULER_NOT_STARTED
	END;
	
	/**
		\brief	Suspend All
		
		\do	
			Suspend the scheduler activities changing its state to suspended
	**/
	vTaskSuspendAll=
	BEGIN 
  		
   		scheduler := taskSCHEDULER_SUSPENDED
   		
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
    		scheduler := taskSCHEDULER_RUNNING ||
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
	BEGIN
    	IF scheduler = taskSCHEDULER_RUNNING THEN 
    	    tickCount := TICK_INCREMENT(tickCount, 1)
    	ELSE 
    	    tickMissed := TICK_INCREMENT(tickCount, 1)
    	END ||
    	
    	t_resumeAll (TICK_INCREMENT(tickCount, 1)) 
	END
	
	
END
