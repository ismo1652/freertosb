Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(QueueCore))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(QueueCore))==(Machine(QueueCore));
  Level(Machine(QueueCore))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(QueueCore)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(QueueCore))==(Types,QueueContext)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(QueueCore))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(QueueCore))==(?);
  List_Includes(Machine(QueueCore))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(QueueCore))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(QueueCore))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(QueueCore))==(?);
  Context_List_Variables(Machine(QueueCore))==(?);
  Abstract_List_Variables(Machine(QueueCore))==(?);
  Local_List_Variables(Machine(QueueCore))==(queue_sending,queue_receiving,queue_items,queues);
  List_Variables(Machine(QueueCore))==(queue_sending,queue_receiving,queue_items,queues);
  External_List_Variables(Machine(QueueCore))==(queue_sending,queue_receiving,queue_items,queues)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(QueueCore))==(?);
  Abstract_List_VisibleVariables(Machine(QueueCore))==(?);
  External_List_VisibleVariables(Machine(QueueCore))==(?);
  Expanded_List_VisibleVariables(Machine(QueueCore))==(?);
  List_VisibleVariables(Machine(QueueCore))==(?);
  Internal_List_VisibleVariables(Machine(QueueCore))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(QueueCore))==(btrue);
  Gluing_List_Invariant(Machine(QueueCore))==(btrue);
  Expanded_List_Invariant(Machine(QueueCore))==(btrue);
  Abstract_List_Invariant(Machine(QueueCore))==(btrue);
  Context_List_Invariant(Machine(QueueCore))==(btrue);
  List_Invariant(Machine(QueueCore))==(queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(QueueCore))==(btrue);
  Abstract_List_Assertions(Machine(QueueCore))==(btrue);
  Context_List_Assertions(Machine(QueueCore))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(QueueCore))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(QueueCore))==(queues,queue_items,queue_receiving,queue_sending:={},{},{},{});
  Context_List_Initialisation(Machine(QueueCore))==(skip);
  List_Initialisation(Machine(QueueCore))==(queues:={} || queue_items:={} || queue_receiving:={} || queue_sending:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(QueueCore))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(QueueCore),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(QueueCore),Machine(QueueContext))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(QueueCore))==(btrue);
  List_Constraints(Machine(QueueCore))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(QueueCore))==(xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue);
  List_Operations(Machine(QueueCore))==(xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue)
END
&
THEORY ListInputX IS
  List_Input(Machine(QueueCore),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(QueueCore),queueDelete)==(queue);
  List_Input(Machine(QueueCore),sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Machine(QueueCore),insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Machine(QueueCore),insertTaskWaitingToRecived)==(pxQueue,pxTask);
  List_Input(Machine(QueueCore),receivedItem)==(pxQueue,justPeeking,task);
  List_Input(Machine(QueueCore),removeFromEventListQueue)==(task)
END
&
THEORY ListOutputX IS
  List_Output(Machine(QueueCore),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(QueueCore),queueDelete)==(?);
  List_Output(Machine(QueueCore),sendItem)==(?);
  List_Output(Machine(QueueCore),insertTaskWaitingToSend)==(?);
  List_Output(Machine(QueueCore),insertTaskWaitingToRecived)==(?);
  List_Output(Machine(QueueCore),receivedItem)==(xItem);
  List_Output(Machine(QueueCore),removeFromEventListQueue)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(QueueCore),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(QueueCore),queueDelete)==(queueDelete(queue));
  List_Header(Machine(QueueCore),sendItem)==(sendItem(pxQueue,pxItem,task,copy_position));
  List_Header(Machine(QueueCore),insertTaskWaitingToSend)==(insertTaskWaitingToSend(pxQueue,pxTask));
  List_Header(Machine(QueueCore),insertTaskWaitingToRecived)==(insertTaskWaitingToRecived(pxQueue,pxTask));
  List_Header(Machine(QueueCore),receivedItem)==(xItem <-- receivedItem(pxQueue,justPeeking,task));
  List_Header(Machine(QueueCore),removeFromEventListQueue)==(removeFromEventListQueue(task))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(QueueCore),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(QueueCore),queueDelete)==(queue: queues);
  List_Precondition(Machine(QueueCore),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue));
  List_Precondition(Machine(QueueCore),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK);
  List_Precondition(Machine(QueueCore),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK);
  List_Precondition(Machine(QueueCore),receivedItem)==(pxQueue: queues & justPeeking: BIT & task: TASK & task: queue_sending(pxQueue));
  List_Precondition(Machine(QueueCore),removeFromEventListQueue)==(task: TASK)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(QueueCore),removeFromEventListQueue)==(task: TASK | @(receiving,sending).(receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) ==> queue_receiving,queue_sending:=queue_receiving<+receiving,queue_sending<+sending));
  Expanded_List_Substitution(Machine(QueueCore),receivedItem)==(pxQueue: queues & justPeeking: BIT & task: TASK & task: queue_sending(pxQueue) | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = pdFALSE ==> queue_items,queue_sending:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}},queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}} [] not(justPeeking = pdFALSE) ==> skip || xItem:=item)));
  Expanded_List_Substitution(Machine(QueueCore),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK | queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(QueueCore),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(QueueCore),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pxItem})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}});
  Expanded_List_Substitution(Machine(QueueCore),queueDelete)==(queue: queues | queues,queue_items,queue_receiving,queue_sending:=queues-{queue},{queue}<<|queue_items,{queue}<<|queue_receiving,{queue}<<|queue_sending);
  Expanded_List_Substitution(Machine(QueueCore),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @queue.(queue: QUEUE & queue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{queue},queue_items\/{queue|->{}},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(QueueCore),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_items:=queue_items\/{queue|->{}} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  List_Substitution(Machine(QueueCore),queueDelete)==(queues:=queues-{queue} || queue_items:={queue}<<|queue_items || queue_receiving:={queue}<<|queue_receiving || queue_sending:={queue}<<|queue_sending);
  List_Substitution(Machine(QueueCore),sendItem)==(queue_items(pxQueue):=queue_items(pxQueue)\/{pxItem} || queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task});
  List_Substitution(Machine(QueueCore),insertTaskWaitingToSend)==(queue_sending(pxQueue):=queue_sending(pxQueue)\/{pxTask});
  List_Substitution(Machine(QueueCore),insertTaskWaitingToRecived)==(queue_receiving(pxQueue):=queue_receiving(pxQueue)\/{pxTask});
  List_Substitution(Machine(QueueCore),receivedItem)==(ANY item WHERE item: ITEM & item: queue_items(pxQueue) THEN IF justPeeking = pdFALSE THEN queue_items(pxQueue):=queue_items(pxQueue)-{item} || queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END || xItem:=item END);
  List_Substitution(Machine(QueueCore),removeFromEventListQueue)==(ANY receiving,sending WHERE receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) THEN queue_receiving:=queue_receiving<+receiving || queue_sending:=queue_sending<+sending END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(QueueCore))==(?);
  Inherited_List_Constants(Machine(QueueCore))==(?);
  List_Constants(Machine(QueueCore))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(QueueCore),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Context_List_Enumerated(Machine(QueueCore))==(SCHEDULER_STATE);
  Context_List_Defered(Machine(QueueCore))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE);
  Context_List_Sets(Machine(QueueCore))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,SCHEDULER_STATE,ITEM,COPY_POSITION,QUEUE);
  List_Valuable_Sets(Machine(QueueCore))==(?);
  Inherited_List_Enumerated(Machine(QueueCore))==(?);
  Inherited_List_Defered(Machine(QueueCore))==(?);
  Inherited_List_Sets(Machine(QueueCore))==(?);
  List_Enumerated(Machine(QueueCore))==(?);
  List_Defered(Machine(QueueCore))==(?);
  List_Sets(Machine(QueueCore))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(QueueCore))==(?);
  Expanded_List_HiddenConstants(Machine(QueueCore))==(?);
  List_HiddenConstants(Machine(QueueCore))==(?);
  External_List_HiddenConstants(Machine(QueueCore))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(QueueCore))==(btrue);
  Context_List_Properties(Machine(QueueCore))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & ITEM: FIN(INTEGER) & not(ITEM = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}));
  Inherited_List_Properties(Machine(QueueCore))==(btrue);
  List_Properties(Machine(QueueCore))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(QueueCore),Machine(QueueContext))==(?);
  Seen_Context_List_Enumerated(Machine(QueueCore))==(SCHEDULER_STATE);
  Seen_Context_List_Invariant(Machine(QueueCore))==(btrue);
  Seen_Context_List_Assertions(Machine(QueueCore))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(QueueCore))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}));
  Seen_List_Constraints(Machine(QueueCore))==(btrue);
  Seen_List_Operations(Machine(QueueCore),Machine(QueueContext))==(?);
  Seen_Expanded_List_Invariant(Machine(QueueCore),Machine(QueueContext))==(btrue);
  Set_Definition(Machine(QueueCore),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Seen_Internal_List_Operations(Machine(QueueCore),Machine(Types))==(?);
  Seen_List_Operations(Machine(QueueCore),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(QueueCore),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(QueueCore),xQueueCreate)==(Var(queue) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(QueueCore),queueDelete)==(?);
  List_ANY_Var(Machine(QueueCore),sendItem)==(?);
  List_ANY_Var(Machine(QueueCore),insertTaskWaitingToSend)==(?);
  List_ANY_Var(Machine(QueueCore),insertTaskWaitingToRecived)==(?);
  List_ANY_Var(Machine(QueueCore),receivedItem)==(Var(item) == atype(ITEM,?,?));
  List_ANY_Var(Machine(QueueCore),removeFromEventListQueue)==((Var(receiving) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))),(Var(sending) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));
  List_ANY_Var(Machine(QueueCore),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(QueueCore)) == (? | ? | queue_sending,queue_receiving,queue_items,queues | ? | xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue | ? | seen(Machine(Types)),seen(Machine(QueueContext)) | ? | QueueCore);
  List_Of_HiddenCst_Ids(Machine(QueueCore)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(QueueCore)) == (?);
  List_Of_VisibleVar_Ids(Machine(QueueCore)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(QueueCore)) == (?: ?);
  List_Of_Ids(Machine(QueueContext)) == (QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | QueueContext);
  List_Of_HiddenCst_Ids(Machine(QueueContext)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(QueueContext)) == (QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(QueueContext)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(QueueContext)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,TASK,STACK,TASK_CODE,SCHEDULER_STATE,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(QueueCore)) == (Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(QueueCore)) == (Type(removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(receivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToRecived) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*atype(COPY_POSITION,?,?));Type(queueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
