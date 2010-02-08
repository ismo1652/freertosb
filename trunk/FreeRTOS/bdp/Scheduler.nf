Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Scheduler))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Scheduler))==(Machine(Scheduler));
  Level(Machine(Scheduler))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Scheduler)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Scheduler))==(Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Scheduler))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Scheduler))==(?);
  List_Includes(Machine(Scheduler))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Scheduler))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Scheduler))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Scheduler))==(?);
  Context_List_Variables(Machine(Scheduler))==(?);
  Abstract_List_Variables(Machine(Scheduler))==(?);
  Local_List_Variables(Machine(Scheduler))==(schedulerSuspended,schedulerRunning);
  List_Variables(Machine(Scheduler))==(schedulerSuspended,schedulerRunning);
  External_List_Variables(Machine(Scheduler))==(schedulerSuspended,schedulerRunning)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Scheduler))==(?);
  Abstract_List_VisibleVariables(Machine(Scheduler))==(?);
  External_List_VisibleVariables(Machine(Scheduler))==(?);
  Expanded_List_VisibleVariables(Machine(Scheduler))==(?);
  List_VisibleVariables(Machine(Scheduler))==(?);
  Internal_List_VisibleVariables(Machine(Scheduler))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Scheduler))==(btrue);
  Gluing_List_Invariant(Machine(Scheduler))==(btrue);
  Expanded_List_Invariant(Machine(Scheduler))==(btrue);
  Abstract_List_Invariant(Machine(Scheduler))==(btrue);
  Context_List_Invariant(Machine(Scheduler))==(btrue);
  List_Invariant(Machine(Scheduler))==(schedulerRunning: BOOL & schedulerSuspended: NATURAL)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Scheduler))==(btrue);
  Abstract_List_Assertions(Machine(Scheduler))==(btrue);
  Context_List_Assertions(Machine(Scheduler))==(BIT <: NATURAL);
  List_Assertions(Machine(Scheduler))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Scheduler))==(schedulerRunning,schedulerSuspended:=FALSE,0);
  Context_List_Initialisation(Machine(Scheduler))==(skip);
  List_Initialisation(Machine(Scheduler))==(schedulerRunning:=FALSE || schedulerSuspended:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Scheduler))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Scheduler),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Scheduler))==(btrue);
  List_Constraints(Machine(Scheduler))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  List_Operations(Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler)
END
&
THEORY ListInputX IS
  List_Input(Machine(Scheduler),startScheduler)==(?);
  List_Input(Machine(Scheduler),stopScheduler)==(?);
  List_Input(Machine(Scheduler),suspendScheduler)==(?);
  List_Input(Machine(Scheduler),resumeScheduler)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Scheduler),startScheduler)==(?);
  List_Output(Machine(Scheduler),stopScheduler)==(?);
  List_Output(Machine(Scheduler),suspendScheduler)==(?);
  List_Output(Machine(Scheduler),resumeScheduler)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Scheduler),startScheduler)==(startScheduler);
  List_Header(Machine(Scheduler),stopScheduler)==(stopScheduler);
  List_Header(Machine(Scheduler),suspendScheduler)==(suspendScheduler);
  List_Header(Machine(Scheduler),resumeScheduler)==(resumeScheduler)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Scheduler),startScheduler)==(schedulerRunning = FALSE);
  List_Precondition(Machine(Scheduler),stopScheduler)==(schedulerRunning = TRUE);
  List_Precondition(Machine(Scheduler),suspendScheduler)==(schedulerSuspended<MAXINT);
  List_Precondition(Machine(Scheduler),resumeScheduler)==(schedulerSuspended>0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Scheduler),resumeScheduler)==(schedulerSuspended>0 | schedulerSuspended:=schedulerSuspended-1);
  Expanded_List_Substitution(Machine(Scheduler),suspendScheduler)==(schedulerSuspended<MAXINT | schedulerSuspended:=schedulerSuspended+1);
  Expanded_List_Substitution(Machine(Scheduler),stopScheduler)==(schedulerRunning = TRUE | schedulerRunning:=FALSE);
  Expanded_List_Substitution(Machine(Scheduler),startScheduler)==(schedulerRunning = FALSE | schedulerRunning:=TRUE);
  List_Substitution(Machine(Scheduler),startScheduler)==(schedulerRunning:=TRUE);
  List_Substitution(Machine(Scheduler),stopScheduler)==(schedulerRunning:=FALSE);
  List_Substitution(Machine(Scheduler),suspendScheduler)==(schedulerSuspended:=schedulerSuspended+1);
  List_Substitution(Machine(Scheduler),resumeScheduler)==(schedulerSuspended:=schedulerSuspended-1)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Scheduler))==(?);
  Inherited_List_Constants(Machine(Scheduler))==(?);
  List_Constants(Machine(Scheduler))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Scheduler),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Machine(Scheduler))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Machine(Scheduler))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Machine(Scheduler))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Machine(Scheduler))==(?);
  Inherited_List_Enumerated(Machine(Scheduler))==(?);
  Inherited_List_Defered(Machine(Scheduler))==(?);
  Inherited_List_Sets(Machine(Scheduler))==(?);
  List_Enumerated(Machine(Scheduler))==(?);
  List_Defered(Machine(Scheduler))==(?);
  List_Sets(Machine(Scheduler))==(?);
  Set_Definition(Machine(Scheduler),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(Scheduler),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(Scheduler),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Scheduler))==(?);
  Expanded_List_HiddenConstants(Machine(Scheduler))==(?);
  List_HiddenConstants(Machine(Scheduler))==(?);
  External_List_HiddenConstants(Machine(Scheduler))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Scheduler))==(btrue);
  Context_List_Properties(Machine(Scheduler))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Machine(Scheduler))==(btrue);
  List_Properties(Machine(Scheduler))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Scheduler),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(Scheduler))==(?);
  Seen_Context_List_Invariant(Machine(Scheduler))==(btrue);
  Seen_Context_List_Assertions(Machine(Scheduler))==(btrue);
  Seen_Context_List_Properties(Machine(Scheduler))==(btrue);
  Seen_List_Constraints(Machine(Scheduler))==(btrue);
  Seen_List_Operations(Machine(Scheduler),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Scheduler),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Scheduler),startScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),stopScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),suspendScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),resumeScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Scheduler)) == (? | ? | schedulerSuspended,schedulerRunning | ? | startScheduler,stopScheduler,suspendScheduler,resumeScheduler | ? | seen(Machine(Types)) | ? | Scheduler);
  List_Of_HiddenCst_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Scheduler)) == (?);
  List_Of_VisibleVar_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Scheduler)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Scheduler)) == (Type(schedulerSuspended) == Mvl(btype(INTEGER,?,?));Type(schedulerRunning) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Scheduler)) == (Type(resumeScheduler) == Cst(No_type,No_type);Type(suspendScheduler) == Cst(No_type,No_type);Type(stopScheduler) == Cst(No_type,No_type);Type(startScheduler) == Cst(No_type,No_type))
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
