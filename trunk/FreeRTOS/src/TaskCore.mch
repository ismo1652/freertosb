/* Task_Core

 \brief Core definitions for task support in FreeRTOS.
 
 Module responsible for specific the features task. In this initial specification, 
 we concerns priority with the changes of task states, abstracting the outher features 
 as priority, code task, context.
 
 
 Author: Stephenson Galvao, David Deharbe
 Creation date: Fri Dec 5 2008
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
 
*/
MACHINE
    TaskCore

SEES
    FreeRTOSConfig,
    Types

SETS
    TASK;		/** tasks */	    
	STACK;		/** stack of task**/
	TASK_CODE  /* pointer to code of task*/
     
    
CONSTANTS 
    PRIORITY,	/** task priorities */
	TASK_NULL,	/** special NULL task. It is used for ensure the invariant tasks/={} */
	TICK, /*Tick available in freeRTOS*/
	TICK_INCREMENT /** function used to update the tick counter */	
		
PROPERTIES
    
    PRIORITY : POW(NAT) & 
   
    
    TICK : POW (NAT) &
	TICK = 0..MAX_DELAY &
	
 	TASK_NULL : TASK &  
 	

	TICK_INCREMENT: TICK * TICK --> TICK &
 	TICK_INCREMENT = %(tick, inc).(tick : TICK & inc : TICK | (tick+inc) mod MAX_DELAY)
    			
VARIABLES
    tasks,	/** all existing tasks */   
    blocked, /** set of blocked task*/
	running, /** task current*/
	ready, /** set of ready task*/
	suspended /** set of suspend task*/

	
	    
INVARIANT
	tasks : FIN(TASK) &
	/*tasks /= {} &*/
	{TASK_NULL} <: tasks &
	
	blocked : FIN(TASK) &
	blocked <: tasks &
	
	ready : FIN(TASK) &
	ready <: tasks &
	
	suspended : FIN(TASK) &
	suspended <: tasks &
	
	running : TASK &
	running: tasks &
	running/:ready &
	running/:blocked &
	running/:suspended & 
	
	TASK_NULL /: suspended &
	TASK_NULL/:ready &
	TASK_NULL/:blocked &
	

	ready/\blocked = {} & 
	blocked/\suspended = {}&
	suspended/\ready= {} &	
	
	tasks = {running}\/ suspended \/ blocked\/ ready\/{TASK_NULL}
 	
INITIALISATION
    
    tasks:={TASK_NULL}||
    running := TASK_NULL ||
    blocked, ready, suspended := {}, {}, {}
    
OPERATIONS

	/**	
		\brief Task creation
	
		\do 
			This method create a new task.
			
		\parameters
			priority - The priority of the task.
			
		\note 
			The actual function takes the handled as a parameter passed by reference.
			
	**/
	result <-- t_create (priority) =
	PRE
	    priority : PRIORITY &
	    running=TASK_NULL
	THEN	
	  	ANY
    	    task
        WHERE
            task : TASK &
            task /: tasks 
    	THEN     	    
        	tasks := { task } \/ tasks ||
        	ready :=  { task } \/ ready||
        	result := task
        END                  
	END;


	/**
		\brief Delete Task
		
		\do	
			Delete a task managed by FreeRTOS. If the task that will be delete is the current task, a ready 
			task will became the running task. The NULL task can't be deleted. 
			 
		\parameters 
			aTask - Task that will be deleted
			
		\question
		    can it delete the idle task?
		    	R - the handle to idle task is not visible for user
			when the task that gonna delete is the unique task in tasks, what do it do?
				R- I don't allow this. The handle for idle task can't be take.
		\warning
			I don't know what the system do when the currenty task is delete and the set ready is empty. 

			
	**/
	t_delete (atask)=
	PRE
	    atask : TASK &
   		atask : tasks &
   		atask /= TASK_NULL & 
   		tasks/={atask} 
   		
	THEN
    	tasks := tasks - { atask }|| 	
    	IF atask = running	THEN
    	    CHOICE
        		ANY
        	    	task
	        	WHERE 
    	        	task : TASK &
    	        	task : ready
    	    	THEN
    	        	running := task ||
    	        	ready := ready - { task }
				END		
			OR
			    running:=TASK_NULL /*Warning*/
			END
		ELSIF atask : ready  THEN
		    ready := ready - { atask }
		ELSIF atask : blocked  THEN
		    blocked := blocked - { atask }
		ELSIF atask : suspended THEN
		    suspended := suspended - { atask }
		END
	END;
	
	/**
		\brief Suspend Task
		
		\do	
			This method suspend the passed task. If the task that will be suspend is 
			the current task, a task with the state ready will choice to be the current task.
			 
		\parameters 
			atask- Task that will be suspend
						
	**/
	t_suspend (atask)=
	PRE
		atask : TASK &
		atask : tasks &
		atask /: suspended &
		atask /= TASK_NULL
	THEN
       	IF atask = running THEN
       	    IF ready={} THEN
           		ANY
           	    	task 
	        	WHERE
	            	task : TASK &
	            	task : ready
	        	THEN
					running := task ||
					ready := ready - { task }
        		END
        	ELSE
        	    running:=TASK_NULL
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
			This method resume a suspended tasks. The resumed task can go to ready or running state depend 
			the priority of resumed tasks (this choice will be specific in future refinement)
			 
		\parameters 
			atask - Task that will be resume
			
	**/
	t_resume (atask) =
	PRE 
	    suspended /= {} & 
    	atask : TASK & 
    	atask : suspended &
    	running /= TASK_NULL
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
			This method get the priority of the task passed, but here this only return a priority available. 
			It will implement in future refinement.
						 
		\parameters 
			atask - Task that will be returned the priority
			
		\returns
			priority - a priority belong of Priority set
			
	**/
	priority <-- t_getPriority(atask)=
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
			result - The currently running task
			
	**/
	result <-- t_getCurrent =
    BEGIN
        result := running
	END;
	
	/**
		\brief	Get Number of Task
		
		\do	
			Get the number of tasks managed by the FreeRTOS
			 			
		\returns
			numberOfTasks -  number of tasks managed by the FreeRTOS
			
	**/
	result <-- t_getNumberOfTasks =
	BEGIN
    	result := card(tasks)
	END;
	
	/**
		\brief	Delay Task
		
		\do	
			Change the state of the current task for the blocked state during the number tick passed. 
			But here it only change the state of task leaving the feature time of block for the next refinement
			
			
		\paramenters
			tick - The tick that the task should be unbloked. Is declared but no used here
			
	**/
	t_delayTask (ticks)=
	PRE
    	ticks:TICK & 
    	not(ticks = 0) &
    	running/=TASK_NULL
	THEN  
	    
	    IF ready={} THEN
	    	blocked := blocked \/ { running }||
	    	running := TASK_NULL
	    ELSE
	    	ANY
    	    	task 
    		WHERE
    	    	task : TASK &
    	    	task : ready
   			THEN
   		    	blocked := blocked \/ { running } ||
   		    	ready := ready - { task } ||
   		    	running := task
   		    
     		END
     	END
	END;
	
	/**
		\brief	Start Scheduler
		
		\do	
			Start the scheduler and create the idle task		
				
		\return 
			
	**/
	t_startScheduler = 
	PRE
	    running=TASK_NULL
	THEN
   	    ANY
   	       	idle_name, 
   	       	idle_task 
        WHERE
           	idle_name : NAME & 
           	idle_task : TASK & 
           	idle_task /: tasks 
   	    THEN
   	        tasks := tasks \/ { idle_task }||
           	IF ready ={} THEN
           	    running:=idle_task
           	ELSE
           	    ANY 
           	        task
           	    WHERE
           	        task:ready
           	    THEN
           	        running:=task||           	        
           	        ready:=(ready\/{ idle_task })-{task}
           	    END
           	    
           	END
           	
		END
        
 	END;
	
	/**
		\brief	End Scheduler
		
		\do	
			End the task of schuler
	**/
	t_endScheduler =
	BEGIN
    	tasks := {TASK_NULL} ||
    	running := TASK_NULL ||
    	blocked, suspended, ready := {}, {}, {}
	END;
	

	/**
		\brief	Resume All
		
		\do	
			Method used for resume the scheduler. It increment the tick with missed ticks and verify the list of 
			blocked tasks to unblock the tasks with expired timers.
	**/
	t_resumeAll (tick) = 
	PRE
		tick : TICK &
		running /=TASK_NULL
	THEN
	    ANY
	        unblocked
	    WHERE
	        unblocked : FIN(TASK) &
			unblocked <: blocked
	   	THEN
   		    IF unblocked /= {} THEN
   		        CHOICE
   	    			ANY
   	        			task
   	    			WHERE
       	  				task : TASK &
       	  				task : tasks &
      					task : unblocked 
   					THEN
       	    			running := task ||
       	    			ready := ready \/ { running } \/ (unblocked - { task })
       	    		END
				OR
				    ready := ready \/ unblocked
   				END ||
   				blocked := blocked - unblocked
   			END
   		END
	END;
	
	/**
		\brief	Remove From Block List
		
		\do
			Unblock the given task
			
	**/
	t_unblock(task)=
	PRE
		task : TASK &
		task : blocked
	THEN
	    IF running=TASK_NULL THEN
	        running:=task
	    ELSE
			CHOICE
		    	running := task ||
		    	ready := ready \/ {running}
    		OR
        		ready := ready \/ {task}
			END 
		END||	blocked := blocked - {task}
	END
	
END