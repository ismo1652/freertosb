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
  Local_List_Variables(Machine(Task))==(schedule,tasks);
  List_Variables(Machine(Task))==(schedule,tasks);
  External_List_Variables(Machine(Task))==(schedule,tasks)
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
  List_Invariant(Machine(Task))==(tasks: POW(TASK) & !(tk1,tk2).(tk1: tasks & tk2: tasks & tk1'State = running & tk2'State = running => tk1 = tk2) & schedule: SCHEDULE_STATE)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Task))==(btrue);
  Abstract_List_Assertions(Machine(Task))==(btrue);
  Context_List_Assertions(Machine(Task))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(Task))==(!(tk1,tk2).(tk1: TASK & tk2: TASK => tk1 = tk2 <=> (tk1'Name = tk2'Name & tk1'Priority = tk2'Priority & tk1'Task_Code = tk2'Task_Code & tk1'Stack = tk2'Stack & tk1'State = tk2'State) & not(tk1 = tk2) <=> (not(tk1'Name/=tk2'Name) or not(tk1'Priority/=tk2'Priority) or not(tk1'Task_Code/=tk2'Task_Code) or not(tk1'Stack/=tk2'Stack) or not(tk1'State/=tk2'State))))
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Task))==(tasks,schedule:={},taskSCHEDULER_NOT_STARTED);
  Context_List_Initialisation(Machine(Task))==(skip);
  List_Initialisation(Machine(Task))==(tasks:={} || schedule:=taskSCHEDULER_NOT_STARTED)
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
  Internal_List_Operations(Machine(Task))==(xTaskCreate,vTaskDelete,prvIdleTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,taskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll);
  List_Operations(Machine(Task))==(xTaskCreate,vTaskDelete,prvIdleTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,taskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll)
END
&
THEORY ListInputX IS
  List_Input(Machine(Task),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Machine(Task),vTaskDelete)==(pxTaskToDelete);
  List_Input(Machine(Task),prvIdleTask)==(pvParameters);
  List_Input(Machine(Task),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Machine(Task),vTaskResume)==(pxTaskToResume);
  List_Input(Machine(Task),uxTaskPriorityGet)==(pxTask);
  List_Input(Machine(Task),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Machine(Task),uxTaskGetNumberOfTasks)==(?);
  List_Input(Machine(Task),xTaskGetSchedulerState)==(?);
  List_Input(Machine(Task),taskStartScheduler)==(?);
  List_Input(Machine(Task),vTaskEndScheduler)==(?);
  List_Input(Machine(Task),vTaskSuspendAll)==(?);
  List_Input(Machine(Task),xTaskResumeAll)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Task),xTaskCreate)==(zz,handle);
  List_Output(Machine(Task),vTaskDelete)==(?);
  List_Output(Machine(Task),prvIdleTask)==(?);
  List_Output(Machine(Task),vTaskSuspend)==(rr);
  List_Output(Machine(Task),vTaskResume)==(?);
  List_Output(Machine(Task),uxTaskPriorityGet)==(priority);
  List_Output(Machine(Task),xTaskGetCurrentTaskHandle)==(rr);
  List_Output(Machine(Task),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Machine(Task),xTaskGetSchedulerState)==(xReturn);
  List_Output(Machine(Task),taskStartScheduler)==(?);
  List_Output(Machine(Task),vTaskEndScheduler)==(?);
  List_Output(Machine(Task),vTaskSuspendAll)==(?);
  List_Output(Machine(Task),xTaskResumeAll)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Task),xTaskCreate)==(zz,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Machine(Task),vTaskDelete)==(vTaskDelete(pxTaskToDelete));
  List_Header(Machine(Task),prvIdleTask)==(prvIdleTask(pvParameters));
  List_Header(Machine(Task),vTaskSuspend)==(rr <-- vTaskSuspend(pxTaskToSuspend));
  List_Header(Machine(Task),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Machine(Task),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Machine(Task),xTaskGetCurrentTaskHandle)==(rr <-- xTaskGetCurrentTaskHandle);
  List_Header(Machine(Task),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Machine(Task),xTaskGetSchedulerState)==(xReturn <-- xTaskGetSchedulerState);
  List_Header(Machine(Task),taskStartScheduler)==(taskStartScheduler);
  List_Header(Machine(Task),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(Task),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(Task),xTaskResumeAll)==(xTaskResumeAll)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Task),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters <: PARAMETER & uxPriority: PRIORITY);
  List_Precondition(Machine(Task),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & pxTaskToDelete'State/=deleted);
  List_Precondition(Machine(Task),prvIdleTask)==(pvParameters <: PARAMETER);
  List_Precondition(Machine(Task),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks);
  List_Precondition(Machine(Task),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: tasks & pxTaskToResume'State = suspended);
  List_Precondition(Machine(Task),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(Task),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(Task),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(Task),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1);
  List_Precondition(Machine(Task),taskStartScheduler)==(schedule = taskSCHEDULER_NOT_STARTED);
  List_Precondition(Machine(Task),vTaskEndScheduler)==(schedule = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(Task),vTaskSuspendAll)==(btrue);
  List_Precondition(Machine(Task),xTaskResumeAll)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Task),xTaskResumeAll)==(btrue | schedule:=taskSCHEDULER_RUNNING [] schedule:=schedule);
  Expanded_List_Substitution(Machine(Task),vTaskSuspendAll)==(btrue | schedule:=taskSCHEDULER_SUSPENDED);
  Expanded_List_Substitution(Machine(Task),vTaskEndScheduler)==(schedule = taskSCHEDULER_RUNNING | schedule:=taskSCHEDULER_NOT_STARTED);
  Expanded_List_Substitution(Machine(Task),taskStartScheduler)==(schedule = taskSCHEDULER_NOT_STARTED | @any(idleTask).(idleTask: TASK & idleTask/:tasks & idleTask'State = ready & idleTask'Priority = tskIDLE_PRIORITY ==> tasks:=tasks\/{idleTask}) || schedule:=taskSCHEDULER_RUNNING);
  Expanded_List_Substitution(Machine(Task),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1 | xReturn:=schedule);
  Expanded_List_Substitution(Machine(Task),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  Expanded_List_Substitution(Machine(Task),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | @any(currentTask).(currentTask: tasks & currentTask'State = running ==> rr:=currentTask));
  Expanded_List_Substitution(Machine(Task),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 | priority:=pxTask'Priority);
  Expanded_List_Substitution(Machine(Task),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: tasks & pxTaskToResume'State = suspended | tasks:=tasks-{pxTaskToResume}\/{rec(Name>>pxTaskToResume'Name,Priority>>pxTaskToResume'Priority,Task_Code>>pxTaskToResume'Task_Code,Stack>>pxTaskToResume'Stack,State>>ready)});
  Expanded_List_Substitution(Machine(Task),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks | not(pxTaskToSuspend'State = suspended) ==> tasks,rr:=tasks-{pxTaskToSuspend}\/{rec(Name>>pxTaskToSuspend'Name,Priority>>pxTaskToSuspend'Priority,Task_Code>>pxTaskToSuspend'Task_Code,Stack>>pxTaskToSuspend'Stack,State>>suspended)},pdTRUE [] not(not(pxTaskToSuspend'State = suspended)) ==> rr:=pdFALSE);
  Expanded_List_Substitution(Machine(Task),prvIdleTask)==(pvParameters <: PARAMETER | @any(task).(task: tasks & task'State = deleted ==> (not(task: {}) ==> tasks:=tasks-{task} [] not(not(task: {})) ==> skip)));
  Expanded_List_Substitution(Machine(Task),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & pxTaskToDelete'State/=deleted | tasks:=tasks-{pxTaskToDelete}\/{rec(Name>>pxTaskToDelete'Name,Priority>>pxTaskToDelete'Priority,Task_Code>>pxTaskToDelete'Task_Code,Stack>>pxTaskToDelete'Stack,State>>deleted)});
  Expanded_List_Substitution(Machine(Task),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters <: PARAMETER & uxPriority: PRIORITY | @any(stack,task_code,task).(stack: STACK & task_code: TASK_CODE & task: TASK & task = rec(Name>>pcName,Priority>>uxPriority,Task_Code>>task_code,Stack>>stack,State>>ready) ==> tasks,zz,handle:=tasks\/{task},pdPASS,task) [] zz,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL);
  List_Substitution(Machine(Task),xTaskCreate)==(CHOICE ANY stack,task_code,task WHERE stack: STACK & task_code: TASK_CODE & task: TASK & task = rec(Name>>pcName,Priority>>uxPriority,Task_Code>>task_code,Stack>>stack,State>>ready) THEN tasks:=tasks\/{task} || zz,handle:=pdPASS,task END OR zz,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL END);
  List_Substitution(Machine(Task),vTaskDelete)==(tasks:=tasks-{pxTaskToDelete}\/{rec(Name>>pxTaskToDelete'Name,Priority>>pxTaskToDelete'Priority,Task_Code>>pxTaskToDelete'Task_Code,Stack>>pxTaskToDelete'Stack,State>>deleted)});
  List_Substitution(Machine(Task),prvIdleTask)==(ANY task WHERE task: tasks & task'State = deleted THEN IF not(task: {}) THEN tasks:=tasks-{task} END END);
  List_Substitution(Machine(Task),vTaskSuspend)==(IF not(pxTaskToSuspend'State = suspended) THEN tasks:=tasks-{pxTaskToSuspend}\/{rec(Name>>pxTaskToSuspend'Name,Priority>>pxTaskToSuspend'Priority,Task_Code>>pxTaskToSuspend'Task_Code,Stack>>pxTaskToSuspend'Stack,State>>suspended)} || rr:=pdTRUE ELSE rr:=pdFALSE END);
  List_Substitution(Machine(Task),vTaskResume)==(tasks:=tasks-{pxTaskToResume}\/{rec(Name>>pxTaskToResume'Name,Priority>>pxTaskToResume'Priority,Task_Code>>pxTaskToResume'Task_Code,Stack>>pxTaskToResume'Stack,State>>ready)});
  List_Substitution(Machine(Task),uxTaskPriorityGet)==(priority:=pxTask'Priority);
  List_Substitution(Machine(Task),xTaskGetCurrentTaskHandle)==(ANY currentTask WHERE currentTask: tasks & currentTask'State = running THEN rr:=currentTask END);
  List_Substitution(Machine(Task),uxTaskGetNumberOfTasks)==(numberOfTasks:=card(tasks));
  List_Substitution(Machine(Task),xTaskGetSchedulerState)==(xReturn:=schedule);
  List_Substitution(Machine(Task),taskStartScheduler)==(ANY idleTask WHERE idleTask: TASK & idleTask/:tasks & idleTask'State = ready & idleTask'Priority = tskIDLE_PRIORITY THEN tasks:=tasks\/{idleTask} END || schedule:=taskSCHEDULER_RUNNING);
  List_Substitution(Machine(Task),vTaskEndScheduler)==(schedule:=taskSCHEDULER_NOT_STARTED);
  List_Substitution(Machine(Task),vTaskSuspendAll)==(schedule:=taskSCHEDULER_SUSPENDED);
  List_Substitution(Machine(Task),xTaskResumeAll)==(CHOICE schedule:=taskSCHEDULER_RUNNING OR schedule:=schedule END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Task))==(PRIORITY,TASK,TASK_NULL,tskIDLE_PRIORITY);
  Inherited_List_Constants(Machine(Task))==(?);
  List_Constants(Machine(Task))==(PRIORITY,TASK,TASK_NULL,tskIDLE_PRIORITY)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Task),TASK_CODE)==(?);
  Context_List_Enumerated(Machine(Task))==(?);
  Context_List_Defered(Machine(Task))==(POINTER,NAME,PARAMETER);
  Context_List_Sets(Machine(Task))==(POINTER,NAME,PARAMETER);
  List_Valuable_Sets(Machine(Task))==(TASK_CODE,STACK);
  Inherited_List_Enumerated(Machine(Task))==(?);
  Inherited_List_Defered(Machine(Task))==(?);
  Inherited_List_Sets(Machine(Task))==(?);
  List_Enumerated(Machine(Task))==(TASK_STATE,SCHEDULE_STATE);
  List_Defered(Machine(Task))==(TASK_CODE,STACK);
  List_Sets(Machine(Task))==(TASK_CODE,TASK_STATE,SCHEDULE_STATE,STACK);
  Set_Definition(Machine(Task),TASK_STATE)==({running,blocked,ready,suspended,deleted});
  Set_Definition(Machine(Task),SCHEDULE_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Set_Definition(Machine(Task),STACK)==(?)
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
  Context_List_Properties(Machine(Task))==(configMAX_PRIORITIES: NATURAL & configTOTAL_HEAP_SIZE: NATURAL & configMINIMAL_STACK_SIZE: NATURAL & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & configUSE_PREEMPTION: BIT & configUSE_IDLE_HOOK: BIT & configUSE_TICK_HOOK: BIT & configCPU_CLOCK_HZ: NATURAL & configTICK_RATE_HZ: NATURAL & configMAX_TASK_NAME_LEN: NATURAL & configUSE_TRACE_FACILITY: BIT & configUSE_16_BIT_TICKS: BIT & configIDLE_SHOULD_YIELD: BIT & configUSE_USE_MUTEXES: BIT & configUSE_RECURSIVE_MUTEXES: BIT & configUSE_COUNTING_SEMAPHORES: BIT & configUSE_ALTERNATIVE_API: BIT & configCHECK_FOR_STACK_OVERFLOW: BIT & configQUEUE_REGISTRY_SIZE: BIT & configUSE_CO_ROUTINES: BIT & configMAX_CO_ROUTINE_PRIORITIES: NATURAL & configKERNEL_INTERRUPT_PRIORITY: NATURAL & configMAX_SYSCALL_INTERRUPT_PRIORITY: NATURAL & INCLUDE_vTaskCleanUpResources: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Inherited_List_Properties(Machine(Task))==(btrue);
  List_Properties(Machine(Task))==(PRIORITY = 0..configMAX_PRIORITIES-1 & TASK = struct(Name>>NAME,Priority>>PRIORITY,Task_Code>>TASK_CODE,Stack>>STACK,State>>TASK_STATE) & TASK_NULL: TASK & tskIDLE_PRIORITY: PRIORITY & tskIDLE_PRIORITY = 1 & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_STATE: FIN(INTEGER) & not(TASK_STATE = {}) & SCHEDULE_STATE: FIN(INTEGER) & not(SCHEDULE_STATE = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Task),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(Task))==(?);
  Seen_Context_List_Invariant(Machine(Task))==(btrue);
  Seen_Context_List_Assertions(Machine(Task))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(Task))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Seen_List_Constraints(Machine(Task))==(btrue);
  Seen_List_Operations(Machine(Task),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Task),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Machine(Task),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Machine(Task),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(Task),Machine(FreeRTOSConfig))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Task),xTaskCreate)==((Var(stack) == atype(STACK,?,?)),(Var(task_code) == atype(TASK_CODE,?,?)),(Var(task) == rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4))));
  List_ANY_Var(Machine(Task),vTaskDelete)==(?);
  List_ANY_Var(Machine(Task),prvIdleTask)==(Var(task) == rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)));
  List_ANY_Var(Machine(Task),vTaskSuspend)==(?);
  List_ANY_Var(Machine(Task),vTaskResume)==(?);
  List_ANY_Var(Machine(Task),uxTaskPriorityGet)==(?);
  List_ANY_Var(Machine(Task),xTaskGetCurrentTaskHandle)==(Var(currentTask) == rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)));
  List_ANY_Var(Machine(Task),uxTaskGetNumberOfTasks)==(?);
  List_ANY_Var(Machine(Task),xTaskGetSchedulerState)==(?);
  List_ANY_Var(Machine(Task),taskStartScheduler)==(Var(idleTask) == rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)));
  List_ANY_Var(Machine(Task),vTaskEndScheduler)==(?);
  List_ANY_Var(Machine(Task),vTaskSuspendAll)==(?);
  List_ANY_Var(Machine(Task),xTaskResumeAll)==(?);
  List_ANY_Var(Machine(Task),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Task)) == (PRIORITY,TASK,TASK_NULL,tskIDLE_PRIORITY,TASK_CODE,TASK_STATE,SCHEDULE_STATE,STACK,running,blocked,ready,suspended,deleted,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | schedule,tasks | ? | xTaskCreate,vTaskDelete,prvIdleTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,taskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task);
  List_Of_HiddenCst_Ids(Machine(Task)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task)) == (PRIORITY,TASK,TASK_NULL,tskIDLE_PRIORITY);
  List_Of_VisibleVar_Ids(Machine(Task)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,POINTER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Task)) == (Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(TASK_STATE) == Cst(SetOf(etype(TASK_STATE,0,4)));Type(SCHEDULE_STATE) == Cst(SetOf(etype(SCHEDULE_STATE,0,2)));Type(STACK) == Cst(SetOf(atype(STACK,"[STACK","]STACK"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Task)) == (Type(running) == Cst(etype(TASK_STATE,0,4));Type(blocked) == Cst(etype(TASK_STATE,0,4));Type(ready) == Cst(etype(TASK_STATE,0,4));Type(suspended) == Cst(etype(TASK_STATE,0,4));Type(deleted) == Cst(etype(TASK_STATE,0,4));Type(taskSCHEDULER_NOT_STARTED) == Cst(etype(SCHEDULE_STATE,0,2));Type(taskSCHEDULER_RUNNING) == Cst(etype(SCHEDULE_STATE,0,2));Type(taskSCHEDULER_SUSPENDED) == Cst(etype(SCHEDULE_STATE,0,2));Type(PRIORITY) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(TASK) == Cst(SetOf(rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4))));Type(TASK_NULL) == Cst(rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)));Type(tskIDLE_PRIORITY) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Task)) == (Type(schedule) == Mvl(etype(SCHEDULE_STATE,?,?));Type(tasks) == Mvl(SetOf(rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Task)) == (Type(xTaskResumeAll) == Cst(No_type,No_type);Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(taskStartScheduler) == Cst(No_type,No_type);Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULE_STATE,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)));Type(vTaskResume) == Cst(No_type,rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)));Type(vTaskSuspend) == Cst(btype(INTEGER,?,?),rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)));Type(prvIdleTask) == Cst(No_type,SetOf(atype(PARAMETER,?,?)));Type(vTaskDelete) == Cst(No_type,rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)));Type(xTaskCreate) == Cst(btype(INTEGER,?,?)*rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)));
  Observers(Machine(Task)) == (Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULE_STATE,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4)),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),rtype(((((Name: atype(NAME,"[NAME","]NAME")),Priority: btype(INTEGER,"[PRIORITY","]PRIORITY")),Task_Code: atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")),Stack: atype(STACK,"[STACK","]STACK")),State: etype(TASK_STATE,0,4))))
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
  variant_clause_mandatory == OK
END
)
