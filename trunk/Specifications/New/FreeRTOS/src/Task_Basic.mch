/* Task_Basic

 \brief Basic layer of definitions for task support in FreeRTOS.
 
 This machine defines the concept of a task in FreeRTOS and some of the core operations related to tasks that do not depend on 
 definitions in other modules, such as queues.

 Some concepts are not handled:
 	- switch context when the tick interruption occur
 	- Block of scheduler activites in the critical operation
 	- Meomry manager
 	- Task's Stack
 	- Task's function and pointer to function
 
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
SETS
    TASK;		/** tasks */	    
    TASK_STATE = {running, blocked, ready, suspended, deleted}; /** states of tasks */
    SCHEDULER_STATE = {taskSCHEDULER_NOT_STARTED, taskSCHEDULER_RUNNING, taskSCHEDULER_SUSPENDED}; /** states of the scheduler */
    
    TASK_CODE;	/** code executed by tasks */
	STACK    
    
CONSTANTS 
    PRIORITY,	/** task priorities */
	TICK,		/** os ticks */

	TASK_NULL,	/** special NULL task */
	NAME_NULL,	/** special NULL name */
	
	READY_PRIORITIES,	/** function that yields the set of priorities of ready tasks */
	tskIDLE_PRIORITY,	/** priority of idle task */

	TICK_INCREMENT, /** function that yields the next tick */	
	UNBLOCK_TASKS	/** function that given a set of tasks, returns a mapping from these tasks to ready */
		
PROPERTIES
    
    PRIORITY : POW(NATURAL) & 
    PRIORITY = 0..(configMAX_PRIORITIES-1) &
    
    TICK :POW (NATURAL) &
	TICK = 0..MAX_DELAY &
	
 	TASK_NULL : TASK &
	NAME_NULL : NAME &

	READY_PRIORITIES : (TASK +-> TASK_STATE) * (TASK +-> PRIORITY) --> POW(PRIORITY) &
	READY_PRIORITIES = %(state, priority).(state : TASK +-> TASK_STATE & priority : TASK +-> PRIORITY |
	    {0} \/ (state~; priority) [{ready}]) &
    
	TICK_INCREMENT: TICK * TICK --> TICK &
 	TICK_INCREMENT = %(tick, inc).(tick : TICK & inc : TICK | (tick+inc) mod MAX_DELAY) &
    			
	tskIDLE_PRIORITY : PRIORITY &
	tskIDLE_PRIORITY = 1 &

	UNBLOCK_TASKS: POW(TASK) --> (TASK +-> TASK_STATE) &
	UNBLOCK_TASKS = %(tasks).(tasks : POW(TASK)| tasks * {ready})

ASSERTIONS
    !(state,priority).(state:(TASK +-> TASK_STATE) & priority:(TASK +-> PRIORITY) => ( 
        					not(ran(dom(state|>{ready})<|priority)={})  => READY_PRIORITIES(state,priority)= ran(dom(state|>{ready})<|priority)
    					&	ran(dom(state|>{ready})<|priority)={} => READY_PRIORITIES(state,priority)={0})
                   )&
                            
   	!(state,priority).(state:(TASK +-> TASK_STATE) & priority:(TASK +-> PRIORITY) => READY_PRIORITIES(state,priority) /= {}) & 			
   	!(state,priority).(state:(TASK +-> TASK_STATE) & priority:(TASK +-> PRIORITY) => max(READY_PRIORITIES(state,priority)) >= 0)    																			
VARIABLES
    tasks,	/** all existing tasks */   
    /** miscellaneous task properties */
    task_priority,
	task_name,
	task_state,
	task_value, /**value used for blocked task **/
		
	current_task,	/** currently running task */
	scheduler,		/** state of scheduler*/
	tickCount,		/** total tick count */
	tickMissed		/** count of missed ticks */
	
    
    
   
INVARIANT
   tasks : POW(TASK) &
    
    
	task_name: TASK +-> NAME &
	task_state: TASK+-> TASK_STATE & 
	task_priority : TASK +-> PRIORITY & 
	task_value: TASK+->TICK &
    
    /**all taskt managed by FreeRTOS must have priority,state,name and value*/
    tasks = dom(task_name) &
    tasks = dom(task_state) &
    tasks = dom(task_priority)  &
    tasks = dom(task_value) &
    
    
    
	current_task : TASK &
	current_task : tasks &
	task_state(current_task) = running &
	task_priority(current_task)>=max(READY_PRIORITIES(task_state,task_priority))&
	 
	
	card(task_state~[{running}])<=1 &
	
	scheduler: SCHEDULER_STATE &
	
	tickCount: TICK &
	
	tickMissed:TICK
	
INITIALISATION
    tasks := {TASK_NULL} ||
    task_name := {TASK_NULL|->NAME_NULL} ||
    task_state := {TASK_NULL|->running} ||
    task_priority := {TASK_NULL|->0} ||
    task_value := {TASK_NULL|->0} ||
    current_task := TASK_NULL ||
    scheduler := taskSCHEDULER_NOT_STARTED ||
    tickCount := 0 ||
    tickMissed := 0
    
OPERATIONS

	/**	
		\brief Task creation
	
		\do This method create a new. The task created have the state ready, if the its priority is less equals than the current task priority, 				otherwise the task will have the state running and the current task will change its state to ready.
		
		\parameters
			pvTaskCode - Code that will be executed by the task
			pcName - The task name
			usStackDepth - The length of task stack
			pvParameters - Then parameters use for the task code 
			uxPriority - The priority of the task
	
		\note 
			The actual function takes the handled as a parameter passed by reference.
	*/
	zz, handle <-- xTaskCreate (pvTaskCode, pcName, usStackDepth, pvParameters, uxPriority) =
	PRE
    	pvTaskCode : TASK_CODE & 
    	pcName : NAME & 
    	usStackDepth : NATURAL &  
    	pvParameters <: PARAMETER & 
    	uxPriority : PRIORITY
	THEN 
	    CHOICE 
        	ANY
        	    task
        	WHERE
        	    task : TASK &
        	    task /: tasks 
    		THEN 
        		tasks := tasks\/ {task} ||
        		task_name := task_name \/ {task |-> pcName}||
        		task_value := task_value \/ {task |-> 0}||
	        	IF uxPriority > task_priority(current_task)
    	    	THEN
        		    task_state := task_state <+ {current_task |-> ready} <+ {task |-> running} ||
        	    	current_task := task
	        	ELSE
    	    	    task_state := task_state <+ {task |-> ready}
        		END ||
	        	task_priority := task_priority \/ {task |-> uxPriority} ||
    	    	zz, handle := pdPASS, task
    		END 
		OR
        	zz, handle := errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY, TASK_NULL
    	END	                     
	END;


	/**
		\brief Delete Task
		
		\do	Delete a task managed by FreeRTOS. If the task deleted is the current task, a new task ,with the ready state and priority
			great or equals than the others tasks in ready state, will be the current task and change its state for running
			 
		\parameters 
			pxTaskToDelete - Task that will be deleted
			
	**/
	deleteTask(pxTaskToDelete)=
	PRE
   		INCLUDE_vTaskDelete =1 & pxTaskToDelete : tasks 
	THEN
    	tasks:=tasks-{pxTaskToDelete}||
    	task_name:= {pxTaskToDelete} <<|task_name ||
    	IF pxTaskToDelete = current_task 
    	THEN
        	ANY
        	    mpriority, task
	        WHERE 
    	        mpriority : PRIORITY & mpriority = max(READY_PRIORITIES(task_state, task_priority)) & 
    	        task : TASK &
    	        task : tasks &
    	        task /= pxTaskToDelete &
	            task_priority(task) = mpriority &
	            task_state(task) = ready
    	    THEN
        	    task_state:= ({current_task} <<| task_state) <+ {task|->running}||
        		current_task := task
			END        
    	ELSE
        	task_state:= {pxTaskToDelete} <<| task_state
    	END ||
    	task_priority := {pxTaskToDelete} <<| task_priority||
    	task_value := {pxTaskToDelete} <<| task_value
	END;
	
	/**
		\brief Suspend Task
		
		\do	
			This method change the state of passed task for 'suspended'. If the task that will be suspend is the current task, a new 
			task, with state raedy and priority great or equals than the others ready tasks, will be choice to be the current task.
			 
		\parameters 
			pxTaskToDelete - Task that will be deleted
			
		\returns 
			rr - Return pdTRUE if the task was suspended with success and pdFALSE otherwise.
			
	**/
	rr <-- vTaskSuspend(pxTaskToSuspend)=
	PRE
    	INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend:tasks
	THEN
    	IF not(task_state(pxTaskToSuspend)=suspended)
    	THEN
        	IF(pxTaskToSuspend = current_task)
        	THEN
            	ANY
            	    mprt, task 
	            WHERE
	                mprt:PRIORITY & 
	                mprt= max(READY_PRIORITIES(task_state,task_priority)) &
	                task : TASK &
	                task : tasks &
                	task /= pxTaskToSuspend & 
                	task_priority(task) = mprt &
                	task_state(task)=ready
	            THEN
					task_state := task_state <+ {pxTaskToSuspend |-> suspended} <+ {task |-> running}||
					current_task := task 
        		END
	    	ELSE
	        	task_state:= task_state <+ {pxTaskToSuspend |-> suspended} 
	    	END ||
	    	rr := pdTRUE	    
		ELSE 
	    	rr := pdFALSE	    
 		END
	END;
	
	/**
		\brief	Resume Task
		
		\do	
			This method resume a suspended tasks. If the task resumed have the priority great than current task. the resumed task
			will be the current task and the current task will go to ready task list.
			 
		\parameters 
			pxTaskToResume - Task that will be resume
			
	**/
	vTaskResume(pxTaskToResume) =
	PRE 
    	INCLUDE_vTaskSuspend = 1 & pxTaskToResume : tasks & task_state(pxTaskToResume)= suspended
	THEN    
    	IF task_priority(pxTaskToResume) > task_priority(current_task)
    	THEN
        	task_state := task_state <+ {current_task|->ready} <+ {pxTaskToResume|->running} ||
	        current_task := pxTaskToResume 
    	ELSE
    		task_state := task_state <+ {pxTaskToResume|->ready}
    	END  	
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
    	pxTask:tasks & INCLUDE_uxTaskPriorityGet = 1 
	THEN 
	    priority := task_priority(pxTask)
	END;
	
	/**
		\brief	Get Current Task
		
		\do	
			Return the currently running task
			
		\returns
			cTask - The currently running task
			
	**/
	cTask<--xTaskGetCurrentTaskHandle=
	PRE
    	INCLUDE_xTaskGetCurrentTaskHandle = 1
	THEN
    	cTask:=current_task
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
    	numberOfTasks:=card(tasks)
	END;
	
	/**
		\brief	Get Scheduler State
		
		\do	
			Get the currently state of the scheduler
			
		\returns
			schedulerState - The currently state of the scheduler
			
	**/
	schedulerState<--xTaskGetSchedulerState=
	PRE
    	INCLUDE_xTaskGetSchedulerState=1
	THEN
    	schedulerState := scheduler
	END;

	/**
		\brief	Delay Task
		
		\do	
			Blocked the task currently for a given number of tick, take with reference the current tick 
			and choice a new task with ready state to run
			
		\paramenters
			xTicksToDelay - The amount of tick that the current task should block
			
	**/
	vTaskDelay(xTicksToDelay)=
	PRE
    	xTicksToDelay : TICK & not(xTicksToDelay=0) & INCLUDE_vTaskDelay = 1 
	THEN
    	ANY
    	    mprt, task 
    	WHERE
    	    mprt : PRIORITY & 
    	    mprt = max(READY_PRIORITIES(task_state, task_priority)) &        
    	    task : TASK &
           	task /= current_task & 
           	task_priority(task) = mprt & 
           	task_state(task) = ready
   		THEN       
        	task_state := task_state <+ {current_task |-> blocked} <+ {task |-> running} ||
        	task_value := task_value <+ {current_task |-> TICK_INCREMENT(tickCount,xTicksToDelay)} ||
        	current_task := task 
     	END
	END;
	
	/**
		\brief	Delay Task
		
		\do	
			Blocked,the task currently for then number of tick, take with reference the time of last unblocked task,
			and choice a new task with ready state to run. This method is used in cyclical tasks.
		\parameters
			\pxPreviousWakeTime - Time at which the task was last unblocked
			\xTimeIncrement- Time that will increment the pxPreviousWakeTime.
			
	**/
	vTaskDelayUntil(pxPreviousWakeTime, xTimeIncrement) =
	PRE
    	pxPreviousWakeTime : TICK & xTimeIncrement : TICK & 
    	INCLUDE_vTaskDelayUntil = 1
	THEN
	    CHOICE
    	    ANY
        	    mprt, task 
    		WHERE
    	    	mprt : PRIORITY & 
    	    	mprt = max(READY_PRIORITIES(task_state, task_priority)) &
    	    	task : TASK &    
           		task : dom({current_task}<<|task_priority) &
           		task_priority(task) = mprt &
           		task_state(task) = ready
   			THEN       
         		task_state := task_state <+ {current_task |-> blocked} <+ {task |-> running}||
         		task_value := task_value <+ {current_task |-> TICK_INCREMENT(pxPreviousWakeTime, xTimeIncrement)} ||	
         		current_task := task
         		
     		END
    	OR
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
	numberOfTicks<--xTaskGetTickCount=
	PRE
    	INCLUDE_xTaskGetCurrentTaskHandle = 1
	THEN
    	numberOfTicks:=tickCount
	END;
	
	/**
		\brief	Start Scheduler
		
		\do	
			Start the scheduler and create the idle task			
	**/
	vTaskStartScheduler = 
	PRE
    	scheduler = taskSCHEDULER_NOT_STARTED  	
	THEN
	    CHOICE
    	    ANY
    	        idle_name, idle_task 
	        WHERE
	            idle_name : NAME & idle_task : TASK & idle_task /: tasks
    	    THEN
	            tasks := tasks \/ {idle_task} ||
    	        task_name := task_name \/ {idle_task |-> idle_name} ||
        	    task_priority := task_priority \/ {idle_task |-> tskIDLE_PRIORITY} ||
            	task_value := task_value \/ {idle_task |-> 0} ||
				IF tasks = {TASK_NULL}
				THEN
			    	task_state := task_state <+ {idle_task|->running}
				ELSE
			    	task_state := task_state <+ {idle_task|->ready}
				END 
			END ||
			tickCount := 0 ||
			tickMissed := 0
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
    	tasks := {TASK_NULL} ||
    	task_name := {TASK_NULL|->NAME_NULL} ||
    	task_state := {TASK_NULL|->running} ||
    	task_priority := {TASK_NULL|->0} ||
    	task_value := {TASK_NULL|->0} ||
    	current_task := TASK_NULL ||
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
			Resume the scheduler and increment the tick with missed ticks and verific the list of blocked tasks to unblock the tasks with
			time of block "excedido".
	**/
	xTaskResumeAll = 
	PRE
	    scheduler = taskSCHEDULER_SUSPENDED
	THEN
    	scheduler := taskSCHEDULER_RUNNING ||
    	tickCount := TICK_INCREMENT(tickCount,tickMissed)||
    	ANY
    	    blockedTasks, mprt, task
    	WHERE
    	    blockedTasks = {task | task : tasks & task_state(task) = blocked &
    	        					tickCount <= task_value(task) &	task_value(task) <= TICK_INCREMENT(tickCount,tickMissed)} &
 			mprt: PRIORITY &
 			mprt = max(task_priority[blockedTasks]) &
          	task : tasks &
          	task : blockedTasks & 
          	task_priority(task) = mprt 
    	THEN
			IF mprt > task_priority(current_task)
        	THEN
            	task_state := task_state <+ UNBLOCK_TASKS(blockedTasks-{task}) <+ {current_task|->ready} <+ {task|->running} ||
            	current_task := task 
        	ELSE
            	task_state := task_state <+ UNBLOCK_TASKS(blockedTasks)
			END
    	END
	END;
	
	/**
		\brief	Increment the tick
		
		\do	
			Increment the tick count and verific the blocked task list to check if any task must be unblock
	**/
	incrementTick =
	BEGIN
    	IF scheduler = taskSCHEDULER_RUNNING
    	THEN tickCount := TICK_INCREMENT(tickCount, 1)
    	ELSE tickMissed := TICK_INCREMENT(tickCount, 1)
    	END ||
	    ANY
	        blockedTasks, mprt, task
	    WHERE
	        blockedTasks <: tasks &
	        blockedTasks = {task | task : tasks & task_state(task) = blocked & task_value(task) = TICK_INCREMENT(tickCount,1) } &
			mprt : PRIORITY & 
			mprt = max(task_priority[blockedTasks]) &
			task : blockedTasks &
			task : task_priority~[{mprt}]
    	THEN  
        	IF mprt > task_priority(current_task)
        	THEN
            	task_state := task_state <+ UNBLOCK_TASKS(blockedTasks) <+ {current_task|->ready} <+ {task|->running} ||
            	current_task := task
        	ELSE
            	task_state := task_state <+ UNBLOCK_TASKS(blockedTasks)
			END        
        
	    END
	END;
	
	/**
		\brief	Remove From Block List
		
		\do	
			Unblock a passed task
			
	**/
	removeFromBlockedList(task)=
	PRE
		task : tasks &
		task_state (task) = blocked & task /= current_task
	THEN
		IF task_priority(task) > task_priority(current_task)
		THEN
		    task_state := task_state <+ {current_task |-> ready} <+ {task |-> running} ||
     		current_task := task 
     		
    	ELSE
        	task_state := task_state <+ {task |-> ready}
		END|| task_value(task):=0
	END
END