/* Task_Core
SG->DD:
Nessa máquina eu comecei a padronizar as operações, colocando um t_ antes das operações 
para indicar que a operação trata-se da máquina Task_Core. Queria saber se posso fazer
a mesma coisa em Queue_Core, sendo nessário também colocar um padrão para as outras máquinas
como Task caso essa venha ser usada;
*/

/*

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
    Task
    
SEES
    FreeRTOSConfig,
    Types
        
VARIABLES
    active, /** the system is in active mode: the scheduler is functionning and tasks are executed */
    
    tasks,	/** all existing tasks */   
    blocked, /** set of blocked task*/
    ready, /** set of ready task*/
    suspended, /** set of suspend task*/
    running, /** task current*/
    
    idle /* a private task that runs when all other tasks are suspended or blocked */
    
INVARIANT
    
    active : BOOL &
    
    tasks : FIN(TASK) &
    idle : TASK &
    
    blocked : FIN(TASK) &
    blocked <: tasks &
    
    ready : FIN(TASK) &
    ready <: tasks &
    
    suspended : FIN(TASK) &
    suspended <: tasks &
    
    running : TASK &
    
    (active = TRUE =>
        (running = idle or idle : ready) &
	    running : tasks &
    	running /: ready &
    	running /: blocked &
    	running /: suspended &
 	    tasks = {running} \/ suspended \/ blocked \/ ready) &
 	
 	(active = FALSE =>
 	    tasks = ready) &
 	
    ready /\ blocked = {} & 
    blocked /\ suspended = {} &
    suspended /\ ready= {}
    
ASSERTIONS
    active = TRUE => idle : tasks;
    active = TRUE => tasks /= {};
    active = TRUE => idle /: blocked;
    active = TRUE => idle /: suspended;
    active = TRUE => ((ready = {}) => (running = idle))
    
INITIALISATION
    active := FALSE ||
    tasks := {} ||
    idle :: TASK ||
    running :: TASK ||
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
        active = FALSE &
        priority : PRIORITY
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
    I don't know what the system does when the current task is delete and the set ready is empty. 
    
    
    **/
    t_delete (atask)=
    PRE
        active = TRUE &
        atask : TASK &
        atask : tasks & 
        atask /= idle 
    THEN
        tasks := tasks - { atask } || 	
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
        active = TRUE &
        atask : TASK &
        atask : tasks &
     	atask /= idle
    THEN
        suspended := suspended \/ { atask } ||
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
        END
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
        active = TRUE &
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
    priority <-- t_getPriority(atask)=
    PRE
        atask : TASK &
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
    PRE
        active = TRUE
    THEN
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
        active = TRUE & 
        running /= idle &
        ticks : TICK & 
        not (ticks = 0)
    THEN  
        blocked := blocked \/ { running } ||
        ANY
            task 
        WHERE
            task : TASK &
            task : ready
        THEN
            ready := ready - { task } ||
            running := task
           
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
        active = FALSE
    THEN
        active := TRUE ||
        blocked, suspended := {}, {} ||
        ANY
            idle_task 
        WHERE
            idle_task : TASK & 
            idle_task /: tasks 
        THEN
            tasks := tasks \/ { idle_task }||
            idle := idle_task ||
            ANY 
                task
            WHERE
                task : ready \/ { idle_task }
            THEN
                running := task ||           	        
                ready := (ready \/ { idle_task }) - { task }
            END
        END
    END;
    
    /**
    \brief	End Scheduler
    
    \do	
    End the task of schuler
    **/
    t_endScheduler =
    PRE
        active = TRUE
    THEN
        active := FALSE ||
        tasks, blocked, suspended, ready := {}, {}, {}, {}
    END;
    
    
    /**
    \brief	Resume All
    
    \do	
    Method used for verify the list of blocked tasks to unblock the tasks with expired timers.
    **/
    t_resumeAll (tick) = 
    PRE
        active = TRUE &
        tick : TICK
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
        active = TRUE &
        task : TASK &
        task : blocked
    THEN
        IF running = idle THEN
            running := task ||
            ready := ready \/ { idle }
        ELSE
            CHOICE
                running := task ||
                ready := ready \/ {running}
            OR
                ready := ready \/ {task}
            END 
        END ||
        blocked := blocked - {task}
    END
    ;
	
/**
	/brief
		States changes in tick increment
	/do
		This method concerns with the states change in tick increment occur.

**/

t_incrementTick(tick) =
PRE
    active=TRUE &
    tick : TICK
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
					ready := ready \/ {running} \/ (unblocked - {task})
				END
			OR
			    ANY
					task
				WHERE
					task:ready & 
					task/=running &
					task/=idle
				THEN
				    running:=task||
					ready := (ready -{task}) \/ {running} \/ unblocked
					
				END   
			OR  
				ready := ready \/ unblocked
			END ||
			blocked := blocked - unblocked
		ELSE
			CHOICE
				ANY
					task
				WHERE
					task:ready & 
					task/=running &
					task/=idle
				THEN
				    running:=task||
					ready := (ready -{task}) \/ {running} 
					
				END        
			OR
				skip
			END
		END
	END    
END
;
	    
    
/**
    \brief	Set the Priority Task
    
    \do
    This method set the priotity of the gived task
    
    \paramenters
    task - The task that will set the priority
    priority - The new priority of the task
**/
    t_setPriority(task,priority)=
    PRE
       
        task:tasks &
        priority:PRIORITY &
        active = TRUE &
        task/=idle
        
    THEN
        IF task : ready 
        THEN
            CHOICE
                skip
            OR
				running:=task ||        
                ready:= (ready \/{running})-{task}
            END
        ELSIF task = running
        THEN
            CHOICE
                skip
            OR
                ANY
                    task
                WHERE
                    task : TASK &
                    task : tasks &
                    task : ready
                THEN
                    running := task ||
                    ready := (ready \/ { running }) - { task }
                END
            END
        END
    END
END




