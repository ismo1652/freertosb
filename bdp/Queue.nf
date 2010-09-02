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
  List_Sees(Machine(Queue))==(Types,Scheduler)
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
  Local_List_Variables(Machine(Queue))==(mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues);
  List_Variables(Machine(Queue))==(mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues);
  External_List_Variables(Machine(Queue))==(mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues)
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
  Context_List_Invariant(Machine(Queue))==(schedulerRunning: BOOL & schedulerSuspended: NATURAL);
  List_Invariant(Machine(Queue))==(queues: POW(QUEUE) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_receiving) & queues = dom(queue_sending) & queues_msg <: queues & queues_msg_full <: queues_msg & queues_msg_empty <: queues_msg & queues_msg_full/\queues_msg_empty = {} & queue_items: QUEUE +-> POW(ITEM) & queues_msg = dom(queue_items) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_receiving(q1) => tk/:queue_sending(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_sending(q2) => tk/:queue_receiving(q1)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_receiving(q1) => tk/:queue_receiving(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_sending(q1) => tk/:queue_sending(q2)) & semaphores: POW(QUEUE) & semaphores <: queues & semaphores_busy <: semaphores & mutexes <: queues & mutex_holder: QUEUE +-> TASK & mutexes = dom(mutex_holder) & mutexes_busy <: mutexes & !mt.(mt: mutexes_busy => mutex_holder(mt)/=TASK_NULL) & !mt.(mt: mutexes & mt/:mutexes_busy => mutex_holder(mt) = TASK_NULL) & queues_msg/\semaphores = {} & queues_msg/\mutexes = {} & mutexes/\semaphores = {})
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Queue))==(btrue);
  Abstract_List_Assertions(Machine(Queue))==(btrue);
  Context_List_Assertions(Machine(Queue))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  List_Assertions(Machine(Queue))==(!que.(que: QUEUE & que/:queues => que/:mutexes) & !que.(que: QUEUE & que/:queues => que/:semaphores) & !que.(que: queues_msg & que: queues_msg_full => que/:queues_msg_empty) & !que.(que: queues_msg & que: queues_msg_empty => que/:queues_msg_full))
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Queue))==(queues,queues_msg,queue_items,queue_receiving,queue_sending,semaphores,semaphores_busy,mutexes,mutexes_busy,mutex_holder,queues_msg_full,queues_msg_empty:={},{},{},{},{},{},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(Queue))==(skip);
  List_Initialisation(Machine(Queue))==(queues:={} || queues_msg:={} || queue_items:={} || queue_receiving:={} || queue_sending:={} || semaphores:={} || semaphores_busy:={} || mutexes:={} || mutexes_busy:={} || mutex_holder:={} || queues_msg_full:={} || queues_msg_empty:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Queue))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Queue),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(Queue),Machine(Scheduler))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Queue))==(btrue);
  List_Constraints(Machine(Queue))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Queue))==(q_queueCreate,q_queueDelete,q_sendItem,q_receivedItem,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_removeFromEventListQueue,q_createSemaphore,q_deleteSemaphore,q_takeSemaphore,q_giveSemaphore,q_createMutex,q_takeMutex,q_giveMutex,q_endScheduler,q_resumeAll);
  List_Operations(Machine(Queue))==(q_queueCreate,q_queueDelete,q_sendItem,q_receivedItem,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_removeFromEventListQueue,q_createSemaphore,q_deleteSemaphore,q_takeSemaphore,q_giveSemaphore,q_createMutex,q_takeMutex,q_giveMutex,q_endScheduler,q_resumeAll)
END
&
THEORY ListInputX IS
  List_Input(Machine(Queue),q_queueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(Queue),q_queueDelete)==(pxQueue);
  List_Input(Machine(Queue),q_sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Machine(Queue),q_receivedItem)==(pxQueue,justPeeking,task);
  List_Input(Machine(Queue),q_insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Machine(Queue),q_insertTaskWaitingToReceive)==(pxQueue,pxTask);
  List_Input(Machine(Queue),q_removeFromEventListQueue)==(task);
  List_Input(Machine(Queue),q_createSemaphore)==(maxCount,initialCount);
  List_Input(Machine(Queue),q_deleteSemaphore)==(semaphore);
  List_Input(Machine(Queue),q_takeSemaphore)==(semaphore,pxTask);
  List_Input(Machine(Queue),q_giveSemaphore)==(semaphore,pxTask);
  List_Input(Machine(Queue),q_createMutex)==(?);
  List_Input(Machine(Queue),q_takeMutex)==(mutex,task);
  List_Input(Machine(Queue),q_giveMutex)==(mutex,pxTask);
  List_Input(Machine(Queue),q_endScheduler)==(?);
  List_Input(Machine(Queue),q_resumeAll)==(unblocked)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Queue),q_queueCreate)==(xQueueHandle);
  List_Output(Machine(Queue),q_queueDelete)==(?);
  List_Output(Machine(Queue),q_sendItem)==(?);
  List_Output(Machine(Queue),q_receivedItem)==(xItem);
  List_Output(Machine(Queue),q_insertTaskWaitingToSend)==(?);
  List_Output(Machine(Queue),q_insertTaskWaitingToReceive)==(?);
  List_Output(Machine(Queue),q_removeFromEventListQueue)==(?);
  List_Output(Machine(Queue),q_createSemaphore)==(rSemaphore);
  List_Output(Machine(Queue),q_deleteSemaphore)==(?);
  List_Output(Machine(Queue),q_takeSemaphore)==(?);
  List_Output(Machine(Queue),q_giveSemaphore)==(?);
  List_Output(Machine(Queue),q_createMutex)==(rMutex);
  List_Output(Machine(Queue),q_takeMutex)==(?);
  List_Output(Machine(Queue),q_giveMutex)==(?);
  List_Output(Machine(Queue),q_endScheduler)==(?);
  List_Output(Machine(Queue),q_resumeAll)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Queue),q_queueCreate)==(xQueueHandle <-- q_queueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(Queue),q_queueDelete)==(q_queueDelete(pxQueue));
  List_Header(Machine(Queue),q_sendItem)==(q_sendItem(pxQueue,pxItem,task,copy_position));
  List_Header(Machine(Queue),q_receivedItem)==(xItem <-- q_receivedItem(pxQueue,justPeeking,task));
  List_Header(Machine(Queue),q_insertTaskWaitingToSend)==(q_insertTaskWaitingToSend(pxQueue,pxTask));
  List_Header(Machine(Queue),q_insertTaskWaitingToReceive)==(q_insertTaskWaitingToReceive(pxQueue,pxTask));
  List_Header(Machine(Queue),q_removeFromEventListQueue)==(q_removeFromEventListQueue(task));
  List_Header(Machine(Queue),q_createSemaphore)==(rSemaphore <-- q_createSemaphore(maxCount,initialCount));
  List_Header(Machine(Queue),q_deleteSemaphore)==(q_deleteSemaphore(semaphore));
  List_Header(Machine(Queue),q_takeSemaphore)==(q_takeSemaphore(semaphore,pxTask));
  List_Header(Machine(Queue),q_giveSemaphore)==(q_giveSemaphore(semaphore,pxTask));
  List_Header(Machine(Queue),q_createMutex)==(rMutex <-- q_createMutex);
  List_Header(Machine(Queue),q_takeMutex)==(q_takeMutex(mutex,task));
  List_Header(Machine(Queue),q_giveMutex)==(q_giveMutex(mutex,pxTask));
  List_Header(Machine(Queue),q_endScheduler)==(q_endScheduler);
  List_Header(Machine(Queue),q_resumeAll)==(q_resumeAll(unblocked))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Queue),q_queueCreate)==(uxQueueLength: QUEUE_LENGTH & uxItemSize: QUEUE_LENGTH & uxQueueLength>0);
  List_Precondition(Machine(Queue),q_queueDelete)==(pxQueue: queues & pxQueue/:semaphores & pxQueue/:mutexes & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {});
  List_Precondition(Machine(Queue),q_sendItem)==(pxQueue: queues_msg & pxItem: ITEM & pxItem/:queue_items(pxQueue) & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & pxQueue/:queues_msg_full);
  List_Precondition(Machine(Queue),q_receivedItem)==(pxQueue: queues_msg & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & pxQueue/:queues_msg_empty);
  List_Precondition(Machine(Queue),q_insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)));
  List_Precondition(Machine(Queue),q_insertTaskWaitingToReceive)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)));
  List_Precondition(Machine(Queue),q_removeFromEventListQueue)==(task: TASK);
  List_Precondition(Machine(Queue),q_createSemaphore)==(maxCount: QUEUE_LENGTH & initialCount: QUEUE_QUANT & initialCount<=maxCount);
  List_Precondition(Machine(Queue),q_deleteSemaphore)==(semaphore: semaphores);
  List_Precondition(Machine(Queue),q_takeSemaphore)==(semaphore: semaphores & semaphore/:semaphores_busy & pxTask: TASK & pxTask: queue_sending(semaphore));
  List_Precondition(Machine(Queue),q_giveSemaphore)==(semaphore: semaphores & pxTask: TASK & pxTask: queue_receiving(semaphore));
  List_Precondition(Machine(Queue),q_createMutex)==(btrue);
  List_Precondition(Machine(Queue),q_takeMutex)==(mutex: mutexes & mutex/:mutexes_busy & task: TASK & task/=TASK_NULL);
  List_Precondition(Machine(Queue),q_giveMutex)==(mutex: mutexes & mutex: mutexes_busy & pxTask: TASK);
  List_Precondition(Machine(Queue),q_endScheduler)==(btrue);
  List_Precondition(Machine(Queue),q_resumeAll)==(unblocked: POW(TASK))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Queue),q_resumeAll)==(unblocked: POW(TASK) | queue_sending/={} ==> queue_sending:=remove_task(queue_sending,unblocked) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> queue_receiving:=remove_task(queue_receiving,unblocked) [] not(queue_receiving/={}) ==> skip));
  Expanded_List_Substitution(Machine(Queue),q_endScheduler)==(btrue | queues,queues_msg,queues_msg_empty,queues_msg_full,queue_items,queue_receiving,queue_sending,semaphores,semaphores_busy,mutexes,mutexes_busy,mutex_holder:={},{},{},{},{},{},{},{},{},{},{},{});
  Expanded_List_Substitution(Machine(Queue),q_giveMutex)==(mutex: mutexes & mutex: mutexes_busy & pxTask: TASK | mutexes_busy,mutex_holder,queue_receiving:=mutexes_busy-{mutex},mutex_holder<+{mutex|->TASK_NULL},queue_receiving<+{mutex|->queue_receiving(mutex)-{pxTask}});
  Expanded_List_Substitution(Machine(Queue),q_takeMutex)==(mutex: mutexes & mutex/:mutexes_busy & task: TASK & task/=TASK_NULL | mutexes_busy,mutex_holder:=mutexes_busy\/{mutex},mutex_holder<+{mutex|->task});
  Expanded_List_Substitution(Machine(Queue),q_createMutex)==(btrue | @mutex.(mutex: QUEUE & mutex/:queues ==> queues,mutexes,queue_receiving,queue_sending,mutex_holder,rMutex:=queues\/{mutex},mutexes\/{mutex},queue_receiving\/{mutex|->{}},queue_sending\/{mutex|->{}},mutex_holder\/{mutex|->TASK_NULL},mutex));
  Expanded_List_Substitution(Machine(Queue),q_giveSemaphore)==(semaphore: semaphores & pxTask: TASK & pxTask: queue_receiving(semaphore) | semaphore: semaphores_busy ==> semaphores_busy:=semaphores_busy-{semaphore} [] not(semaphore: semaphores_busy) ==> skip || queue_receiving:=queue_receiving<+{semaphore|->queue_receiving(semaphore)-{pxTask}} [] skip);
  Expanded_List_Substitution(Machine(Queue),q_takeSemaphore)==(semaphore: semaphores & semaphore/:semaphores_busy & pxTask: TASK & pxTask: queue_sending(semaphore) | semaphores_busy:=semaphores_busy\/{semaphore} [] skip || queue_sending:=queue_sending<+{semaphore|->queue_sending(semaphore)-{pxTask}});
  Expanded_List_Substitution(Machine(Queue),q_deleteSemaphore)==(semaphore: semaphores | queues,semaphores,queue_receiving,queue_sending:=queues-{semaphore},semaphores-{semaphore},{semaphore}<<|queue_receiving,{semaphore}<<|queue_sending || (semaphore: semaphores_busy ==> semaphores_busy:=semaphores_busy-{semaphore} [] not(semaphore: semaphores_busy) ==> skip));
  Expanded_List_Substitution(Machine(Queue),q_createSemaphore)==(maxCount: QUEUE_LENGTH & initialCount: QUEUE_QUANT & initialCount<=maxCount | @semaphore.(semaphore: QUEUE & semaphore/:queues ==> (queues,queue_receiving,queue_sending,semaphores:=queues\/{semaphore},queue_receiving\/{semaphore|->{}},queue_sending\/{semaphore|->{}},semaphores\/{semaphore} || (semaphores_busy:=semaphores_busy\/{semaphore} [] skip) || rSemaphore:=semaphore)));
  Expanded_List_Substitution(Machine(Queue),q_removeFromEventListQueue)==(task: TASK | @pxQueue.(pxQueue: queues & task: queue_receiving(pxQueue) ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}}) || @pxQueue.(pxQueue: queues & task: queue_sending(pxQueue) ==> queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}}));
  Expanded_List_Substitution(Machine(Queue),q_insertTaskWaitingToReceive)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)) | queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(Queue),q_insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)) | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(Queue),q_receivedItem)==(pxQueue: queues_msg & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & pxQueue/:queues_msg_empty | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = FALSE ==> (queue_items,queue_sending:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}},queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}} || (pxQueue: queues_msg_full ==> queues_msg_full:=queues_msg_full-{pxQueue} [] not(pxQueue: queues_msg_full) ==> skip) || (queues_msg_empty:=queues_msg_empty\/{pxQueue} [] skip)) [] not(justPeeking = FALSE) ==> skip || xItem:=item)));
  Expanded_List_Substitution(Machine(Queue),q_sendItem)==(pxQueue: queues_msg & pxItem: ITEM & pxItem/:queue_items(pxQueue) & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & pxQueue/:queues_msg_full | queue_items:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pxItem})} || (copy_position = queueSEND_TO_BACK ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}} [] not(copy_position = queueSEND_TO_BACK) ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}}) || (pxQueue: queues_msg_empty ==> queues_msg_empty:=queues_msg_empty-{pxQueue} [] not(pxQueue: queues_msg_empty) ==> skip) || (queues_msg_full:=queues_msg_full\/{pxQueue} [] skip));
  Expanded_List_Substitution(Machine(Queue),q_queueDelete)==(pxQueue: queues & pxQueue/:semaphores & pxQueue/:mutexes & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {} | queues,queues_msg,queue_items,queue_receiving,queue_sending:=queues-{pxQueue},queues_msg-{pxQueue},{pxQueue}<<|queue_items,{pxQueue}<<|queue_receiving,{pxQueue}<<|queue_sending || (pxQueue: queues_msg_full ==> queues_msg_full:=queues_msg_full-{pxQueue} [] not(pxQueue: queues_msg_full) ==> skip) || (pxQueue: queues_msg_empty ==> queues_msg_empty:=queues_msg_empty-{pxQueue} [] not(pxQueue: queues_msg_empty) ==> skip));
  Expanded_List_Substitution(Machine(Queue),q_queueCreate)==(uxQueueLength: QUEUE_LENGTH & uxItemSize: QUEUE_LENGTH & uxQueueLength>0 | @pxQueue.(pxQueue: QUEUE & pxQueue/:queues ==> queues,queues_msg,queue_items,queue_receiving,queue_sending,queues_msg_empty,xQueueHandle:=queues\/{pxQueue},queues_msg\/{pxQueue},queue_items\/{pxQueue|->{}},queue_receiving\/{pxQueue|->{}},queue_sending\/{pxQueue|->{}},queues_msg_empty\/{pxQueue},pxQueue));
  List_Substitution(Machine(Queue),q_queueCreate)==(ANY pxQueue WHERE pxQueue: QUEUE & pxQueue/:queues THEN queues:=queues\/{pxQueue} || queues_msg:=queues_msg\/{pxQueue} || queue_items:=queue_items\/{pxQueue|->{}} || queue_receiving:=queue_receiving\/{pxQueue|->{}} || queue_sending:=queue_sending\/{pxQueue|->{}} || queues_msg_empty:=queues_msg_empty\/{pxQueue} || xQueueHandle:=pxQueue END);
  List_Substitution(Machine(Queue),q_queueDelete)==(queues:=queues-{pxQueue} || queues_msg:=queues_msg-{pxQueue} || queue_items:={pxQueue}<<|queue_items || queue_receiving:={pxQueue}<<|queue_receiving || queue_sending:={pxQueue}<<|queue_sending || IF pxQueue: queues_msg_full THEN queues_msg_full:=queues_msg_full-{pxQueue} END || IF pxQueue: queues_msg_empty THEN queues_msg_empty:=queues_msg_empty-{pxQueue} END);
  List_Substitution(Machine(Queue),q_sendItem)==(queue_items(pxQueue):=queue_items(pxQueue)\/{pxItem} || IF copy_position = queueSEND_TO_BACK THEN queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task} ELSE queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task} END || IF pxQueue: queues_msg_empty THEN queues_msg_empty:=queues_msg_empty-{pxQueue} END || CHOICE queues_msg_full:=queues_msg_full\/{pxQueue} OR skip END);
  List_Substitution(Machine(Queue),q_receivedItem)==(ANY item WHERE item: ITEM & item: queue_items(pxQueue) THEN IF justPeeking = FALSE THEN queue_items(pxQueue):=queue_items(pxQueue)-{item} || queue_sending(pxQueue):=queue_sending(pxQueue)-{task} || IF pxQueue: queues_msg_full THEN queues_msg_full:=queues_msg_full-{pxQueue} END || CHOICE queues_msg_empty:=queues_msg_empty\/{pxQueue} OR skip END END || xItem:=item END);
  List_Substitution(Machine(Queue),q_insertTaskWaitingToSend)==(queue_sending(pxQueue):=queue_sending(pxQueue)\/{pxTask});
  List_Substitution(Machine(Queue),q_insertTaskWaitingToReceive)==(queue_receiving(pxQueue):=queue_receiving(pxQueue)\/{pxTask});
  List_Substitution(Machine(Queue),q_removeFromEventListQueue)==(ANY pxQueue WHERE pxQueue: queues & task: queue_receiving(pxQueue) THEN queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task} END || ANY pxQueue WHERE pxQueue: queues & task: queue_sending(pxQueue) THEN queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END);
  List_Substitution(Machine(Queue),q_createSemaphore)==(ANY semaphore WHERE semaphore: QUEUE & semaphore/:queues THEN queues:=queues\/{semaphore} || queue_receiving:=queue_receiving\/{semaphore|->{}} || queue_sending:=queue_sending\/{semaphore|->{}} || semaphores:=semaphores\/{semaphore} || CHOICE semaphores_busy:=semaphores_busy\/{semaphore} OR skip END || rSemaphore:=semaphore END);
  List_Substitution(Machine(Queue),q_deleteSemaphore)==(queues:=queues-{semaphore} || semaphores:=semaphores-{semaphore} || queue_receiving:={semaphore}<<|queue_receiving || queue_sending:={semaphore}<<|queue_sending || IF semaphore: semaphores_busy THEN semaphores_busy:=semaphores_busy-{semaphore} END);
  List_Substitution(Machine(Queue),q_takeSemaphore)==(CHOICE semaphores_busy:=semaphores_busy\/{semaphore} OR skip END || queue_sending(semaphore):=queue_sending(semaphore)-{pxTask});
  List_Substitution(Machine(Queue),q_giveSemaphore)==(CHOICE IF semaphore: semaphores_busy THEN semaphores_busy:=semaphores_busy-{semaphore} END || queue_receiving(semaphore):=queue_receiving(semaphore)-{pxTask} OR skip END);
  List_Substitution(Machine(Queue),q_createMutex)==(ANY mutex WHERE mutex: QUEUE & mutex/:queues THEN queues:=queues\/{mutex} || mutexes:=mutexes\/{mutex} || queue_receiving:=queue_receiving\/{mutex|->{}} || queue_sending:=queue_sending\/{mutex|->{}} || mutex_holder:=mutex_holder\/{mutex|->TASK_NULL} || rMutex:=mutex END);
  List_Substitution(Machine(Queue),q_takeMutex)==(mutexes_busy:=mutexes_busy\/{mutex} || mutex_holder(mutex):=task);
  List_Substitution(Machine(Queue),q_giveMutex)==(mutexes_busy:=mutexes_busy-{mutex} || mutex_holder(mutex):=TASK_NULL || queue_receiving(mutex):=queue_receiving(mutex)-{pxTask});
  List_Substitution(Machine(Queue),q_endScheduler)==(queues:={} || queues_msg:={} || queues_msg_empty:={} || queues_msg_full:={} || queue_items:={} || queue_receiving:={} || queue_sending:={} || semaphores:={} || semaphores_busy:={} || mutexes:={} || mutexes_busy:={} || mutex_holder:={});
  List_Substitution(Machine(Queue),q_resumeAll)==(IF queue_sending/={} THEN queue_sending:=remove_task(queue_sending,unblocked) END || IF queue_receiving/={} THEN queue_receiving:=remove_task(queue_receiving,unblocked) END)
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
  Context_List_Properties(Machine(Queue))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Machine(Queue))==(btrue);
  List_Properties(Machine(Queue))==(remove_task: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> POW(TASK)) & remove_task = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | %q1.(q1: QUEUE & q1: dom(q_task) | q_task(q1)-unblocked)))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Queue),Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  Seen_Context_List_Enumerated(Machine(Queue))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Machine(Queue))==(btrue);
  Seen_Context_List_Assertions(Machine(Queue))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  Seen_Context_List_Properties(Machine(Queue))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Machine(Queue))==(btrue);
  Seen_List_Precondition(Machine(Queue),resumeScheduler)==(schedulerSuspended>0);
  Seen_Expanded_List_Substitution(Machine(Queue),resumeScheduler)==(schedulerSuspended:=schedulerSuspended-1);
  Seen_List_Precondition(Machine(Queue),suspendScheduler)==(schedulerSuspended<MAXINT);
  Seen_Expanded_List_Substitution(Machine(Queue),suspendScheduler)==(schedulerSuspended:=schedulerSuspended+1);
  Seen_List_Precondition(Machine(Queue),stopScheduler)==(schedulerRunning = TRUE);
  Seen_Expanded_List_Substitution(Machine(Queue),stopScheduler)==(schedulerRunning:=FALSE);
  Seen_List_Precondition(Machine(Queue),startScheduler)==(schedulerRunning = FALSE);
  Seen_Expanded_List_Substitution(Machine(Queue),startScheduler)==(schedulerRunning:=TRUE);
  Seen_List_Operations(Machine(Queue),Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  Seen_Expanded_List_Invariant(Machine(Queue),Machine(Scheduler))==(btrue);
  Set_Definition(Machine(Queue),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Machine(Queue),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(Queue),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(Queue),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Seen_Internal_List_Operations(Machine(Queue),Machine(Types))==(?);
  Seen_List_Operations(Machine(Queue),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Queue),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Queue),q_queueCreate)==(Var(pxQueue) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue),q_queueDelete)==(?);
  List_ANY_Var(Machine(Queue),q_sendItem)==(?);
  List_ANY_Var(Machine(Queue),q_receivedItem)==(Var(item) == atype(ITEM,?,?));
  List_ANY_Var(Machine(Queue),q_insertTaskWaitingToSend)==(?);
  List_ANY_Var(Machine(Queue),q_insertTaskWaitingToReceive)==(?);
  List_ANY_Var(Machine(Queue),q_removeFromEventListQueue)==(Var(pxQueue) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue),q_createSemaphore)==(Var(semaphore) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue),q_deleteSemaphore)==(?);
  List_ANY_Var(Machine(Queue),q_takeSemaphore)==(?);
  List_ANY_Var(Machine(Queue),q_giveSemaphore)==(?);
  List_ANY_Var(Machine(Queue),q_createMutex)==(Var(mutex) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue),q_takeMutex)==(?);
  List_ANY_Var(Machine(Queue),q_giveMutex)==(?);
  List_ANY_Var(Machine(Queue),q_endScheduler)==(?);
  List_ANY_Var(Machine(Queue),q_resumeAll)==(?);
  List_ANY_Var(Machine(Queue),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Queue)) == (remove_task | ? | mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues | ? | q_queueCreate,q_queueDelete,q_sendItem,q_receivedItem,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_removeFromEventListQueue,q_createSemaphore,q_deleteSemaphore,q_takeSemaphore,q_giveSemaphore,q_createMutex,q_takeMutex,q_giveMutex,q_endScheduler,q_resumeAll | ? | seen(Machine(Types)),seen(Machine(Scheduler)) | ? | Queue);
  List_Of_HiddenCst_Ids(Machine(Queue)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue)) == (remove_task);
  List_Of_VisibleVar_Ids(Machine(Queue)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue)) == (?: ?);
  List_Of_Ids(Machine(Scheduler)) == (? | ? | schedulerSuspended,schedulerRunning | ? | startScheduler,stopScheduler,suspendScheduler,resumeScheduler | ? | seen(Machine(Types)) | ? | Scheduler);
  List_Of_HiddenCst_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Scheduler)) == (?);
  List_Of_VisibleVar_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Scheduler)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Queue)) == (Type(remove_task) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Queue)) == (Type(mutex_holder) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(mutexes_busy) == Mvl(SetOf(atype(QUEUE,?,?)));Type(mutexes) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores_busy) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg_empty) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg_full) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Queue)) == (Type(q_resumeAll) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(q_endScheduler) == Cst(No_type,No_type);Type(q_giveMutex) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_takeMutex) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_createMutex) == Cst(atype(QUEUE,?,?),No_type);Type(q_giveSemaphore) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_takeSemaphore) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_deleteSemaphore) == Cst(No_type,atype(QUEUE,?,?));Type(q_createSemaphore) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(q_removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(q_insertTaskWaitingToReceive) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_receivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(BOOL,?,?)*atype(TASK,?,?));Type(q_sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*etype(COPY_POSITION,?,?));Type(q_queueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(q_queueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
