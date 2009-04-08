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
  List_Sees(Machine(QueueCore))==(Types,TaskCore)
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
  Context_List_Invariant(Machine(QueueCore))==(tasks: FIN(TASK) & {TASK_NULL} <: tasks & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & running: TASK & running: tasks & running/:ready & running/:blocked & running/:suspended & TASK_NULL/:suspended & TASK_NULL/:ready & TASK_NULL/:blocked & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {} & tasks = {running}\/suspended\/blocked\/ready\/{TASK_NULL});
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
  List_Instanciated_Parameters(Machine(QueueCore),Machine(TaskCore))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(QueueCore))==(btrue);
  List_Constraints(Machine(QueueCore))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(QueueCore))==(xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue);
  List_Operations(Machine(QueueCore))==(xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue)
END
&
THEORY ListInputX IS
  List_Input(Machine(QueueCore),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(QueueCore),sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Machine(QueueCore),insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Machine(QueueCore),insertTaskWaitingToRecived)==(pxQueue,pxTask);
  List_Input(Machine(QueueCore),receivedItem)==(pxQueue,justPeeking,task);
  List_Input(Machine(QueueCore),removeFromEventListQueue)==(task)
END
&
THEORY ListOutputX IS
  List_Output(Machine(QueueCore),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(QueueCore),sendItem)==(?);
  List_Output(Machine(QueueCore),insertTaskWaitingToSend)==(?);
  List_Output(Machine(QueueCore),insertTaskWaitingToRecived)==(?);
  List_Output(Machine(QueueCore),receivedItem)==(xItem);
  List_Output(Machine(QueueCore),removeFromEventListQueue)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(QueueCore),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
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
  Expanded_List_Substitution(Machine(QueueCore),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @queue.(queue: QUEUE & queue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{queue},queue_items\/{queue|->{}},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(QueueCore),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_items:=queue_items\/{queue|->{}} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  List_Substitution(Machine(QueueCore),sendItem)==(queue_items(pxQueue):=queue_items(pxQueue)\/{pxItem} || queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task});
  List_Substitution(Machine(QueueCore),insertTaskWaitingToSend)==(queue_sending(pxQueue):=queue_sending(pxQueue)\/{pxTask});
  List_Substitution(Machine(QueueCore),insertTaskWaitingToRecived)==(queue_receiving(pxQueue):=queue_receiving(pxQueue)\/{pxTask});
  List_Substitution(Machine(QueueCore),receivedItem)==(ANY item WHERE item: ITEM & item: queue_items(pxQueue) THEN IF justPeeking = pdFALSE THEN queue_items(pxQueue):=queue_items(pxQueue)-{item} || queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END || xItem:=item END);
  List_Substitution(Machine(QueueCore),removeFromEventListQueue)==(ANY receiving,sending WHERE receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) THEN queue_receiving:=queue_receiving<+receiving || queue_sending:=queue_sending<+sending END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(QueueCore))==(QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  Inherited_List_Constants(Machine(QueueCore))==(?);
  List_Constants(Machine(QueueCore))==(QUEUE_NULL,ITEM_NULL,REMOVE_EVENT)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(QueueCore),ITEM)==(?);
  Context_List_Enumerated(Machine(QueueCore))==(?);
  Context_List_Defered(Machine(QueueCore))==(NAME,PARAMETER,TASK,STACK,TASK_CODE);
  Context_List_Sets(Machine(QueueCore))==(NAME,PARAMETER,TASK,STACK,TASK_CODE);
  List_Valuable_Sets(Machine(QueueCore))==(ITEM,COPY_POSITION,QUEUE);
  Inherited_List_Enumerated(Machine(QueueCore))==(?);
  Inherited_List_Defered(Machine(QueueCore))==(?);
  Inherited_List_Sets(Machine(QueueCore))==(?);
  List_Enumerated(Machine(QueueCore))==(?);
  List_Defered(Machine(QueueCore))==(ITEM,COPY_POSITION,QUEUE);
  List_Sets(Machine(QueueCore))==(ITEM,COPY_POSITION,QUEUE);
  Set_Definition(Machine(QueueCore),COPY_POSITION)==(?);
  Set_Definition(Machine(QueueCore),QUEUE)==(?)
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
  Context_List_Properties(Machine(QueueCore))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TASK_NULL: TASK & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}));
  Inherited_List_Properties(Machine(QueueCore))==(btrue);
  List_Properties(Machine(QueueCore))==(QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & ITEM: FIN(INTEGER) & not(ITEM = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(QueueCore),Machine(TaskCore))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock);
  Seen_Context_List_Enumerated(Machine(QueueCore))==(?);
  Seen_Context_List_Invariant(Machine(QueueCore))==(btrue);
  Seen_Context_List_Assertions(Machine(QueueCore))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(QueueCore))==(configMAX_PRIORITIES: INT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: INT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: INT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Seen_List_Constraints(Machine(QueueCore))==(btrue);
  Seen_List_Precondition(Machine(QueueCore),t_unblock)==(task: TASK & task: blocked);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_unblock)==(running = TASK_NULL ==> running:=task [] not(running = TASK_NULL) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task});
  Seen_List_Precondition(Machine(QueueCore),t_resumeAll)==(tick: TICK & running/=TASK_NULL);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_resumeAll)==(@unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked/={} ==> (@task.(task: TASK & task: tasks & task: unblocked ==> running,ready:=task,ready\/{running}\/unblocked-{task}) [] ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip)));
  Seen_List_Precondition(Machine(QueueCore),t_endScheduler)==(btrue);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_endScheduler)==(tasks,running,blocked,suspended,ready:={TASK_NULL},TASK_NULL,{},{},{});
  Seen_List_Precondition(Machine(QueueCore),t_startScheduler)==(running = TASK_NULL);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_startScheduler)==(@(idle_name,idle_task).(idle_name: NAME & idle_task: TASK & idle_task/:tasks ==> (tasks:=tasks\/{idle_task} || (ready = {} ==> running:=idle_task [] not(ready = {}) ==> @task.(task: ready ==> running,ready:=task,(ready\/{idle_task})-{task})))));
  Seen_List_Precondition(Machine(QueueCore),t_delayTask)==(ticks: TICK & not(ticks = 0) & running/=TASK_NULL);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_delayTask)==(ready = {} ==> blocked,running:=blocked\/{running},TASK_NULL [] not(ready = {}) ==> @task.(task: TASK & task: ready ==> blocked,ready,running:=blocked\/{running},ready-{task},task));
  Seen_List_Precondition(Machine(QueueCore),t_getNumberOfTasks)==(btrue);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_getNumberOfTasks)==(result:=card(tasks));
  Seen_List_Precondition(Machine(QueueCore),t_getCurrent)==(btrue);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_getCurrent)==(result:=running);
  Seen_List_Precondition(Machine(QueueCore),t_getPriority)==(atask: tasks);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_getPriority)==(@(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Seen_List_Precondition(Machine(QueueCore),t_resume)==(suspended/={} & atask: TASK & atask: suspended & running/=TASK_NULL);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_resume)==(ready,running:=ready\/{running},atask [] ready:=ready\/{atask} || suspended:=suspended-{atask});
  Seen_List_Precondition(Machine(QueueCore),t_suspend)==(atask: TASK & atask: tasks & atask/:suspended & atask/=TASK_NULL);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_suspend)==(atask = running ==> (ready = {} ==> @task.(task: TASK & task: ready ==> running,ready:=task,ready-{task}) [] not(ready = {}) ==> running:=TASK_NULL) [] not(atask = running) ==> (atask: ready ==> ready:=ready-{atask} [] not(atask: ready) ==> (atask: blocked ==> blocked:=blocked-{atask} [] not(atask: blocked) ==> skip)) || suspended:=suspended\/{atask});
  Seen_List_Precondition(Machine(QueueCore),t_delete)==(atask: TASK & atask: tasks & atask/=TASK_NULL & tasks/={atask});
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_delete)==(tasks:=tasks-{atask} || (atask = running ==> (@task.(task: TASK & task: ready ==> running,ready:=task,ready-{task}) [] running:=TASK_NULL) [] not(atask = running) ==> (atask: ready ==> ready:=ready-{atask} [] not(atask: ready) ==> (atask: blocked ==> blocked:=blocked-{atask} [] not(atask: blocked) ==> (atask: suspended ==> suspended:=suspended-{atask} [] not(atask: suspended) ==> skip)))));
  Seen_List_Precondition(Machine(QueueCore),t_create)==(priority: PRIORITY & running = TASK_NULL);
  Seen_Expanded_List_Substitution(Machine(QueueCore),t_create)==(@task.(task: TASK & task/:tasks ==> tasks,ready,result:={task}\/tasks,{task}\/ready,task));
  Seen_List_Operations(Machine(QueueCore),Machine(TaskCore))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock);
  Seen_Expanded_List_Invariant(Machine(QueueCore),Machine(TaskCore))==(btrue);
  Seen_Internal_List_Operations(Machine(QueueCore),Machine(Types))==(?);
  Seen_List_Operations(Machine(QueueCore),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(QueueCore),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(QueueCore),xQueueCreate)==(Var(queue) == atype(QUEUE,?,?));
  List_ANY_Var(Machine(QueueCore),sendItem)==(?);
  List_ANY_Var(Machine(QueueCore),insertTaskWaitingToSend)==(?);
  List_ANY_Var(Machine(QueueCore),insertTaskWaitingToRecived)==(?);
  List_ANY_Var(Machine(QueueCore),receivedItem)==(Var(item) == atype(ITEM,?,?));
  List_ANY_Var(Machine(QueueCore),removeFromEventListQueue)==((Var(receiving) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))),(Var(sending) == SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));
  List_ANY_Var(Machine(QueueCore),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(QueueCore)) == (QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | ? | queue_sending,queue_receiving,queue_items,queues | ? | xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue | ? | seen(Machine(Types)),seen(Machine(TaskCore)) | ? | QueueCore);
  List_Of_HiddenCst_Ids(Machine(QueueCore)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(QueueCore)) == (QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(QueueCore)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(QueueCore)) == (?: ?);
  List_Of_Ids(Machine(TaskCore)) == (PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,TASK,STACK,TASK_CODE | ? | suspended,ready,running,blocked,tasks | ? | t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | TaskCore);
  List_Of_HiddenCst_Ids(Machine(TaskCore)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(TaskCore)) == (PRIORITY,TASK_NULL,TICK,TICK_INCREMENT);
  List_Of_VisibleVar_Ids(Machine(TaskCore)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(TaskCore)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(QueueCore)) == (Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM")));Type(COPY_POSITION) == Cst(SetOf(atype(COPY_POSITION,"[COPY_POSITION","]COPY_POSITION")));Type(QUEUE) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(QueueCore)) == (Type(QUEUE_NULL) == Cst(atype(QUEUE,?,?));Type(ITEM_NULL) == Cst(atype(ITEM,?,?));Type(REMOVE_EVENT) == Cst(SetOf(atype(TASK,?,?)*SetOf(atype(QUEUE,?,?))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(QueueCore)) == (Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(QueueCore)) == (Type(removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(receivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToRecived) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*atype(COPY_POSITION,?,?));Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
