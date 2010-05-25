Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Task))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Task))==(Machine(Task));
  Level(Machine(Task))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Task)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Task))==(FreeRTOSConfig,Types,Scheduler)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Task))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Task))==(?);
  List_Includes(Machine(Task))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Task))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Task))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Task))==(?);
  Context_List_Variables(Machine(Task))==(?);
  Abstract_List_Variables(Machine(Task))==(?);
  Local_List_Variables(Machine(Task))==(idle,running,suspended,runable,blocked,tasks,active);
  List_Variables(Machine(Task))==(idle,running,suspended,runable,blocked,tasks,active);
  External_List_Variables(Machine(Task))==(idle,running,suspended,runable,blocked,tasks,active)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Task))==(?);
  Abstract_List_VisibleVariables(Machine(Task))==(?);
  External_List_VisibleVariables(Machine(Task))==(?);
  Expanded_List_VisibleVariables(Machine(Task))==(?);
  List_VisibleVariables(Machine(Task))==(?);
  Internal_List_VisibleVariables(Machine(Task))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Task))==(btrue);
  Gluing_List_Invariant(Machine(Task))==(btrue);
  Expanded_List_Invariant(Machine(Task))==(btrue);
  Abstract_List_Invariant(Machine(Task))==(btrue);
  Context_List_Invariant(Machine(Task))==(schedulerRunning: BOOL & schedulerSuspended: NATURAL);
  List_Invariant(Machine(Task))==(active: BOOL & tasks: FIN(TASK) & blocked: FIN(TASK) & blocked <: tasks & runable: FIN(TASK) & runable <: tasks & suspended: FIN(TASK) & suspended <: tasks & runable/\blocked = {} & blocked/\suspended = {} & suspended/\runable = {} & tasks = suspended\/blocked\/runable & running: TASK & idle: TASK & (active = TRUE => runable/={} & running: runable & idle: runable))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Task))==(btrue);
  Abstract_List_Assertions(Machine(Task))==(btrue);
  Context_List_Assertions(Machine(Task))==(configMAX_PRIORITIES: NATURAL & BIT <: NATURAL);
  List_Assertions(Machine(Task))==(active = TRUE => runable/={};active = TRUE => tasks/={};active = TRUE => idle: runable;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => running: runable;active = TRUE => running/:blocked;active = TRUE => running/:suspended)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Task))==(active,tasks,blocked,runable,suspended:=FALSE,{},{},{},{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0));
  Context_List_Initialisation(Machine(Task))==(skip);
  List_Initialisation(Machine(Task))==(active:=FALSE || tasks,blocked,runable,suspended:={},{},{},{} || idle:: TASK || running:: TASK)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Task))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Task),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Machine(Task),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(Task),Machine(Scheduler))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Task))==(btrue);
  List_Constraints(Machine(Task))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Task))==(t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_suspendAll,t_PriorityInherit);
  List_Operations(Machine(Task))==(t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_suspendAll,t_PriorityInherit)
END
&
THEORY ListInputX IS
  List_Input(Machine(Task),t_create)==(priority);
  List_Input(Machine(Task),t_delete)==(atask);
  List_Input(Machine(Task),t_yield)==(?);
  List_Input(Machine(Task),t_suspend)==(stask);
  List_Input(Machine(Task),t_resume)==(rtask);
  List_Input(Machine(Task),t_getPriority)==(atask);
  List_Input(Machine(Task),t_getCurrent)==(?);
  List_Input(Machine(Task),t_getNumberOfTasks)==(?);
  List_Input(Machine(Task),t_delayTask)==(ticks,task);
  List_Input(Machine(Task),t_startScheduler)==(?);
  List_Input(Machine(Task),t_endScheduler)==(?);
  List_Input(Machine(Task),t_resumeAll)==(unblocked);
  List_Input(Machine(Task),t_unblock)==(task);
  List_Input(Machine(Task),t_removeFromEventList)==(task);
  List_Input(Machine(Task),t_setPriority)==(task,priority);
  List_Input(Machine(Task),t_suspendAll)==(?);
  List_Input(Machine(Task),t_PriorityInherit)==(xTicksToWait,holderTask)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Task),t_create)==(result);
  List_Output(Machine(Task),t_delete)==(?);
  List_Output(Machine(Task),t_yield)==(?);
  List_Output(Machine(Task),t_suspend)==(?);
  List_Output(Machine(Task),t_resume)==(?);
  List_Output(Machine(Task),t_getPriority)==(priority);
  List_Output(Machine(Task),t_getCurrent)==(result);
  List_Output(Machine(Task),t_getNumberOfTasks)==(result);
  List_Output(Machine(Task),t_delayTask)==(?);
  List_Output(Machine(Task),t_startScheduler)==(?);
  List_Output(Machine(Task),t_endScheduler)==(?);
  List_Output(Machine(Task),t_resumeAll)==(?);
  List_Output(Machine(Task),t_unblock)==(?);
  List_Output(Machine(Task),t_removeFromEventList)==(?);
  List_Output(Machine(Task),t_setPriority)==(?);
  List_Output(Machine(Task),t_suspendAll)==(?);
  List_Output(Machine(Task),t_PriorityInherit)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Task),t_create)==(result <-- t_create(priority));
  List_Header(Machine(Task),t_delete)==(t_delete(atask));
  List_Header(Machine(Task),t_yield)==(t_yield);
  List_Header(Machine(Task),t_suspend)==(t_suspend(stask));
  List_Header(Machine(Task),t_resume)==(t_resume(rtask));
  List_Header(Machine(Task),t_getPriority)==(priority <-- t_getPriority(atask));
  List_Header(Machine(Task),t_getCurrent)==(result <-- t_getCurrent);
  List_Header(Machine(Task),t_getNumberOfTasks)==(result <-- t_getNumberOfTasks);
  List_Header(Machine(Task),t_delayTask)==(t_delayTask(ticks,task));
  List_Header(Machine(Task),t_startScheduler)==(t_startScheduler);
  List_Header(Machine(Task),t_endScheduler)==(t_endScheduler);
  List_Header(Machine(Task),t_resumeAll)==(t_resumeAll(unblocked));
  List_Header(Machine(Task),t_unblock)==(t_unblock(task));
  List_Header(Machine(Task),t_removeFromEventList)==(t_removeFromEventList(task));
  List_Header(Machine(Task),t_setPriority)==(t_setPriority(task,priority));
  List_Header(Machine(Task),t_suspendAll)==(t_suspendAll);
  List_Header(Machine(Task),t_PriorityInherit)==(t_PriorityInherit(xTicksToWait,holderTask))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Task),t_create)==(priority: PRIORITY);
  List_Precondition(Machine(Task),t_delete)==(atask: TASK & atask: tasks & atask/=idle);
  List_Precondition(Machine(Task),t_yield)==(active = TRUE);
  List_Precondition(Machine(Task),t_suspend)==(stask: TASK & stask: tasks & stask/=idle);
  List_Precondition(Machine(Task),t_resume)==(rtask: TASK & rtask: suspended);
  List_Precondition(Machine(Task),t_getPriority)==(atask: TASK & atask: tasks);
  List_Precondition(Machine(Task),t_getCurrent)==(btrue);
  List_Precondition(Machine(Task),t_getNumberOfTasks)==(btrue);
  List_Precondition(Machine(Task),t_delayTask)==(task: TASK & task = running & running: runable & running/=idle & ticks: TICK);
  List_Precondition(Machine(Task),t_startScheduler)==(active = FALSE);
  List_Precondition(Machine(Task),t_endScheduler)==(active = TRUE);
  List_Precondition(Machine(Task),t_resumeAll)==(unblocked: FIN(TASK) & unblocked <: blocked);
  List_Precondition(Machine(Task),t_unblock)==(task: TASK & task: blocked);
  List_Precondition(Machine(Task),t_removeFromEventList)==(task: TASK & task: blocked\/suspended);
  List_Precondition(Machine(Task),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle);
  List_Precondition(Machine(Task),t_suspendAll)==(active = TRUE);
  List_Precondition(Machine(Task),t_PriorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: runable)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Task),t_PriorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: runable | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (@(running$0).(running$0: n_runable ==> running:=running$0) || runable:=n_runable)) || blocked:=blocked\/{running});
  Expanded_List_Substitution(Machine(Task),t_suspendAll)==(active = TRUE | active:=FALSE);
  Expanded_List_Substitution(Machine(Task),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle | @(running$0).(running$0: runable ==> running:=running$0) [] skip);
  Expanded_List_Substitution(Machine(Task),t_removeFromEventList)==(task: TASK & task: blocked\/suspended | task: blocked ==> blocked:=blocked-{task} [] not(task: blocked) ==> skip || (task: suspended ==> suspended:=suspended-{task} [] not(task: suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{task} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))));
  Expanded_List_Substitution(Machine(Task),t_unblock)==(task: TASK & task: blocked | blocked:=blocked-{task} || @n_runable.(n_runable <: tasks & n_runable = runable\/{task} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))));
  Expanded_List_Substitution(Machine(Task),t_resumeAll)==(unblocked: FIN(TASK) & unblocked <: blocked | unblocked/={} ==> (@n_runable.(n_runable <: tasks & n_runable = runable\/unblocked ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))) || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip);
  Expanded_List_Substitution(Machine(Task),t_endScheduler)==(active = TRUE | active,tasks,blocked,suspended,runable:=FALSE,{},{},{},{});
  Expanded_List_Substitution(Machine(Task),t_startScheduler)==(active = FALSE | active:=TRUE || @(idle_task,n_runable).(idle_task: TASK & idle_task/:tasks & n_runable <: tasks & n_runable = runable\/{idle_task} ==> (idle,tasks:=idle_task,tasks\/{idle_task} || @(running$0).(running$0: n_runable ==> running:=running$0))));
  Expanded_List_Substitution(Machine(Task),t_delayTask)==(task: TASK & task = running & running: runable & running/=idle & ticks: TICK | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running});
  Expanded_List_Substitution(Machine(Task),t_getNumberOfTasks)==(btrue | result:=card(tasks));
  Expanded_List_Substitution(Machine(Task),t_getCurrent)==(btrue | result:=running);
  Expanded_List_Substitution(Machine(Task),t_getPriority)==(atask: TASK & atask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Machine(Task),t_resume)==(rtask: TASK & rtask: suspended | @n_runable.(n_runable <: tasks & n_runable = runable\/{rtask} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))) || suspended:=suspended-{rtask});
  Expanded_List_Substitution(Machine(Task),t_suspend)==(stask: TASK & stask: tasks & stask/=idle | stask: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{stask} ==> (runable:=n_runable || (stask = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(stask = running) ==> skip))) [] not(stask: runable) ==> (stask: blocked ==> blocked:=blocked-{stask} [] not(stask: blocked) ==> skip) || suspended:=suspended\/{stask});
  Expanded_List_Substitution(Machine(Task),t_yield)==(active = TRUE | @(running$0).(running$0: runable ==> running:=running$0));
  Expanded_List_Substitution(Machine(Task),t_delete)==(atask: TASK & atask: tasks & atask/=idle | tasks:=tasks-{atask} || (atask: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{atask} ==> (runable:=n_runable || (atask = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(atask = running) ==> skip))) [] not(atask: runable) ==> (atask: blocked ==> blocked:=blocked-{atask} [] not(atask: blocked) ==> (atask: suspended ==> suspended:=suspended-{atask} [] not(atask: suspended) ==> skip))));
  Expanded_List_Substitution(Machine(Task),t_create)==(priority: PRIORITY | @(task,n_runable).(task: TASK & task/:tasks & n_runable <: tasks & n_runable = runable\/{task} ==> (tasks,runable:=tasks\/{task},n_runable || (skip [] @(running$0).(running$0: n_runable ==> running:=running$0)) || result:=task)));
  List_Substitution(Machine(Task),t_create)==(ANY task,n_runable WHERE task: TASK & task/:tasks & n_runable <: tasks & n_runable = runable\/{task} THEN tasks:=tasks\/{task} || runable:=n_runable || CHOICE skip OR running:: n_runable END || result:=task END);
  List_Substitution(Machine(Task),t_delete)==(tasks:=tasks-{atask} || IF atask: runable THEN ANY n_runable WHERE n_runable <: tasks & n_runable = runable-{atask} THEN runable:=n_runable || IF atask = running THEN running:: n_runable END END ELSIF atask: blocked THEN blocked:=blocked-{atask} ELSIF atask: suspended THEN suspended:=suspended-{atask} END);
  List_Substitution(Machine(Task),t_yield)==(running:: runable);
  List_Substitution(Machine(Task),t_suspend)==(IF stask: runable THEN ANY n_runable WHERE n_runable <: tasks & n_runable = runable-{stask} THEN runable:=n_runable || IF stask = running THEN running:: n_runable END END ELSIF stask: blocked THEN blocked:=blocked-{stask} END || suspended:=suspended\/{stask});
  List_Substitution(Machine(Task),t_resume)==(ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/{rtask} THEN runable:=n_runable || CHOICE running:: n_runable OR skip END END || suspended:=suspended-{rtask});
  List_Substitution(Machine(Task),t_getPriority)==(priority:: PRIORITY);
  List_Substitution(Machine(Task),t_getCurrent)==(result:=running);
  List_Substitution(Machine(Task),t_getNumberOfTasks)==(result:=card(tasks));
  List_Substitution(Machine(Task),t_delayTask)==(ANY n_runable WHERE n_runable <: tasks & n_runable = runable-{running} THEN runable:=n_runable || running:: n_runable END || blocked:=blocked\/{running});
  List_Substitution(Machine(Task),t_startScheduler)==(active:=TRUE || ANY idle_task,n_runable WHERE idle_task: TASK & idle_task/:tasks & n_runable <: tasks & n_runable = runable\/{idle_task} THEN idle:=idle_task || tasks:=tasks\/{idle_task} || running:: n_runable END);
  List_Substitution(Machine(Task),t_endScheduler)==(active:=FALSE || tasks,blocked,suspended,runable:={},{},{},{});
  List_Substitution(Machine(Task),t_resumeAll)==(IF unblocked/={} THEN ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/unblocked THEN runable:=n_runable || CHOICE running:: n_runable OR skip END END || blocked:=blocked-unblocked END);
  List_Substitution(Machine(Task),t_unblock)==(blocked:=blocked-{task} || ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/{task} THEN runable:=n_runable || CHOICE running:: n_runable OR skip END END);
  List_Substitution(Machine(Task),t_removeFromEventList)==(IF task: blocked THEN blocked:=blocked-{task} END || IF task: suspended THEN suspended:=suspended-{task} END || ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/{task} THEN runable:=n_runable || CHOICE running:: n_runable OR skip END END);
  List_Substitution(Machine(Task),t_setPriority)==(CHOICE running:: runable OR skip END);
  List_Substitution(Machine(Task),t_suspendAll)==(active:=FALSE);
  List_Substitution(Machine(Task),t_PriorityInherit)==(ANY n_runable WHERE n_runable <: tasks & n_runable = runable-{running} THEN running:: n_runable || runable:=n_runable END || blocked:=blocked\/{running})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Task))==(?);
  Inherited_List_Constants(Machine(Task))==(?);
  List_Constants(Machine(Task))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Task),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Machine(Task))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Machine(Task))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Machine(Task))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Machine(Task))==(?);
  Inherited_List_Enumerated(Machine(Task))==(?);
  Inherited_List_Defered(Machine(Task))==(?);
  Inherited_List_Sets(Machine(Task))==(?);
  List_Enumerated(Machine(Task))==(?);
  List_Defered(Machine(Task))==(?);
  List_Sets(Machine(Task))==(?);
  Set_Definition(Machine(Task),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(Task),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(Task),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Task))==(?);
  Expanded_List_HiddenConstants(Machine(Task))==(?);
  List_HiddenConstants(Machine(Task))==(?);
  External_List_HiddenConstants(Machine(Task))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Task))==(btrue);
  Context_List_Properties(Machine(Task))==(configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & PRIORITY = 0..configMAX_PRIORITIES-1 & BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Machine(Task))==(btrue);
  List_Properties(Machine(Task))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Task),Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  Seen_Context_List_Enumerated(Machine(Task))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Machine(Task))==(btrue);
  Seen_Context_List_Assertions(Machine(Task))==(BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(Task))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Machine(Task))==(btrue);
  Seen_List_Precondition(Machine(Task),resumeScheduler)==(schedulerSuspended>0);
  Seen_Expanded_List_Substitution(Machine(Task),resumeScheduler)==(schedulerSuspended:=schedulerSuspended-1);
  Seen_List_Precondition(Machine(Task),suspendScheduler)==(schedulerSuspended<MAXINT);
  Seen_Expanded_List_Substitution(Machine(Task),suspendScheduler)==(schedulerSuspended:=schedulerSuspended+1);
  Seen_List_Precondition(Machine(Task),stopScheduler)==(schedulerRunning = TRUE);
  Seen_Expanded_List_Substitution(Machine(Task),stopScheduler)==(schedulerRunning:=FALSE);
  Seen_List_Precondition(Machine(Task),startScheduler)==(schedulerRunning = FALSE);
  Seen_Expanded_List_Substitution(Machine(Task),startScheduler)==(schedulerRunning:=TRUE);
  Seen_List_Operations(Machine(Task),Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  Seen_Expanded_List_Invariant(Machine(Task),Machine(Scheduler))==(btrue);
  Seen_Internal_List_Operations(Machine(Task),Machine(Types))==(?);
  Seen_List_Operations(Machine(Task),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Task),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Machine(Task),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Machine(Task),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(Task),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Machine(Task),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Machine(Task),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(Task),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(Task),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Task),t_create)==((Var(task) == atype(TASK,?,?)),(Var(n_runable) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Machine(Task),t_delete)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(Task),t_yield)==(?);
  List_ANY_Var(Machine(Task),t_suspend)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(Task),t_resume)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(Task),t_getPriority)==(?);
  List_ANY_Var(Machine(Task),t_getCurrent)==(?);
  List_ANY_Var(Machine(Task),t_getNumberOfTasks)==(?);
  List_ANY_Var(Machine(Task),t_delayTask)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(Task),t_startScheduler)==((Var(idle_task) == atype(TASK,?,?)),(Var(n_runable) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Machine(Task),t_endScheduler)==(?);
  List_ANY_Var(Machine(Task),t_resumeAll)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(Task),t_unblock)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(Task),t_removeFromEventList)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(Task),t_setPriority)==(?);
  List_ANY_Var(Machine(Task),t_suspendAll)==(?);
  List_ANY_Var(Machine(Task),t_PriorityInherit)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(Task),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Task)) == (? | ? | idle,running,suspended,runable,blocked,tasks,active | ? | t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_suspendAll,t_PriorityInherit | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)),seen(Machine(Scheduler)) | ? | Task);
  List_Of_HiddenCst_Ids(Machine(Task)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task)) == (?);
  List_Of_VisibleVar_Ids(Machine(Task)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task)) == (?: ?);
  List_Of_Ids(Machine(Scheduler)) == (? | ? | schedulerSuspended,schedulerRunning | ? | startScheduler,stopScheduler,suspendScheduler,resumeScheduler | ? | seen(Machine(Types)) | ? | Scheduler);
  List_Of_HiddenCst_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Scheduler)) == (?);
  List_Of_VisibleVar_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Scheduler)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Task)) == (Type(idle) == Mvl(atype(TASK,?,?));Type(running) == Mvl(atype(TASK,?,?));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(runable) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Task)) == (Type(t_PriorityInherit) == Cst(No_type,btype(INTEGER,?,?)*atype(TASK,?,?));Type(t_suspendAll) == Cst(No_type,No_type);Type(t_setPriority) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_removeFromEventList) == Cst(No_type,atype(TASK,?,?));Type(t_unblock) == Cst(No_type,atype(TASK,?,?));Type(t_resumeAll) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(t_endScheduler) == Cst(No_type,No_type);Type(t_startScheduler) == Cst(No_type,No_type);Type(t_delayTask) == Cst(No_type,btype(INTEGER,?,?)*atype(TASK,?,?));Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(t_resume) == Cst(No_type,atype(TASK,?,?));Type(t_suspend) == Cst(No_type,atype(TASK,?,?));Type(t_yield) == Cst(No_type,No_type);Type(t_delete) == Cst(No_type,atype(TASK,?,?));Type(t_create) == Cst(atype(TASK,?,?),btype(INTEGER,?,?)));
  Observers(Machine(Task)) == (Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  event_b_project == KO;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO
END
)
