Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Memory))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Memory))==(Machine(Memory));
  Level(Machine(Memory))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Memory)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Memory))==(FreeRTOSConfig,Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Memory))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Memory))==(?);
  List_Includes(Machine(Memory))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Memory))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Memory))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Memory))==(?);
  Context_List_Variables(Machine(Memory))==(?);
  Abstract_List_Variables(Machine(Memory))==(?);
  Local_List_Variables(Machine(Memory))==(heap);
  List_Variables(Machine(Memory))==(heap);
  External_List_Variables(Machine(Memory))==(heap)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Memory))==(?);
  Abstract_List_VisibleVariables(Machine(Memory))==(?);
  External_List_VisibleVariables(Machine(Memory))==(?);
  Expanded_List_VisibleVariables(Machine(Memory))==(?);
  List_VisibleVariables(Machine(Memory))==(?);
  Internal_List_VisibleVariables(Machine(Memory))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Memory))==(btrue);
  Gluing_List_Invariant(Machine(Memory))==(btrue);
  Expanded_List_Invariant(Machine(Memory))==(btrue);
  Abstract_List_Invariant(Machine(Memory))==(btrue);
  Context_List_Invariant(Machine(Memory))==(btrue);
  List_Invariant(Machine(Memory))==(heap: HEAP_SIZE)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Memory))==(btrue);
  Abstract_List_Assertions(Machine(Memory))==(btrue);
  Context_List_Assertions(Machine(Memory))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(Memory))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Memory))==(heap:=configTOTAL_HEAP_SIZE);
  Context_List_Initialisation(Machine(Memory))==(skip);
  List_Initialisation(Machine(Memory))==(heap:=configTOTAL_HEAP_SIZE)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Memory))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Memory),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Machine(Memory),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Memory))==(btrue);
  List_Constraints(Machine(Memory))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Memory))==(setHeap);
  List_Operations(Machine(Memory))==(setHeap)
END
&
THEORY ListInputX IS
  List_Input(Machine(Memory),setHeap)==(mem)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Memory),setHeap)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Memory),setHeap)==(setHeap(mem))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Memory),setHeap)==(mem: NATURAL & mem<=configTOTAL_HEAP_SIZE)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Memory),setHeap)==(mem: NATURAL & mem<=configTOTAL_HEAP_SIZE | heap:=mem);
  List_Substitution(Machine(Memory),setHeap)==(heap:=mem)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Memory))==(STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree);
  Inherited_List_Constants(Machine(Memory))==(?);
  List_Constants(Machine(Memory))==(STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Memory))==(?);
  Context_List_Defered(Machine(Memory))==(POINTER,NAME);
  Context_List_Sets(Machine(Memory))==(POINTER,NAME);
  List_Valuable_Sets(Machine(Memory))==(?);
  Inherited_List_Enumerated(Machine(Memory))==(?);
  Inherited_List_Defered(Machine(Memory))==(?);
  Inherited_List_Sets(Machine(Memory))==(?);
  List_Enumerated(Machine(Memory))==(?);
  List_Defered(Machine(Memory))==(?);
  List_Sets(Machine(Memory))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Memory))==(?);
  Expanded_List_HiddenConstants(Machine(Memory))==(?);
  List_HiddenConstants(Machine(Memory))==(?);
  External_List_HiddenConstants(Machine(Memory))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Memory))==(btrue);
  Context_List_Properties(Machine(Memory))==(configMAX_PRIORITIES: NATURAL & configTOTAL_HEAP_SIZE: NATURAL & configMINIMAL_STACK_SIZE: NATURAL & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & configUSE_PREEMPTION: BIT & configUSE_IDLE_HOOK: BIT & configUSE_TICK_HOOK: BIT & configCPU_CLOCK_HZ: NATURAL & configTICK_RATE_HZ: NATURAL & configMAX_TASK_NAME_LEN: NATURAL & configUSE_TRACE_FACILITY: BIT & configUSE_16_BIT_TICKS: BIT & configIDLE_SHOULD_YIELD: BIT & configUSE_USE_MUTEXES: BIT & configUSE_RECURSIVE_MUTEXES: BIT & configUSE_COUNTING_SEMAPHORES: BIT & configUSE_ALTERNATIVE_API: BIT & configCHECK_FOR_STACK_OVERFLOW: BIT & configQUEUE_REGISTRY_SIZE: BIT & configUSE_CO_ROUTINES: BIT & configMAX_CO_ROUTINE_PRIORITIES: NATURAL & configKERNEL_INTERRUPT_PRIORITY: NATURAL & configMAX_SYSCALL_INTERRUPT_PRIORITY: NATURAL & INCLUDE_vTaskCleanUpResources: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & pointer: POINTER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}));
  Inherited_List_Properties(Machine(Memory))==(btrue);
  List_Properties(Machine(Memory))==(STACK = POINTER*NATURAL & STACK_NULL: STACK & HEAP_SIZE = 0..configTOTAL_HEAP_SIZE & portMalloc: HEAP_SIZE*HEAP_SIZE --> HEAP_SIZE*STACK & portMalloc = %(heap,sz).(heap: HEAP_SIZE & sz: HEAP_SIZE & heap-sz+1>0 | heap-sz,(pointer,sz)) & portMalloc = %(heap,sz).(heap: HEAP_SIZE & sz: HEAP_SIZE & heap-sz<0 | 0,STACK_NULL) & portFree: HEAP_SIZE*POINTER*HEAP_SIZE --> HEAP_SIZE & portFree = %(heap,pt,sz).(heap: HEAP_SIZE & pt: POINTER & sz: HEAP_SIZE & heap+sz<=configTOTAL_HEAP_SIZE | heap+sz) & portFree = %(heap,pt,sz).(heap: HEAP_SIZE & pt: POINTER & sz: HEAP_SIZE & heap+sz>configTOTAL_HEAP_SIZE | heap))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Memory),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(Memory))==(?);
  Seen_Context_List_Invariant(Machine(Memory))==(btrue);
  Seen_Context_List_Assertions(Machine(Memory))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(Memory))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & pointer: POINTER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}));
  Seen_List_Constraints(Machine(Memory))==(btrue);
  Seen_List_Operations(Machine(Memory),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Memory),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Machine(Memory),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Machine(Memory),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(Memory),Machine(FreeRTOSConfig))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Memory),setHeap)==(?);
  List_ANY_Var(Machine(Memory),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Memory)) == (STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree | ? | heap | ? | setHeap | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Memory);
  List_Of_HiddenCst_Ids(Machine(Memory)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Memory)) == (STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree);
  List_Of_VisibleVar_Ids(Machine(Memory)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Memory)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,pointer,POINTER,NAME | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,pointer);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Memory)) == (Type(STACK) == Cst(SetOf(atype(POINTER,?,?)*btype(INTEGER,?,?)));Type(STACK_NULL) == Cst(atype(POINTER,?,?)*btype(INTEGER,?,?));Type(HEAP_SIZE) == Cst(SetOf(btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")));Type(portMalloc) == Cst(SetOf(btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*(btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*(atype(POINTER,?,?)*btype(INTEGER,?,?)))));Type(portFree) == Cst(SetOf(btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*atype(POINTER,"[POINTER","]POINTER")*btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Memory)) == (Type(heap) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Memory)) == (Type(setHeap) == Cst(No_type,btype(INTEGER,?,?)))
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
