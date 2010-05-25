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
  List_Assertions(Machine(Types))==(BIT <: NATURAL)
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
  List_Valuable_Constants(Machine(Types))==(BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY);
  Inherited_List_Constants(Machine(Types))==(?);
  List_Constants(Machine(Types))==(BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Types),NAME)==(?);
  Context_List_Enumerated(Machine(Types))==(?);
  Context_List_Defered(Machine(Types))==(?);
  Context_List_Sets(Machine(Types))==(?);
  List_Valuable_Sets(Machine(Types))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Inherited_List_Enumerated(Machine(Types))==(?);
  Inherited_List_Defered(Machine(Types))==(?);
  Inherited_List_Sets(Machine(Types))==(?);
  List_Enumerated(Machine(Types))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  List_Defered(Machine(Types))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  List_Sets(Machine(Types))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  Set_Definition(Machine(Types),PARAMETER)==(?);
  Set_Definition(Machine(Types),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Set_Definition(Machine(Types),TASK)==(?);
  Set_Definition(Machine(Types),STACK)==(?);
  Set_Definition(Machine(Types),TASK_CODE)==(?);
  Set_Definition(Machine(Types),ITEM)==(?);
  Set_Definition(Machine(Types),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(Types),QUEUE)==(?);
  Set_Definition(Machine(Types),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(Types),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE})
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
  List_Properties(Machine(Types))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Types),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Types)) == (Type(NAME) == Cst(SetOf(atype(NAME,"[NAME","]NAME")));Type(PARAMETER) == Cst(SetOf(atype(PARAMETER,"[PARAMETER","]PARAMETER")));Type(SCHEDULER_STATE) == Cst(SetOf(etype(SCHEDULER_STATE,0,2)));Type(TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK")));Type(STACK) == Cst(SetOf(atype(STACK,"[STACK","]STACK")));Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM")));Type(COPY_POSITION) == Cst(SetOf(etype(COPY_POSITION,0,1)));Type(QUEUE) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")));Type(QUEUE_TYPE) == Cst(SetOf(etype(QUEUE_TYPE,0,2)));Type(ERROR_DEFINITION) == Cst(SetOf(etype(ERROR_DEFINITION,0,9))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Types)) == (Type(taskSCHEDULER_NOT_STARTED) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_RUNNING) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_SUSPENDED) == Cst(etype(SCHEDULER_STATE,0,2));Type(queueSEND_TO_BACK) == Cst(etype(COPY_POSITION,0,1));Type(queueSEND_TO_FRONT) == Cst(etype(COPY_POSITION,0,1));Type(TQUE) == Cst(etype(QUEUE_TYPE,0,2));Type(TSEMAPH) == Cst(etype(QUEUE_TYPE,0,2));Type(TMUT) == Cst(etype(QUEUE_TYPE,0,2));Type(errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY) == Cst(etype(ERROR_DEFINITION,0,9));Type(errNO_TASK_TO_RUN) == Cst(etype(ERROR_DEFINITION,0,9));Type(errQUEUE_BLOCKED) == Cst(etype(ERROR_DEFINITION,0,9));Type(errQUEUE_YIELD) == Cst(etype(ERROR_DEFINITION,0,9));Type(errQUEUE_EMPTY) == Cst(etype(ERROR_DEFINITION,0,9));Type(errQUEUE_FULL) == Cst(etype(ERROR_DEFINITION,0,9));Type(pdPASS) == Cst(etype(ERROR_DEFINITION,0,9));Type(pdFAIL) == Cst(etype(ERROR_DEFINITION,0,9));Type(pdTRUE) == Cst(etype(ERROR_DEFINITION,0,9));Type(pdFALSE) == Cst(etype(ERROR_DEFINITION,0,9));Type(BIT) == Cst(SetOf(btype(INTEGER,"[BIT","]BIT")));Type(QUEUE_NULL) == Cst(atype(QUEUE,?,?));Type(ITEM_NULL) == Cst(atype(ITEM,?,?));Type(TASK_NULL) == Cst(atype(TASK,?,?));Type(ITEM_EMPTY) == Cst(atype(ITEM,?,?));Type(REMOVE_EVENT) == Cst(SetOf(atype(TASK,?,?)*SetOf(atype(QUEUE,?,?))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));Type(PRIORITY) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(TICK) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")));Type(TICK_INCREMENT) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")));Type(MAX_DELAY) == Cst(btype(INTEGER,?,?));Type(NULL_PARAMETER) == Cst(atype(PARAMETER,?,?));Type(semGIVE_BLOCK_TIME) == Cst(btype(INTEGER,?,?));Type(IDLE_PRIORITY) == Cst(btype(INTEGER,?,?)))
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
