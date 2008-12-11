/* Task_Core

 \brief Core definitions for task support in FreeRTOS.
 
 Author: Stephenson Galvao, David Deharbe
 Creation date: Fri Dec 5 2008
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
*/
MACHINE
    Task_Core

SEES
    FreeRTOSConfig,
    Types

SETS
    TASK;		/** tasks */	    
    SCHEDULER_STATE = {taskSCHEDULER_NOT_STARTED, taskSCHEDULER_RUNNING, taskSCHEDULER_SUSPENDED}; /** states of the scheduler */
    TASK_CODE;	/** code executed by tasks */
	STACK    
    
CONSTANTS 
    PRIORITY,	/** task priorities */
	TICK, 		/** os ticks */

	TASK_NULL,	/** special NULL task */
	NAME_NULL,	/** special NULL name */
	
	TICK_INCREMENT  /** function used to update the tick counter */	
		
PROPERTIES
    
    PRIORITY : POW(NATURAL) & 
    PRIORITY = 0..(configMAX_PRIORITIES-1) &
    
    TICK : POW (NATURAL) &
	TICK = 0..MAX_DELAY &
	
 	TASK_NULL : TASK &
	NAME_NULL : NAME &

	TICK_INCREMENT: TICK * TICK --> TICK &
 	TICK_INCREMENT = %(tick, inc).(tick : TICK & inc : TICK | (tick+inc) mod MAX_DELAY)
    			
VARIABLES
    tasks,	/** all existing tasks */   
    blocked,
	running,
	ready,
	suspended
	    
INVARIANT
	tasks : FIN(TASK) &
	/*tasks /= {} &*/
	
	running : TASK &
	/*running : tasks &*/
	
	blocked : FIN(TASK) &
	blocked <: tasks &
	not (running : blocked) &	

	ready : FIN(TASK) &
	ready <: tasks &
	not (running : ready) &
	blocked /\ ready = {} &
	
	suspended : FIN(TASK) &
	suspended <: tasks &
	not (running : suspended) &
	blocked /\ suspended = {} &
	ready /\ suspended = {} &

	(tasks <: ({running} \/ blocked \/ ready \/ suspended))
	
	/* (( (ready = {}) & (running = TASK_NULL)) or TASK_NULL : ready) & */
    
	
INITIALISATION
    
    tasks := {} ||
    running := TASK_NULL ||
    blocked, ready, suspended := {}, {}, {}
    
ASSERTIONS
    !(tk,tasks,rtask,btasks,rtasks,stasks).(tk:TASK &  tasks:POW(TASK) & rtask:TASK & btasks:POW(TASK) & rtasks:POW(TASK) & stasks:POW(TASK) &
        (tasks<: ({rtask} \/ btasks \/ rtasks \/ stasks)) => (tasks<: ({tk}\/{rtask}\/ btasks \/ rtasks \/ stasks)))
    
    
    
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
	**/
	result <-- Create (priority) =
	PRE
	    priority : PRIORITY
	THEN	
	  	ANY
    	    task
        WHERE
            task : TASK &
            task /: tasks 
    	THEN     	    
        	tasks := { task } \/ tasks ||
        	CHOICE
        	    IF running : tasks 
        	    THEN
        	        ready := {running} \/ ready 
        	    END||  
    	   	   	running := task
			OR
			   	ready :=  { task } \/ ready
        	END||
        	result := task
        END                  
	END;


	/**
		\brief Delete Task
		
		\do	Delete a task managed by FreeRTOS. If the task deleted is the current task, a new task, with the ready state and priority
			great or equals than the others tasks in ready state, will be the current task and change its state for running
			The NULL task cannot be deleted.
			 
		\parameters 
			pxTaskToDelete - Task that will be deleted
			
	**/
	Delete (atask)=
	PRE
	    atask : TASK &
   		atask : tasks &
   		atask /= TASK_NULL
	THEN
    	tasks := tasks - { atask } ||
    	IF atask = running	THEN
        	ANY
        	    task
	        WHERE 
    	        task : TASK &
    	        task : ready
    	    THEN
    	        running := task ||
    	        ready := ready - { task }
			END
		ELSIF atask : blocked THEN
		    blocked := blocked - { atask }
		ELSIF atask : ready THEN
		    ready := ready - { atask }
		ELSIF atask : suspended THEN
		    suspended := suspended - { atask }
		END
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
	Suspend (atask)=
	PRE
		atask : TASK &
		atask : tasks &
		atask /: suspended
	THEN
       	IF atask = running THEN
           	ANY
           	    task 
	        WHERE
	            task : TASK &
	            task : ready
	        THEN
				running := task ||
				ready := ready - { task }
        	END
	    ELSIF atask : ready THEN
	        ready := ready - { atask }
	    ELSIF atask : blocked THEN
	        blocked := blocked - { atask }
	    END ||
		suspended := suspended \/ { atask }
	END;
	
	/**
		\brief	Resume Task
		
		\do	
			This method resume a suspended tasks. If the task resumed have the priority great than current task. the resumed task
			will be the current task and the current task will go to ready task list.
			 
		\parameters 
			pxTaskToResume - Task that will be resume
			
	**/
	Resume (atask) =
	PRE 
	    suspended /= {} & 
    	atask : TASK & 
    	atask : suspended
	THEN    
    	CHOICE
    	    ready := ready \/ { running } ||
    	    running := atask
    	OR
    		ready := ready \/ { atask }
    	END ||
    	suspended := suspended - { atask }	
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
	priority <-- GetPriority(atask)=
	PRE
    	atask : tasks
	THEN 
	    priority :: PRIORITY
	END;
	
	/**
		\brief	Get Current Task
		
		\do	
			Return the currently running task
			
		\returns
			cTask - The currently running task
			
	**/
	result <-- GetCurrent =
    BEGIN
        result := running
	END;
	
	/**
		\brief	Get Number of Task
		
		\do	
			Get the number of tasks managed by the FreeRTOS
			 			
		\returns
			numberOfTasks - Priority of the passed task
			
	**/
	result <-- GetNumberOfTasks =
	BEGIN
    	result := card(tasks)
	END;
	
	/**
		\brief	Delay Task
		
		\do	
			Blocked the task currently for a given number of tick, take with reference the current tick 
			and choice a new task with ready state to run
			
		\paramenters
			xTicksToDelay - The amount of tick that the current task should block
			
	**/
	DelayTask (ticks)=
	PRE
    	ticks : TICK & not(ticks = 0) 
	THEN
    	ANY
    	    task 
    	WHERE
    	    task : TASK &
    	    task : ready
   		THEN
   		    blocked := blocked \/ { running } ||
   		    running := task ||
   		    ready := ready - { task } 
     	END
	END;
	
	/**
		\brief	Start Scheduler
		
		\do	
			Start the scheduler and create the idle task			
	**/
	StartScheduler = 
	PRE
    	running = TASK_NULL 
	THEN

   	    ANY
   	        idle_name, 
   	        idle_task 
        WHERE
            idle_name : NAME & 
            idle_task : TASK & 
            idle_task /: tasks
   	    THEN
            tasks := tasks \/ { idle_task } 
		END
 	END
 	;
	
	/**
		\brief	End Scheduler
		
		\do	
			End the task of schuler
	**/
	EndScheduler =
	BEGIN
    	tasks := {} ||
    	running := TASK_NULL ||
    	blocked, suspended, ready := {}, {}, {}
	END;
	
	/**
		\brief	Suspend All
		
		\do	
			Suspend the scheduler activities changing its state to suspended
	**/
	SuspendAll=
	BEGIN 
   		skip
	END;

	/**
		\brief	Resume All
		
		\do	
			Resume the scheduler:
			increment the tick with missed ticks; 
			verify the list of blocked tasks to unblock the tasks with expired timers.
	**/
	ResumeAll (tick) = 
	PRE
		tick : TICK
	THEN
	    ANY
	        unblocked
	    WHERE
	        unblocked : FIN(TASK) &
			unblocked <: blocked
	   	THEN
   		    IF unblocked /= {} THEN
   	    		ANY
   	        		task
   	    		WHERE
       	  			task : TASK &
      				task : unblocked 
   				THEN
					CHOICE
       	    			running := task ||
       	    			ready := ready \/ { running } \/ (unblocked - { task })
					OR
				    	ready := ready \/ unblocked
					END
   				END ||
   				blocked := blocked - unblocked
   			END
   		END
	END;
	
	/**
		\brief	Remove From Block List
		
		Unblock the given task
			
	**/
	Unblock(task)=
	PRE
		task : TASK &
		task : blocked
	THEN
		CHOICE
		    running := task ||
		    ready := ready \/ { running }
    	OR
        	ready := ready \/ { task }
		END ||
		blocked := blocked - { task }
	END
END
