/*
Maquina que implementa o conceito de Task
*/

MACHINE
  Task_Concern

SETS
/*Conjunto universo dos possíveis ponteiros das operações das tarefas */  
TASK_CODE

/*Conjunto universo dos parâmentros das operações das tarefas */
;PARAMETER

SEES
  Types,FreeRTOSConfig

INCLUDES
  Memory


CONSTANTS
/* Conjunto de todas prioridades possíveis*/
   PRIORITIES

/*
Conjunto universo de todas as tarefas possíveis. Essas são formadas por um Nome, 
 uma Pilha, uma Função e uma Prioridade
*/
  ,TASK

/*Prioridade da Idle Task*/
  ,tskIDLE_PRIORITY

/*Tamanho da pilha da Idle Task*/
  ,tskIDLE_STACK_SIZE

/*Constante para representar uma tarefa nula*/
  ,TASK_NULL  

/*Constante para representar um parâmentro NULL*/
  ,PARAMETER_NULL

/*Funções de apoio*/
  ,getName
  ,getPriority
  ,getCode
  ,getStack

/*Constantes que indicam o estado do escalonador*/
  ,taskSCHEDULER_NOT_STARTED	
  ,taskSCHEDULER_RUNNING	
  ,taskSCHEDULER_SUSPENDED	



PROPERTIES

  PRIORITIES = 0..(configMAX_PRIORITIES-1)

& TASK =  NAME*PRIORITIES*TASK_CODE*STACK

& tskIDLE_PRIORITY:PRIORITIES
& tskIDLE_PRIORITY =0 

& tskIDLE_STACK_SIZE:NATURAL
& tskIDLE_STACK_SIZE =configMINIMAL_STACK_SIZE

& getName:TASK --> NAME
& getName=%(nm,pr,tc,stk).(nm,pr,tc,stk:TASK|nm)

& getPriority:TASK--> PRIORITIES
& getPriority=%(nm,pr,tc,stk).(nm,pr,tc,stk:TASK|pr)

& getCode:TASK --> TASK_CODE
& getCode=%(nm,pr,tc,stk).(nm,pr,tc,stk:TASK|tc)

& getStack:TASK --> STACK
& getStack=%(nm,pr,tc,stk).(nm,pr,tc,stk:TASK|stk)

& TASK_NULL:TASK

& PARAMETER_NULL:PARAMETER

& taskSCHEDULER_NOT_STARTED : NATURAL	
& taskSCHEDULER_RUNNING : NATURAL		
& taskSCHEDULER_SUSPENDED : NATURAL	
& taskSCHEDULER_NOT_STARTED =0
& taskSCHEDULER_RUNNING = 1
& taskSCHEDULER_SUSPENDED =2

VARIABLES
/*Conjunto de tarefas*/
  tasks

/*Conjunto de tarefas prontas*/
, readyTasks

/*Tarefa em execução*/
, pxCurrentTCB 

/*Conjunto das tarefas prontas organizadas de acordo com a prioridade*/
, pxReadyTasksLists 

/*Conjunto de tarefas "deletadas" esperando para serem excluidas*/
, xTasksWaitingTermination

/*Conjunto  de tarefas suspensas*/
, xSuspendedTaskList

/*Conjunto de tarefas Blocked*/
, pxDelayedTaskList


/*Número de tarefas criadas */
, uxCurrentNumberOfTasks

/*Maior prioridade usada*/
, uxTopUsedPriority

/*Número de tarefas excluidas*/
, uxTasksDeleted

/*Flag que indica se o escalonador está em execução ou não */
,xSchedulerRunning

/*Variável de controle para vTaskSuspendAll vTaskResumeAll */
,uxSchedulerSuspended

INVARIANT

  tasks<:TASK


/*Conjuntos de tarefas organizadas de acordo com o seu estado*/

& pxCurrentTCB : TASK

& pxReadyTasksLists: PRIORITIES >+> POW(TASK)
& !(pr,tk).(pr:PRIORITIES & tk:TASK =>((getPriority(tk) = pr) <=> (tk : pxReadyTasksLists(pr))))

& readyTasks <:TASK

& xTasksWaitingTermination <: TASK

& xSuspendedTaskList <: TASK

& pxDelayedTaskList <: TASK

& readyTasks = UNION(pr).(pr:PRIORITIES|{tk|tk:TASK & tk:pxReadyTasksLists(pr)})


/*Nenhuma tarefa está em duas listas diferentes*/
&(xSuspendedTaskList/\xTasksWaitingTermination={})
&(pxDelayedTaskList/\xTasksWaitingTermination={})
&(pxDelayedTaskList/\xSuspendedTaskList={})
&(readyTasks/\xTasksWaitingTermination={}) 
&(xSuspendedTaskList/\readyTasks={})
&(pxDelayedTaskList/\readyTasks={})				
& !(p1,p2).(p1:PRIORITIES & p2:PRIORITIES & p1/=p2 => pxReadyTasksLists(p1) /\ pxReadyTasksLists(p2)={}) 

/*Tarefa que está sendo executada é a tarefa de maior prioridade*/
&!(tk).(tk:readyTasks => getPriority(tk)<= getPriority(pxCurrentTCB))	

& tasks = xSuspendedTaskList \/ xTasksWaitingTermination \/ pxDelayedTaskList \/ readyTasks\/ {pxCurrentTCB}

/*Parâmentros de controle interno*/
& uxCurrentNumberOfTasks:NATURAL
& uxCurrentNumberOfTasks=card(tasks)

& uxTopUsedPriority : PRIORITIES
& uxTasksDeleted : NATURAL

/*Controle do Escalonador e das chamadas aos métodos vTaskSuspendAll e vTaskResumeAll */
& xSchedulerRunning:BIT
& uxSchedulerSuspended:NATURAL

INITIALISATION

    tasks:={}
 || pxReadyTasksLists:=PRIORITIES*{} 
 || readyTasks:={} 
 || xTasksWaitingTermination:={}
 || uxCurrentNumberOfTasks:=0
 || uxTopUsedPriority:=0
 || pxCurrentTCB::{}
 || xSuspendedTaskList:={}
 || pxDelayedTaskList:={}
 || uxTasksDeleted:=0
 || xSchedulerRunning:=pdFALSE
 || uxSchedulerSuspended:=0

OPERATIONS


/*************
TASK CREATION
**************/
zz,handle<--xTaskCreate(pvTaskCode, pcName,usStackDepth, pvParameters, uxPriority ) = 
   PRE
      pvTaskCode:TASK_CODE & pcName:NAME & usStackDepth:NATURAL & pvParameters:POW(PARAMETER) & uxPriority:PRIORITIES

   THEN
     ANY task,stack,new_heap
     WHERE task:TASK & task/:tasks & stack:STACK & new_heap:NATURAL
	   & new_heap,stack=portMalloc(heap,usStackDepth) & task=(pcName,uxPriority,pvTaskCode,stack)
      THEN      
	IF stack/=STACK_NULL
	   THEN 
		  tasks:=tasks\/{task}
		||IF uxCurrentNumberOfTasks = 0 
		    THEN pxCurrentTCB := task 
                    ELSE
                      IF uxTopUsedPriority <= uxPriority /*& xSchedulerRunning = pdFALSE*/
			THEN pxCurrentTCB := task 
		      END
		  END
		||IF uxTopUsedPriority <= uxPriority THEN uxTopUsedPriority:=uxPriority END
		||pxReadyTasksLists(uxPriority):= pxReadyTasksLists(uxPriority)\/{task}
		||uxCurrentNumberOfTasks:= uxCurrentNumberOfTasks+1
		||zz:=pdPASS
	   ELSE zz:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY
	END||handle:= task||setHeap(new_heap)
      END	
   END

;

vTaskDelete(pxTaskToDelete)=
  PRE
      pxTaskToDelete:TASK & INCLUDE_vTaskDelete=1 
    & pxTaskToDelete/:xTasksWaitingTermination & pxTaskToDelete:tasks
  THEN
    ANY priority WHERE priority:PRIORITIES & priority=getPriority(pxTaskToDelete)
	THEN 
     	  pxReadyTasksLists(priority):= pxReadyTasksLists(priority)-{pxTaskToDelete}
   	  ||xTasksWaitingTermination := xTasksWaitingTermination \/ {pxTaskToDelete}
   	  ||uxTasksDeleted:=uxTasksDeleted-1
	  ||IF pxCurrentTCB =pxTaskToDelete  THEN pxCurrentTCB:= TASK_NULL END
	END	
  END
;

prvIdleTask(pvParameters)=
PRE
  pvParameters : PARAMETER
THEN
  ANY task,new_heap,pt,sz,tam
  WHERE task:TASK & task:xTasksWaitingTermination & pt:POINTER & tam:NATURAL & tam = card(xTasksWaitingTermination)
	& sz:NATURAL & pt,sz=getStack(task) & new_heap:NATURAL & new_heap=portFree(heap,pt,sz)
    THEN
      IF(uxTasksDeleted > 0 & tam >0)
        THEN
	     xTasksWaitingTermination:=xTasksWaitingTermination-{task}
	   ||tasks:=tasks-{task}	
	   ||uxTasksDeleted:=uxTasksDeleted-1
	   ||uxCurrentNumberOfTasks:=uxCurrentNumberOfTasks-1
        END||setHeap(new_heap)
     END
  END
;


/************************
TASK CONTROL
*************************/

rr<--vTaskSuspend(pxTaskToSuspend)=
PRE
    INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend:TASK & pxTaskToSuspend:tasks

THEN
 IF pxTaskToSuspend /: xSuspendedTaskList
   THEN
       pxReadyTasksLists(getPriority(pxTaskToSuspend))
		:=pxReadyTasksLists(getPriority(pxTaskToSuspend))-{pxTaskToSuspend}
       ||pxDelayedTaskList:=pxDelayedTaskList - {pxTaskToSuspend}
       ||xSuspendedTaskList:=xSuspendedTaskList\/{pxTaskToSuspend}
       ||IF pxCurrentTCB = pxTaskToSuspend THEN pxCurrentTCB:=TASK_NULL END
       ||rr:=pdTRUE	
   ELSE rr:=pdFALSE
 END
END
;

vTaskResume(pxTaskToResume)=
PRE
 INCLUDE_vTaskSuspend=1 & pxTaskToResume:xSuspendedTaskList 
THEN 
  ANY pr WHERE pr:PRIORITIES & pr=getPriority(pxTaskToResume)  
  THEN
        xSuspendedTaskList:=xSuspendedTaskList-{pxTaskToResume}
     || pxReadyTasksLists(pr):=pxReadyTasksLists(pr)\/{pxTaskToResume}
     || IF pr >= getPriority(pxCurrentTCB ) THEN pxCurrentTCB :=TASK_NULL END
  END
END 
;

priority <-- uxTaskPriorityGet(pxTask )=
PRE
  pxTask:TASK & pxTask:tasks & INCLUDE_uxTaskPriorityGet = 1 
THEN 
  priority := getPriority(pxTask)
END
;

/***************
TASK UTIL
****************/

rr<--xTaskGetCurrentTaskHandle=
PRE
  INCLUDE_xTaskGetCurrentTaskHandle = 1
THEN
  rr:=pxCurrentTCB 
END
;

numberOfTasks <-- uxTaskGetNumberOfTasks =
BEGIN
  numberOfTasks:=uxCurrentNumberOfTasks
END
;


xReturn<--xTaskGetSchedulerState=
PRE
  INCLUDE_xTaskGetSchedulerState=1
THEN
  IF xSchedulerRunning = pdFALSE 
    THEN xReturn:=taskSCHEDULER_NOT_STARTED
    ELSE
      IF uxSchedulerSuspended =pdFALSE 	
	THEN xReturn := taskSCHEDULER_RUNNING	
	ELSE xReturn := taskSCHEDULER_SUSPENDED
      END
  END	
END
;

/******************
Scheduler Control
********************/
taskStartScheduler = 
PRE
 xSchedulerRunning=pdFALSE  	
THEN
 xSchedulerRunning := pdTRUE
END
;

vTaskEndScheduler =
PRE
  xSchedulerRunning = pdTRUE	
THEN
  xSchedulerRunning := pdFALSE
END
;

vTaskSuspendAll=
BEGIN
 uxSchedulerSuspended:=uxSchedulerSuspended+1   
END
;

xTaskResumeAll = 
PRE
  uxSchedulerSuspended >0
THEN
 uxSchedulerSuspended:=uxSchedulerSuspended-1
 
END


END