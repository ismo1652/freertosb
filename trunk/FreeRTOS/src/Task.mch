/**********************************************************************************************************
\brief Core definitions for task support in FreeRTOS.

Module responsible for specific the features task. In this initial specification, we concerns priority 
with the changes of task states, abstracting the outher features as priority, delay time, context and other

Author: Stephenson Galvao, David Deharbe
Creation date: Fri Dec 5 2008
Universidade Federal do Rio Grande do Norte
Departamento de Informatica e Matematica Aplicada
Programa de Pos-Graduacao em Sistemas e Computacao
Formal Methods and Languages Laboratory
**********************************************************************************************************/
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
    pending,/* Pending Ready task set*/
    idle /* a private task that runs when all other tasks are suspended or blocked */
    
INVARIANT
    
    active : BOOL &
    
    tasks : FIN(TASK) &
    idle : TASK &
    TASK_NULL/:tasks &
    
    blocked : FIN(TASK) &
    blocked <: tasks &
    
    ready : FIN(TASK) &
    ready <: tasks &
    
    suspended : FIN(TASK) &
    suspended <: tasks &
    
    pending: FIN(TASK) &
    pending <: suspended \/blocked &
    
    ready /\ blocked = {} & 
    blocked /\ suspended = {} &
    suspended /\ ready= {} &
    
    /*******************
    New code
    ********************/
    tasks = suspended \/ blocked \/ ready &
    
    running:TASK &
    (active=TRUE => 
        ready/={} & /* There are last one ready task when start the scheduler*/
        running:ready & /* All time need there are one task running*/
        idle:ready)  /* Would create the idle when start the scheduler*/
    
    
/*  
CONSTANTS 
    Task_create
    
PROPERTIES
    Task_create: POW(TASK) --> TASK &
    Task_create= %(stasks).(stasks:POW(TASK)|::stasks)
*/
    
ASSERTIONS
    active = TRUE => tasks /= {};
    active = TRUE => idle : tasks;
    active = TRUE => idle /: blocked;
    active = TRUE => idle /: suspended;
    active = TRUE => (running:tasks);
    active = TRUE => (running/:blocked);
    active = TRUE => (running/:suspended)
    
INITIALISATION
    active := FALSE ||
    tasks := {} ||
    idle :: TASK ||
    running :: TASK ||
    blocked, ready, suspended, pending := {}, {}, {},{}
    
OPERATIONS
    
    /****************************************************************************************************
    \brief Task creation
    
    \do 
    This method create a new task. If the created task have priority great than the running task
    the switch context is necessary.
    
    \parameters
    priority - The priority of the task.
    
    \note 
    The actual function takes the handled as a parameter passed by reference.
    ****************************************************************************************************/
    result <-- t_create (priority)=
    PRE
        priority : PRIORITY
    THEN	
        ANY
            task
        WHERE
            task : TASK &
            task /: tasks &
            task /= TASK_NULL
        THEN
            tasks := tasks \/ {task} ||
            ready := ready \/ {task}||
            /**************************************************************************************************************************
              If task have priority either equals or greate than running task it is necessary the switche context. The same occour when 
              the set of handler tasks is empty. Do this cases in refinament.
             **************************************************************************************************************************/	    
            CHOICE 
                running:=task 
            OR
                skip
            END||
            result := task
        END
    END;
    
    
    /****************************************************************************************************
    \brief Delete Task
    
    \do	
    Delete a task managed by FreeRTOS. If the task that will be delete is the current task, a ready 
    task will became the running task.
    
    \parameters 
    aTask - Task that will be deleted
	****************************************************************************************************/
    t_delete (atask)=
    PRE
        atask : TASK &
        atask : tasks & 
        atask /= idle 
    THEN
        tasks := tasks - { atask } || 	
        IF atask : ready  THEN
            ready := ready - { atask }||
            IF atask = running THEN
                /**************************************************************************************
                Choice the task with the greater priority to running. Make this case in refinament.
                ***************************************************************************************/
                running::ready-{ atask }
            END
        ELSIF atask : blocked  THEN
            blocked := blocked - { atask }||
            pending:=pending-{atask}
        ELSIF atask : suspended THEN
            suspended := suspended - { atask }||
            pending:=pending-{atask}
        END
        
    END;
    
    /****************************************************************************************************
    \brief Suspend Task
    
    \do	
    This method suspend the passed task. If the task that will be suspend is the current task, a task 
    with the state ready will choice to be the current task.
    
    \parameters 
    atask- Task that will be suspend
    *****************************************************************************************************/
    t_suspend (stask)=
    PRE
        stask : TASK &
        stask : tasks &
        stask /= idle
    THEN
        
        IF stask : ready THEN
            ready := ready - { stask }||
            IF stask=running THEN
                running::ready- { stask }
            END
        ELSIF stask : blocked THEN
            blocked := blocked - { stask }
        END||
        suspended := suspended \/ { stask } 
    END;
    
    /****************************************************************************************************
    \brief	Resume Task
    
    \do	
    This method resume a suspended tasks. The resumed task can go to ready or running state.
    
    \parameters 
    atask - Task that will be resume
    ******************************************************************************************************/
    t_resume (rtask) =
    PRE 
        rtask : TASK & 
        rtask : suspended &
        rtask/: pending
        
    THEN 
        ready := ready \/ {rtask}||
        CHOICE
            
            running ::ready \/ {rtask}
        OR
            skip
        END ||
        
        suspended := suspended - {rtask}||
        IF rtask: pending THEN
            pending:=pending - {rtask}
        END
        
            
    END;
    
    /*****************************************************************************************************
    \brief	Get Task Priority
    
    \do	
    This method get the priority of the task passed.
    
    \parameters 
    atask - Task that will be returned the priority
    
    \returns
    priority - a priority belong of Priority set
    *********************************************************************************************************/
    priority <-- t_getPriority(atask)=
    PRE
        atask : TASK &
        atask : tasks
    THEN 
        priority :: PRIORITY
    END;
    
    /********************************************************************************************************
    \brief	Get Current Task
    
    \do	
    Return the currently running task
    
    \returns
    result - The currently running task
    **********************************************************************************************************/
    result <-- t_getCurrent =
    BEGIN
        result := running
    END;
    
    /**********************************************************************************************************
    \brief	Get Number of Task
    
    \do	
    Get the number of tasks managed by the FreeRTOS
    
    \returns
    numberOfTasks -  number of tasks managed by the FreeRTOS
    **********************************************************************************************************/
    result <-- t_getNumberOfTasks =
    BEGIN
        result := card(tasks)
    END;
    
    /**********************************************************************************************************
    \brief	Delay Task
    
    \do	
    Delay the current task until a number of ticks passed as parameter
   
    \parameters
    tick - The tick that the task should be unbloked. Is declared but no used here
    **********************************************************************************************************/
    t_delayTask (ticks,task)=
    PRE
        task:TASK &
        task=running &
        running:ready &
        running /= idle &
        ticks : TICK 
    THEN  
        ready := ready-{running} ||
        blocked := blocked \/ {running}||
        running:: ready -{running}
    END;
    
    /**********************************************************************************************************
    \brief	Start Scheduler
    
    \do	
    Start the scheduler and create the idle task. 
    
    
    **********************************************************************************************************/
    t_startScheduler = 
    PRE
        active = FALSE
    THEN
        active := TRUE ||
        ANY
            idle_task 
        WHERE
            idle_task:TASK & 
            idle_task /: tasks &
            idle_task/=TASK_NULL
        THEN
            tasks := tasks \/ { idle_task }||
            ready:= ready \/ { idle_task }||
            idle := idle_task ||
            running::(ready \/ { idle_task })
        END
    END;
    
    /**********************************************************************************************************
    \brief	End Scheduler
    
    \do	
    End the task of schuler
    **********************************************************************************************************/
    t_endScheduler =
    PRE
        active = TRUE
    THEN
        active := FALSE ||
        tasks, blocked, suspended, ready,pending := {}, {}, {}, {}, {}
    END;
    
    
    /**********************************************************************************************************
    \brief	Resume All
    
    \do	
    Method used for resume the scheduler. It increment the tick with missed ticks and verify the list of 
    blocked tasks to unblock the tasks with expired timers.
    **********************************************************************************************************/
    t_resumeAll (unblocked) = 
    PRE
        unblocked : FIN(TASK) &
        unblocked <: blocked
    THEN
        IF unblocked /= {} or pending /={}THEN
            CHOICE
                running::unblocked \/ pending
            OR
                skip
            END ||
            ready := ready \/ unblocked\/ pending ||
            blocked := blocked - unblocked - pending ||
            suspended := suspended - pending||
            pending:={}
        END
    END;
    
    t_resumeIncrement(unblocked)=
    PRE
        unblocked : FIN(TASK) &
        unblocked <: blocked &
        unblocked/\pending={}
    THEN
        IF unblocked /= {} THEN
            CHOICE
                running::unblocked 
            OR
                skip
            END ||
            ready := ready \/ unblocked ||
            blocked := blocked - unblocked 
        END
    END;
    
    
    
    /*************************************************************************************************
    \brief	Remove From Block List
    
    \do
    Unblock the given task
    *************************************************************************************************/
    t_unblock(task)=
    PRE
        task : TASK &
        task : blocked&
        task /:pending
    THEN
        blocked := blocked - {task}||
        ready := ready \/ {task}||
        CHOICE
            running:=task
        OR
            skip
        END 
    END;
    
    
    t_unblockMutex(task)=
    PRE
        task : TASK &
        task : blocked&
        task /:pending
    THEN
        blocked := blocked - {task}||
        ready := ready \/ {task}||
        /*
        colocar aqui o sobre a prioridade da 
        tarefa no caso de herança de prioridade
        */
        CHOICE
            running:=task
        OR
            skip
        END 
    END;
    
    t_setPriority(task,priority)=
    PRE
        task:tasks &
        priority:PRIORITY &
        task/=idle   
    THEN
        CHOICE
            running::ready
        OR
            skip
        END
    END;
    
    t_addPending(ptask)=
    
    PRE
        ptask:TASK &
        ptask/:pending &
        ptask:blocked \/suspended
    THEN
        pending := pending\/ {ptask} 
	END;
    
    
   
    t_PriorityInherit(xTicksToWait,holderTask)=
    PRE
        xTicksToWait:TICK &
        holderTask:tasks &        
        holderTask/=idle &
        running/=idle &
        running:ready
    THEN
        ready := ready-{running} ||
        blocked := blocked \/ {running}||
        running:: ready -{running}
    END
  
END