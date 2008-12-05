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
  List_Valuable_Constants(Machine(Types))==(BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  Inherited_List_Constants(Machine(Types))==(?);
  List_Constants(Machine(Types))==(BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Types),POINTER)==(?);
  Context_List_Enumerated(Machine(Types))==(?);
  Context_List_Defered(Machine(Types))==(?);
  Context_List_Sets(Machine(Types))==(?);
  List_Valuable_Sets(Machine(Types))==(POINTER,NAME,PARAMETER);
  Inherited_List_Enumerated(Machine(Types))==(?);
  Inherited_List_Defered(Machine(Types))==(?);
  Inherited_List_Sets(Machine(Types))==(?);
  List_Enumerated(Machine(Types))==(?);
  List_Defered(Machine(Types))==(POINTER,NAME,PARAMETER);
  List_Sets(Machine(Types))==(POINTER,NAME,PARAMETER);
  Set_Definition(Machine(Types),NAME)==(?);
  Set_Definition(Machine(Types),PARAMETER)==(?)
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
  List_Properties(Machine(Types))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Types),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,POINTER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Types)) == (Type(POINTER) == Cst(SetOf(atype(POINTER,"[POINTER","]POINTER")));Type(NAME) == Cst(SetOf(atype(NAME,"[NAME","]NAME")));Type(PARAMETER) == Cst(SetOf(atype(PARAMETER,"[PARAMETER","]PARAMETER"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Types)) == (Type(BIT) == Cst(SetOf(btype(INTEGER,"[BIT","]BIT")));Type(ERROR_DEFINITION) == Cst(SetOf(btype(INTEGER,"[ERROR_DEFINITION","]ERROR_DEFINITION")));Type(pdTRUE) == Cst(btype(INTEGER,?,?));Type(pdFALSE) == Cst(btype(INTEGER,?,?));Type(pdPASS) == Cst(btype(INTEGER,?,?));Type(pdFAIL) == Cst(btype(INTEGER,?,?));Type(errQUEUE_EMPTY) == Cst(btype(INTEGER,?,?));Type(errQUEUE_FULL) == Cst(btype(INTEGER,?,?));Type(errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY) == Cst(btype(INTEGER,?,?));Type(errNO_TASK_TO_RUN) == Cst(btype(INTEGER,?,?));Type(errQUEUE_BLOCKED) == Cst(btype(INTEGER,?,?));Type(errQUEUE_YIELD) == Cst(btype(INTEGER,?,?));Type(MAX_DELAY) == Cst(btype(INTEGER,?,?));Type(NULL_PARAMETER) == Cst(atype(PARAMETER,?,?)))
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
