Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(TaskCore))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(TaskCore))==(Machine(TaskCore));
  Level(Machine(TaskCore))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(TaskCore)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(TaskCore))==(FreeRTOSConfig,Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(TaskCore))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(TaskCore))==(?);
  List_Includes(Machine(TaskCore))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(TaskCore))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(TaskCore))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(TaskCore))==(?);
  Context_List_Variables(Machine(TaskCore))==(?);
  Abstract_List_Variables(Machine(TaskCore))==(?);
  Local_List_Variables(Machine(TaskCore))==(idle,running,suspended,ready,blocked,tasks,active);
  List_Variables(Machine(TaskCore))==(idle,running,suspended,ready,blocked,tasks,active);
  External_List_Variables(Machine(TaskCore))==(idle,running,suspended,ready,blocked,tasks,active)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(TaskCore))==(?);
  Abstract_List_VisibleVariables(Machine(TaskCore))==(?);
  External_List_VisibleVariables(Machine(TaskCore))==(?);
  Expanded_List_VisibleVariables(Machine(TaskCore))==(?);
  List_VisibleVariables(Machine(TaskCore))==(?);
  Internal_List_VisibleVariables(Machine(TaskCore))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(TaskCore))==(btrue);
  Gluing_List_Invariant(Machine(TaskCore))==(btrue);
  Expanded_List_Invariant(Machine(TaskCore))==(btrue);
  Abstract_List_Invariant(Machine(TaskCore))==(btrue);
  Context_List_Invariant(Machine(TaskCore))==(btrue);
  List_Invariant(Machine(TaskCore))==(active: BOOL & tasks: FIN(TASK) & idle: TASK & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & running: TASK & (active = TRUE => running = idle or idle: ready & running: tasks & running/:ready & running/:blocked & running/:suspended & tasks = {running}\/suspended\/blocked\/ready) & (active = FALSE => tasks = ready) & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {})
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(TaskCore))==(btrue);
  Abstract_List_Assertions(Machine(TaskCore))==(btrue);
  Context_List_Assertions(Machine(TaskCore))==(configMAX_PRIORITIES: NATURAL & ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(TaskCore))==(active = TRUE => idle: tasks;active = TRUE => tasks/={};active = TRUE => idle/:blocked;active = TRUE => idle/:suspended)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(TaskCore))==(active,tasks:=FALSE,{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0) || blocked,ready,suspended:={},{},{});
  Context_List_Initialisation(Machine(TaskCore))==(skip);
  List_Initialisation(Machine(TaskCore))==(active:=FALSE || tasks:={} || idle:: TASK || running:: TASK || blocked,ready,suspended:={},{},{})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(TaskCore))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(TaskCore),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Machine(TaskCore),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(TaskCore))==(btrue);
  List_Constraints(Machine(TaskCore))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(TaskCore))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_setPriority);
  List_Operations(Machine(TaskCore))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_setPriority)
END
&
THEORY ListInputX IS
  List_Input(Machine(TaskCore),t_create)==(priority);
  List_Input(Machine(TaskCore),t_delete)==(atask);
  List_Input(Machine(TaskCore),t_suspend)==(atask);
  List_Input(Machine(TaskCore),t_resume)==(atask);
  List_Input(Machine(TaskCore),t_getPriority)==(atask);
  List_Input(Machine(TaskCore),t_getCurrent)==(?);
  List_Input(Machine(TaskCore),t_getNumberOfTasks)==(?);
  List_Input(Machine(TaskCore),t_delayTask)==(ticks);
  List_Input(Machine(TaskCore),t_startScheduler)==(?);
  List_Input(Machine(TaskCore),t_endScheduler)==(?);
  List_Input(Machine(TaskCore),t_resumeAll)==(tick);
  List_Input(Machine(TaskCore),t_unblock)==(task);
  List_Input(Machine(TaskCore),t_setPriority)==(task,priority)
END
&
THEORY ListOutputX IS
  List_Output(Machine(TaskCore),t_create)==(result);
  List_Output(Machine(TaskCore),t_delete)==(?);
  List_Output(Machine(TaskCore),t_suspend)==(?);
  List_Output(Machine(TaskCore),t_resume)==(?);
  List_Output(Machine(TaskCore),t_getPriority)==(priority);
  List_Output(Machine(TaskCore),t_getCurrent)==(result);
  List_Output(Machine(TaskCore),t_getNumberOfTasks)==(result);
  List_Output(Machine(TaskCore),t_delayTask)==(?);
  List_Output(Machine(TaskCore),t_startScheduler)==(?);
  List_Output(Machine(TaskCore),t_endScheduler)==(?);
  List_Output(Machine(TaskCore),t_resumeAll)==(?);
  List_Output(Machine(TaskCore),t_unblock)==(?);
  List_Output(Machine(TaskCore),t_setPriority)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(TaskCore),t_create)==(result <-- t_create(priority));
  List_Header(Machine(TaskCore),t_delete)==(t_delete(atask));
  List_Header(Machine(TaskCore),t_suspend)==(t_suspend(atask));
  List_Header(Machine(TaskCore),t_resume)==(t_resume(atask));
  List_Header(Machine(TaskCore),t_getPriority)==(priority <-- t_getPriority(atask));
  List_Header(Machine(TaskCore),t_getCurrent)==(result <-- t_getCurrent);
  List_Header(Machine(TaskCore),t_getNumberOfTasks)==(result <-- t_getNumberOfTasks);
  List_Header(Machine(TaskCore),t_delayTask)==(t_delayTask(ticks));
  List_Header(Machine(TaskCore),t_startScheduler)==(t_startScheduler);
  List_Header(Machine(TaskCore),t_endScheduler)==(t_endScheduler);
  List_Header(Machine(TaskCore),t_resumeAll)==(t_resumeAll(tick));
  List_Header(Machine(TaskCore),t_unblock)==(t_unblock(task));
  List_Header(Machine(TaskCore),t_setPriority)==(t_setPriority(task,priority))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(TaskCore),t_create)==(active = FALSE & priority: PRIORITY);
  List_Precondition(Machine(TaskCore),t_delete)==(active = TRUE & atask: TASK & atask: tasks & atask/=idle);
  List_Precondition(Machine(TaskCore),t_suspend)==(active = TRUE & atask: TASK & atask: tasks & atask/=idle);
  List_Precondition(Machine(TaskCore),t_resume)==(active = TRUE & atask: TASK & atask: suspended);
  List_Precondition(Machine(TaskCore),t_getPriority)==(atask: TASK & atask: tasks);
  List_Precondition(Machine(TaskCore),t_getCurrent)==(active = TRUE);
  List_Precondition(Machine(TaskCore),t_getNumberOfTasks)==(btrue);
  List_Precondition(Machine(TaskCore),t_delayTask)==(active = TRUE & running/=idle & ticks: TICK & not(ticks = 0));
  List_Precondition(Machine(TaskCore),t_startScheduler)==(active = FALSE);
  List_Precondition(Machine(TaskCore),t_endScheduler)==(active = TRUE);
  List_Precondition(Machine(TaskCore),t_resumeAll)==(active = TRUE & tick: TICK);
  List_Precondition(Machine(TaskCore),t_unblock)==(active = TRUE & task: TASK & task: blocked);
  List_Precondition(Machine(TaskCore),t_setPriority)==(task: tasks & priority: PRIORITY & active = TRUE & task/=idle)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(TaskCore),t_setPriority)==(task: tasks & priority: PRIORITY & active = TRUE & task/=idle | task: ready ==> (skip [] running,ready:=task,(ready\/{running})-{task}) [] not(task: ready) ==> (task = running ==> (skip [] @task.(task: TASK & task: tasks & task: ready ==> running,ready:=task,(ready\/{running})-{task})) [] not(task = running) ==> skip));
  Expanded_List_Substitution(Machine(TaskCore),t_unblock)==(active = TRUE & task: TASK & task: blocked | running = idle ==> running,ready:=task,ready\/{idle} [] not(running = idle) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task});
  Expanded_List_Substitution(Machine(TaskCore),t_resumeAll)==(active = TRUE & tick: TICK | @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked/={} ==> (@task.(task: TASK & task: tasks & task: unblocked ==> running,ready:=task,ready\/{running}\/unblocked-{task}) [] ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip)));
  Expanded_List_Substitution(Machine(TaskCore),t_endScheduler)==(active = TRUE | active,tasks,blocked,suspended,ready:=FALSE,{},{},{},{});
  Expanded_List_Substitution(Machine(TaskCore),t_startScheduler)==(active = FALSE | active,blocked,suspended:=TRUE,{},{} || @idle_task.(idle_task: TASK & idle_task/:tasks ==> (tasks,idle:=tasks\/{idle_task},idle_task || @task.(task: ready\/{idle_task} ==> running,ready:=task,(ready\/{idle_task})-{task}))));
  Expanded_List_Substitution(Machine(TaskCore),t_delayTask)==(active = TRUE & running/=idle & ticks: TICK & not(ticks = 0) | blocked:=blocked\/{running} || @task.(task: TASK & task: ready ==> ready,running:=ready-{task},task));
  Expanded_List_Substitution(Machine(TaskCore),t_getNumberOfTasks)==(btrue | result:=card(tasks));
  Expanded_List_Substitution(Machine(TaskCore),t_getCurrent)==(active = TRUE | result:=running);
  Expanded_List_Substitution(Machine(TaskCore),t_getPriority)==(atask: TASK & atask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Machine(TaskCore),t_resume)==(active = TRUE & atask: TASK & atask: suspended | ready,running:=ready\/{running},atask [] ready:=ready\/{atask} || suspended:=suspended-{atask});
  Expanded_List_Substitution(Machine(TaskCore),t_suspend)==(active = TRUE & atask: TASK & atask: tasks & atask/=idle | suspended:=suspended\/{atask} || (atask = running ==> @task.(task: TASK & task: ready ==> running,ready:=task,ready-{task}) [] not(atask = running) ==> (atask: ready ==> ready:=ready-{atask} [] not(atask: ready) ==> (atask: blocked ==> blocked:=blocked-{atask} [] not(atask: blocked) ==> skip))));
  Expanded_List_Substitution(Machine(TaskCore),t_delete)==(active = TRUE & atask: TASK & atask: tasks & atask/=idle | tasks:=tasks-{atask} || (atask = running ==> @task.(task: TASK & task: ready ==> running,ready:=task,ready-{task}) [] not(atask = running) ==> (atask: ready ==> ready:=ready-{atask} [] not(atask: ready) ==> (atask: blocked ==> blocked:=blocked-{atask} [] not(atask: blocked) ==> (atask: suspended ==> suspended:=suspended-{atask} [] not(atask: suspended) ==> skip)))));
  Expanded_List_Substitution(Machine(TaskCore),t_create)==(active = FALSE & priority: PRIORITY | @task.(task: TASK & task/:tasks ==> tasks,ready,result:={task}\/tasks,{task}\/ready,task));
  List_Substitution(Machine(TaskCore),t_create)==(ANY task WHERE task: TASK & task/:tasks THEN tasks:={task}\/tasks || ready:={task}\/ready || result:=task END);
  List_Substitution(Machine(TaskCore),t_delete)==(tasks:=tasks-{atask} || IF atask = running THEN ANY task WHERE task: TASK & task: ready THEN running:=task || ready:=ready-{task} END ELSIF atask: ready THEN ready:=ready-{atask} ELSIF atask: blocked THEN blocked:=blocked-{atask} ELSIF atask: suspended THEN suspended:=suspended-{atask} END);
  List_Substitution(Machine(TaskCore),t_suspend)==(suspended:=suspended\/{atask} || IF atask = running THEN ANY task WHERE task: TASK & task: ready THEN running:=task || ready:=ready-{task} END ELSIF atask: ready THEN ready:=ready-{atask} ELSIF atask: blocked THEN blocked:=blocked-{atask} END);
  List_Substitution(Machine(TaskCore),t_resume)==(CHOICE ready:=ready\/{running} || running:=atask OR ready:=ready\/{atask} END || suspended:=suspended-{atask});
  List_Substitution(Machine(TaskCore),t_getPriority)==(priority:: PRIORITY);
  List_Substitution(Machine(TaskCore),t_getCurrent)==(result:=running);
  List_Substitution(Machine(TaskCore),t_getNumberOfTasks)==(result:=card(tasks));
  List_Substitution(Machine(TaskCore),t_delayTask)==(blocked:=blocked\/{running} || ANY task WHERE task: TASK & task: ready THEN ready:=ready-{task} || running:=task END);
  List_Substitution(Machine(TaskCore),t_startScheduler)==(active:=TRUE || blocked,suspended:={},{} || ANY idle_task WHERE idle_task: TASK & idle_task/:tasks THEN tasks:=tasks\/{idle_task} || idle:=idle_task || ANY task WHERE task: ready\/{idle_task} THEN running:=task || ready:=(ready\/{idle_task})-{task} END END);
  List_Substitution(Machine(TaskCore),t_endScheduler)==(active:=FALSE || tasks,blocked,suspended,ready:={},{},{},{});
  List_Substitution(Machine(TaskCore),t_resumeAll)==(ANY unblocked WHERE unblocked: FIN(TASK) & unblocked <: blocked THEN IF unblocked/={} THEN CHOICE ANY task WHERE task: TASK & task: tasks & task: unblocked THEN running:=task || ready:=ready\/{running}\/unblocked-{task} END OR ready:=ready\/unblocked END || blocked:=blocked-unblocked END END);
  List_Substitution(Machine(TaskCore),t_unblock)==(IF running = idle THEN running:=task || ready:=ready\/{idle} ELSE CHOICE running:=task || ready:=ready\/{running} OR ready:=ready\/{task} END END || blocked:=blocked-{task});
  List_Substitution(Machine(TaskCore),t_setPriority)==(IF task: ready THEN CHOICE skip OR running:=task || ready:=(ready\/{running})-{task} END ELSIF task = running THEN CHOICE skip OR ANY task WHERE task: TASK & task: tasks & task: ready THEN running:=task || ready:=(ready\/{running})-{task} END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(TaskCore))==(?);
  Inherited_List_Constants(Machine(TaskCore))==(?);
  List_Constants(Machine(TaskCore))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(TaskCore),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Context_List_Enumerated(Machine(TaskCore))==(SCHEDULER_STATE);
  Context_List_Defered(Machine(TaskCore))==(NAME,PARAMETER,TASK,STACK,TASK_CODE);
  Context_List_Sets(Machine(TaskCore))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,SCHEDULER_STATE);
  List_Valuable_Sets(Machine(TaskCore))==(?);
  Inherited_List_Enumerated(Machine(TaskCore))==(?);
  Inherited_List_Defered(Machine(TaskCore))==(?);
  Inherited_List_Sets(Machine(TaskCore))==(?);
  List_Enumerated(Machine(TaskCore))==(?);
  List_Defered(Machine(TaskCore))==(?);
  List_Sets(Machine(TaskCore))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(TaskCore))==(?);
  Expanded_List_HiddenConstants(Machine(TaskCore))==(?);
  List_HiddenConstants(Machine(TaskCore))==(?);
  External_List_HiddenConstants(Machine(TaskCore))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(TaskCore))==(btrue);
  Context_List_Properties(Machine(TaskCore))==(configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}));
  Inherited_List_Properties(Machine(TaskCore))==(btrue);
  List_Properties(Machine(TaskCore))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(TaskCore),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(TaskCore))==(SCHEDULER_STATE);
  Seen_Context_List_Invariant(Machine(TaskCore))==(btrue);
  Seen_Context_List_Assertions(Machine(TaskCore))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(TaskCore))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}));
  Seen_List_Constraints(Machine(TaskCore))==(btrue);
  Seen_List_Operations(Machine(TaskCore),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(TaskCore),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Machine(TaskCore),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Machine(TaskCore),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(TaskCore),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Machine(TaskCore),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(TaskCore),t_create)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(TaskCore),t_delete)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(TaskCore),t_suspend)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(TaskCore),t_resume)==(?);
  List_ANY_Var(Machine(TaskCore),t_getPriority)==(?);
  List_ANY_Var(Machine(TaskCore),t_getCurrent)==(?);
  List_ANY_Var(Machine(TaskCore),t_getNumberOfTasks)==(?);
  List_ANY_Var(Machine(TaskCore),t_delayTask)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(TaskCore),t_startScheduler)==((Var(idle_task) == atype(TASK,?,?)),(Var(task) == atype(TASK,?,?)));
  List_ANY_Var(Machine(TaskCore),t_endScheduler)==(?);
  List_ANY_Var(Machine(TaskCore),t_resumeAll)==((Var(unblocked) == SetOf(atype(TASK,?,?))),(Var(task) == atype(TASK,?,?)));
  List_ANY_Var(Machine(TaskCore),t_unblock)==(?);
  List_ANY_Var(Machine(TaskCore),t_setPriority)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(TaskCore),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(TaskCore)) == (? | ? | idle,running,suspended,ready,blocked,tasks,active | ? | t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_setPriority | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | TaskCore);
  List_Of_HiddenCst_Ids(Machine(TaskCore)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(TaskCore)) == (?);
  List_Of_VisibleVar_Ids(Machine(TaskCore)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(TaskCore)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,TASK,STACK,TASK_CODE,SCHEDULER_STATE,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
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
  Variables(Machine(TaskCore)) == (Type(idle) == Mvl(atype(TASK,?,?));Type(running) == Mvl(atype(TASK,?,?));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(TaskCore)) == (Type(t_setPriority) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_unblock) == Cst(No_type,atype(TASK,?,?));Type(t_resumeAll) == Cst(No_type,btype(INTEGER,?,?));Type(t_endScheduler) == Cst(No_type,No_type);Type(t_startScheduler) == Cst(No_type,No_type);Type(t_delayTask) == Cst(No_type,btype(INTEGER,?,?));Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(t_resume) == Cst(No_type,atype(TASK,?,?));Type(t_suspend) == Cst(No_type,atype(TASK,?,?));Type(t_delete) == Cst(No_type,atype(TASK,?,?));Type(t_create) == Cst(atype(TASK,?,?),btype(INTEGER,?,?)));
  Observers(Machine(TaskCore)) == (Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?)))
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
