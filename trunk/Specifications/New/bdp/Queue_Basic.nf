Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Queue_Basic))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Queue_Basic))==(Machine(Queue_Basic));
  Level(Machine(Queue_Basic))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Queue_Basic)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Queue_Basic))==(Types,Task_Basic)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Queue_Basic))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Queue_Basic))==(?);
  List_Includes(Machine(Queue_Basic))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Queue_Basic))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Queue_Basic))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Queue_Basic))==(?);
  Context_List_Variables(Machine(Queue_Basic))==(?);
  Abstract_List_Variables(Machine(Queue_Basic))==(?);
  Local_List_Variables(Machine(Queue_Basic))==(queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues);
  List_Variables(Machine(Queue_Basic))==(queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues);
  External_List_Variables(Machine(Queue_Basic))==(queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Queue_Basic))==(?);
  Abstract_List_VisibleVariables(Machine(Queue_Basic))==(?);
  External_List_VisibleVariables(Machine(Queue_Basic))==(?);
  Expanded_List_VisibleVariables(Machine(Queue_Basic))==(?);
  List_VisibleVariables(Machine(Queue_Basic))==(?);
  Internal_List_VisibleVariables(Machine(Queue_Basic))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Queue_Basic))==(btrue);
  Gluing_List_Invariant(Machine(Queue_Basic))==(btrue);
  Expanded_List_Invariant(Machine(Queue_Basic))==(btrue);
  Abstract_List_Invariant(Machine(Queue_Basic))==(btrue);
  Context_List_Invariant(Machine(Queue_Basic))==(tasks: POW(TASK) & task_name: TASK +-> NAME & task_state: TASK +-> TASK_STATE & task_priority: TASK +-> PRIORITY & task_value: TASK +-> TICK & tasks = dom(task_priority) & tasks = dom(task_state) & tasks = dom(task_value) & tasks = dom(task_name) & current_task: TASK & current_task: tasks & task_state(current_task) = running & max_priority: PRIORITY & max_priority = task_priority(current_task) & max_priority>=max(READY_PRIORITIES(task_state,task_priority)) & card(task_state|>{running})<=1 & scheduler: SCHEDULER_STATE & tickCount: TICK & tickMissed: TICK);
  List_Invariant(Machine(Queue_Basic))==(queues: POW(QUEUE) & queue_itens: QUEUE +-> POW(ITEM) & queue_tkRecived: QUEUE +-> POW(TASK) & queue_tkSend: QUEUE +-> POW(TASK) & queue_length: QUEUE +-> NAT & queues = dom(queue_itens) & queues = dom(queue_tkRecived) & queues = dom(queue_tkSend) & queues = dom(queue_length) & !queue.(queue: queues => card(queue_itens(queue))<=queue_length(queue)))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Queue_Basic))==(btrue);
  Abstract_List_Assertions(Machine(Queue_Basic))==(btrue);
  Context_List_Assertions(Machine(Queue_Basic))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(Queue_Basic))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Queue_Basic))==(queues,queue_itens,queue_tkRecived,queue_tkSend,queue_length:={QUEUE_NULL},{QUEUE_NULL|->{}},{QUEUE_NULL|->{}},{QUEUE_NULL|->{}},{QUEUE_NULL|->card({})});
  Context_List_Initialisation(Machine(Queue_Basic))==(skip);
  List_Initialisation(Machine(Queue_Basic))==(queues:={QUEUE_NULL} || queue_itens:={QUEUE_NULL|->{}} || queue_tkRecived:={QUEUE_NULL|->{}} || queue_tkSend:={QUEUE_NULL|->{}} || queue_length:={QUEUE_NULL|->card({})})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Queue_Basic))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Queue_Basic),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(Queue_Basic),Machine(Task_Basic))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Queue_Basic))==(btrue);
  List_Constraints(Machine(Queue_Basic))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Queue_Basic))==(xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,recivedItem,removeFromEventListQueue);
  List_Operations(Machine(Queue_Basic))==(xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,recivedItem,removeFromEventListQueue)
END
&
THEORY ListInputX IS
  List_Input(Machine(Queue_Basic),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(Queue_Basic),sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Machine(Queue_Basic),insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Machine(Queue_Basic),insertTaskWaitingToRecived)==(pxQueue,pxTask);
  List_Input(Machine(Queue_Basic),recivedItem)==(pxQueue,justPeeking,task);
  List_Input(Machine(Queue_Basic),removeFromEventListQueue)==(task)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Queue_Basic),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(Queue_Basic),sendItem)==(?);
  List_Output(Machine(Queue_Basic),insertTaskWaitingToSend)==(?);
  List_Output(Machine(Queue_Basic),insertTaskWaitingToRecived)==(?);
  List_Output(Machine(Queue_Basic),recivedItem)==(xItem);
  List_Output(Machine(Queue_Basic),removeFromEventListQueue)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Queue_Basic),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(Queue_Basic),sendItem)==(sendItem(pxQueue,pxItem,task,copy_position));
  List_Header(Machine(Queue_Basic),insertTaskWaitingToSend)==(insertTaskWaitingToSend(pxQueue,pxTask));
  List_Header(Machine(Queue_Basic),insertTaskWaitingToRecived)==(insertTaskWaitingToRecived(pxQueue,pxTask));
  List_Header(Machine(Queue_Basic),recivedItem)==(xItem <-- recivedItem(pxQueue,justPeeking,task));
  List_Header(Machine(Queue_Basic),removeFromEventListQueue)==(removeFromEventListQueue(task))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Queue_Basic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(Queue_Basic),sendItem)==(pxQueue: queues & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE & pxItem: ITEM & task: TASK & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION);
  List_Precondition(Machine(Queue_Basic),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK);
  List_Precondition(Machine(Queue_Basic),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK);
  List_Precondition(Machine(Queue_Basic),recivedItem)==(pxQueue: queues & QUEUE_ISEMPTY(pxQueue,queue_itens) = FALSE & justPeeking: BIT & task: TASK & task: queue_tkSend(pxQueue));
  List_Precondition(Machine(Queue_Basic),removeFromEventListQueue)==(task: TASK)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Queue_Basic),removeFromEventListQueue)==(task: TASK | @any(queuesTask,q_tkRecived,q_tkSend).(queuesTask: POW(QUEUE) & queuesTask = QUEUES_WITH_TASK(task,queues,queue_tkRecived,queue_tkSend) & q_tkRecived: QUEUE +-> POW(TASK) & q_tkSend: QUEUE +-> POW(TASK) & q_tkRecived,q_tkSend = REMOVE_EVENT(task,queues,queue_tkRecived,queue_tkSend) ==> queue_tkRecived,queue_tkSend:=queue_tkRecived<+q_tkRecived,queue_tkSend<+q_tkSend));
  Expanded_List_Substitution(Machine(Queue_Basic),recivedItem)==(pxQueue: queues & QUEUE_ISEMPTY(pxQueue,queue_itens) = FALSE & justPeeking: BIT & task: TASK & task: queue_tkSend(pxQueue) | @any(item).(item: ITEM & item: queue_itens(pxQueue) ==> (justPeeking = pdFALSE ==> queue_itens,queue_tkSend:=queue_itens<+{pxQueue|->queue_itens(pxQueue)-{item}},queue_tkSend<+{pxQueue|->queue_tkSend(pxQueue)-{task}} [] not(justPeeking = pdFALSE) ==> skip || xItem:=item)));
  Expanded_List_Substitution(Machine(Queue_Basic),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK | queue_tkRecived:=queue_tkRecived<+{pxQueue|->(queue_tkRecived(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(Queue_Basic),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK | queue_tkSend:=queue_tkSend<+{pxQueue|->(queue_tkSend(pxQueue)\/{pxTask})});
  Expanded_List_Substitution(Machine(Queue_Basic),sendItem)==(pxQueue: queues & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE & pxItem: ITEM & task: TASK & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION | queue_itens,queue_tkRecived:=queue_itens<+{pxQueue|->(queue_itens(pxQueue)\/{pxItem})},queue_tkRecived<+{pxQueue|->queue_tkRecived(pxQueue)-{task}});
  Expanded_List_Substitution(Machine(Queue_Basic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @any(queue).(queue: QUEUE & queue/:queues ==> queues,queue_itens,queue_tkRecived,queue_tkSend,queue_length,xQueueHandle:=queues\/{queue},queue_itens\/{queue|->{}},queue_tkRecived\/{queue|->{}},queue_tkSend\/{queue|->{}},queue_length\/{queue|->uxQueueLength},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(Queue_Basic),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_itens:=queue_itens\/{queue|->{}} || queue_tkRecived:=queue_tkRecived\/{queue|->{}} || queue_tkSend:=queue_tkSend\/{queue|->{}} || queue_length:=queue_length\/{queue|->uxQueueLength} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  List_Substitution(Machine(Queue_Basic),sendItem)==(queue_itens(pxQueue):=queue_itens(pxQueue)\/{pxItem} || queue_tkRecived(pxQueue):=queue_tkRecived(pxQueue)-{task});
  List_Substitution(Machine(Queue_Basic),insertTaskWaitingToSend)==(queue_tkSend(pxQueue):=queue_tkSend(pxQueue)\/{pxTask});
  List_Substitution(Machine(Queue_Basic),insertTaskWaitingToRecived)==(queue_tkRecived(pxQueue):=queue_tkRecived(pxQueue)\/{pxTask});
  List_Substitution(Machine(Queue_Basic),recivedItem)==(ANY item WHERE item: ITEM & item: queue_itens(pxQueue) THEN IF justPeeking = pdFALSE THEN queue_itens(pxQueue):=queue_itens(pxQueue)-{item} || queue_tkSend(pxQueue):=queue_tkSend(pxQueue)-{task} END || xItem:=item END);
  List_Substitution(Machine(Queue_Basic),removeFromEventListQueue)==(ANY queuesTask,q_tkRecived,q_tkSend WHERE queuesTask: POW(QUEUE) & queuesTask = QUEUES_WITH_TASK(task,queues,queue_tkRecived,queue_tkSend) & q_tkRecived: QUEUE +-> POW(TASK) & q_tkSend: QUEUE +-> POW(TASK) & q_tkRecived,q_tkSend = REMOVE_EVENT(task,queues,queue_tkRecived,queue_tkSend) THEN queue_tkRecived:=queue_tkRecived<+q_tkRecived || queue_tkSend:=queue_tkSend<+q_tkSend END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Queue_Basic))==(QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT);
  Inherited_List_Constants(Machine(Queue_Basic))==(?);
  List_Constants(Machine(Queue_Basic))==(QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Queue_Basic),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Context_List_Enumerated(Machine(Queue_Basic))==(TASK_STATE,SCHEDULER_STATE);
  Context_List_Defered(Machine(Queue_Basic))==(POINTER,NAME,PARAMETER,TASK_CODE,STACK,TASK);
  Context_List_Sets(Machine(Queue_Basic))==(POINTER,NAME,PARAMETER,TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK);
  List_Valuable_Sets(Machine(Queue_Basic))==(ITEM,COPY_POSITION,QUEUE);
  Inherited_List_Enumerated(Machine(Queue_Basic))==(?);
  Inherited_List_Defered(Machine(Queue_Basic))==(?);
  Inherited_List_Sets(Machine(Queue_Basic))==(?);
  List_Enumerated(Machine(Queue_Basic))==(?);
  List_Defered(Machine(Queue_Basic))==(ITEM,COPY_POSITION,QUEUE);
  List_Sets(Machine(Queue_Basic))==(ITEM,COPY_POSITION,QUEUE);
  Set_Definition(Machine(Queue_Basic),TASK_STATE)==({running,blocked,ready,suspended,deleted});
  Set_Definition(Machine(Queue_Basic),ITEM)==(?);
  Set_Definition(Machine(Queue_Basic),COPY_POSITION)==(?);
  Set_Definition(Machine(Queue_Basic),QUEUE)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Queue_Basic))==(?);
  Expanded_List_HiddenConstants(Machine(Queue_Basic))==(?);
  List_HiddenConstants(Machine(Queue_Basic))==(?);
  External_List_HiddenConstants(Machine(Queue_Basic))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Queue_Basic))==(btrue);
  Context_List_Properties(Machine(Queue_Basic))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & PRIORITY = 0..configMAX_PRIORITIES-1 & TICK = 0..MAX_DELAY & TASK_NULL: TASK & NAME_NULL: NAME & READY_PRIORITIES: (TASK +-> TASK_STATE)*(TASK +-> PRIORITY) --> POW(PRIORITY) & READY_PRIORITIES = %(tk_state,tk_prt).(tk_state: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY | ran(dom(tk_state|>{ready})<|tk_prt)) & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & tskIDLE_PRIORITY: PRIORITY & tskIDLE_PRIORITY = 1 & UNBLOCK_TASKS: POW(TASK) --> (TASK +-> TASK_STATE) & UNBLOCK_TASKS = %bTasks.(bTasks: POW(TASK) | UNION(tk).(tk: bTasks | {rTask | rTask = tk|->ready})) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & TASK_STATE: FIN(INTEGER) & not(TASK_STATE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}));
  Inherited_List_Properties(Machine(Queue_Basic))==(btrue);
  List_Properties(Machine(Queue_Basic))==(QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & QUEUE_ISFULL: QUEUE*(QUEUE +-> POW(ITEM))*(QUEUE +-> NAT) --> BOOL & QUEUE_ISFULL = %(queue,q_it,q_vl).(queue: QUEUE & q_it: QUEUE +-> POW(ITEM) & q_vl: QUEUE +-> NAT & queue: dom(q_vl) & queue: dom(q_it) | bool(card(q_it(queue))>=q_vl(queue))) & QUEUE_ISEMPTY: QUEUE*(QUEUE +-> POW(ITEM)) --> BOOL & QUEUE_ISEMPTY = %(queue,q_it).(queue: QUEUE & q_it: QUEUE +-> POW(ITEM) & queue: dom(q_it) | bool(q_it(queue) = {})) & QUEUES_WITH_TASK: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) --> POW(QUEUE) & QUEUES_WITH_TASK = %(tk,ques,q_tkR,q_tkS).(tk: TASK & ques: POW(QUEUE) & q_tkR: QUEUE +-> POW(TASK) & q_tkS: QUEUE +-> POW(TASK) & ques = dom(q_tkR) & ques = dom(q_tkS) | {que | que: ques & (tk: q_tkR(que) or tk: q_tkS(que))}) & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) --> (QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(tk,ques,q_tkR,q_tkS).(tk: TASK & ques: POW(QUEUE) & q_tkR: QUEUE +-> POW(TASK) & q_tkS: QUEUE +-> POW(TASK) | UNION(que).(que: ques | {et | et = que|->q_tkS(que)-{tk}}),UNION(que).(que: ques | {et | et = que|->q_tkR(que)-{tk}})) & ITEM: FIN(INTEGER) & not(ITEM = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Queue_Basic),Machine(Task_Basic))==(xTaskCreate,deleteTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,removeFromBlockedList);
  Seen_Context_List_Enumerated(Machine(Queue_Basic))==(?);
  Seen_Context_List_Invariant(Machine(Queue_Basic))==(btrue);
  Seen_Context_List_Assertions(Machine(Queue_Basic))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(Queue_Basic))==(configMAX_PRIORITIES: NATURAL & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NATURAL & configMINIMAL_STACK_SIZE: NATURAL & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & configUSE_PREEMPTION: BIT & configUSE_IDLE_HOOK: BIT & configUSE_TICK_HOOK: BIT & configCPU_CLOCK_HZ: NATURAL & configTICK_RATE_HZ: NATURAL & configMAX_TASK_NAME_LEN: NATURAL & configUSE_TRACE_FACILITY: BIT & configUSE_16_BIT_TICKS: BIT & configIDLE_SHOULD_YIELD: BIT & configUSE_USE_MUTEXES: BIT & configUSE_RECURSIVE_MUTEXES: BIT & configUSE_COUNTING_SEMAPHORES: BIT & configUSE_ALTERNATIVE_API: BIT & configCHECK_FOR_STACK_OVERFLOW: BIT & configQUEUE_REGISTRY_SIZE: BIT & configUSE_CO_ROUTINES: BIT & configMAX_CO_ROUTINE_PRIORITIES: NATURAL & configKERNEL_INTERRUPT_PRIORITY: NATURAL & configMAX_SYSCALL_INTERRUPT_PRIORITY: NATURAL & INCLUDE_vTaskCleanUpResources: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Seen_List_Constraints(Machine(Queue_Basic))==(btrue);
  Seen_List_Precondition(Machine(Queue_Basic),removeFromBlockedList)==(task: tasks & task_state(task) = blocked & task/=current_task);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),removeFromBlockedList)==(task_priority(task)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready,task|->running},task,task_priority(task) [] not(task_priority(task)>max_priority) ==> task_state:=task_state<+{task|->ready});
  Seen_List_Precondition(Machine(Queue_Basic),incrementTick)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),incrementTick)==(scheduler = taskSCHEDULER_RUNNING ==> tickCount:=TICK_INCREMENT(tickCount,1) [] not(scheduler = taskSCHEDULER_RUNNING) ==> tickMissed:=TICK_INCREMENT(tickCount,1) || @any(blockedTasks,mprt,task).(blockedTasks = {bTask | bTask: tasks & task_state(bTask) = blocked & task_value(bTask) = TICK_INCREMENT(tickCount,1)} & mprt: PRIORITY & mprt = max(ran(dom(UNBLOCK_TASKS(blockedTasks))<|task_priority)) & task: dom(UNBLOCK_TASKS(blockedTasks)) & task: dom(task_priority) & task_priority(task) = mprt ==> (mprt>max_priority ==> task_state,current_task,max_priority:=task_state<+UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running},task,mprt [] not(mprt>max_priority) ==> task_state:=task_state<+UNBLOCK_TASKS(blockedTasks))));
  Seen_List_Precondition(Machine(Queue_Basic),xTaskResumeAll)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),xTaskResumeAll)==(scheduler = taskSCHEDULER_SUSPENDED ==> (scheduler,tickCount:=taskSCHEDULER_RUNNING,TICK_INCREMENT(tickCount,tickMissed) || @any(blockedTasks,mprt,task).(blockedTasks = {bTask | bTask: tasks & task_state(bTask) = blocked & tickCount<=task_value(bTask) & task_value(bTask)<=TICK_INCREMENT(tickCount,tickMissed)} & mprt: PRIORITY & mprt = max(ran(dom(UNBLOCK_TASKS(blockedTasks))<|task_priority)) & task: dom(UNBLOCK_TASKS(blockedTasks)) & task: dom(task_priority) & task_priority(task) = mprt ==> (mprt>max_priority ==> task_state,current_task,max_priority:=task_state<+UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running},task,mprt [] not(mprt>max_priority) ==> task_state:=task_state<+UNBLOCK_TASKS(blockedTasks)))) [] not(scheduler = taskSCHEDULER_SUSPENDED) ==> skip);
  Seen_List_Precondition(Machine(Queue_Basic),vTaskSuspendAll)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),vTaskSuspendAll)==(scheduler:=taskSCHEDULER_SUSPENDED);
  Seen_List_Precondition(Machine(Queue_Basic),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),vTaskEndScheduler)==(tasks,task_name,task_state,task_priority,task_value,current_task,max_priority,scheduler:={TASK_NULL},{TASK_NULL|->NAME_NULL},{TASK_NULL|->running},{TASK_NULL|->0},{TASK_NULL|->0},TASK_NULL,0,taskSCHEDULER_NOT_STARTED);
  Seen_List_Precondition(Machine(Queue_Basic),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),vTaskStartScheduler)==(@any(idle_name,idle_task).(idle_name: NAME & idle_task: TASK & idle_task/:tasks ==> (tasks,task_name,task_priority,task_value:=tasks\/{idle_task},task_name\/{idle_task|->idle_name},task_priority\/{idle_task|->tskIDLE_PRIORITY},task_value\/{idle_task|->0} || (tasks = {TASK_NULL} ==> task_state:=task_state<+{idle_task|->running} [] not(tasks = {TASK_NULL}) ==> task_state:=task_state<+{idle_task|->ready}))) || tickCount:=0 || tickMissed:=0 [] skip);
  Seen_List_Precondition(Machine(Queue_Basic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),xTaskGetTickCount)==(zz:=tickCount);
  Seen_List_Precondition(Machine(Queue_Basic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & INCLUDE_vTaskDelayUntil = 1);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),vTaskDelayUntil)==(@any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)},ctk,mprt) [] skip);
  Seen_List_Precondition(Machine(Queue_Basic),vTaskDelay)==(xTicksToDelay: TICK & not(xTicksToDelay = 0) & INCLUDE_vTaskDelay = 1);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),vTaskDelay)==(@any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToDelay)},ctk,mprt));
  Seen_List_Precondition(Machine(Queue_Basic),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),xTaskGetSchedulerState)==(xReturn:=scheduler);
  Seen_List_Precondition(Machine(Queue_Basic),uxTaskGetNumberOfTasks)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),uxTaskGetNumberOfTasks)==(numberOfTasks:=card(tasks));
  Seen_List_Precondition(Machine(Queue_Basic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),xTaskGetCurrentTaskHandle)==(rr:=current_task);
  Seen_List_Precondition(Machine(Queue_Basic),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),uxTaskPriorityGet)==(priority:=task_priority(pxTask));
  Seen_List_Precondition(Machine(Queue_Basic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: tasks & task_state(pxTaskToResume) = suspended);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),vTaskResume)==(task_priority(pxTaskToResume)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready}<+{pxTaskToResume|->running},pxTaskToResume,task_priority(pxTaskToResume) [] not(task_priority(pxTaskToResume)>max_priority) ==> task_state:=task_state<+{pxTaskToResume|->ready});
  Seen_List_Precondition(Machine(Queue_Basic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),vTaskSuspend)==(not(task_state(pxTaskToSuspend) = suspended) ==> (pxTaskToSuspend = current_task ==> @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToSuspend}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,current_task,max_priority:=task_state<+{pxTaskToSuspend|->suspended}<+{ctk|->running},ctk,mprt) [] not(pxTaskToSuspend = current_task) ==> task_state:=task_state<+{pxTaskToSuspend|->suspended} || rr:=pdTRUE) [] not(not(task_state(pxTaskToSuspend) = suspended)) ==> rr:=pdFALSE);
  Seen_List_Precondition(Machine(Queue_Basic),deleteTask)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & task_state(pxTaskToDelete)/=deleted);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),deleteTask)==(tasks,task_name:=tasks-{pxTaskToDelete},{pxTaskToDelete}<<|task_name || (pxTaskToDelete = current_task ==> @any(mpriority,ctk).(mpriority: PRIORITY & mpriority = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToDelete}<<|task_priority) & task_priority(ctk) = mpriority & task_state(ctk) = ready ==> task_state,max_priority,current_task:={current_task}<<|task_state<+{ctk|->running},mpriority,ctk) [] not(pxTaskToDelete = current_task) ==> task_state:={pxTaskToDelete}<<|task_state) || task_priority:={pxTaskToDelete}<<|task_priority || task_value:={pxTaskToDelete}<<|task_value);
  Seen_List_Precondition(Machine(Queue_Basic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters <: PARAMETER & uxPriority: PRIORITY);
  Seen_Expanded_List_Substitution(Machine(Queue_Basic),xTaskCreate)==(@any(task).(task: TASK & task/:tasks ==> (tasks,task_name,task_value:=tasks\/{task},task_name\/{task|->pcName},task_value\/{task|->0} || (uxPriority>max_priority ==> task_state,max_priority,current_task:=task_state<+{current_task|->ready}\/{task|->running},uxPriority,task [] not(uxPriority>max_priority) ==> task_state:=task_state<+{task|->ready}) || task_priority:=task_priority\/{task|->uxPriority} || zz,handle:=pdPASS,task)) [] zz,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL);
  Seen_List_Operations(Machine(Queue_Basic),Machine(Task_Basic))==(xTaskCreate,deleteTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,removeFromBlockedList);
  Seen_Expanded_List_Invariant(Machine(Queue_Basic),Machine(Task_Basic))==(btrue);
  Seen_Internal_List_Operations(Machine(Queue_Basic),Machine(Types))==(?);
  Seen_List_Operations(Machine(Queue_Basic),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Queue_Basic),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Queue_Basic),xQueueCreate)==(Var(queue) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(Queue_Basic),sendItem)==(?);
  List_ANY_Var(Machine(Queue_Basic),insertTaskWaitingToSend)==(?);
  List_ANY_Var(Machine(Queue_Basic),insertTaskWaitingToRecived)==(?);
  List_ANY_Var(Machine(Queue_Basic),recivedItem)==(Var(item) == atype(ITEM,?,?));
  List_ANY_Var(Machine(Queue_Basic),removeFromEventListQueue)==((Var(queuesTask) == SetOf(atype(QUEUE,?,?))),(Var(q_tkRecived) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))),(Var(q_tkSend) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));
  List_ANY_Var(Machine(Queue_Basic),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Queue_Basic)) == (QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | ? | queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues | ? | xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,recivedItem,removeFromEventListQueue | ? | seen(Machine(Types)),seen(Machine(Task_Basic)) | ? | Queue_Basic);
  List_Of_HiddenCst_Ids(Machine(Queue_Basic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue_Basic)) == (QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(Queue_Basic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue_Basic)) == (?: ?);
  List_Of_Ids(Machine(Task_Basic)) == (PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS,TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK,running,blocked,ready,suspended,deleted,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks | ? | xTaskCreate,deleteTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,removeFromBlockedList | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task_Basic);
  List_Of_HiddenCst_Ids(Machine(Task_Basic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task_Basic)) == (PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS);
  List_Of_VisibleVar_Ids(Machine(Task_Basic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task_Basic)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,POINTER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Queue_Basic)) == (Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM")));Type(COPY_POSITION) == Cst(SetOf(atype(COPY_POSITION,"[COPY_POSITION","]COPY_POSITION")));Type(QUEUE) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Queue_Basic)) == (Type(QUEUE_NULL) == Cst(atype(QUEUE,?,?));Type(ITEM_NULL) == Cst(atype(ITEM,?,?));Type(QUEUE_ISFULL) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")*SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?)))*SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?))*btype(BOOL,0,1)));Type(QUEUE_ISEMPTY) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")*SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?)))*btype(BOOL,0,1)));Type(QUEUES_WITH_TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK")*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))));Type(REMOVE_EVENT) == Cst(SetOf(atype(TASK,"[TASK","]TASK")*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Queue_Basic)) == (Type(queue_length) == Mvl(SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?)));Type(queue_tkSend) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_tkRecived) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_itens) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Queue_Basic)) == (Type(removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(recivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToRecived) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*atype(COPY_POSITION,?,?));Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
