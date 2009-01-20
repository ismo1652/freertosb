/* Task_Core

 \brief Core definitions for task support in FreeRTOS.
 
 Nessa especificação inicial nos implementamos, de uma forma abstrata, como é feita a troca de estado das
 tarefas no FreeRTOS. Nela nos abstraímos características como prioridades, código da tarefa e contexto, 
 ficando essas para serem tratada em futuros refinamentos.
 
 
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
	STACK;		/**stack of task**/
	TASK_CODE  /*pointer to code of task*/
    
CONSTANTS 
    PRIORITY,	/** task priorities */
	TASK_NULL,	/** special NULL task. It is used in the initialisation for ensure the invariant tasks/={} */
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

	tasks = {running} \/ blocked \/ ready \/ suspended
    
	
INITIALISATION
    
    tasks:={TASK_NULL}||
    running := TASK_NULL ||
    blocked, ready, suspended := {}, {}, {}
   
ASSERTIONS
    /*
    !(tk,tasks,rtask,btasks,rtasks,stasks).(tk:TASK &  tasks:POW(TASK) & rtask:TASK & btasks:POW(TASK) &
         rtasks:POW(TASK) & stasks:POW(TASK) =>
        	(tasks ({rtask} \/ btasks \/ rtasks \/ stasks)) => 
        		(tasks<: ({tk}\/{rtask}\/ btasks \/ rtasks \/ stasks)))
    */
    
    !(stasks1,stasks2,stasks3).(stasks1:POW(TASK) & stasks2:POW(TASK) & stasks3:POW(TASK) 
        => (stasks1 \/ stasks2 \/stasks3 = (stasks1 \/ stasks2)\/stasks3 )& 
	       	(stasks1 \/ (stasks2 \/ stasks3) = stasks1 \/ stasks2 \/stasks3)) &
        
    !(s1,s2,s3,s4).(s1:POW(TASK) & s2:POW(TASK) & s3:POW(TASK) & s4:POW(TASK)
        => s1 \/ ( s2 \/ s3 \/ s4) = s1 \/  s2 \/ s3 \/ s4 ) 
    /*
    !(s1,s2,s3).(s1:POW(TASK) & s2:POW(TASK) & s3:POW(TASK) 
        => 	s1 \/ s2 \/ s3  = s1 \/ (s2 \/ s3) &
        	s1 \/ s2 \/ s3  = s2 \/ (s1 \/ s3)  &
			s1 \/ s2 \/ s3  = s3 \/ (s1 \/ s2)  )
  	*/      	
        	  
        	 
        
    
    
OPERATIONS

	/**	
		\brief Task creation
	
		\do 
			This method create a new task. The task created can have the state ready or running. This choice 
			depend both of the priorities of the tasks in ready state and the priority of the new task created
			and will be implement in future refinement
					
		\parameters
		
			priority - The priority of the task
	
		\note 
			The actual function takes the handled as a parameter passed by reference.
			The paramenter priority is declareted here, but is not used, only in the refinement 
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
		
		\do	
			Delete a task managed by FreeRTOS. If the task deleted is the current task, a task, with the ready
			state will became the running task. The NULL task can't be deleted.
			 
		\parameters 
			aTask - Task that will be deleted
			
		\question
		    can it delete the idle task?
		    	R - the handle to idle task is not visible for user
			when the task that gonna delete is the unique task in tasks, what do it do?
				R- I don't know
			
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
			This method change the state of passed task for 'suspended'. If the task that will be suspend is 
			the current task, a task, with the state ready will choice to be the current task.
			 
		\parameters 
			atask- Task that will be deleted
						
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
			This method resume a suspended tasks. The resumed task can go to ready or running state
			 
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
			Get the priority of the task passed
			 
		\parameters 
			atask - Task that will be returned the priority
			
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
			tick - The amount of tick that the current task should block. Is declared but no used here
			
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
