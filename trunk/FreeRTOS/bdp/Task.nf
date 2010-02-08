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
  List_Sees(Machine(Task))==(FreeRTOSConfig,Types)
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
  Local_List_Variables(Machine(Task))==(idle,pending,running,suspended,ready,blocked,tasks,active);
  List_Variables(Machine(Task))==(idle,pending,running,suspended,ready,blocked,tasks,active);
  External_List_Variables(Machine(Task))==(idle,pending,running,suspended,ready,blocked,tasks,active)
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
  Context_List_Invariant(Machine(Task))==(btrue);
  List_Invariant(Machine(Task))==(active: BOOL & tasks: FIN(TASK) & idle: TASK & TASK_NULL/:tasks & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & pending: FIN(TASK) & pending <: suspended\/blocked & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {} & tasks = suspended\/blocked\/ready & running: TASK & (active = TRUE => ready/={} & running: ready & idle: ready))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Task))==(btrue);
  Abstract_List_Assertions(Machine(Task))==(btrue);
  Context_List_Assertions(Machine(Task))==(configMAX_PRIORITIES: NATURAL & BIT <: NATURAL);
  List_Assertions(Machine(Task))==(active = TRUE => tasks/={};active = TRUE => idle: tasks;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => running: tasks;active = TRUE => running/:blocked;active = TRUE => running/:suspended)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Task))==(active,tasks:=FALSE,{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0) || blocked,ready,suspended,pending:={},{},{},{});
  Context_List_Initialisation(Machine(Task))==(skip);
  List_Initialisation(Machine(Task))==(active:=FALSE || tasks:={} || idle:: TASK || running:: TASK || blocked,ready,suspended,pending:={},{},{},{})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Task))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Task),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Machine(Task),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Task))==(btrue);
  List_Constraints(Machine(Task))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Task))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_resumeIncrement,t_unblock,t_unblockMutex,t_setPriority,t_addPending,t_PriorityInherit);
  List_Operations(Machine(Task))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_resumeIncrement,t_unblock,t_unblockMutex,t_setPriority,t_addPending,t_PriorityInherit)
END
&
THEORY ListInputX IS
  List_Input(Machine(Task),t_create)==(priority);
  List_Input(Machine(Task),t_delete)==(atask);
  List_Input(Machine(Task),t_suspend)==(stask);
  List_Input(Machine(Task),t_resume)==(rtask);
  List_Input(Machine(Task),t_getPriority)==(atask);
  List_Input(Machine(Task),t_getCurrent)==(?);
  List_Input(Machine(Task),t_getNumberOfTasks)==(?);
  List_Input(Machine(Task),t_delayTask)==(ticks,task);
  List_Input(Machine(Task),t_startScheduler)==(?);
  List_Input(Machine(Task),t_endScheduler)==(?);
  List_Input(Machine(Task),t_resumeAll)==(unblocked);
  List_Input(Machine(Task),t_resumeIncrement)==(unblocked);
  List_Input(Machine(Task),t_unblock)==(task);
  List_Input(Machine(Task),t_unblockMutex)==(task);
  List_Input(Machine(Task),t_setPriority)==(task,priority);
  List_Input(Machine(Task),t_addPending)==(ptask);
  List_Input(Machine(Task),t_PriorityInherit)==(xTicksToWait,holderTask)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Task),t_create)==(result);
  List_Output(Machine(Task),t_delete)==(?);
  List_Output(Machine(Task),t_suspend)==(?);
  List_Output(Machine(Task),t_resume)==(?);
  List_Output(Machine(Task),t_getPriority)==(priority);
  List_Output(Machine(Task),t_getCurrent)==(result);
  List_Output(Machine(Task),t_getNumberOfTasks)==(result);
  List_Output(Machine(Task),t_delayTask)==(?);
  List_Output(Machine(Task),t_startScheduler)==(?);
  List_Output(Machine(Task),t_endScheduler)==(?);
  List_Output(Machine(Task),t_resumeAll)==(?);
  List_Output(Machine(Task),t_resumeIncrement)==(?);
  List_Output(Machine(Task),t_unblock)==(?);
  List_Output(Machine(Task),t_unblockMutex)==(?);
  List_Output(Machine(Task),t_setPriority)==(?);
  List_Output(Machine(Task),t_addPending)==(?);
  List_Output(Machine(Task),t_PriorityInherit)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Task),t_create)==(result <-- t_create(priority));
  List_Header(Machine(Task),t_delete)==(t_delete(atask));
  List_Header(Machine(Task),t_suspend)==(t_suspend(stask));
  List_Header(Machine(Task),t_resume)==(t_resume(rtask));
  List_Header(Machine(Task),t_getPriority)==(priority <-- t_getPriority(atask));
  List_Header(Machine(Task),t_getCurrent)==(result <-- t_getCurrent);
  List_Header(Machine(Task),t_getNumberOfTasks)==(result <-- t_getNumberOfTasks);
  List_Header(Machine(Task),t_delayTask)==(t_delayTask(ticks,task));
  List_Header(Machine(Task),t_startScheduler)==(t_startScheduler);
  List_Header(Machine(Task),t_endScheduler)==(t_endScheduler);
  List_Header(Machine(Task),t_resumeAll)==(t_resumeAll(unblocked));
  List_Header(Machine(Task),t_resumeIncrement)==(t_resumeIncrement(unblocked));
  List_Header(Machine(Task),t_unblock)==(t_unblock(task));
  List_Header(Machine(Task),t_unblockMutex)==(t_unblockMutex(task));
  List_Header(Machine(Task),t_setPriority)==(t_setPriority(task,priority));
  List_Header(Machine(Task),t_addPending)==(t_addPending(ptask));
  List_Header(Machine(Task),t_PriorityInherit)==(t_PriorityInherit(xTicksToWait,holderTask))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Task),t_create)==(priority: PRIORITY);
  List_Precondition(Machine(Task),t_delete)==(atask: TASK & atask: tasks & atask/=idle);
  List_Precondition(Machine(Task),t_suspend)==(stask: TASK & stask: tasks & stask/=idle);
  List_Precondition(Machine(Task),t_resume)==(rtask: TASK & rtask: suspended & rtask/:pending);
  List_Precondition(Machine(Task),t_getPriority)==(atask: TASK & atask: tasks);
  List_Precondition(Machine(Task),t_getCurrent)==(btrue);
  List_Precondition(Machine(Task),t_getNumberOfTasks)==(btrue);
  List_Precondition(Machine(Task),t_delayTask)==(task: TASK & task = running & running: ready & running/=idle & ticks: TICK);
  List_Precondition(Machine(Task),t_startScheduler)==(active = FALSE);
  List_Precondition(Machine(Task),t_endScheduler)==(active = TRUE);
  List_Precondition(Machine(Task),t_resumeAll)==(unblocked: FIN(TASK) & unblocked <: blocked);
  List_Precondition(Machine(Task),t_resumeIncrement)==(unblocked: FIN(TASK) & unblocked <: blocked & unblocked/\pending = {});
  List_Precondition(Machine(Task),t_unblock)==(task: TASK & task: blocked & task/:pending);
  List_Precondition(Machine(Task),t_unblockMutex)==(task: TASK & task: blocked & task/:pending);
  List_Precondition(Machine(Task),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle);
  List_Precondition(Machine(Task),t_addPending)==(ptask: TASK & ptask/:pending & ptask: blocked\/suspended);
  List_Precondition(Machine(Task),t_PriorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: ready)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Task),t_PriorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: ready | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0));
  Expanded_List_Substitution(Machine(Task),t_addPending)==(ptask: TASK & ptask/:pending & ptask: blocked\/suspended | pending:=pending\/{ptask});
  Expanded_List_Substitution(Machine(Task),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle | @(running$0).(running$0: ready ==> running:=running$0) [] skip);
  Expanded_List_Substitution(Machine(Task),t_unblockMutex)==(task: TASK & task: blocked & task/:pending | blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip));
  Expanded_List_Substitution(Machine(Task),t_unblock)==(task: TASK & task: blocked & task/:pending | blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip));
  Expanded_List_Substitution(Machine(Task),t_resumeIncrement)==(unblocked: FIN(TASK) & unblocked <: blocked & unblocked/\pending = {} | unblocked/={} ==> (@(running$0).(running$0: unblocked ==> running:=running$0) [] skip || ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip);
  Expanded_List_Substitution(Machine(Task),t_resumeAll)==(unblocked: FIN(TASK) & unblocked <: blocked | unblocked/={} or pending/={} ==> (@(running$0).(running$0: unblocked\/pending ==> running:=running$0) [] skip || ready:=ready\/unblocked\/pending || blocked:=blocked-unblocked-pending || suspended:=suspended-pending || pending:={}) [] not(unblocked/={} or pending/={}) ==> skip);
  Expanded_List_Substitution(Machine(Task),t_endScheduler)==(active = TRUE | active,tasks,blocked,suspended,ready,pending:=FALSE,{},{},{},{},{});
  Expanded_List_Substitution(Machine(Task),t_startScheduler)==(active = FALSE | active:=TRUE || @idle_task.(idle_task: TASK & idle_task/:tasks & idle_task/=TASK_NULL ==> (tasks,ready,idle:=tasks\/{idle_task},ready\/{idle_task},idle_task || @(running$0).(running$0: ready\/{idle_task} ==> running:=running$0))));
  Expanded_List_Substitution(Machine(Task),t_delayTask)==(task: TASK & task = running & running: ready & running/=idle & ticks: TICK | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0));
  Expanded_List_Substitution(Machine(Task),t_getNumberOfTasks)==(btrue | result:=card(tasks));
  Expanded_List_Substitution(Machine(Task),t_getCurrent)==(btrue | result:=running);
  Expanded_List_Substitution(Machine(Task),t_getPriority)==(atask: TASK & atask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Machine(Task),t_resume)==(rtask: TASK & rtask: suspended & rtask/:pending | ready:=ready\/{rtask} || (@(running$0).(running$0: ready\/{rtask} ==> running:=running$0) [] skip) || suspended:=suspended-{rtask} || (rtask: pending ==> pending:=pending-{rtask} [] not(rtask: pending) ==> skip));
  Expanded_List_Substitution(Machine(Task),t_suspend)==(stask: TASK & stask: tasks & stask/=idle | stask: ready ==> (ready:=ready-{stask} || (stask = running ==> @(running$0).(running$0: ready-{stask} ==> running:=running$0) [] not(stask = running) ==> skip)) [] not(stask: ready) ==> (stask: blocked ==> blocked:=blocked-{stask} [] not(stask: blocked) ==> skip) || suspended:=suspended\/{stask});
  Expanded_List_Substitution(Machine(Task),t_delete)==(atask: TASK & atask: tasks & atask/=idle | tasks:=tasks-{atask} || (atask: ready ==> (ready:=ready-{atask} || (atask = running ==> @(running$0).(running$0: ready-{atask} ==> running:=running$0) [] not(atask = running) ==> skip)) [] not(atask: ready) ==> (atask: blocked ==> blocked,pending:=blocked-{atask},pending-{atask} [] not(atask: blocked) ==> (atask: suspended ==> suspended,pending:=suspended-{atask},pending-{atask} [] not(atask: suspended) ==> skip))));
  Expanded_List_Substitution(Machine(Task),t_create)==(priority: PRIORITY | @task.(task: TASK & task/:tasks & task/=TASK_NULL ==> (tasks,ready:=tasks\/{task},ready\/{task} || (running:=task [] skip) || result:=task)));
  List_Substitution(Machine(Task),t_create)==(ANY task WHERE task: TASK & task/:tasks & task/=TASK_NULL THEN tasks:=tasks\/{task} || ready:=ready\/{task} || CHOICE running:=task OR skip END || result:=task END);
  List_Substitution(Machine(Task),t_delete)==(tasks:=tasks-{atask} || IF atask: ready THEN ready:=ready-{atask} || IF atask = running THEN running:: ready-{atask} END ELSIF atask: blocked THEN blocked:=blocked-{atask} || pending:=pending-{atask} ELSIF atask: suspended THEN suspended:=suspended-{atask} || pending:=pending-{atask} END);
  List_Substitution(Machine(Task),t_suspend)==(IF stask: ready THEN ready:=ready-{stask} || IF stask = running THEN running:: ready-{stask} END ELSIF stask: blocked THEN blocked:=blocked-{stask} END || suspended:=suspended\/{stask});
  List_Substitution(Machine(Task),t_resume)==(ready:=ready\/{rtask} || CHOICE running:: ready\/{rtask} OR skip END || suspended:=suspended-{rtask} || IF rtask: pending THEN pending:=pending-{rtask} END);
  List_Substitution(Machine(Task),t_getPriority)==(priority:: PRIORITY);
  List_Substitution(Machine(Task),t_getCurrent)==(result:=running);
  List_Substitution(Machine(Task),t_getNumberOfTasks)==(result:=card(tasks));
  List_Substitution(Machine(Task),t_delayTask)==(ready:=ready-{running} || blocked:=blocked\/{running} || running:: ready-{running});
  List_Substitution(Machine(Task),t_startScheduler)==(active:=TRUE || ANY idle_task WHERE idle_task: TASK & idle_task/:tasks & idle_task/=TASK_NULL THEN tasks:=tasks\/{idle_task} || ready:=ready\/{idle_task} || idle:=idle_task || running:: ready\/{idle_task} END);
  List_Substitution(Machine(Task),t_endScheduler)==(active:=FALSE || tasks,blocked,suspended,ready,pending:={},{},{},{},{});
  List_Substitution(Machine(Task),t_resumeAll)==(IF unblocked/={} or pending/={} THEN CHOICE running:: unblocked\/pending OR skip END || ready:=ready\/unblocked\/pending || blocked:=blocked-unblocked-pending || suspended:=suspended-pending || pending:={} END);
  List_Substitution(Machine(Task),t_resumeIncrement)==(IF unblocked/={} THEN CHOICE running:: unblocked OR skip END || ready:=ready\/unblocked || blocked:=blocked-unblocked END);
  List_Substitution(Machine(Task),t_unblock)==(blocked:=blocked-{task} || ready:=ready\/{task} || CHOICE running:=task OR skip END);
  List_Substitution(Machine(Task),t_unblockMutex)==(blocked:=blocked-{task} || ready:=ready\/{task} || CHOICE running:=task OR skip END);
  List_Substitution(Machine(Task),t_setPriority)==(CHOICE running:: ready OR skip END);
  List_Substitution(Machine(Task),t_addPending)==(pending:=pending\/{ptask});
  List_Substitution(Machine(Task),t_PriorityInherit)==(ready:=ready-{running} || blocked:=blocked\/{running} || running:: ready-{running})
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
  Context_List_Properties(Machine(Task))==(configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Machine(Task))==(btrue);
  List_Properties(Machine(Task))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Task),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(Task))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Machine(Task))==(btrue);
  Seen_Context_List_Assertions(Machine(Task))==(BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(Task))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Machine(Task))==(btrue);
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
  List_ANY_Var(Machine(Task),t_create)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(Task),t_delete)==(?);
  List_ANY_Var(Machine(Task),t_suspend)==(?);
  List_ANY_Var(Machine(Task),t_resume)==(?);
  List_ANY_Var(Machine(Task),t_getPriority)==(?);
  List_ANY_Var(Machine(Task),t_getCurrent)==(?);
  List_ANY_Var(Machine(Task),t_getNumberOfTasks)==(?);
  List_ANY_Var(Machine(Task),t_delayTask)==(?);
  List_ANY_Var(Machine(Task),t_startScheduler)==(Var(idle_task) == atype(TASK,?,?));
  List_ANY_Var(Machine(Task),t_endScheduler)==(?);
  List_ANY_Var(Machine(Task),t_resumeAll)==(?);
  List_ANY_Var(Machine(Task),t_resumeIncrement)==(?);
  List_ANY_Var(Machine(Task),t_unblock)==(?);
  List_ANY_Var(Machine(Task),t_unblockMutex)==(?);
  List_ANY_Var(Machine(Task),t_setPriority)==(?);
  List_ANY_Var(Machine(Task),t_addPending)==(?);
  List_ANY_Var(Machine(Task),t_PriorityInherit)==(?);
  List_ANY_Var(Machine(Task),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Task)) == (? | ? | idle,pending,running,suspended,ready,blocked,tasks,active | ? | t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_resumeIncrement,t_unblock,t_unblockMutex,t_setPriority,t_addPending,t_PriorityInherit | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task);
  List_Of_HiddenCst_Ids(Machine(Task)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task)) == (?);
  List_Of_VisibleVar_Ids(Machine(Task)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER);
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
  Variables(Machine(Task)) == (Type(idle) == Mvl(atype(TASK,?,?));Type(pending) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Task)) == (Type(t_PriorityInherit) == Cst(No_type,btype(INTEGER,?,?)*atype(TASK,?,?));Type(t_addPending) == Cst(No_type,atype(TASK,?,?));Type(t_setPriority) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_unblockMutex) == Cst(No_type,atype(TASK,?,?));Type(t_unblock) == Cst(No_type,atype(TASK,?,?));Type(t_resumeIncrement) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(t_resumeAll) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(t_endScheduler) == Cst(No_type,No_type);Type(t_startScheduler) == Cst(No_type,No_type);Type(t_delayTask) == Cst(No_type,btype(INTEGER,?,?)*atype(TASK,?,?));Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(t_resume) == Cst(No_type,atype(TASK,?,?));Type(t_suspend) == Cst(No_type,atype(TASK,?,?));Type(t_delete) == Cst(No_type,atype(TASK,?,?));Type(t_create) == Cst(atype(TASK,?,?),btype(INTEGER,?,?)));
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
