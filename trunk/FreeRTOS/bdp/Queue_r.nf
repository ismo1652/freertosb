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
  List_Sees(Refinement(Queue_r))==(Types,Scheduler)
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
  Abstract_List_Variables(Refinement(Queue_r))==(mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues);
  Local_List_Variables(Refinement(Queue_r))==(queue_quant,queue_items_r,queue_size,mutex_holder,queue_sending,queue_receiving,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_full,queues_msg_empty,queues_msg,queues);
  List_Variables(Refinement(Queue_r))==(queue_quant,queue_items_r,queue_size,mutex_holder,queue_sending,queue_receiving,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_full,queues_msg_empty,queues_msg,queues);
  External_List_Variables(Refinement(Queue_r))==(queue_quant,queue_items_r,queue_size,mutex_holder,queue_sending,queue_receiving,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_full,queues_msg_empty,queues_msg,queues)
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
  List_Of_New_Variables(Refinement(Queue_r))==(queue_quant,queue_items_r,queue_size)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(Queue_r))==(btrue);
  Expanded_List_Invariant(Refinement(Queue_r))==(btrue);
  Abstract_List_Invariant(Refinement(Queue_r))==(queues: POW(QUEUE) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_receiving) & queues = dom(queue_sending) & queues_msg <: queues & queues_msg_full <: queues_msg & queues_msg_empty <: queues_msg & queues_msg_full/\queues_msg_empty = {} & queue_items: QUEUE +-> POW(ITEM) & queues_msg = dom(queue_items) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_receiving(q1) => tk/:queue_sending(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_sending(q2) => tk/:queue_receiving(q1)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_receiving(q1) => tk/:queue_receiving(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_sending(q1) => tk/:queue_sending(q2)) & semaphores: POW(QUEUE) & semaphores <: queues & semaphores_busy <: semaphores & mutexes <: queues & mutex_holder: QUEUE +-> TASK & mutexes = dom(mutex_holder) & mutexes_busy <: mutexes & !mt.(mt: mutexes_busy => mutex_holder(mt)/=TASK_NULL) & !mt.(mt: mutexes & mt/:mutexes_busy => mutex_holder(mt) = TASK_NULL) & queues_msg/\semaphores = {} & queues_msg/\mutexes = {} & mutexes/\semaphores = {});
  Context_List_Invariant(Refinement(Queue_r))==(schedulerRunning: BOOL & schedulerSuspended: NATURAL);
  List_Invariant(Refinement(Queue_r))==(queue_size: QUEUE +-> QUEUE_LENGTH & queue_quant: QUEUE +-> QUEUE_QUANT & queue_items_r: QUEUE +-> iseq(ITEM) & dom(queue_size) = queues & dom(queue_quant) = queues & dom(queue_items_r) = dom(queue_items) & !queue.(queue: queues => queue_quant(queue)<=queue_size(queue)) & !queue.(queue: queues_msg => ran(queue_items_r(queue)) = queue_items(queue) & size(queue_items_r(queue)) = queue_quant(queue)) & !queue.(queue: queues_msg_empty => queue_quant(queue) = 0) & !queue.(queue: queues_msg_full => queue_quant(queue) = queue_size(queue)) & !queue.(queue: queues_msg & queue_quant(queue) = queue_size(queue) => queue: queues_msg_full) & !queue.(queue: queues_msg & queue_quant(queue) = queue_size(queue) => queue: queues_msg_full) & !queue.(queue: queues_msg & queue_quant(queue) = 0 => queue: queues_msg_empty) & !queue.(queue: queues_msg & queue/:queues_msg_full => queue_quant(queue)<queue_size(queue)) & !queue.(queue: queues_msg & queue/:queues_msg_empty => queue_quant(queue)>0) & !queue.(queue: queues_msg & queue_quant(queue)>0 => queue/:queues_msg_empty) & !queue.(queue: queues_msg & queue_quant(queue)<queue_size(queue) => queue/:queues_msg_full) & !semaphore.(semaphore: semaphores_busy => queue_quant(semaphore) = 0) & !semaphore.(semaphore: semaphores & queue_quant(semaphore) = 0 => semaphore: semaphores_busy) & !semaphore.(semaphore: semaphores & semaphore/:semaphores_busy => queue_quant(semaphore)/=0) & !semaphore.(semaphore: semaphores & queue_quant(semaphore)/=0 => semaphore/:semaphores_busy) & !mutex.(mutex: mutexes => queue_size(mutex) = 1) & !mutex.(mutex: mutexes_busy => queue_quant(mutex) = 0) & !mutex.(mutex: mutexes & queue_quant(mutex) = 0 => mutex: mutexes_busy) & !mutex.(mutex: mutexes & mutex/:mutexes_busy => queue_quant(mutex) = 1) & !mutex.(mutex: mutexes & queue_quant(mutex) = 1 => mutex/:mutexes_busy))
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(Queue_r))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(Queue_r))==(btrue);
  Abstract_List_Assertions(Refinement(Queue_r))==(!que.(que: QUEUE & que/:queues => que/:mutexes) & !que.(que: QUEUE & que/:queues => que/:semaphores) & !que.(que: queues_msg & que: queues_msg_full => que/:queues_msg_empty) & !que.(que: queues_msg & que: queues_msg_empty => que/:queues_msg_full));
  Context_List_Assertions(Refinement(Queue_r))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  List_Assertions(Refinement(Queue_r))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(Queue_r))==(queues,queues_msg,queue_receiving,queue_sending,semaphores,semaphores_busy,mutexes,mutexes_busy,mutex_holder,queue_size,queue_items_r,queue_quant,queues_msg_empty,queues_msg_full:={},{},{},{},{},{},{},{},{},{},{},{},{},{});
  Context_List_Initialisation(Refinement(Queue_r))==(skip);
  List_Initialisation(Refinement(Queue_r))==(queues:={} || queues_msg:={} || queue_receiving:={} || queue_sending:={} || semaphores:={} || semaphores_busy:={} || mutexes:={} || mutexes_busy:={} || mutex_holder:={} || queue_size:={} || queue_items_r:={} || queue_quant:={} || queues_msg_empty:={} || queues_msg_full:={})
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(Queue_r))==(q_queueCreate,q_queueDelete,q_sendItem,q_receivedItem,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_removeFromEventListQueue,q_createSemaphore,q_deleteSemaphore,q_takeSemaphore,q_giveSemaphore,q_createMutex,q_takeMutex,q_giveMutex,q_endScheduler,q_resumeAll);
  List_Operations(Refinement(Queue_r))==(q_queueCreate,q_queueDelete,q_sendItem,q_receivedItem,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_removeFromEventListQueue,q_createSemaphore,q_deleteSemaphore,q_takeSemaphore,q_giveSemaphore,q_createMutex,q_takeMutex,q_giveMutex,q_endScheduler,q_resumeAll)
END
&
THEORY ListInputX IS
  List_Input(Refinement(Queue_r),q_queueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Refinement(Queue_r),q_queueDelete)==(pxQueue);
  List_Input(Refinement(Queue_r),q_sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Refinement(Queue_r),q_receivedItem)==(pxQueue,justPeeking,task);
  List_Input(Refinement(Queue_r),q_insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Refinement(Queue_r),q_insertTaskWaitingToReceive)==(pxQueue,pxTask);
  List_Input(Refinement(Queue_r),q_removeFromEventListQueue)==(task);
  List_Input(Refinement(Queue_r),q_createSemaphore)==(maxCount,initialCount);
  List_Input(Refinement(Queue_r),q_deleteSemaphore)==(semaphore);
  List_Input(Refinement(Queue_r),q_takeSemaphore)==(semaphore,pxTask);
  List_Input(Refinement(Queue_r),q_giveSemaphore)==(semaphore,pxTask);
  List_Input(Refinement(Queue_r),q_createMutex)==(?);
  List_Input(Refinement(Queue_r),q_takeMutex)==(mutex,task);
  List_Input(Refinement(Queue_r),q_giveMutex)==(mutex,pxTask);
  List_Input(Refinement(Queue_r),q_endScheduler)==(?);
  List_Input(Refinement(Queue_r),q_resumeAll)==(unblocked)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(Queue_r),q_queueCreate)==(xQueueHandle);
  List_Output(Refinement(Queue_r),q_queueDelete)==(?);
  List_Output(Refinement(Queue_r),q_sendItem)==(?);
  List_Output(Refinement(Queue_r),q_receivedItem)==(xItem);
  List_Output(Refinement(Queue_r),q_insertTaskWaitingToSend)==(?);
  List_Output(Refinement(Queue_r),q_insertTaskWaitingToReceive)==(?);
  List_Output(Refinement(Queue_r),q_removeFromEventListQueue)==(?);
  List_Output(Refinement(Queue_r),q_createSemaphore)==(rSemaphore);
  List_Output(Refinement(Queue_r),q_deleteSemaphore)==(?);
  List_Output(Refinement(Queue_r),q_takeSemaphore)==(?);
  List_Output(Refinement(Queue_r),q_giveSemaphore)==(?);
  List_Output(Refinement(Queue_r),q_createMutex)==(rMutex);
  List_Output(Refinement(Queue_r),q_takeMutex)==(?);
  List_Output(Refinement(Queue_r),q_giveMutex)==(?);
  List_Output(Refinement(Queue_r),q_endScheduler)==(?);
  List_Output(Refinement(Queue_r),q_resumeAll)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(Queue_r),q_queueCreate)==(xQueueHandle <-- q_queueCreate(uxQueueLength,uxItemSize));
  List_Header(Refinement(Queue_r),q_queueDelete)==(q_queueDelete(pxQueue));
  List_Header(Refinement(Queue_r),q_sendItem)==(q_sendItem(pxQueue,pxItem,task,copy_position));
  List_Header(Refinement(Queue_r),q_receivedItem)==(xItem <-- q_receivedItem(pxQueue,justPeeking,task));
  List_Header(Refinement(Queue_r),q_insertTaskWaitingToSend)==(q_insertTaskWaitingToSend(pxQueue,pxTask));
  List_Header(Refinement(Queue_r),q_insertTaskWaitingToReceive)==(q_insertTaskWaitingToReceive(pxQueue,pxTask));
  List_Header(Refinement(Queue_r),q_removeFromEventListQueue)==(q_removeFromEventListQueue(task));
  List_Header(Refinement(Queue_r),q_createSemaphore)==(rSemaphore <-- q_createSemaphore(maxCount,initialCount));
  List_Header(Refinement(Queue_r),q_deleteSemaphore)==(q_deleteSemaphore(semaphore));
  List_Header(Refinement(Queue_r),q_takeSemaphore)==(q_takeSemaphore(semaphore,pxTask));
  List_Header(Refinement(Queue_r),q_giveSemaphore)==(q_giveSemaphore(semaphore,pxTask));
  List_Header(Refinement(Queue_r),q_createMutex)==(rMutex <-- q_createMutex);
  List_Header(Refinement(Queue_r),q_takeMutex)==(q_takeMutex(mutex,task));
  List_Header(Refinement(Queue_r),q_giveMutex)==(q_giveMutex(mutex,pxTask));
  List_Header(Refinement(Queue_r),q_endScheduler)==(q_endScheduler);
  List_Header(Refinement(Queue_r),q_resumeAll)==(q_resumeAll(unblocked))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(Queue_r),q_queueCreate)==(btrue);
  List_Precondition(Refinement(Queue_r),q_queueCreate)==(uxQueueLength: QUEUE_LENGTH & uxItemSize: QUEUE_LENGTH & uxQueueLength>0);
  Own_Precondition(Refinement(Queue_r),q_queueDelete)==(btrue);
  List_Precondition(Refinement(Queue_r),q_queueDelete)==(pxQueue: queues & pxQueue/:semaphores & pxQueue/:mutexes & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {});
  Own_Precondition(Refinement(Queue_r),q_sendItem)==(btrue);
  List_Precondition(Refinement(Queue_r),q_sendItem)==(pxQueue: queues_msg & pxItem: ITEM & pxItem/:queue_items(pxQueue) & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & pxQueue/:queues_msg_full);
  Own_Precondition(Refinement(Queue_r),q_receivedItem)==(btrue);
  List_Precondition(Refinement(Queue_r),q_receivedItem)==(pxQueue: queues_msg & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & pxQueue/:queues_msg_empty);
  Own_Precondition(Refinement(Queue_r),q_insertTaskWaitingToSend)==(btrue);
  List_Precondition(Refinement(Queue_r),q_insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)));
  Own_Precondition(Refinement(Queue_r),q_insertTaskWaitingToReceive)==(btrue);
  List_Precondition(Refinement(Queue_r),q_insertTaskWaitingToReceive)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)));
  Own_Precondition(Refinement(Queue_r),q_removeFromEventListQueue)==(btrue);
  List_Precondition(Refinement(Queue_r),q_removeFromEventListQueue)==(task: TASK);
  Own_Precondition(Refinement(Queue_r),q_createSemaphore)==(btrue);
  List_Precondition(Refinement(Queue_r),q_createSemaphore)==(maxCount: QUEUE_LENGTH & initialCount: QUEUE_QUANT & initialCount<=maxCount);
  Own_Precondition(Refinement(Queue_r),q_deleteSemaphore)==(semaphore: semaphores);
  List_Precondition(Refinement(Queue_r),q_deleteSemaphore)==(semaphore: semaphores & semaphore: semaphores);
  Own_Precondition(Refinement(Queue_r),q_takeSemaphore)==(btrue);
  List_Precondition(Refinement(Queue_r),q_takeSemaphore)==(semaphore: semaphores & semaphore/:semaphores_busy & pxTask: TASK & pxTask: queue_sending(semaphore));
  Own_Precondition(Refinement(Queue_r),q_giveSemaphore)==(btrue);
  List_Precondition(Refinement(Queue_r),q_giveSemaphore)==(semaphore: semaphores & pxTask: TASK & pxTask: queue_receiving(semaphore));
  Own_Precondition(Refinement(Queue_r),q_createMutex)==(btrue);
  List_Precondition(Refinement(Queue_r),q_createMutex)==(btrue);
  Own_Precondition(Refinement(Queue_r),q_takeMutex)==(btrue);
  List_Precondition(Refinement(Queue_r),q_takeMutex)==(mutex: mutexes & mutex/:mutexes_busy & task: TASK & task/=TASK_NULL);
  Own_Precondition(Refinement(Queue_r),q_giveMutex)==(btrue);
  List_Precondition(Refinement(Queue_r),q_giveMutex)==(mutex: mutexes & mutex: mutexes_busy & pxTask: TASK);
  Own_Precondition(Refinement(Queue_r),q_endScheduler)==(btrue);
  List_Precondition(Refinement(Queue_r),q_endScheduler)==(btrue);
  Own_Precondition(Refinement(Queue_r),q_resumeAll)==(btrue);
  List_Precondition(Refinement(Queue_r),q_resumeAll)==(unblocked: POW(TASK))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(Queue_r),q_resumeAll)==(unblocked: POW(TASK) | queue_sending/={} ==> queue_sending:=remove_task(queue_sending,unblocked) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> queue_receiving:=remove_task(queue_receiving,unblocked) [] not(queue_receiving/={}) ==> skip));
  Expanded_List_Substitution(Refinement(Queue_r),q_endScheduler)==(btrue | queues,queues_msg,queue_receiving,queue_sending,semaphores,semaphores_busy,mutexes,mutexes_busy,mutex_holder,queue_quant,queue_size,queues_msg_empty,queues_msg_full,queue_items_r:={},{},{},{},{},{},{},{},{},{},{},{},{},{});
  Expanded_List_Substitution(Refinement(Queue_r),q_giveMutex)==(mutex: mutexes & mutex: mutexes_busy & pxTask: TASK | queue_quant,mutexes_busy,mutex_holder,queue_receiving:=queue_quant<+{mutex|->queue_quant(mutex)+1},mutexes_busy-{mutex},mutex_holder<+{mutex|->TASK_NULL},queue_receiving<+{mutex|->queue_receiving(mutex)-{pxTask}});
  Expanded_List_Substitution(Refinement(Queue_r),q_takeMutex)==(mutex: mutexes & mutex/:mutexes_busy & task: TASK & task/=TASK_NULL | queue_quant,mutexes_busy,mutex_holder:=queue_quant<+{mutex|->queue_quant(mutex)-1},mutexes_busy\/{mutex},mutex_holder<+{mutex|->task});
  Expanded_List_Substitution(Refinement(Queue_r),q_createMutex)==(btrue | @mutex.(mutex: QUEUE & mutex/:queues ==> queues,mutexes,queue_receiving,queue_sending,mutex_holder,queue_size,queue_quant,rMutex:=queues\/{mutex},mutexes\/{mutex},queue_receiving\/{mutex|->{}},queue_sending\/{mutex|->{}},mutex_holder\/{mutex|->TASK_NULL},queue_size\/{mutex|->1},queue_quant\/{mutex|->1},mutex));
  Expanded_List_Substitution(Refinement(Queue_r),q_giveSemaphore)==(semaphore: semaphores & pxTask: TASK & pxTask: queue_receiving(semaphore) | queue_quant(semaphore)<queue_size(semaphore) ==> (queue_quant:=queue_quant<+{semaphore|->queue_quant(semaphore)+1} || (queue_quant(semaphore) = 0 ==> semaphores_busy:=semaphores_busy-{semaphore} [] not(queue_quant(semaphore) = 0) ==> skip) || queue_receiving:=queue_receiving<+{semaphore|->queue_receiving(semaphore)-{pxTask}}) [] not(queue_quant(semaphore)<queue_size(semaphore)) ==> skip);
  Expanded_List_Substitution(Refinement(Queue_r),q_takeSemaphore)==(semaphore: semaphores & semaphore/:semaphores_busy & pxTask: TASK & pxTask: queue_sending(semaphore) | queue_quant:=queue_quant<+{semaphore|->queue_quant(semaphore)-1} || (queue_quant(semaphore)-1 = 0 ==> semaphores_busy:=semaphores_busy\/{semaphore} [] not(queue_quant(semaphore)-1 = 0) ==> skip) || queue_sending:=queue_sending<+{semaphore|->queue_sending(semaphore)-{pxTask}});
  Expanded_List_Substitution(Refinement(Queue_r),q_deleteSemaphore)==(semaphore: semaphores & semaphore: semaphores | queues,semaphores,queue_receiving,queue_sending,queue_size,queue_quant:=queues-{semaphore},semaphores-{semaphore},{semaphore}<<|queue_receiving,{semaphore}<<|queue_sending,{semaphore}<<|queue_size,{semaphore}<<|queue_quant || (semaphore: semaphores_busy ==> semaphores_busy:=semaphores_busy-{semaphore} [] not(semaphore: semaphores_busy) ==> skip));
  Expanded_List_Substitution(Refinement(Queue_r),q_createSemaphore)==(maxCount: QUEUE_LENGTH & initialCount: QUEUE_QUANT & initialCount<=maxCount | @semaphore.(semaphore: QUEUE & semaphore/:queues ==> (queues,queue_receiving,queue_sending,semaphores,queue_size,queue_quant:=queues\/{semaphore},queue_receiving\/{semaphore|->{}},queue_sending\/{semaphore|->{}},semaphores\/{semaphore},queue_size\/{semaphore|->maxCount},queue_quant\/{semaphore|->initialCount} || (initialCount = 0 ==> semaphores_busy:=semaphores_busy\/{semaphore} [] not(initialCount = 0) ==> skip) || rSemaphore:=semaphore)));
  Expanded_List_Substitution(Refinement(Queue_r),q_removeFromEventListQueue)==(task: TASK | @pxQueue.(pxQueue: queues & task: queue_receiving(pxQueue) ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}}) || @pxQueue.(pxQueue: queues & task: queue_sending(pxQueue) ==> queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}}));
  Expanded_List_Substitution(Refinement(Queue_r),q_insertTaskWaitingToReceive)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)) | queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Refinement(Queue_r),q_insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK & !q1.(q1: queues => pxTask/:queue_sending(q1) & pxTask/:queue_receiving(q1)) | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Refinement(Queue_r),q_receivedItem)==(pxQueue: queues_msg & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & pxQueue/:queues_msg_empty | xItem:=first(queue_items_r(pxQueue)) || (justPeeking = FALSE ==> (queue_items_r,queue_sending:=queue_items_r<+{pxQueue|->tail(queue_items_r(pxQueue))},queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}} || (pxQueue: queues_msg_full ==> queues_msg_full:=queues_msg_full-{pxQueue} [] not(pxQueue: queues_msg_full) ==> skip) || (queue_quant(pxQueue)-1 = 0 ==> queues_msg_empty:=queues_msg_empty\/{pxQueue} [] not(queue_quant(pxQueue)-1 = 0) ==> skip) || queue_quant:=queue_quant<+{pxQueue|->queue_quant(pxQueue)-1}) [] not(justPeeking = FALSE) ==> skip));
  Expanded_List_Substitution(Refinement(Queue_r),q_sendItem)==(pxQueue: queues_msg & pxItem: ITEM & pxItem/:queue_items(pxQueue) & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & pxQueue/:queues_msg_full | copy_position = queueSEND_TO_BACK ==> queue_items_r:=queue_items_r<+{pxQueue|->(queue_items_r(pxQueue)<-pxItem)} [] not(copy_position = queueSEND_TO_BACK) ==> queue_items_r:=queue_items_r<+{pxQueue|->(pxItem->queue_items_r(pxQueue))} || queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}} || (pxQueue: queues_msg_empty ==> queues_msg_empty:=queues_msg_empty-{pxQueue} [] not(pxQueue: queues_msg_empty) ==> skip) || (queue_quant(pxQueue)+1 = queue_size(pxQueue) ==> queues_msg_full:=queues_msg_full\/{pxQueue} [] not(queue_quant(pxQueue)+1 = queue_size(pxQueue)) ==> skip) || queue_quant:=queue_quant<+{pxQueue|->queue_quant(pxQueue)+1});
  Expanded_List_Substitution(Refinement(Queue_r),q_queueDelete)==(pxQueue: queues & pxQueue/:semaphores & pxQueue/:mutexes & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {} | queues,queues_msg,queue_items_r,queue_size,queue_receiving,queue_sending,queue_quant,queues_msg_empty,queues_msg_full:=queues-{pxQueue},queues_msg-{pxQueue},{pxQueue}<<|queue_items_r,{pxQueue}<<|queue_size,{pxQueue}<<|queue_receiving,{pxQueue}<<|queue_sending,{pxQueue}<<|queue_quant,queues_msg_empty-{pxQueue},queues_msg_full-{pxQueue});
  Expanded_List_Substitution(Refinement(Queue_r),q_queueCreate)==(uxQueueLength: QUEUE_LENGTH & uxItemSize: QUEUE_LENGTH & uxQueueLength>0 | @pxQueue.(pxQueue: QUEUE & pxQueue/:queues ==> queues,queues_msg,queue_items_r,queue_size,queue_receiving,queue_sending,queue_quant,queues_msg_empty,xQueueHandle:=queues\/{pxQueue},queues_msg\/{pxQueue},queue_items_r\/{pxQueue|-><>},queue_size\/{pxQueue|->uxQueueLength},queue_receiving\/{pxQueue|->{}},queue_sending\/{pxQueue|->{}},queue_quant\/{pxQueue|->0},queues_msg_empty\/{pxQueue},pxQueue));
  List_Substitution(Refinement(Queue_r),q_queueCreate)==(ANY pxQueue WHERE pxQueue: QUEUE & pxQueue/:queues THEN queues:=queues\/{pxQueue} || queues_msg:=queues_msg\/{pxQueue} || queue_items_r:=queue_items_r\/{pxQueue|-><>} || queue_size:=queue_size\/{pxQueue|->uxQueueLength} || queue_receiving:=queue_receiving\/{pxQueue|->{}} || queue_sending:=queue_sending\/{pxQueue|->{}} || queue_quant:=queue_quant\/{pxQueue|->0} || queues_msg_empty:=queues_msg_empty\/{pxQueue} || xQueueHandle:=pxQueue END);
  List_Substitution(Refinement(Queue_r),q_queueDelete)==(queues:=queues-{pxQueue} || queues_msg:=queues_msg-{pxQueue} || queue_items_r:={pxQueue}<<|queue_items_r || queue_size:={pxQueue}<<|queue_size || queue_receiving:={pxQueue}<<|queue_receiving || queue_sending:={pxQueue}<<|queue_sending || queue_quant:={pxQueue}<<|queue_quant || queues_msg_empty:=queues_msg_empty-{pxQueue} || queues_msg_full:=queues_msg_full-{pxQueue});
  List_Substitution(Refinement(Queue_r),q_sendItem)==(IF copy_position = queueSEND_TO_BACK THEN queue_items_r(pxQueue):=queue_items_r(pxQueue)<-pxItem ELSE queue_items_r(pxQueue):=pxItem->queue_items_r(pxQueue) END || queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task} || IF pxQueue: queues_msg_empty THEN queues_msg_empty:=queues_msg_empty-{pxQueue} END || IF queue_quant(pxQueue)+1 = queue_size(pxQueue) THEN queues_msg_full:=queues_msg_full\/{pxQueue} END || queue_quant(pxQueue):=queue_quant(pxQueue)+1);
  List_Substitution(Refinement(Queue_r),q_receivedItem)==(xItem:=first(queue_items_r(pxQueue)) || IF justPeeking = FALSE THEN queue_items_r(pxQueue):=tail(queue_items_r(pxQueue)) || queue_sending(pxQueue):=queue_sending(pxQueue)-{task} || IF pxQueue: queues_msg_full THEN queues_msg_full:=queues_msg_full-{pxQueue} END || IF queue_quant(pxQueue)-1 = 0 THEN queues_msg_empty:=queues_msg_empty\/{pxQueue} END || queue_quant(pxQueue):=queue_quant(pxQueue)-1 END);
  List_Substitution(Refinement(Queue_r),q_insertTaskWaitingToSend)==(queue_sending(pxQueue):=queue_sending(pxQueue)\/{pxTask});
  List_Substitution(Refinement(Queue_r),q_insertTaskWaitingToReceive)==(queue_receiving(pxQueue):=queue_receiving(pxQueue)\/{pxTask});
  List_Substitution(Refinement(Queue_r),q_removeFromEventListQueue)==(ANY pxQueue WHERE pxQueue: queues & task: queue_receiving(pxQueue) THEN queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task} END || ANY pxQueue WHERE pxQueue: queues & task: queue_sending(pxQueue) THEN queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END);
  List_Substitution(Refinement(Queue_r),q_createSemaphore)==(ANY semaphore WHERE semaphore: QUEUE & semaphore/:queues THEN queues:=queues\/{semaphore} || queue_receiving:=queue_receiving\/{semaphore|->{}} || queue_sending:=queue_sending\/{semaphore|->{}} || semaphores:=semaphores\/{semaphore} || queue_size:=queue_size\/{semaphore|->maxCount} || queue_quant:=queue_quant\/{semaphore|->initialCount} || IF initialCount = 0 THEN semaphores_busy:=semaphores_busy\/{semaphore} ELSE skip END || rSemaphore:=semaphore END);
  List_Substitution(Refinement(Queue_r),q_deleteSemaphore)==(queues:=queues-{semaphore} || semaphores:=semaphores-{semaphore} || queue_receiving:={semaphore}<<|queue_receiving || queue_sending:={semaphore}<<|queue_sending || queue_size:={semaphore}<<|queue_size || queue_quant:={semaphore}<<|queue_quant || IF semaphore: semaphores_busy THEN semaphores_busy:=semaphores_busy-{semaphore} END);
  List_Substitution(Refinement(Queue_r),q_takeSemaphore)==(queue_quant(semaphore):=queue_quant(semaphore)-1 || IF queue_quant(semaphore)-1 = 0 THEN semaphores_busy:=semaphores_busy\/{semaphore} END || queue_sending(semaphore):=queue_sending(semaphore)-{pxTask});
  List_Substitution(Refinement(Queue_r),q_giveSemaphore)==(IF queue_quant(semaphore)<queue_size(semaphore) THEN queue_quant(semaphore):=queue_quant(semaphore)+1 || IF queue_quant(semaphore) = 0 THEN semaphores_busy:=semaphores_busy-{semaphore} END || queue_receiving(semaphore):=queue_receiving(semaphore)-{pxTask} END);
  List_Substitution(Refinement(Queue_r),q_createMutex)==(ANY mutex WHERE mutex: QUEUE & mutex/:queues THEN queues:=queues\/{mutex} || mutexes:=mutexes\/{mutex} || queue_receiving:=queue_receiving\/{mutex|->{}} || queue_sending:=queue_sending\/{mutex|->{}} || mutex_holder:=mutex_holder\/{mutex|->TASK_NULL} || queue_size:=queue_size\/{mutex|->1} || queue_quant:=queue_quant\/{mutex|->1} || rMutex:=mutex END);
  List_Substitution(Refinement(Queue_r),q_takeMutex)==(queue_quant(mutex):=queue_quant(mutex)-1 || mutexes_busy:=mutexes_busy\/{mutex} || mutex_holder(mutex):=task);
  List_Substitution(Refinement(Queue_r),q_giveMutex)==(queue_quant(mutex):=queue_quant(mutex)+1 || mutexes_busy:=mutexes_busy-{mutex} || mutex_holder(mutex):=TASK_NULL || queue_receiving(mutex):=queue_receiving(mutex)-{pxTask});
  List_Substitution(Refinement(Queue_r),q_endScheduler)==(queues:={} || queues_msg:={} || queue_receiving:={} || queue_sending:={} || semaphores:={} || semaphores_busy:={} || mutexes:={} || mutexes_busy:={} || mutex_holder:={} || queue_quant:={} || queue_size:={} || queues_msg_empty:={} || queues_msg_full:={} || queue_items_r:={});
  List_Substitution(Refinement(Queue_r),q_resumeAll)==(IF queue_sending/={} THEN queue_sending:=remove_task(queue_sending,unblocked) END || IF queue_receiving/={} THEN queue_receiving:=remove_task(queue_receiving,unblocked) END)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(Queue_r))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(Queue_r),Machine(Types))==(?);
  List_Instanciated_Parameters(Refinement(Queue_r),Machine(Scheduler))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(Queue_r))==(btrue);
  List_Context_Constraints(Refinement(Queue_r))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(Queue_r))==(remove_task);
  Inherited_List_Constants(Refinement(Queue_r))==(remove_task);
  List_Constants(Refinement(Queue_r))==(?)
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
  Abstract_List_Properties(Refinement(Queue_r))==(remove_task: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> POW(TASK)) & remove_task = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | %q1.(q1: QUEUE & q1: dom(q_task) | q_task(q1)-unblocked)));
  Context_List_Properties(Refinement(Queue_r))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Refinement(Queue_r))==(btrue);
  List_Properties(Refinement(Queue_r))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(Queue_r),Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  Seen_Context_List_Enumerated(Refinement(Queue_r))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Refinement(Queue_r))==(btrue);
  Seen_Context_List_Assertions(Refinement(Queue_r))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  Seen_Context_List_Properties(Refinement(Queue_r))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Refinement(Queue_r))==(btrue);
  Seen_List_Precondition(Refinement(Queue_r),resumeScheduler)==(schedulerSuspended>0);
  Seen_Expanded_List_Substitution(Refinement(Queue_r),resumeScheduler)==(schedulerSuspended:=schedulerSuspended-1);
  Seen_List_Precondition(Refinement(Queue_r),suspendScheduler)==(schedulerSuspended<MAXINT);
  Seen_Expanded_List_Substitution(Refinement(Queue_r),suspendScheduler)==(schedulerSuspended:=schedulerSuspended+1);
  Seen_List_Precondition(Refinement(Queue_r),stopScheduler)==(schedulerRunning = TRUE);
  Seen_Expanded_List_Substitution(Refinement(Queue_r),stopScheduler)==(schedulerRunning:=FALSE);
  Seen_List_Precondition(Refinement(Queue_r),startScheduler)==(schedulerRunning = FALSE);
  Seen_Expanded_List_Substitution(Refinement(Queue_r),startScheduler)==(schedulerRunning:=TRUE);
  Seen_List_Operations(Refinement(Queue_r),Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  Seen_Expanded_List_Invariant(Refinement(Queue_r),Machine(Scheduler))==(btrue);
  Set_Definition(Refinement(Queue_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Refinement(Queue_r),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(Queue_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Queue_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Seen_Internal_List_Operations(Refinement(Queue_r),Machine(Types))==(?);
  Seen_List_Operations(Refinement(Queue_r),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Refinement(Queue_r),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(Queue_r),q_queueCreate)==(Var(pxQueue) == atype(QUEUE,?,?));
  List_ANY_Var(Refinement(Queue_r),q_queueDelete)==(?);
  List_ANY_Var(Refinement(Queue_r),q_sendItem)==(?);
  List_ANY_Var(Refinement(Queue_r),q_receivedItem)==(?);
  List_ANY_Var(Refinement(Queue_r),q_insertTaskWaitingToSend)==(?);
  List_ANY_Var(Refinement(Queue_r),q_insertTaskWaitingToReceive)==(?);
  List_ANY_Var(Refinement(Queue_r),q_removeFromEventListQueue)==(Var(pxQueue) == atype(QUEUE,?,?));
  List_ANY_Var(Refinement(Queue_r),q_createSemaphore)==(Var(semaphore) == atype(QUEUE,?,?));
  List_ANY_Var(Refinement(Queue_r),q_deleteSemaphore)==(?);
  List_ANY_Var(Refinement(Queue_r),q_takeSemaphore)==(?);
  List_ANY_Var(Refinement(Queue_r),q_giveSemaphore)==(?);
  List_ANY_Var(Refinement(Queue_r),q_createMutex)==(Var(mutex) == atype(QUEUE,?,?));
  List_ANY_Var(Refinement(Queue_r),q_takeMutex)==(?);
  List_ANY_Var(Refinement(Queue_r),q_giveMutex)==(?);
  List_ANY_Var(Refinement(Queue_r),q_endScheduler)==(?);
  List_ANY_Var(Refinement(Queue_r),q_resumeAll)==(?);
  List_ANY_Var(Refinement(Queue_r),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(Queue_r)) == (? | ? | queue_quant,queue_items_r,queue_size,mutex_holder,queue_sending,queue_receiving,mutexes_busy,mutexes,semaphores_busy,semaphores,queues_msg_full,queues_msg_empty,queues_msg,queues | ? | q_queueCreate,q_queueDelete,q_sendItem,q_receivedItem,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_removeFromEventListQueue,q_createSemaphore,q_deleteSemaphore,q_takeSemaphore,q_giveSemaphore,q_createMutex,q_takeMutex,q_giveMutex,q_endScheduler,q_resumeAll | ? | seen(Machine(Types)),seen(Machine(Scheduler)) | ? | Queue_r);
  List_Of_HiddenCst_Ids(Refinement(Queue_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(Queue_r)) == (?);
  List_Of_VisibleVar_Ids(Refinement(Queue_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(Queue_r)) == (?: ?);
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
  Constants(Refinement(Queue_r)) == (Type(remove_task) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(Queue_r)) == (Type(queue_quant) == Mvl(SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?)));Type(queue_items_r) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(btype(INTEGER,?,?)*atype(ITEM,?,?))));Type(queue_size) == Mvl(SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?)));Type(mutex_holder) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(mutexes_busy) == Mvl(SetOf(atype(QUEUE,?,?)));Type(mutexes) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores_busy) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg_full) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg_empty) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(Queue_r)) == (Type(q_resumeAll) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(q_endScheduler) == Cst(No_type,No_type);Type(q_giveMutex) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_takeMutex) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_createMutex) == Cst(atype(QUEUE,?,?),No_type);Type(q_giveSemaphore) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_takeSemaphore) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_deleteSemaphore) == Cst(No_type,atype(QUEUE,?,?));Type(q_createSemaphore) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(q_removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(q_insertTaskWaitingToReceive) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(q_receivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(BOOL,?,?)*atype(TASK,?,?));Type(q_sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*etype(COPY_POSITION,?,?));Type(q_queueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(q_queueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
