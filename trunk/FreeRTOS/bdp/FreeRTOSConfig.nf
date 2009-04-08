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
  List_Valuable_Constants(Machine(FreeRTOSConfig))==(configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  Inherited_List_Constants(Machine(FreeRTOSConfig))==(?);
  List_Constants(Machine(FreeRTOSConfig))==(configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(FreeRTOSConfig))==(?);
  Context_List_Defered(Machine(FreeRTOSConfig))==(NAME,PARAMETER);
  Context_List_Sets(Machine(FreeRTOSConfig))==(NAME,PARAMETER);
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
  Context_List_Properties(Machine(FreeRTOSConfig))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Inherited_List_Properties(Machine(FreeRTOSConfig))==(btrue);
  List_Properties(Machine(FreeRTOSConfig))==(configMAX_PRIORITIES: INT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: INT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: INT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT)
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
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(FreeRTOSConfig)) == (Type(configMAX_PRIORITIES) == Cst(btype(INTEGER,?,?));Type(configTOTAL_HEAP_SIZE) == Cst(btype(INTEGER,?,?));Type(configMINIMAL_STACK_SIZE) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskPrioritySet) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskSuspend) == Cst(btype(INTEGER,?,?));Type(INCLUDE_uxTaskPriorityGet) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskDelete) == Cst(btype(INTEGER,?,?));Type(INCLUDE_xTaskGetSchedulerState) == Cst(btype(INTEGER,?,?));Type(INCLUDE_xTaskGetCurrentTaskHandle) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskDelay) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskDelayUntil) == Cst(btype(INTEGER,?,?)))
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
