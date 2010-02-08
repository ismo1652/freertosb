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
  Local_List_Variables(Machine(Queue))==(mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues);
  List_Variables(Machine(Queue))==(mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues);
  External_List_Variables(Machine(Queue))==(mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues)
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
  List_Invariant(Machine(Queue))==(queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & semaphores: POW(QUEUE) & semaphores <: queues & mutexes: POW(QUEUE) & mutexes <: queues & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_receiving(q1) => tk/:queue_sending(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_sending(q2) => tk/:queue_receiving(q1)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_receiving(q1) => tk/:queue_receiving(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_sending(q1) => tk/:queue_sending(q2)) & mutex_holder: QUEUE +-> TASK & mutexes = dom(mutex_holder) & !mt.(mt: mutexes & queue_items(mt) = {} => mutex_holder(mt)/=TASK_NULL) & !mt.(mt: mutexes & queue_items(mt)/={} => mutex_holder(mt) = TASK_NULL) & !mt.(mt: mutexes => queue_items(mt) = {} or queue_items(mt) = {ITEM_EMPTY}))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Queue))==(btrue);
  Abstract_List_Assertions(Machine(Queue))==(btrue);
  Context_List_Assertions(Machine(Queue))==(BIT <: NATURAL);
  List_Assertions(Machine(Queue))==(!que.(que: QUEUE & que/:queues => que/:mutexes) & !mt.(mt: mutexes & queue_items(mt)/={} => queue_items(mt) = {ITEM_EMPTY}) & !mt.(mt: mutexes & queue_items(mt)/={ITEM_EMPTY} => queue_items(mt) = {}))
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Queue))==(queues,queue_items,queue_receiving,queue_sending,semaphores,mutexes,mutex_holder:={},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(Queue))==(skip);
  List_Initialisation(Machine(Queue))==(queues:={} || queue_items:={} || queue_receiving:={} || queue_sending:={} || semaphores:={} || mutexes:={} || mutex_holder:={})
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
  Internal_List_Operations(Machine(Queue))==(xQueueCreate,q_queueDelete,q_sendItem,q_sendItemMutex,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_receivedItem,q_removeFromEventListQueue,q_endScheduler,q_resumeAll,q_createSemaphore,q_createMutex);
  List_Operations(Machine(Queue))==(xQueueCreate,q_queueDelete,q_sendItem,q_sendItemMutex,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_receivedItem,q_removeFromEventListQueue,q_endScheduler,q_resumeAll,q_createSemaphore,q_createMutex)
END
&
THEORY ListInputX IS
  List_Input(Machine(Queue),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(Queue),q_queueDelete)==(pxQueue);
  List_Input(Machine(Queue),q_sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Machine(Queue),q_sendItemMutex)==(mutex,task);
  List_Input(Machine(Queue),q_insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Machine(Queue),q_insertTaskWaitingToReceive)==(pxQueue,pxTask);
  List_Input(Machine(Queue),q_receivedItem)==(pxQueue,justPeeking,task,rTask);
  List_Input(Machine(Queue),q_removeFromEventListQueue)==(task);
  List_Input(Machine(Queue),q_endScheduler)==(?);
  List_Input(Machine(Queue),q_resumeAll)==(unblocked);
  List_Input(Machine(Queue),q_createSemaphore)==(length,initialCount);
  List_Input(Machine(Queue),q_createMutex)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Queue),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(Queue),q_queueDelete)==(?);
  List_Output(Machine(Queue),q_sendItem)==(?);
  List_Output(Machine(Queue),q_sendItemMutex)==(?);
  List_Output(Machine(Queue),q_insertTaskWaitingToSend)==(?);
  List_Output(Machine(Queue),q_insertTaskWaitingToReceive)==(?);
  List_Output(Machine(Queue),q_receivedItem)==(xItem);
  List_Output(Machine(Queue),q_removeFromEventListQueue)==(?);
  List_Output(Machine(Queue),q_endScheduler)==(?);
  List_Output(Machine(Queue),q_resumeAll)==(?);
  List_Output(Machine(Queue),q_createSemaphore)==(semaph);
  List_Output(Machine(Queue),q_createMutex)==(mt)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Queue),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(Queue),q_queueDelete)==(q_queueDelete(pxQueue));
  List_Header(Machine(Queue),q_sendItem)==(q_sendItem(pxQueue,pxItem,task,copy_position));
  List_Header(Machine(Queue),q_sendItemMutex)==(q_sendItemMutex(mutex,task));
  List_Header(Machine(Queue),q_insertTaskWaitingToSend)==(q_insertTaskWaitingToSend(pxQueue,pxTask));
  List_Header(Machine(Queue),q_insertTaskWaitingToReceive)==(q_insertTaskWaitingToReceive(pxQueue,pxTask));
  List_Header(Machine(Queue),q_receivedItem)==(xItem <-- q_receivedItem(pxQueue,justPeeking,task,rTask));
  List_Header(Machine(Queue),q_removeFromEventListQueue)==(q_removeFromEventListQueue(task));
  List_Header(Machine(Queue),q_endScheduler)==(q_endScheduler);
  List_Header(Machine(Queue),q_resumeAll)==(q_resumeAll(unblocked));
  List_Header(Machine(Queue),q_createSemaphore)==(semaph <-- q_createSemaphore(length,initialCount));
  List_Header(Machine(Queue),q_createMutex)==(mt <-- q_createMutex)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Queue),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(Queue),q_queueDelete)==(pxQueue: queues);
  List_Precondition(Machine(Queue),q_sendItem)==(pxQueue: queues & pxQueue/:mutexes & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue));
  List_Precondition(Machine(Queue),q_sendItemMutex)==(mutex: mutexes & task: TASK & task: queue_receiving(mutex) & queue_items(mutex) = {});
  List_Precondition(Machine(Queue),q_insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)));
  List_Precondition(Machine(Queue),q_insertTaskWaitingToReceive)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)));
  List_Precondition(Machine(Queue),q_receivedItem)==(pxQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & rTask: TASK & rTask/=TASK_NULL);
  List_Precondition(Machine(Queue),q_removeFromEventListQueue)==(task: TASK);
  List_Precondition(Machine(Queue),q_endScheduler)==(btrue);
  List_Precondition(Machine(Queue),q_resumeAll)==(unblocked: POW(TASK));
  List_Precondition(Machine(Queue),q_createSemaphore)==(length: NAT & length>0 & initialCount: NAT & initialCount<=length);
  List_Precondition(Machine(Queue),q_createMutex)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Queue),q_createMutex)==(btrue | @mutex.(mutex: QUEUE & mutex/:queues ==> queues,mutexes,queue_items,queue_receiving,queue_sending,mutex_holder,mt:=queues\/{mutex},mutexes\/{mutex},queue_items\/{mutex|->{ITEM_EMPTY}},queue_receiving\/{mutex|->{}},queue_sending\/{mutex|->{}},mutex_holder\/{mutex|->TASK_NULL},mutex));
  Expanded_List_Substitution(Machine(Queue),q_createSemaphore)==(length: NAT & length>0 & initialCount: NAT & initialCount<=length | @(semaphore,s_items).(semaphore: QUEUE & semaphore/:queues & semaphore/:mutexes & s_items: POW(ITEM) & card(s_items) = initialCount ==> queues,semaphores,queue_items,queue_receiving,queue_sending,semaph:=queues\/{semaphore},semaphores\/{semaphore},queue_items\/{semaphore|->s_items},queue_receiving\/{semaphore|->{}},queue_sending\/{semaphore|->{}},semaphore));
  Expanded_List_Substitution(Machine(Queue),q_resumeAll)==(unblocked: POW(TASK) | queue_sending/={} ==> queue_sending:=remove_task(queue_sending,unblocked) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> queue_receiving:=remove_task(queue_receiving,unblocked) [] not(queue_receiving/={}) ==> skip));
  Expanded_List_Substitution(Machine(Queue),q_endScheduler)==(btrue | queues,queue_items,queue_receiving,queue_sending,semaphores,mutexes,mutex_holder:={},{},{},{},{},{},{});
  Expanded_List_Substitution(Machine(Queue),q_removeFromEventListQueue)==(task: TASK | @pxQueue.(pxQueue: queues & task: queue_receiving(pxQueue) ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}}) || @pxQueue.(pxQueue: queues & task: queue_sending(pxQueue) ==> queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}}));
  Expanded_List_Substitution(Machine(Queue),q_receivedItem)==(pxQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & rTask: TASK & rTask/=TASK_NULL | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = FALSE ==> (pxQueue: mutexes ==> (queue_items(pxQueue) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{pxQueue|->rTask},queue_items<+{pxQueue|->queue_items(pxQueue)-{ITEM_EMPTY}} [] not(queue_items(pxQueue) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{pxQueue|->TASK_NULL}) [] not(pxQueue: mutexes) ==> queue_items:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}} || queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}}) [] not(justPeeking = FALSE) ==> skip || xItem:=item)));
  Expanded_List_Substitution(Machine(Queue),q_insertTaskWaitingToReceive)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)) | queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(Queue),q_insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)) | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(Queue),q_sendItemMutex)==(mutex: mutexes & task: TASK & task: queue_receiving(mutex) & queue_items(mutex) = {} | queue_items,queue_receiving,mutex_holder:=queue_items<+{mutex|->(queue_items(mutex)\/{ITEM_EMPTY})},queue_receiving<+{mutex|->queue_receiving(mutex)-{task}},mutex_holder<+{mutex|->TASK_NULL});
  Expanded_List_Substitution(Machine(Queue),q_sendItem)==(pxQueue: queues & pxQueue/:mutexes & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pxItem})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}});
  Expanded_List_Substitution(Machine(Queue),q_queueDelete)==(pxQueue: queues | queues,queue_items,queue_receiving,queue_sending:=queues-{pxQueue},{pxQueue}<<|queue_items,{pxQueue}<<|queue_receiving,{pxQueue}<<|queue_sending || (pxQueue: semaphores ==> semaphores:=semaphores-{pxQueue} [] not(pxQueue: semaphores) ==> skip) || (pxQueue: mutexes ==> mutexes,mutex_holder:=mutexes-{pxQueue},{pxQueue}<<|mutex_holder [] not(pxQueue: mutexes) ==> skip));
  Expanded_List_Substitution(Machine(Queue),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @pxQueue.(pxQueue: QUEUE & pxQueue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{pxQueue},queue_items\/{pxQueue|->{}},queue_receiving\/{pxQueue|->{}},queue_sending\/{pxQueue|->{}},pxQueue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(Queue),xQueueCreate)==(CHOICE ANY pxQueue WHERE pxQueue: QUEUE & pxQueue/:queues THEN queues:=queues\/{pxQueue} || queue_items:=queue_items\/{pxQueue|->{}} || queue_receiving:=queue_receiving\/{pxQueue|->{}} || queue_sending:=queue_sending\/{pxQueue|->{}} || xQueueHandle:=pxQueue END OR xQueueHandle:=QUEUE_NULL END);
  List_Substitution(Machine(Queue),q_queueDelete)==(queues:=queues-{pxQueue} || queue_items:={pxQueue}<<|queue_items || queue_receiving:={pxQueue}<<|queue_receiving || queue_sending:={pxQueue}<<|queue_sending || IF pxQueue: semaphores THEN semaphores:=semaphores-{pxQueue} END || IF pxQueue: mutexes THEN mutexes:=mutexes-{pxQueue} || mutex_holder:={pxQueue}<<|mutex_holder END);
  List_Substitution(Machine(Queue),q_sendItem)==(queue_items(pxQueue):=queue_items(pxQueue)\/{pxItem} || queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task});
  List_Substitution(Machine(Queue),q_sendItemMutex)==(queue_items(mutex):=queue_items(mutex)\/{ITEM_EMPTY} || queue_receiving(mutex):=queue_receiving(mutex)-{task} || mutex_holder(mutex):=TASK_NULL);
  List_Substitution(Machine(Queue),q_insertTaskWaitingToSend)==(queue_sending(pxQueue):=queue_sending(pxQueue)\/{pxTask});
  List_Substitution(Machine(Queue),q_insertTaskWaitingToReceive)==(queue_receiving(pxQueue):=queue_receiving(pxQueue)\/{pxTask});
  List_Substitution(Machine(Queue),q_receivedItem)==(ANY item WHERE item: ITEM & item: queue_items(pxQueue) THEN IF justPeeking = FALSE THEN IF pxQueue: mutexes THEN IF queue_items(pxQueue) = {ITEM_EMPTY} THEN mutex_holder(pxQueue):=rTask || queue_items(pxQueue):=queue_items(pxQueue)-{ITEM_EMPTY} ELSE mutex_holder(pxQueue):=TASK_NULL END ELSE queue_items(pxQueue):=queue_items(pxQueue)-{item} END || queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END || xItem:=item END);
  List_Substitution(Machine(Queue),q_removeFromEventListQueue)==(ANY pxQueue WHERE pxQueue: queues & task: queue_receiving(pxQueue) THEN queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task} END || ANY pxQueue WHERE pxQueue: queues & task: queue_sending(pxQueue) THEN queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END);
  List_Substitution(Machine(Queue),q_endScheduler)==(queues:={} || queue_items:={} || queue_receiving:={} || queue_sending:={} || semaphores:={} || mutexes:={} || mutex_holder:={});
  List_Substitution(Machine(Queue),q_resumeAll)==(IF queue_sending/={} THEN queue_sending:=remove_task(queue_sending,unblocked) END || IF queue_receiving/={} THEN queue_receiving:=remove_task(queue_receiving,unblocked) END);
  List_Substitution(Machine(Queue),q_createSemaphore)==(ANY semaphore,s_items WHERE semaphore: QUEUE & semaphore/:queues & semaphore/:mutexes & s_items: POW(ITEM) & card(s_items) = initialCount THEN queues:=queues\/{semaphore} || semaphores:=semaphores\/{semaphore} || queue_items:=queue_items\/{semaphore|->s_items} || queue_receiving:=queue_receiving\/{semaphore|->{}} || queue_sending:=queue_sending\/{semaphore|->{}} || semaph:=semaphore END);
  List_Substitution(Machine(Queue),q_createMutex)==(ANY mutex WHERE mutex: QUEUE & mutex/:queues THEN queues:=queues\/{mutex} || mutexes:=mutexes\/{mutex} || queue_items:=queue_items\/{mutex|->{ITEM_EMPTY}} || queue_receiving:=queue_receiving\/{mutex|->{}} || queue_sending:=queue_sending\/{mutex|->{}} || mutex_holder:=mutex_holder\/{mutex|->TASK_NULL} || mt:=mutex END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Queue))==(remove_task);
  Inherited_List_Constants(Machine(Queue))==(?);
  List_Constants(Machine(Queue))==(remove_task)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Queue),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Machine(Queue))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Machine(Queue))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Machine(Queue))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Machine(Queue))==(?);
  Inherited_List_Enumerated(Machine(Queue))==(?);
  Inherited_List_Defered(Machine(Queue))==(?);
  Inherited_List_Sets(Machine(Queue))==(?);
  List_Enumerated(Machine(Queue))==(?);
  List_Defered(Machine(Queue))==(?);
  List_Sets(Machine(Queue))==(?);
  Set_Definition(Machine(Queue),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
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
  Context_List_Properties(Machine(Queue))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Machine(Queue))==(btrue);
  List_Properties(Machine(Queue))==(remove_task: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> POW(TASK)) & remove_task = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | %q1.(q1: QUEUE & q1: dom(q_task) | q_task(q1)-unblocked)))
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
  List_ANY_Var(Machine(Queue),xQueueCreate)==(Var(pxQueue) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue),q_queueDelete)==(?);
  List_ANY_Var(Machine(Queue),q_sendItem)==(?);
  List_ANY_Var(Machine(Queue),q_sendItemMutex)==(?);
  List_ANY_Var(Machine(Queue),q_insertTaskWaitingToSend)==(?);
  List_ANY_Var(Machine(Queue),q_insertTaskWaitingToReceive)==(?);
  List_ANY_Var(Machine(Queue),q_receivedItem)==(Var(item) == atype(ITEM,?,?));
  List_ANY_Var(Machine(Queue),q_removeFromEventListQueue)==(Var(pxQueue) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue),q_endScheduler)==(?);
  List_ANY_Var(Machine(Queue),q_resumeAll)==(?);
  List_ANY_Var(Machine(Queue),q_createSemaphore)==((Var(semaphore) == atype(QUEUE,?,?)),(Var(s_items) == SetOf(atype(ITEM,?,?))));
  List_ANY_Var(Machine(Queue),q_createMutex)==(Var(mutex) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Queue)) == (remove_task | ? | mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues | ? | xQueueCreate,q_queueDelete,q_sendItem,q_sendItemMutex,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_receivedItem,q_removeFromEventListQueue,q_endScheduler,q_resumeAll,q_createSemaphore,q_createMutex | ? | seen(Machine(Types)) | ? | Queue);
  List_Of_HiddenCst_Ids(Machine(Queue)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue)) == (remove_task);
  List_Of_VisibleVar_Ids(Machine(Queue)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Queue)) == (Type(remove_task) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Queue)) == (Type(mutex_holder) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(mutexes) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Queue)) == (Type(q_createMutex) == Cst(atype(QUEUE,?,?),No_type);Type(q_createSemaphore) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(q_resumeAll) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(q_endScheduler) == Cst(No_type,No_type);Type(q_removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(q_receivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(BOOL,?,?)*atype(TASK,?,?)*atype(TASK,?,?));Type(q_insertTaskWaitingToReceive) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_sendItemMutex) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*etype(COPY_POSITION,?,?));Type(q_queueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
