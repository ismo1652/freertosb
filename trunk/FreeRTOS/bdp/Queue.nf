Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Queue))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Queue))==(Machine(Queue));
  Level(Machine(Queue))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Queue)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Queue))==(Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Queue))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Queue))==(?);
  List_Includes(Machine(Queue))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Queue))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Queue))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Queue))==(?);
  Context_List_Variables(Machine(Queue))==(?);
  Abstract_List_Variables(Machine(Queue))==(?);
  Local_List_Variables(Machine(Queue))==(queue_sending,queue_receiving,queue_items,queues);
  List_Variables(Machine(Queue))==(queue_sending,queue_receiving,queue_items,queues);
  External_List_Variables(Machine(Queue))==(queue_sending,queue_receiving,queue_items,queues)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Queue))==(?);
  Abstract_List_VisibleVariables(Machine(Queue))==(?);
  External_List_VisibleVariables(Machine(Queue))==(?);
  Expanded_List_VisibleVariables(Machine(Queue))==(?);
  List_VisibleVariables(Machine(Queue))==(?);
  Internal_List_VisibleVariables(Machine(Queue))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Queue))==(btrue);
  Gluing_List_Invariant(Machine(Queue))==(btrue);
  Expanded_List_Invariant(Machine(Queue))==(btrue);
  Abstract_List_Invariant(Machine(Queue))==(btrue);
  Context_List_Invariant(Machine(Queue))==(btrue);
  List_Invariant(Machine(Queue))==(queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Queue))==(btrue);
  Abstract_List_Assertions(Machine(Queue))==(btrue);
  Context_List_Assertions(Machine(Queue))==(BIT <: NATURAL);
  List_Assertions(Machine(Queue))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Queue))==(queues,queue_items,queue_receiving,queue_sending:={},{},{},{});
  Context_List_Initialisation(Machine(Queue))==(skip);
  List_Initialisation(Machine(Queue))==(queues:={} || queue_items:={} || queue_receiving:={} || queue_sending:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Queue))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Queue),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Queue))==(btrue);
  List_Constraints(Machine(Queue))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Queue))==(xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue);
  List_Operations(Machine(Queue))==(xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue)
END
&
THEORY ListInputX IS
  List_Input(Machine(Queue),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(Queue),queueDelete)==(queue);
  List_Input(Machine(Queue),sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Machine(Queue),insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Machine(Queue),insertTaskWaitingToRecived)==(pxQueue,pxTask);
  List_Input(Machine(Queue),receivedItem)==(pxQueue,justPeeking,task);
  List_Input(Machine(Queue),removeFromEventListQueue)==(task)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Queue),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(Queue),queueDelete)==(?);
  List_Output(Machine(Queue),sendItem)==(?);
  List_Output(Machine(Queue),insertTaskWaitingToSend)==(?);
  List_Output(Machine(Queue),insertTaskWaitingToRecived)==(?);
  List_Output(Machine(Queue),receivedItem)==(xItem);
  List_Output(Machine(Queue),removeFromEventListQueue)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Queue),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(Queue),queueDelete)==(queueDelete(queue));
  List_Header(Machine(Queue),sendItem)==(sendItem(pxQueue,pxItem,task,copy_position));
  List_Header(Machine(Queue),insertTaskWaitingToSend)==(insertTaskWaitingToSend(pxQueue,pxTask));
  List_Header(Machine(Queue),insertTaskWaitingToRecived)==(insertTaskWaitingToRecived(pxQueue,pxTask));
  List_Header(Machine(Queue),receivedItem)==(xItem <-- receivedItem(pxQueue,justPeeking,task));
  List_Header(Machine(Queue),removeFromEventListQueue)==(removeFromEventListQueue(task))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Queue),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(Queue),queueDelete)==(queue: queues);
  List_Precondition(Machine(Queue),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue));
  List_Precondition(Machine(Queue),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK);
  List_Precondition(Machine(Queue),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK);
  List_Precondition(Machine(Queue),receivedItem)==(pxQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue));
  List_Precondition(Machine(Queue),removeFromEventListQueue)==(task: TASK)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Queue),removeFromEventListQueue)==(task: TASK | @(receiving,sending).(receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) ==> queue_receiving,queue_sending:=queue_receiving<+receiving,queue_sending<+sending));
  Expanded_List_Substitution(Machine(Queue),receivedItem)==(pxQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = FALSE ==> queue_items,queue_sending:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}},queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}} [] not(justPeeking = FALSE) ==> skip || xItem:=item)));
  Expanded_List_Substitution(Machine(Queue),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK | queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(Queue),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(Queue),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pxItem})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}});
  Expanded_List_Substitution(Machine(Queue),queueDelete)==(queue: queues | queues,queue_items,queue_receiving,queue_sending:=queues-{queue},{queue}<<|queue_items,{queue}<<|queue_receiving,{queue}<<|queue_sending);
  Expanded_List_Substitution(Machine(Queue),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @queue.(queue: QUEUE & queue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{queue},queue_items\/{queue|->{}},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(Queue),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_items:=queue_items\/{queue|->{}} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  List_Substitution(Machine(Queue),queueDelete)==(queues:=queues-{queue} || queue_items:={queue}<<|queue_items || queue_receiving:={queue}<<|queue_receiving || queue_sending:={queue}<<|queue_sending);
  List_Substitution(Machine(Queue),sendItem)==(queue_items(pxQueue):=queue_items(pxQueue)\/{pxItem} || queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task});
  List_Substitution(Machine(Queue),insertTaskWaitingToSend)==(queue_sending(pxQueue):=queue_sending(pxQueue)\/{pxTask});
  List_Substitution(Machine(Queue),insertTaskWaitingToRecived)==(queue_receiving(pxQueue):=queue_receiving(pxQueue)\/{pxTask});
  List_Substitution(Machine(Queue),receivedItem)==(ANY item WHERE item: ITEM & item: queue_items(pxQueue) THEN IF justPeeking = FALSE THEN queue_items(pxQueue):=queue_items(pxQueue)-{item} || queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END || xItem:=item END);
  List_Substitution(Machine(Queue),removeFromEventListQueue)==(ANY receiving,sending WHERE receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) THEN queue_receiving:=queue_receiving<+receiving || queue_sending:=queue_sending<+sending END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Queue))==(?);
  Inherited_List_Constants(Machine(Queue))==(?);
  List_Constants(Machine(Queue))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Queue),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Machine(Queue))==(SCHEDULER_STATE,COPY_POSITION,ERROR_DEFINITION);
  Context_List_Defered(Machine(Queue))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Machine(Queue))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,ERROR_DEFINITION);
  List_Valuable_Sets(Machine(Queue))==(?);
  Inherited_List_Enumerated(Machine(Queue))==(?);
  Inherited_List_Defered(Machine(Queue))==(?);
  Inherited_List_Sets(Machine(Queue))==(?);
  List_Enumerated(Machine(Queue))==(?);
  List_Defered(Machine(Queue))==(?);
  List_Sets(Machine(Queue))==(?);
  Set_Definition(Machine(Queue),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(Queue),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Queue))==(?);
  Expanded_List_HiddenConstants(Machine(Queue))==(?);
  List_HiddenConstants(Machine(Queue))==(?);
  External_List_HiddenConstants(Machine(Queue))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Queue))==(btrue);
  Context_List_Properties(Machine(Queue))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Machine(Queue))==(btrue);
  List_Properties(Machine(Queue))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Queue),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(Queue))==(?);
  Seen_Context_List_Invariant(Machine(Queue))==(btrue);
  Seen_Context_List_Assertions(Machine(Queue))==(btrue);
  Seen_Context_List_Properties(Machine(Queue))==(btrue);
  Seen_List_Constraints(Machine(Queue))==(btrue);
  Seen_List_Operations(Machine(Queue),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Queue),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Queue),xQueueCreate)==(Var(queue) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue),queueDelete)==(?);
  List_ANY_Var(Machine(Queue),sendItem)==(?);
  List_ANY_Var(Machine(Queue),insertTaskWaitingToSend)==(?);
  List_ANY_Var(Machine(Queue),insertTaskWaitingToRecived)==(?);
  List_ANY_Var(Machine(Queue),receivedItem)==(Var(item) == atype(ITEM,?,?));
  List_ANY_Var(Machine(Queue),removeFromEventListQueue)==((Var(receiving) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))),(Var(sending) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));
  List_ANY_Var(Machine(Queue),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Queue)) == (? | ? | queue_sending,queue_receiving,queue_items,queues | ? | xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue | ? | seen(Machine(Types)) | ? | Queue);
  List_Of_HiddenCst_Ids(Machine(Queue)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue)) == (?);
  List_Of_VisibleVar_Ids(Machine(Queue)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Queue)) == (Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Queue)) == (Type(removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(receivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(BOOL,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToRecived) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*etype(COPY_POSITION,?,?));Type(queueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
