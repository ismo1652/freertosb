Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(FreeRTOSConfig))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(FreeRTOSConfig))==(Machine(FreeRTOSConfig));
  Level(Machine(FreeRTOSConfig))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(FreeRTOSConfig)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(FreeRTOSConfig))==(Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(FreeRTOSConfig))==(?);
  List_Includes(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(FreeRTOSConfig))==(?);
  Context_List_Variables(Machine(FreeRTOSConfig))==(?);
  Abstract_List_Variables(Machine(FreeRTOSConfig))==(?);
  Local_List_Variables(Machine(FreeRTOSConfig))==(?);
  List_Variables(Machine(FreeRTOSConfig))==(?);
  External_List_Variables(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(FreeRTOSConfig))==(?);
  Abstract_List_VisibleVariables(Machine(FreeRTOSConfig))==(?);
  External_List_VisibleVariables(Machine(FreeRTOSConfig))==(?);
  Expanded_List_VisibleVariables(Machine(FreeRTOSConfig))==(?);
  List_VisibleVariables(Machine(FreeRTOSConfig))==(?);
  Internal_List_VisibleVariables(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(FreeRTOSConfig))==(btrue);
  Gluing_List_Invariant(Machine(FreeRTOSConfig))==(btrue);
  Expanded_List_Invariant(Machine(FreeRTOSConfig))==(btrue);
  Abstract_List_Invariant(Machine(FreeRTOSConfig))==(btrue);
  Context_List_Invariant(Machine(FreeRTOSConfig))==(btrue);
  List_Invariant(Machine(FreeRTOSConfig))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(FreeRTOSConfig))==(btrue);
  Abstract_List_Assertions(Machine(FreeRTOSConfig))==(btrue);
  Context_List_Assertions(Machine(FreeRTOSConfig))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(FreeRTOSConfig))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(FreeRTOSConfig))==(skip);
  Context_List_Initialisation(Machine(FreeRTOSConfig))==(skip);
  List_Initialisation(Machine(FreeRTOSConfig))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(FreeRTOSConfig),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(FreeRTOSConfig))==(btrue);
  List_Constraints(Machine(FreeRTOSConfig))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(FreeRTOSConfig))==(?);
  List_Operations(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(FreeRTOSConfig))==(configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay);
  Inherited_List_Constants(Machine(FreeRTOSConfig))==(?);
  List_Constants(Machine(FreeRTOSConfig))==(configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(FreeRTOSConfig))==(?);
  Context_List_Defered(Machine(FreeRTOSConfig))==(POINTER,NAME,PARAMETER);
  Context_List_Sets(Machine(FreeRTOSConfig))==(POINTER,NAME,PARAMETER);
  List_Valuable_Sets(Machine(FreeRTOSConfig))==(?);
  Inherited_List_Enumerated(Machine(FreeRTOSConfig))==(?);
  Inherited_List_Defered(Machine(FreeRTOSConfig))==(?);
  Inherited_List_Sets(Machine(FreeRTOSConfig))==(?);
  List_Enumerated(Machine(FreeRTOSConfig))==(?);
  List_Defered(Machine(FreeRTOSConfig))==(?);
  List_Sets(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(FreeRTOSConfig))==(?);
  Expanded_List_HiddenConstants(Machine(FreeRTOSConfig))==(?);
  List_HiddenConstants(Machine(FreeRTOSConfig))==(?);
  External_List_HiddenConstants(Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(FreeRTOSConfig))==(btrue);
  Context_List_Properties(Machine(FreeRTOSConfig))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Inherited_List_Properties(Machine(FreeRTOSConfig))==(btrue);
  List_Properties(Machine(FreeRTOSConfig))==(configMAX_PRIORITIES: NATURAL & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NATURAL & configMINIMAL_STACK_SIZE: NATURAL & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & configUSE_PREEMPTION: BIT & configUSE_IDLE_HOOK: BIT & configUSE_TICK_HOOK: BIT & configCPU_CLOCK_HZ: NATURAL & configTICK_RATE_HZ: NATURAL & configMAX_TASK_NAME_LEN: NATURAL & configUSE_TRACE_FACILITY: BIT & configUSE_16_BIT_TICKS: BIT & configIDLE_SHOULD_YIELD: BIT & configUSE_USE_MUTEXES: BIT & configUSE_RECURSIVE_MUTEXES: BIT & configUSE_COUNTING_SEMAPHORES: BIT & configUSE_ALTERNATIVE_API: BIT & configCHECK_FOR_STACK_OVERFLOW: BIT & configQUEUE_REGISTRY_SIZE: BIT & configUSE_CO_ROUTINES: BIT & configMAX_CO_ROUTINE_PRIORITIES: NATURAL & configKERNEL_INTERRUPT_PRIORITY: NATURAL & configMAX_SYSCALL_INTERRUPT_PRIORITY: NATURAL & INCLUDE_vTaskCleanUpResources: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(FreeRTOSConfig),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(FreeRTOSConfig))==(?);
  Seen_Context_List_Invariant(Machine(FreeRTOSConfig))==(btrue);
  Seen_Context_List_Assertions(Machine(FreeRTOSConfig))==(btrue);
  Seen_Context_List_Properties(Machine(FreeRTOSConfig))==(btrue);
  Seen_List_Constraints(Machine(FreeRTOSConfig))==(btrue);
  Seen_List_Operations(Machine(FreeRTOSConfig),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(FreeRTOSConfig),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(FreeRTOSConfig),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,POINTER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(FreeRTOSConfig)) == (Type(configMAX_PRIORITIES) == Cst(btype(INTEGER,?,?));Type(configTOTAL_HEAP_SIZE) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskPrioritySet) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskSuspend) == Cst(btype(INTEGER,?,?));Type(INCLUDE_uxTaskPriorityGet) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskDelete) == Cst(btype(INTEGER,?,?));Type(INCLUDE_xTaskGetSchedulerState) == Cst(btype(INTEGER,?,?));Type(INCLUDE_xTaskGetCurrentTaskHandle) == Cst(btype(INTEGER,?,?));Type(configMINIMAL_STACK_SIZE) == Cst(btype(INTEGER,?,?));Type(configUSE_PREEMPTION) == Cst(btype(INTEGER,?,?));Type(configUSE_IDLE_HOOK) == Cst(btype(INTEGER,?,?));Type(configUSE_TICK_HOOK) == Cst(btype(INTEGER,?,?));Type(configCPU_CLOCK_HZ) == Cst(btype(INTEGER,?,?));Type(configTICK_RATE_HZ) == Cst(btype(INTEGER,?,?));Type(configMAX_TASK_NAME_LEN) == Cst(btype(INTEGER,?,?));Type(configUSE_TRACE_FACILITY) == Cst(btype(INTEGER,?,?));Type(configUSE_16_BIT_TICKS) == Cst(btype(INTEGER,?,?));Type(configIDLE_SHOULD_YIELD) == Cst(btype(INTEGER,?,?));Type(configUSE_USE_MUTEXES) == Cst(btype(INTEGER,?,?));Type(configUSE_RECURSIVE_MUTEXES) == Cst(btype(INTEGER,?,?));Type(configUSE_COUNTING_SEMAPHORES) == Cst(btype(INTEGER,?,?));Type(configUSE_ALTERNATIVE_API) == Cst(btype(INTEGER,?,?));Type(configCHECK_FOR_STACK_OVERFLOW) == Cst(btype(INTEGER,?,?));Type(configQUEUE_REGISTRY_SIZE) == Cst(btype(INTEGER,?,?));Type(configUSE_CO_ROUTINES) == Cst(btype(INTEGER,?,?));Type(configMAX_CO_ROUTINE_PRIORITIES) == Cst(btype(INTEGER,?,?));Type(configKERNEL_INTERRUPT_PRIORITY) == Cst(btype(INTEGER,?,?));Type(configMAX_SYSCALL_INTERRUPT_PRIORITY) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskCleanUpResources) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskDelayUntil) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskDelay) == Cst(btype(INTEGER,?,?)))
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
