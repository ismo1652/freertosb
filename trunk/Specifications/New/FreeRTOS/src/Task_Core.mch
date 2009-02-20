/*
Notas para o relatório:
	
	A principal preocupação desse módulo inicial foi implementar de forma abstrata como ocorre 
	a mudança de estado de uma tarefa no FreeRTOS. Para isso, nele, foram especificados princi-
	palmente os conceitos de tarefa e sua característica de estado. Além disso, no Task_Core, 
	também foram criadas funções responsáveis pela mudança de estado de um tarefa, sendo
	essas utilizadas como funções base na implementação da API Task em Task.mch
*/

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
    Task_Core

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
    
    PRIORITY : POW(NATURAL) & 
   
    
    TICK : POW (NATURAL) &
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
	tasks /= {} &
	
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

	ready/\blocked = {} & 
	blocked/\suspended = {}&
	suspended/\ready= {} &	
	
	tasks = {running}\/ suspended \/ blocked\/ ready
 	
INITIALISATION
    
    tasks:={TASK_NULL}||
    running := TASK_NULL ||
    blocked, ready, suspended := {}, {}, {}
    
OPERATIONS

	/**	
		\brief Task creation
	
		\do 
			This method create a new task. The task created can have the state ready or running. This choice 
			depend both of the priorities of the tasks in ready state and the priority of the new task created
			and will be implement in future refinement. The parameter priority is declared but not used.
					
		\parameters
		
			priority - The priority of the task
	
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
        	    ready := {running} \/ ready ||        	    
    	   	   	running := task
			OR
			   	ready :=  { task } \/ ready
        	END||
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
			
	**/
	Delete (atask)=
	PRE
	    atask : TASK &
   		atask : tasks &
   		atask /= TASK_NULL &
   		not(tasks={ atask })
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
			This method resume a suspended tasks. The resumed task can go to ready or running state depend 
			the priority of resumed tasks (this choice will be specific in future refinement)
			 
		\parameters 
			atask - Task that will be resume
			
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
			This method get the priority of the task passed, but here this only return a priority available. 
			It will implement in future refinement.
						 
		\parameters 
			atask - Task that will be returned the priority
			
		\returns
			priority - a priority belong of Priority set
			
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
			result - The currently running task
			
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
			numberOfTasks -  number of tasks managed by the FreeRTOS
			
	**/
	result <-- GetNumberOfTasks =
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
	DelayTask (ticks)=
	PRE
    	ticks:TICK & not(ticks = 0) 
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
				
		\return 
			
	**/
	StartScheduler = 
	BEGIN
		
   	    ANY
   	       	idle_name, 
   	       	idle_task 
        WHERE
           	idle_name : NAME & 
           	idle_task : TASK & 
           	idle_task /: tasks 
   	    THEN
           	tasks := tasks \/ { idle_task }||
           	CHOICE
           	    ready:=ready \/ {idle_task}
           	OR
				ready:=ready \/ {running}||           	    
           	    running:=idle_task
           	END
           	
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
		
		\do
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
