/* Task
 * Author: Stephenson Galvão
 *
 *
 * This machine implement the concepts of tasks and some operation of Task.h that don't need uses the operation of other api as Queue.h.
 * Some concepts aren't concerns here, than are:
 	- The operation that concerns with the switch context when the tick interruption occur
 	- Block of scheduler activites in the critical operation
 	- Manager memory
 	- Task's Stack
 	- Task's function and pointer to function
 */
MACHINE
    Task_Basic
SEES
    FreeRTOSConfig, 
    Types
SETS
    /* 
    Set of all available pointers to operation's task 
	*/    
    TASK_CODE;
	
    /* Set of states of a tasks*/
    TASK_STATE={running,blocked,ready,suspended,deleted};
    
    /* Set of schedule's states*/
    SCHEDULER_STATE={taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED};
    
    /* Set of all available stacks for a task*/
	STACK;
	
	/*Set of task availables */
	TASK	    
    
CONSTANTS 
    /*Set of priorities available*/
	PRIORITY,
	
	/*Set of tick available*/
	TICK,
	
	/*Task null*/
	TASK_NULL,
	
	/*Name null*/
	NAME_NULL,
	
	/*Function that, give the task_state and task_priority, return the set of priorities of ready tasks */
	READY_PRIORITIES,
	
	/*Function for increment the tick*/
	TICK_INCREMENT,
	
	/*Constant the hold the value of priority of idle task*/
	tskIDLE_PRIORITY,
	
	/*
	Function that, give the set of blocked task, return the same set but with all task of set unblocked. The return of this function is
	(TASK+->TASK_STATE) that is used to change the task_state variable
	*/
	UNBLOCK_TASKS
		
PROPERTIES
    
    PRIORITY= 0..(configMAX_PRIORITIES-1)
    
&	TICK = 0..MAX_DELAY

& 	TASK_NULL:TASK

&	NAME_NULL:NAME

&	READY_PRIORITIES:(TASK +-> TASK_STATE) * (TASK +-> PRIORITY) --> POW(PRIORITY)
& 	READY_PRIORITIES = %(tk_st,tk_prt).(tk_st:(TASK +-> TASK_STATE) & tk_prt:(TASK +-> PRIORITY) 
    												& not(ran(dom(tk_st|>{ready})<|tk_prt)={}) |ran(dom(tk_st|>{ready})<|tk_prt))
                         
                       \/ %(tk_st,tk_prt).(tk_st:(TASK +-> TASK_STATE) & tk_prt:(TASK +-> PRIORITY) 
    													& ran(dom(tk_st|>{ready})<|tk_prt)={} |{0})
                    	

&	TICK_INCREMENT: TICK * TICK --> TICK
& 	TICK_INCREMENT = %(tick,inc).(tick:TICK & inc:TICK | (tick+inc) mod MAX_DELAY)
    			
&	tskIDLE_PRIORITY:PRIORITY & tskIDLE_PRIORITY = 1

&	UNBLOCK_TASKS: POW(TASK) --> (TASK +-> TASK_STATE)
&	UNBLOCK_TASKS = %(bTasks).(bTasks:POW(TASK)| UNION (tk).(tk:bTasks | {rTask| rTask= tk|->ready } ) )

ASSERTIONS
    !(tk_st,tk_prt).(tk_st:(TASK +-> TASK_STATE) & tk_prt:(TASK +-> PRIORITY) => ( 
        							not(ran(dom(tk_st|>{ready})<|tk_prt)={})  => READY_PRIORITIES(tk_st,tk_prt)= ran(dom(tk_st|>{ready})<|tk_prt)
    							&	ran(dom(tk_st|>{ready})<|tk_prt)={} => READY_PRIORITIES(tk_st,tk_prt)={0})
                            )&
                            
   	!(tk_st,tk_prt).(tk_st:(TASK +-> TASK_STATE) & tk_prt:(TASK +-> PRIORITY) => READY_PRIORITIES(tk_st,tk_prt)/={}) & 			
   	!(tk_st,tk_prt).(tk_st:(TASK +-> TASK_STATE) & tk_prt:(TASK +-> PRIORITY) => max(READY_PRIORITIES(tk_st,tk_prt))>=0)    																			
VARIABLES
    /*Set of all system's tasks*/
    tasks,
    
    /*properties of task*/
    task_priority,
	task_name,
	task_state,
	task_value,
	
	/*task running and its priority*/
	max_priority,
	current_task,
	
	/*state of scheduler*/
	scheduler,
	
	/*total of tick occur */
	tickCount,
	
	/*total of tick missed of count*/
	tickMissed
	
    
    
   
INVARIANT
    tasks : POW(TASK) &
    
    /*Relações que armazenam os atributos de uma tarefa*/
	task_name: TASK +-> NAME &
	task_state: TASK+-> TASK_STATE & 
	task_priority : TASK +-> PRIORITY & 
	task_value: TASK+->TICK &
    
    /* toda tarefa deve ter  name,state, priority e value*/
    tasks = dom(task_priority)  &
	tasks = dom(task_state) &
	tasks = dom(task_value) &
	tasks = dom(task_name) &
	
	
	current_task:TASK &
	current_task:tasks &
	task_state(current_task)=running &

	max_priority: PRIORITY &
	max_priority = task_priority(current_task) &
	max_priority >= max(READY_PRIORITIES(task_state,task_priority)) &
	
	
	

	 
	/* existe no máximo uma tarefa com o state igual a running*/
	card(task_state|> {running})<=1 &
	
	scheduler: SCHEDULER_STATE &
	
	tickCount: TICK &
	
	tickMissed:TICK

INITIALISATION
    tasks:= {TASK_NULL}||
    task_name:={TASK_NULL|->NAME_NULL}||
    task_state:={TASK_NULL|->running}||
    task_priority:={TASK_NULL|->0}||
    task_value:={TASK_NULL|->0} ||
    current_task:=TASK_NULL ||
    max_priority:=0||
    scheduler:=taskSCHEDULER_NOT_STARTED||
    tickCount:=0||
    tickMissed:=0
    
OPERATIONS
    
/******************************************************************************************************************************
TASK CREATE
******************************************************************************************************************************/    


/*
	The original method have the handle is passed as reference. Here we put the handle as operation's return 
*/


zz,handle<--xTaskCreate(pvTaskCode, pcName, usStackDepth, pvParameters, uxPriority) =
PRE
    pvTaskCode:TASK_CODE & pcName:NAME & usStackDepth:NATURAL &  pvParameters<:PARAMETER & uxPriority:PRIORITY
THEN 
    
    CHOICE 
    
    	ANY task WHERE task:TASK & task/:tasks 
    	THEN 
        	tasks:= tasks\/{task} ||
        	task_name:=task_name \/ {task|->pcName}||
        	task_value:=task_value \/ {task|->0}||
        	
        	IF uxPriority > max_priority 
        	THEN
        	    task_state:=task_state<+{current_task|->ready,task|->running}||
        	    max_priority:=uxPriority||
        	    current_task:= task
        	ELSE
        	    task_state:= task_state<+ {task|->ready}
        	END||
        	task_priority:=task_priority \/ {task|->uxPriority}||
        	zz,handle:= pdPASS,task
    	END 
    	
    OR
        zz,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL
    END
    	                     
END
;



deleteTask(pxTaskToDelete)=
PRE
   	INCLUDE_vTaskDelete=1 & pxTaskToDelete:tasks & task_state(pxTaskToDelete)/=deleted 
THEN
    tasks:=tasks-{pxTaskToDelete}||
    task_name:= {pxTaskToDelete} <<|task_name ||
    IF pxTaskToDelete = current_task 
    THEN
        ANY mpriority, ctk
        WHERE 
            mpriority:PRIORITY & mpriority=max(READY_PRIORITIES(task_state,task_priority))&  ctk:dom({pxTaskToDelete}<<|task_priority) & 
            task_priority(ctk)=mpriority & task_state(ctk)=ready
        THEN
            task_state:= ({current_task} <<|task_state) <+ {ctk|->running}||
        	max_priority:=mpriority||
        	current_task:=ctk
		END        
    ELSE
         task_state:= {pxTaskToDelete} <<|task_state
    END||
    task_priority:={pxTaskToDelete} <<| task_priority||
    task_value:={pxTaskToDelete} <<| task_value
   
END
;

rr<--vTaskSuspend(pxTaskToSuspend)=
PRE
    INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend:tasks
THEN
    IF not(task_state(pxTaskToSuspend)=suspended)
    THEN
        IF(pxTaskToSuspend = current_task)
        THEN
            ANY mprt,ctk 
            WHERE mprt:PRIORITY & mprt= max(READY_PRIORITIES(task_state,task_priority)) 
                	& ctk:dom({pxTaskToSuspend}<<|task_priority) & task_priority(ctk)=mprt & task_state(ctk)=ready
            THEN
               task_state:= (task_state<+{pxTaskToSuspend|->suspended} )<+ {ctk|->running}||
               current_task:=ctk||
               max_priority:=mprt
        	END
	    	
	    ELSE
	        task_state:= task_state<+{pxTaskToSuspend|->suspended} 
	    END || rr:=pdTRUE	    
	ELSE 
	    rr:=pdFALSE	    
 	END
END
;


vTaskResume(pxTaskToResume)=
PRE
    INCLUDE_vTaskSuspend=1 & pxTaskToResume:tasks & task_state(pxTaskToResume)=suspended
THEN	    
    IF task_priority(pxTaskToResume)>max_priority 
    THEN
        task_state:= (task_state <+ {current_task|->ready} ) <+ {pxTaskToResume|->running}||
        current_task:=pxTaskToResume||
        max_priority:=task_priority(pxTaskToResume)
    ELSE
    	task_state:=task_state<+{pxTaskToResume|->ready}
    END  	
END
;


priority <-- uxTaskPriorityGet(pxTask )=
PRE
    pxTask:tasks & INCLUDE_uxTaskPriorityGet = 1 
THEN 
    priority := task_priority(pxTask)
END 
;


rr<--xTaskGetCurrentTaskHandle=
PRE
    INCLUDE_xTaskGetCurrentTaskHandle = 1
THEN
    rr:=current_task
END
;

numberOfTasks <-- uxTaskGetNumberOfTasks =
BEGIN
    numberOfTasks:=card(tasks)
END
;

xReturn<--xTaskGetSchedulerState=
PRE
    INCLUDE_xTaskGetSchedulerState=1
THEN
    xReturn := scheduler
END
;


vTaskDelay(xTicksToDelay)=
PRE
    xTicksToDelay : TICK & not(xTicksToDelay=0) & INCLUDE_vTaskDelay=1 
THEN
    ANY mprt,ctk 
    WHERE mprt:PRIORITY & mprt= max(READY_PRIORITIES(task_state,task_priority))         
           & ctk:dom({current_task}<<|task_priority) & task_priority(ctk)=mprt & task_state(ctk)=ready
   	THEN       
         task_state:= (task_state<+{current_task|->blocked} )<+ {ctk|->running}||
         task_value:=task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToDelay)}||
         current_task:=ctk||
         max_priority:=mprt 
     END
END
;

vTaskDelayUntil(pxPreviousWakeTime,xTimeIncrement )=
PRE
    pxPreviousWakeTime:TICK & xTimeIncrement:TICK & INCLUDE_vTaskDelayUntil=1
THEN
    CHOICE
        ANY mprt,ctk 
    	WHERE mprt:PRIORITY & mprt= max(READY_PRIORITIES(task_state,task_priority))         
           	& ctk:dom({current_task}<<|task_priority) & task_priority(ctk)=mprt & task_state(ctk)=ready
   		THEN       
         	task_state:= (task_state<+{current_task|->blocked} )<+ {ctk|->running}||
         	task_value:=task_value<+{current_task|->TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)}||	
         	current_task:=ctk||
         	max_priority:=mprt 
     	END
    OR
        skip
    END
END
;

zz<--xTaskGetTickCount=
PRE
    INCLUDE_xTaskGetCurrentTaskHandle = 1
THEN
    zz:=tickCount
END
;

vTaskStartScheduler = 
PRE
    scheduler = taskSCHEDULER_NOT_STARTED  	
THEN
    
    CHOICE
        ANY idle_name, idle_task 
        WHERE idle_name:NAME & idle_task:TASK & idle_task/:tasks
        THEN
            tasks:=tasks\/ {idle_task}||
            task_name:=task_name \/ {idle_task|->idle_name}||
            task_priority:=task_priority\/{idle_task|->tskIDLE_PRIORITY}||
            task_value:=task_value\/{idle_task|->0}||
			IF tasks={TASK_NULL}
			THEN
			    task_state:=task_state<+ {idle_task|->running}
			ELSE
			    task_state:=task_state<+ {idle_task|->ready}
			END 
		END||
		tickCount:=0||
		tickMissed:=0
			       
    OR
        skip
    END
 	
END
;

vTaskEndScheduler =
PRE
    scheduler = taskSCHEDULER_RUNNING
THEN
    tasks:= {TASK_NULL}||
    task_name:={TASK_NULL|->NAME_NULL}||
    task_state:={TASK_NULL|->running}||
    task_priority:={TASK_NULL|->0}||
    task_value:={TASK_NULL|->0} ||
    current_task:=TASK_NULL ||
    max_priority:=0||
    scheduler:=taskSCHEDULER_NOT_STARTED
END
;

vTaskSuspendAll=
BEGIN 
   scheduler := taskSCHEDULER_SUSPENDED
END
;

xTaskResumeAll = 
IF scheduler = taskSCHEDULER_SUSPENDED
	THEN
    	scheduler := taskSCHEDULER_RUNNING ||
    	tickCount:= TICK_INCREMENT(tickCount,tickMissed)||
    	ANY blockedTasks,mprt,task
    	WHERE blockedTasks={bTask|bTask:tasks & task_state(bTask)=blocked & tickCount<=task_value(bTask) &
    	      																task_value(bTask) <=TICK_INCREMENT(tickCount,tickMissed)}  
          	  & mprt: PRIORITY & mprt=max(ran(dom(UNBLOCK_TASKS(blockedTasks)) <| task_priority)) &
          	  task: dom(UNBLOCK_TASKS(blockedTasks))  & task: dom(task_priority) & task_priority(task)=mprt 
    	THEN
    	     IF mprt>max_priority
            /*
            	Se existir uma tarefa que será desbloqueada com a prioridade maior que a da tarefa em execução,
            	ela irá para o estado running e a tarrefa corrente irá para o estado ready. Caso não exista tão sintuação 
            */
        	THEN
            	task_state:= task_state <+ UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running}||
            	current_task:=task||
            	max_priority:=mprt
        	ELSE
            	task_state:= task_state <+ UNBLOCK_TASKS(blockedTasks)
			END
    	END
    	
	ELSE
    	skip
END
;

incrementTick =
BEGIN
    IF scheduler = taskSCHEDULER_RUNNING
    THEN tickCount := TICK_INCREMENT(tickCount,1)
    ELSE tickMissed := TICK_INCREMENT(tickCount,1)
    END||
         
    /*
    blockedTasks = Lista de tarefas bloqueadas que devem ser desbloqueadas
 	mpr = maior prioridade entre as tarefas que serão desbloqueadas
    task = tarefa com maior prioridade entre o conjunto de tarefas desbloqueadas
    */
    ANY blockedTasks,mprt,task
    WHERE blockedTasks={ bTask| bTask: tasks & task_state(bTask) = blocked & task_value(bTask)=TICK_INCREMENT(tickCount,1) } &
          mprt: PRIORITY & mprt=max(ran(dom(UNBLOCK_TASKS(blockedTasks)) <| task_priority)) &
          task: dom(UNBLOCK_TASKS(blockedTasks))  & task: dom(task_priority) & task_priority(task)=mprt  
    THEN  
        IF mprt>max_priority
            /*
            	Se existir uma tarefa que será desbloqueada com a prioridade maior que a da tarefa em execução,
            	ela irá para o estado running e a tarrefa corrente irá para o estado ready. Caso não exista tão sintuação 
            */
        THEN
            task_state:= task_state <+ UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running}||
            current_task:=task||
            max_priority:=mprt
        ELSE
            task_state:= task_state <+ UNBLOCK_TASKS(blockedTasks)
		END        
        
    END
END
;

removeFromBlockedList(task)=
PRE
	task:tasks & task_state(task)=blocked & task/=current_task
THEN
	IF task_priority(task)>max_priority
	THEN
	    task_state:= task_state <+{current_task|->ready,task|->running}||
     	current_task:=task||
     	max_priority:=task_priority(task)
    ELSE
        task_state:= task_state <+ {task|->ready}
	END
END

END