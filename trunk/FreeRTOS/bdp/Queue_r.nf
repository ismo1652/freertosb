Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(Queue_r))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(Queue_r))==(Machine(Queue));
  Level(Refinement(Queue_r))==(1);
  Upper_Level(Refinement(Queue_r))==(Machine(Queue))
END
&
THEORY LoadedStructureX IS
  Refinement(Queue_r)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(Queue_r))==(Types)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(Queue_r))==(?);
  List_Includes(Refinement(Queue_r))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(Queue_r))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(Queue_r))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(Queue_r))==(?);
  Context_List_Variables(Refinement(Queue_r))==(?);
  Abstract_List_Variables(Refinement(Queue_r))==(queue_recursive,queue_holder,queue_type,queue_sending,queue_receiving,queue_items,queues);
  Local_List_Variables(Refinement(Queue_r))==(queue_recursive,queue_holder,queue_type,queue_items_r,queue_size,queue_sending,queue_receiving,queues);
  List_Variables(Refinement(Queue_r))==(queue_recursive,queue_holder,queue_type,queue_items_r,queue_size,queue_sending,queue_receiving,queues);
  External_List_Variables(Refinement(Queue_r))==(queue_recursive,queue_holder,queue_type,queue_items_r,queue_size,queue_sending,queue_receiving,queues)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(Queue_r))==(?);
  Abstract_List_VisibleVariables(Refinement(Queue_r))==(?);
  External_List_VisibleVariables(Refinement(Queue_r))==(?);
  Expanded_List_VisibleVariables(Refinement(Queue_r))==(?);
  List_VisibleVariables(Refinement(Queue_r))==(?);
  Internal_List_VisibleVariables(Refinement(Queue_r))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(Queue_r))==(queue_items_r,queue_size)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(Queue_r))==(btrue);
  Expanded_List_Invariant(Refinement(Queue_r))==(btrue);
  Abstract_List_Invariant(Refinement(Queue_r))==(queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queue_type: QUEUE +-> QUEUE_TYPE & queue_holder: QUEUE +-> TASK & queue_recursive: QUEUE +-> NAT & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending) & queues = dom(queue_type) & dom(queue_holder) <: queues & dom(queue_holder) <: dom(queue_type|>{TMUT}) & !queue.(queue: queues & queue_type(queue) = TMUT & queue_items(queue) = {} => queue: dom(queue_holder)) & dom(queue_recursive) <: queues & dom(queue_recursive) <: dom(queue_type|>{TMUT}));
  Context_List_Invariant(Refinement(Queue_r))==(btrue);
  List_Invariant(Refinement(Queue_r))==(queue_size: QUEUE +-> NAT & queue_items_r: QUEUE +-> seq(ITEM) & dom(queue_items_r) = dom(queue_items) & dom(queue_size) = queues & !queue.(queue: queues => ran(queue_items_r(queue)) = queue_items(queue)))
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(Queue_r))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(Queue_r))==(btrue);
  Abstract_List_Assertions(Refinement(Queue_r))==(btrue);
  Context_List_Assertions(Refinement(Queue_r))==(BIT <: NATURAL);
  List_Assertions(Refinement(Queue_r))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(Queue_r))==(queues,queue_receiving,queue_sending,queue_size,queue_items_r,queue_type,queue_holder,queue_recursive:={},{},{},{},{},{},{},{});
  Context_List_Initialisation(Refinement(Queue_r))==(skip);
  List_Initialisation(Refinement(Queue_r))==(queues:={} || queue_receiving:={} || queue_sending:={} || queue_size:={} || queue_items_r:={} || queue_type:={} || queue_holder:={} || queue_recursive:={})
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(Queue_r))==(xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue,q_endScheduler,createSemaphore,createMutex);
  List_Operations(Refinement(Queue_r))==(xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue,q_endScheduler,createSemaphore,createMutex)
END
&
THEORY ListInputX IS
  List_Input(Refinement(Queue_r),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Refinement(Queue_r),queueDelete)==(queue);
  List_Input(Refinement(Queue_r),sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Refinement(Queue_r),insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Refinement(Queue_r),insertTaskWaitingToRecived)==(pxQueue,pxTask);
  List_Input(Refinement(Queue_r),receivedItem)==(pxQueue,justPeeking,task,rTask);
  List_Input(Refinement(Queue_r),removeFromEventListQueue)==(task);
  List_Input(Refinement(Queue_r),q_endScheduler)==(?);
  List_Input(Refinement(Queue_r),createSemaphore)==(maxCount,initialCount);
  List_Input(Refinement(Queue_r),createMutex)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(Queue_r),xQueueCreate)==(xQueueHandle);
  List_Output(Refinement(Queue_r),queueDelete)==(?);
  List_Output(Refinement(Queue_r),sendItem)==(?);
  List_Output(Refinement(Queue_r),insertTaskWaitingToSend)==(?);
  List_Output(Refinement(Queue_r),insertTaskWaitingToRecived)==(?);
  List_Output(Refinement(Queue_r),receivedItem)==(xItem);
  List_Output(Refinement(Queue_r),removeFromEventListQueue)==(?);
  List_Output(Refinement(Queue_r),q_endScheduler)==(?);
  List_Output(Refinement(Queue_r),createSemaphore)==(semaphore);
  List_Output(Refinement(Queue_r),createMutex)==(mutex)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(Queue_r),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Refinement(Queue_r),queueDelete)==(queueDelete(queue));
  List_Header(Refinement(Queue_r),sendItem)==(sendItem(pxQueue,pxItem,task,copy_position));
  List_Header(Refinement(Queue_r),insertTaskWaitingToSend)==(insertTaskWaitingToSend(pxQueue,pxTask));
  List_Header(Refinement(Queue_r),insertTaskWaitingToRecived)==(insertTaskWaitingToRecived(pxQueue,pxTask));
  List_Header(Refinement(Queue_r),receivedItem)==(xItem <-- receivedItem(pxQueue,justPeeking,task,rTask));
  List_Header(Refinement(Queue_r),removeFromEventListQueue)==(removeFromEventListQueue(task));
  List_Header(Refinement(Queue_r),q_endScheduler)==(q_endScheduler);
  List_Header(Refinement(Queue_r),createSemaphore)==(semaphore <-- createSemaphore(maxCount,initialCount));
  List_Header(Refinement(Queue_r),createMutex)==(mutex <-- createMutex)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(Queue_r),xQueueCreate)==(btrue);
  List_Precondition(Refinement(Queue_r),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  Own_Precondition(Refinement(Queue_r),queueDelete)==(btrue);
  List_Precondition(Refinement(Queue_r),queueDelete)==(queue: queues);
  Own_Precondition(Refinement(Queue_r),sendItem)==(btrue);
  List_Precondition(Refinement(Queue_r),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue));
  Own_Precondition(Refinement(Queue_r),insertTaskWaitingToSend)==(btrue);
  List_Precondition(Refinement(Queue_r),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK);
  Own_Precondition(Refinement(Queue_r),insertTaskWaitingToRecived)==(btrue);
  List_Precondition(Refinement(Queue_r),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK);
  Own_Precondition(Refinement(Queue_r),receivedItem)==(btrue);
  List_Precondition(Refinement(Queue_r),receivedItem)==(pxQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & rTask: TASK);
  Own_Precondition(Refinement(Queue_r),removeFromEventListQueue)==(btrue);
  List_Precondition(Refinement(Queue_r),removeFromEventListQueue)==(task: TASK);
  Own_Precondition(Refinement(Queue_r),q_endScheduler)==(btrue);
  List_Precondition(Refinement(Queue_r),q_endScheduler)==(btrue);
  Own_Precondition(Refinement(Queue_r),createSemaphore)==(btrue);
  List_Precondition(Refinement(Queue_r),createSemaphore)==(maxCount: NAT & initialCount: NAT & initialCount<=maxCount);
  Own_Precondition(Refinement(Queue_r),createMutex)==(btrue);
  List_Precondition(Refinement(Queue_r),createMutex)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(Queue_r),createMutex)==(btrue | @(queue,initialItems,initialSeq).(queue: QUEUE & queue/:queues & initialItems: POW(ITEM) & initialItems/={} & initialSeq: seq(ITEM) & ran(initialSeq) = initialItems & size(initialSeq) = 1 ==> queues,queue_size,queue_items_r,queue_receiving,queue_sending,queue_type,queue_recursive,mutex:=queues\/{queue},queue_size\/{queue|->1},queue_items_r\/{queue|->initialSeq},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue_type\/{queue|->TMUT},queue_recursive\/{queue|->0},queue));
  Expanded_List_Substitution(Refinement(Queue_r),createSemaphore)==(maxCount: NAT & initialCount: NAT & initialCount<=maxCount | @(queue,initialItems,initialSeq).(queue: QUEUE & queue/:queues & initialItems <: ITEM & initialItems/={} & initialSeq: seq(ITEM) & ran(initialSeq) = initialItems & size(initialSeq) = initialCount ==> queues,queue_size,queue_items_r,queue_receiving,queue_sending,queue_type,semaphore:=queues\/{queue},queue_size\/{queue|->maxCount},queue_items_r\/{queue|->initialSeq},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue_type\/{queue|->TSEMAPH},queue));
  Expanded_List_Substitution(Refinement(Queue_r),q_endScheduler)==(btrue | queues,queue_receiving,queue_sending,queue_size,queue_items_r,queue_type,queue_holder,queue_recursive:={},{},{},{},{},{},{},{});
  Expanded_List_Substitution(Refinement(Queue_r),removeFromEventListQueue)==(task: TASK | @(receiving,sending,holder).(receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) & holder = queue_holder|>{task} ==> queue_receiving,queue_sending,queue_holder,queue_items_r:=queue_receiving<+receiving,queue_sending<+sending,queue_holder-holder,queue_items_r<+%queue.(queue: dom(holder) | [ITEM_NULL])));
  Expanded_List_Substitution(Refinement(Queue_r),receivedItem)==(pxQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & rTask: TASK | xItem:=first(queue_items_r(pxQueue)) || (justPeeking = FALSE ==> queue_items_r,queue_sending:=queue_items_r<+{pxQueue|->tail(queue_items_r(pxQueue))},queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}} [] not(justPeeking = FALSE) ==> skip) || (queue_type(pxQueue) = TMUT ==> queue_holder:=queue_holder<+{pxQueue|->rTask} [] not(queue_type(pxQueue) = TMUT) ==> skip));
  Expanded_List_Substitution(Refinement(Queue_r),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK | queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Refinement(Queue_r),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Refinement(Queue_r),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) | pxItem/:ran(queue_items_r(pxQueue)) ==> (copy_position = queueSEND_TO_BACK ==> queue_items_r:=queue_items_r<+{pxQueue|->(queue_items_r(pxQueue)<-pxItem)} [] not(copy_position = queueSEND_TO_BACK) ==> queue_items_r:=queue_items_r<+{pxQueue|->(pxItem->queue_items_r(pxQueue))}) [] not(pxItem/:ran(queue_items_r(pxQueue))) ==> skip || queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}});
  Expanded_List_Substitution(Refinement(Queue_r),queueDelete)==(queue: queues | queues,queue_size,queue_items_r,queue_receiving,queue_sending,queue_type,queue_holder,queue_recursive:=queues-{queue},{queue}<<|queue_size,{queue}<<|queue_items_r,{queue}<<|queue_receiving,{queue}<<|queue_sending,{queue}<<|queue_type,{queue}<<|queue_holder,{queue}<<|queue_recursive);
  Expanded_List_Substitution(Refinement(Queue_r),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @queue.(queue: QUEUE & queue/:queues ==> queues,queue_size,queue_items_r,queue_receiving,queue_sending,queue_type,xQueueHandle:=queues\/{queue},queue_size\/{queue|->uxQueueLength},queue_items_r\/{queue|-><>},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue_type\/{queue|->TQUE},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Refinement(Queue_r),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_size:=queue_size\/{queue|->uxQueueLength} || queue_items_r:=queue_items_r\/{queue|-><>} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || queue_type:=queue_type\/{queue|->TQUE} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  List_Substitution(Refinement(Queue_r),queueDelete)==(queues:=queues-{queue} || queue_size:={queue}<<|queue_size || queue_items_r:={queue}<<|queue_items_r || queue_receiving:={queue}<<|queue_receiving || queue_sending:={queue}<<|queue_sending || queue_type:={queue}<<|queue_type || queue_holder:={queue}<<|queue_holder || queue_recursive:={queue}<<|queue_recursive);
  List_Substitution(Refinement(Queue_r),sendItem)==(IF pxItem/:ran(queue_items_r(pxQueue)) THEN IF copy_position = queueSEND_TO_BACK THEN queue_items_r(pxQueue):=queue_items_r(pxQueue)<-pxItem ELSE queue_items_r(pxQueue):=pxItem->queue_items_r(pxQueue) END END || queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task});
  List_Substitution(Refinement(Queue_r),insertTaskWaitingToSend)==(queue_sending(pxQueue):=queue_sending(pxQueue)\/{pxTask});
  List_Substitution(Refinement(Queue_r),insertTaskWaitingToRecived)==(queue_receiving(pxQueue):=queue_receiving(pxQueue)\/{pxTask});
  List_Substitution(Refinement(Queue_r),receivedItem)==(xItem:=first(queue_items_r(pxQueue)) || IF justPeeking = FALSE THEN queue_items_r(pxQueue):=tail(queue_items_r(pxQueue)) || queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END || IF queue_type(pxQueue) = TMUT THEN queue_holder(pxQueue):=rTask END);
  List_Substitution(Refinement(Queue_r),removeFromEventListQueue)==(ANY receiving,sending,holder WHERE receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) & holder = queue_holder|>{task} THEN queue_receiving:=queue_receiving<+receiving || queue_sending:=queue_sending<+sending || queue_holder:=queue_holder-holder || queue_items_r:=queue_items_r<+%queue.(queue: dom(holder) | [ITEM_NULL]) END);
  List_Substitution(Refinement(Queue_r),q_endScheduler)==(queues:={} || queue_receiving:={} || queue_sending:={} || queue_size:={} || queue_items_r:={} || queue_type:={} || queue_holder:={} || queue_recursive:={});
  List_Substitution(Refinement(Queue_r),createSemaphore)==(ANY queue,initialItems,initialSeq WHERE queue: QUEUE & queue/:queues & initialItems <: ITEM & initialItems/={} & initialSeq: seq(ITEM) & ran(initialSeq) = initialItems & size(initialSeq) = initialCount THEN queues:=queues\/{queue} || queue_size:=queue_size\/{queue|->maxCount} || queue_items_r:=queue_items_r\/{queue|->initialSeq} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || queue_type:=queue_type\/{queue|->TSEMAPH} || semaphore:=queue END);
  List_Substitution(Refinement(Queue_r),createMutex)==(ANY queue,initialItems,initialSeq WHERE queue: QUEUE & queue/:queues & initialItems: POW(ITEM) & initialItems/={} & initialSeq: seq(ITEM) & ran(initialSeq) = initialItems & size(initialSeq) = 1 THEN queues:=queues\/{queue} || queue_size:=queue_size\/{queue|->1} || queue_items_r:=queue_items_r\/{queue|->initialSeq} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || queue_type:=queue_type\/{queue|->TMUT} || queue_recursive:=queue_recursive\/{queue|->0} || mutex:=queue END)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(Queue_r))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(Queue_r),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(Queue_r))==(btrue);
  List_Context_Constraints(Refinement(Queue_r))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(Queue_r))==(semSEMAPHORE_QUEUE_ITEM_LENGTH,semGIVE_BLOCK_TIME,queue_is_full);
  Inherited_List_Constants(Refinement(Queue_r))==(semSEMAPHORE_QUEUE_ITEM_LENGTH,semGIVE_BLOCK_TIME);
  List_Constants(Refinement(Queue_r))==(queue_is_full)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(Queue_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Refinement(Queue_r))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Refinement(Queue_r))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Refinement(Queue_r))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Refinement(Queue_r))==(?);
  Inherited_List_Enumerated(Refinement(Queue_r))==(?);
  Inherited_List_Defered(Refinement(Queue_r))==(?);
  Inherited_List_Sets(Refinement(Queue_r))==(?);
  List_Enumerated(Refinement(Queue_r))==(?);
  List_Defered(Refinement(Queue_r))==(?);
  List_Sets(Refinement(Queue_r))==(?);
  Set_Definition(Refinement(Queue_r),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(Queue_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Queue_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(Queue_r))==(?);
  Expanded_List_HiddenConstants(Refinement(Queue_r))==(?);
  List_HiddenConstants(Refinement(Queue_r))==(?);
  External_List_HiddenConstants(Refinement(Queue_r))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(Queue_r))==(semSEMAPHORE_QUEUE_ITEM_LENGTH: NAT & semSEMAPHORE_QUEUE_ITEM_LENGTH = 0 & semGIVE_BLOCK_TIME: TICK & semGIVE_BLOCK_TIME = 0);
  Context_List_Properties(Refinement(Queue_r))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Refinement(Queue_r))==(btrue);
  List_Properties(Refinement(Queue_r))==(queue_is_full: QUEUE*(QUEUE +-> iseq(ITEM))*(QUEUE +-> NAT) --> BOOL & queue_is_full = %(queue,items,queue_size).(queue: QUEUE & items: QUEUE +-> iseq(ITEM) & queue_size: QUEUE +-> NAT | bool(queue_size(queue) = size(items(queue)))))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(Queue_r),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Refinement(Queue_r))==(?);
  Seen_Context_List_Invariant(Refinement(Queue_r))==(btrue);
  Seen_Context_List_Assertions(Refinement(Queue_r))==(btrue);
  Seen_Context_List_Properties(Refinement(Queue_r))==(btrue);
  Seen_List_Constraints(Refinement(Queue_r))==(btrue);
  Seen_List_Operations(Refinement(Queue_r),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Refinement(Queue_r),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(Queue_r),xQueueCreate)==(Var(queue) == atype(QUEUE,?,?));
  List_ANY_Var(Refinement(Queue_r),queueDelete)==(?);
  List_ANY_Var(Refinement(Queue_r),sendItem)==(?);
  List_ANY_Var(Refinement(Queue_r),insertTaskWaitingToSend)==(?);
  List_ANY_Var(Refinement(Queue_r),insertTaskWaitingToRecived)==(?);
  List_ANY_Var(Refinement(Queue_r),receivedItem)==(?);
  List_ANY_Var(Refinement(Queue_r),removeFromEventListQueue)==((Var(receiving) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))),(Var(sending) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))),(Var(holder) == SetOf(atype(QUEUE,?,?)*atype(TASK,?,?))));
  List_ANY_Var(Refinement(Queue_r),q_endScheduler)==(?);
  List_ANY_Var(Refinement(Queue_r),createSemaphore)==((Var(queue) == atype(QUEUE,?,?)),(Var(initialItems) == SetOf(atype(ITEM,?,?))),(Var(initialSeq) == SetOf(btype(INTEGER,?,?)*atype(ITEM,?,?))));
  List_ANY_Var(Refinement(Queue_r),createMutex)==((Var(queue) == atype(QUEUE,?,?)),(Var(initialItems) == SetOf(atype(ITEM,?,?))),(Var(initialSeq) == SetOf(btype(INTEGER,?,?)*atype(ITEM,?,?))));
  List_ANY_Var(Refinement(Queue_r),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(Queue_r)) == (queue_is_full | ? | queue_recursive,queue_holder,queue_type,queue_items_r,queue_size,queue_sending,queue_receiving,queues | ? | xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue,q_endScheduler,createSemaphore,createMutex | ? | seen(Machine(Types)) | ? | Queue_r);
  List_Of_HiddenCst_Ids(Refinement(Queue_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(Queue_r)) == (queue_is_full);
  List_Of_VisibleVar_Ids(Refinement(Queue_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(Queue_r)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Refinement(Queue_r)) == (Type(queue_is_full) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")*SetOf(atype(QUEUE,?,?)*SetOf(btype(INTEGER,?,?)*atype(ITEM,?,?)))*SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?))*btype(BOOL,0,1)));Type(semGIVE_BLOCK_TIME) == Cst(btype(INTEGER,?,?));Type(semSEMAPHORE_QUEUE_ITEM_LENGTH) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(Queue_r)) == (Type(queue_recursive) == Mvl(SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?)));Type(queue_holder) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(queue_type) == Mvl(SetOf(atype(QUEUE,?,?)*etype(QUEUE_TYPE,?,?)));Type(queue_items_r) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(btype(INTEGER,?,?)*atype(ITEM,?,?))));Type(queue_size) == Mvl(SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?)));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(Queue_r)) == (Type(createMutex) == Cst(atype(QUEUE,?,?),No_type);Type(createSemaphore) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(q_endScheduler) == Cst(No_type,No_type);Type(removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(receivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(BOOL,?,?)*atype(TASK,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToRecived) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*etype(COPY_POSITION,?,?));Type(queueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
