Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Types))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Types))==(Machine(Types));
  Level(Machine(Types))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Types)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Types))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Types))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Types))==(?);
  List_Includes(Machine(Types))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Types))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Types))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Types))==(?);
  Context_List_Variables(Machine(Types))==(?);
  Abstract_List_Variables(Machine(Types))==(?);
  Local_List_Variables(Machine(Types))==(?);
  List_Variables(Machine(Types))==(?);
  External_List_Variables(Machine(Types))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Types))==(?);
  Abstract_List_VisibleVariables(Machine(Types))==(?);
  External_List_VisibleVariables(Machine(Types))==(?);
  Expanded_List_VisibleVariables(Machine(Types))==(?);
  List_VisibleVariables(Machine(Types))==(?);
  Internal_List_VisibleVariables(Machine(Types))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Types))==(btrue);
  Gluing_List_Invariant(Machine(Types))==(btrue);
  Expanded_List_Invariant(Machine(Types))==(btrue);
  Abstract_List_Invariant(Machine(Types))==(btrue);
  Context_List_Invariant(Machine(Types))==(btrue);
  List_Invariant(Machine(Types))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Types))==(btrue);
  Abstract_List_Assertions(Machine(Types))==(btrue);
  Context_List_Assertions(Machine(Types))==(btrue);
  List_Assertions(Machine(Types))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Types))==(skip);
  Context_List_Initialisation(Machine(Types))==(skip);
  List_Initialisation(Machine(Types))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Types))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Types))==(btrue);
  List_Constraints(Machine(Types))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Types))==(?);
  List_Operations(Machine(Types))==(?)
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
  List_Valuable_Constants(Machine(Types))==(PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  Inherited_List_Constants(Machine(Types))==(?);
  List_Constants(Machine(Types))==(PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Types),NAME)==(?);
  Context_List_Enumerated(Machine(Types))==(?);
  Context_List_Defered(Machine(Types))==(?);
  Context_List_Sets(Machine(Types))==(?);
  List_Valuable_Sets(Machine(Types))==(NAME,PARAMETER,TASK,STACK,TASK_CODE);
  Inherited_List_Enumerated(Machine(Types))==(?);
  Inherited_List_Defered(Machine(Types))==(?);
  Inherited_List_Sets(Machine(Types))==(?);
  List_Enumerated(Machine(Types))==(SCHEDULER_STATE);
  List_Defered(Machine(Types))==(NAME,PARAMETER,TASK,STACK,TASK_CODE);
  List_Sets(Machine(Types))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,SCHEDULER_STATE);
  Set_Definition(Machine(Types),PARAMETER)==(?);
  Set_Definition(Machine(Types),TASK)==(?);
  Set_Definition(Machine(Types),STACK)==(?);
  Set_Definition(Machine(Types),TASK_CODE)==(?);
  Set_Definition(Machine(Types),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Types))==(?);
  Expanded_List_HiddenConstants(Machine(Types))==(?);
  List_HiddenConstants(Machine(Types))==(?);
  External_List_HiddenConstants(Machine(Types))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Types))==(btrue);
  Context_List_Properties(Machine(Types))==(btrue);
  Inherited_List_Properties(Machine(Types))==(btrue);
  List_Properties(Machine(Types))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Types),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Types)) == (PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,TASK,STACK,TASK_CODE,SCHEDULER_STATE,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Types)) == (Type(NAME) == Cst(SetOf(atype(NAME,"[NAME","]NAME")));Type(PARAMETER) == Cst(SetOf(atype(PARAMETER,"[PARAMETER","]PARAMETER")));Type(TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK")));Type(STACK) == Cst(SetOf(atype(STACK,"[STACK","]STACK")));Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(SCHEDULER_STATE) == Cst(SetOf(etype(SCHEDULER_STATE,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Types)) == (Type(taskSCHEDULER_NOT_STARTED) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_RUNNING) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_SUSPENDED) == Cst(etype(SCHEDULER_STATE,0,2));Type(PRIORITY) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(TICK) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")));Type(TICK_INCREMENT) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")));Type(BIT) == Cst(SetOf(btype(INTEGER,"[BIT","]BIT")));Type(pdTRUE) == Cst(btype(INTEGER,?,?));Type(pdFALSE) == Cst(btype(INTEGER,?,?));Type(pdPASS) == Cst(btype(INTEGER,?,?));Type(pdFAIL) == Cst(btype(INTEGER,?,?));Type(errQUEUE_EMPTY) == Cst(btype(INTEGER,?,?));Type(errQUEUE_FULL) == Cst(btype(INTEGER,?,?));Type(ERROR_DEFINITION) == Cst(SetOf(btype(INTEGER,"[ERROR_DEFINITION","]ERROR_DEFINITION")));Type(errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY) == Cst(btype(INTEGER,?,?));Type(errNO_TASK_TO_RUN) == Cst(btype(INTEGER,?,?));Type(errQUEUE_BLOCKED) == Cst(btype(INTEGER,?,?));Type(errQUEUE_YIELD) == Cst(btype(INTEGER,?,?));Type(MAX_DELAY) == Cst(btype(INTEGER,?,?));Type(NULL_PARAMETER) == Cst(atype(PARAMETER,?,?)))
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
