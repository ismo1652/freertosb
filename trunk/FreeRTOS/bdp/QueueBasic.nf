Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(QueueBasic))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(QueueBasic))==(Machine(QueueBasic));
  Level(Machine(QueueBasic))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(QueueBasic)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(QueueBasic))==(Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(QueueBasic))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(QueueBasic))==(FreeRTOSConfig,TaskCore,QueueCore);
  List_Includes(Machine(QueueBasic))==(QueueCore,TaskCore,FreeRTOSConfig)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(QueueBasic))==(xQueueCreate)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(QueueBasic))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(QueueBasic))==(?);
  Context_List_Variables(Machine(QueueBasic))==(?);
  Abstract_List_Variables(Machine(QueueBasic))==(?);
  Local_List_Variables(Machine(QueueBasic))==(?);
  List_Variables(Machine(QueueBasic))==(queue_sending,queue_receiving,queue_items,queues,suspended,ready,running,blocked,tasks);
  External_List_Variables(Machine(QueueBasic))==(queue_sending,queue_receiving,queue_items,queues,suspended,ready,running,blocked,tasks)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(QueueBasic))==(?);
  Abstract_List_VisibleVariables(Machine(QueueBasic))==(?);
  External_List_VisibleVariables(Machine(QueueBasic))==(?);
  Expanded_List_VisibleVariables(Machine(QueueBasic))==(?);
  List_VisibleVariables(Machine(QueueBasic))==(?);
  Internal_List_VisibleVariables(Machine(QueueBasic))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(QueueBasic))==(btrue);
  Gluing_List_Invariant(Machine(QueueBasic))==(btrue);
  Abstract_List_Invariant(Machine(QueueBasic))==(btrue);
  Expanded_List_Invariant(Machine(QueueBasic))==(queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending) & tasks: FIN(TASK) & {TASK_NULL} <: tasks & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & running: TASK & running: tasks & running/:ready & running/:blocked & running/:suspended & TASK_NULL/:suspended & TASK_NULL/:ready & TASK_NULL/:blocked & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {} & tasks = {running}\/suspended\/blocked\/ready\/{TASK_NULL});
  Context_List_Invariant(Machine(QueueBasic))==(btrue);
  List_Invariant(Machine(QueueBasic))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(QueueBasic))==(btrue);
  Expanded_List_Assertions(Machine(QueueBasic))==(btrue);
  Context_List_Assertions(Machine(QueueBasic))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(QueueBasic))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(QueueBasic))==(queues,queue_items,queue_receiving,queue_sending:={},{},{},{};tasks,running,blocked,ready,suspended:={TASK_NULL},TASK_NULL,{},{},{});
  Context_List_Initialisation(Machine(QueueBasic))==(skip);
  List_Initialisation(Machine(QueueBasic))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(QueueBasic))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(QueueBasic),Machine(QueueCore))==(?);
  List_Instanciated_Parameters(Machine(QueueBasic),Machine(TaskCore))==(?);
  List_Instanciated_Parameters(Machine(QueueBasic),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Machine(QueueBasic),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(QueueBasic),Machine(FreeRTOSConfig))==(btrue);
  List_Context_Constraints(Machine(QueueBasic))==(btrue);
  List_Constraints(Machine(QueueBasic))==(btrue);
  List_Constraints(Machine(QueueBasic),Machine(TaskCore))==(btrue);
  List_Constraints(Machine(QueueBasic),Machine(QueueCore))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(QueueBasic))==(xQueueGenericSend,xQueueGenericReceive,xQueueCreate);
  List_Operations(Machine(QueueBasic))==(xQueueGenericSend,xQueueGenericReceive,xQueueCreate)
END
&
THEORY ListInputX IS
  List_Input(Machine(QueueBasic),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(QueueBasic),xQueueGenericSend)==(pxQueue,pvItemToQueue,xTicksToWait,copy_position);
  List_Input(Machine(QueueBasic),xQueueGenericReceive)==(xQueue,xTicksToWait,justPeeking)
END
&
THEORY ListOutputX IS
  List_Output(Machine(QueueBasic),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(QueueBasic),xQueueGenericSend)==(return);
  List_Output(Machine(QueueBasic),xQueueGenericReceive)==(return,pvBuffer)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(QueueBasic),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(QueueBasic),xQueueGenericSend)==(return <-- xQueueGenericSend(pxQueue,pvItemToQueue,xTicksToWait,copy_position));
  List_Header(Machine(QueueBasic),xQueueGenericReceive)==(return,pvBuffer <-- xQueueGenericReceive(xQueue,xTicksToWait,justPeeking))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(QueueBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(QueueBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(QueueBasic),xQueueGenericSend)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & running/=TASK_NULL);
  List_Precondition(Machine(QueueBasic),xQueueGenericReceive)==(xQueue: queues & xTicksToWait: TICK & justPeeking: BIT & running/=TASK_NULL)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(QueueBasic),xQueueGenericReceive)==(xQueue: queues & xTicksToWait: TICK & justPeeking: BIT & running/=TASK_NULL | xTicksToWait>0 ==> (xQueue: queues & running: TASK & xTicksToWait: TICK & not(xTicksToWait = 0) & running/=TASK_NULL | queue_receiving:=queue_receiving<+{xQueue|->(queue_receiving(xQueue)\/{running})} || (ready = {} ==> blocked,running:=blocked\/{running},TASK_NULL [] not(ready = {}) ==> @task.(task: TASK & task: ready ==> blocked,ready,running:=blocked\/{running},ready-{task},task)) || return,pvBuffer:=pdTRUE,ITEM_NULL [] (@task.(task: TASK & task: queue_sending(xQueue) & task: blocked ==> (xQueue: queues & justPeeking: BIT & task: TASK & task: queue_sending(xQueue) | @item.(item: ITEM & item: queue_items(xQueue) ==> (justPeeking = pdFALSE ==> queue_items,queue_sending:=queue_items<+{xQueue|->queue_items(xQueue)-{item}},queue_sending<+{xQueue|->queue_sending(xQueue)-{task}} [] not(justPeeking = pdFALSE) ==> skip || pvBuffer:=item)) || (justPeeking = pdFALSE ==> (task: TASK & task: blocked | running = TASK_NULL ==> running:=task [] not(running = TASK_NULL) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task}) [] not(justPeeking = pdFALSE) ==> skip))) || return:=pdPASS)) [] not(xTicksToWait>0) ==> (@task.(task: TASK & task: queue_sending(xQueue) & task: blocked ==> (xQueue: queues & justPeeking: BIT & task: TASK & task: queue_sending(xQueue) | @item.(item: ITEM & item: queue_items(xQueue) ==> (justPeeking = pdFALSE ==> queue_items,queue_sending:=queue_items<+{xQueue|->queue_items(xQueue)-{item}},queue_sending<+{xQueue|->queue_sending(xQueue)-{task}} [] not(justPeeking = pdFALSE) ==> skip || pvBuffer:=item)) || (justPeeking = pdFALSE ==> (task: TASK & task: blocked | running = TASK_NULL ==> running:=task [] not(running = TASK_NULL) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task}) [] not(justPeeking = pdFALSE) ==> skip))) || return:=pdPASS [] return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL));
  Expanded_List_Substitution(Machine(QueueBasic),xQueueGenericSend)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & running/=TASK_NULL | xTicksToWait>0 ==> (pxQueue: queues & running: TASK & xTicksToWait: TICK & not(xTicksToWait = 0) & running/=TASK_NULL | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{running})} || (ready = {} ==> blocked,running:=blocked\/{running},TASK_NULL [] not(ready = {}) ==> @task.(task: TASK & task: ready ==> blocked,ready,running:=blocked\/{running},ready-{task},task)) || return:=pdTRUE [] @task.(task: TASK & task: blocked & task: queue_receiving(pxQueue) ==> (pxQueue: queues & pvItemToQueue: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & task: TASK & task: blocked | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pvItemToQueue})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}} || (running = TASK_NULL ==> running:=task [] not(running = TASK_NULL) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task}) || return:=pdPASS))) [] not(xTicksToWait>0) ==> (@task.(task: TASK & task: blocked & task: queue_receiving(pxQueue) ==> (pxQueue: queues & pvItemToQueue: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & task: TASK & task: blocked | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pvItemToQueue})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}} || (running = TASK_NULL ==> running:=task [] not(running = TASK_NULL) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task}) || return:=pdPASS)) [] return:=errQUEUE_FULL));
  List_Substitution(Machine(QueueBasic),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_items:=queue_items\/{queue|->{}} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  Expanded_List_Substitution(Machine(QueueBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @queue.(queue: QUEUE & queue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{queue},queue_items\/{queue|->{}},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(QueueBasic),xQueueGenericSend)==(IF xTicksToWait>0 THEN CHOICE insertTaskWaitingToSend(pxQueue,running) || t_delayTask(xTicksToWait) || return:=pdTRUE OR ANY task WHERE task: TASK & task: blocked & task: queue_receiving(pxQueue) THEN sendItem(pxQueue,pvItemToQueue,task,copy_position) || t_unblock(task) || return:=pdPASS END END ELSE CHOICE ANY task WHERE task: TASK & task: blocked & task: queue_receiving(pxQueue) THEN sendItem(pxQueue,pvItemToQueue,task,copy_position) || t_unblock(task) || return:=pdPASS END OR return:=errQUEUE_FULL END END);
  List_Substitution(Machine(QueueBasic),xQueueGenericReceive)==(IF xTicksToWait>0 THEN CHOICE insertTaskWaitingToRecived(xQueue,running) || t_delayTask(xTicksToWait) || return,pvBuffer:=pdTRUE,ITEM_NULL OR ANY task WHERE task: TASK & task: queue_sending(xQueue) & task: blocked THEN pvBuffer <-- receivedItem(xQueue,justPeeking,task) || IF justPeeking = pdFALSE THEN t_unblock(task) END END || return:=pdPASS END ELSE CHOICE ANY task WHERE task: TASK & task: queue_sending(xQueue) & task: blocked THEN pvBuffer <-- receivedItem(xQueue,justPeeking,task) || IF justPeeking = pdFALSE THEN t_unblock(task) END END || return:=pdPASS OR return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(QueueBasic))==(QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  Inherited_List_Constants(Machine(QueueBasic))==(QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Constants(Machine(QueueBasic))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(QueueBasic),TASK_CODE)==(?);
  Context_List_Enumerated(Machine(QueueBasic))==(?);
  Context_List_Defered(Machine(QueueBasic))==(NAME,PARAMETER);
  Context_List_Sets(Machine(QueueBasic))==(NAME,PARAMETER);
  List_Valuable_Sets(Machine(QueueBasic))==(ITEM,COPY_POSITION,QUEUE,TASK,STACK,TASK_CODE);
  Inherited_List_Enumerated(Machine(QueueBasic))==(?);
  Inherited_List_Defered(Machine(QueueBasic))==(ITEM,COPY_POSITION,QUEUE,TASK,STACK,TASK_CODE);
  Inherited_List_Sets(Machine(QueueBasic))==(ITEM,COPY_POSITION,QUEUE,TASK,STACK,TASK_CODE);
  List_Enumerated(Machine(QueueBasic))==(?);
  List_Defered(Machine(QueueBasic))==(?);
  List_Sets(Machine(QueueBasic))==(?);
  Set_Definition(Machine(QueueBasic),STACK)==(?);
  Set_Definition(Machine(QueueBasic),TASK)==(?);
  Set_Definition(Machine(QueueBasic),QUEUE)==(?);
  Set_Definition(Machine(QueueBasic),COPY_POSITION)==(?);
  Set_Definition(Machine(QueueBasic),ITEM)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(QueueBasic))==(?);
  Expanded_List_HiddenConstants(Machine(QueueBasic))==(?);
  List_HiddenConstants(Machine(QueueBasic))==(?);
  External_List_HiddenConstants(Machine(QueueBasic))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(QueueBasic))==(btrue);
  Context_List_Properties(Machine(QueueBasic))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Inherited_List_Properties(Machine(QueueBasic))==(QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & ITEM: FIN(INTEGER) & not(ITEM = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TASK_NULL: TASK & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & configMAX_PRIORITIES: INT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: INT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: INT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT);
  List_Properties(Machine(QueueBasic))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(QueueBasic),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(QueueBasic))==(?);
  Seen_Context_List_Invariant(Machine(QueueBasic))==(btrue);
  Seen_Context_List_Assertions(Machine(QueueBasic))==(btrue);
  Seen_Context_List_Properties(Machine(QueueBasic))==(btrue);
  Seen_List_Constraints(Machine(QueueBasic))==(btrue);
  Seen_List_Operations(Machine(QueueBasic),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(QueueBasic),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(QueueBasic),xQueueGenericSend)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(QueueBasic),xQueueGenericReceive)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(QueueBasic),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(QueueBasic)) == (? | configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil,PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,TASK,STACK,TASK_CODE,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | ? | V,suspended,ready,running,blocked,tasks,queue_sending,queue_receiving,queue_items,queues | xQueueGenericSend,xQueueGenericReceive | xQueueCreate | seen(Machine(Types)),included(Machine(QueueCore)),included(Machine(TaskCore)),included(Machine(FreeRTOSConfig)) | ? | QueueBasic);
  List_Of_HiddenCst_Ids(Machine(QueueBasic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(QueueBasic)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil,PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(QueueBasic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(QueueBasic)) == (seen(Machine(Types)): (BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(TaskCore)): (PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,TASK,STACK,TASK_CODE | ? | suspended,ready,running,blocked,tasks | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(TaskCore)) == (PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,TASK,STACK,TASK_CODE | ? | suspended,ready,running,blocked,tasks | ? | t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | TaskCore);
  List_Of_HiddenCst_Ids(Machine(TaskCore)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(TaskCore)) == (PRIORITY,TASK_NULL,TICK,TICK_INCREMENT);
  List_Of_VisibleVar_Ids(Machine(TaskCore)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(TaskCore)) == (?: ?);
  List_Of_Ids(Machine(QueueCore)) == (QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | ? | queue_sending,queue_receiving,queue_items,queues | ? | xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue | ? | seen(Machine(Types)),seen(Machine(TaskCore)) | ? | QueueCore);
  List_Of_HiddenCst_Ids(Machine(QueueCore)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(QueueCore)) == (QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(QueueCore)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(QueueCore)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(QueueBasic)) == (Type(QUEUE) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")));Type(COPY_POSITION) == Cst(SetOf(atype(COPY_POSITION,"[COPY_POSITION","]COPY_POSITION")));Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM")));Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(STACK) == Cst(SetOf(atype(STACK,"[STACK","]STACK")));Type(TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(QueueBasic)) == (Type(REMOVE_EVENT) == Cst(SetOf(atype(TASK,?,?)*SetOf(atype(QUEUE,?,?))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));Type(ITEM_NULL) == Cst(atype(ITEM,?,?));Type(QUEUE_NULL) == Cst(atype(QUEUE,?,?));Type(TICK_INCREMENT) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")));Type(TICK) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")));Type(TASK_NULL) == Cst(atype(TASK,?,?));Type(PRIORITY) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(INCLUDE_vTaskDelayUntil) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskDelay) == Cst(btype(INTEGER,?,?));Type(INCLUDE_xTaskGetCurrentTaskHandle) == Cst(btype(INTEGER,?,?));Type(INCLUDE_xTaskGetSchedulerState) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskDelete) == Cst(btype(INTEGER,?,?));Type(INCLUDE_uxTaskPriorityGet) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskSuspend) == Cst(btype(INTEGER,?,?));Type(INCLUDE_vTaskPrioritySet) == Cst(btype(INTEGER,?,?));Type(configMINIMAL_STACK_SIZE) == Cst(btype(INTEGER,?,?));Type(configTOTAL_HEAP_SIZE) == Cst(btype(INTEGER,?,?));Type(configMAX_PRIORITIES) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(QueueBasic)) == (Type(queues) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(suspended) == Mvl(SetOf(atype(TASK,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(QueueBasic)) == (Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(xQueueGenericReceive) == Cst(btype(INTEGER,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(xQueueGenericSend) == Cst(btype(INTEGER,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?)*atype(COPY_POSITION,?,?)))
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
