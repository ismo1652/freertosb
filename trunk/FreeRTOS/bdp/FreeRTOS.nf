Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(FreeRTOS))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(FreeRTOS))==(Machine(FreeRTOS));
  Level(Machine(FreeRTOS))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(FreeRTOS)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(FreeRTOS))==(Types,FreeRTOSConfig)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(FreeRTOS))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(FreeRTOS))==(FreeRTOSBasic,Queue,Task,Scheduler);
  List_Includes(Machine(FreeRTOS))==(FreeRTOSBasic)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(FreeRTOS))==(xQueueCreate,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,vQueueDelete,vTaskPrioritySet)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(FreeRTOS))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(FreeRTOS))==(?);
  Context_List_Variables(Machine(FreeRTOS))==(?);
  Abstract_List_Variables(Machine(FreeRTOS))==(?);
  Local_List_Variables(Machine(FreeRTOS))==(?);
  List_Variables(Machine(FreeRTOS))==(tickMissed,tickCount,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues,idle,pending,running,suspended,ready,blocked,tasks,active,schedulerSuspended,schedulerRunning);
  External_List_Variables(Machine(FreeRTOS))==(tickMissed,tickCount,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues,idle,pending,running,suspended,ready,blocked,tasks,active,schedulerSuspended,schedulerRunning)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(FreeRTOS))==(?);
  Abstract_List_VisibleVariables(Machine(FreeRTOS))==(?);
  External_List_VisibleVariables(Machine(FreeRTOS))==(?);
  Expanded_List_VisibleVariables(Machine(FreeRTOS))==(?);
  List_VisibleVariables(Machine(FreeRTOS))==(?);
  Internal_List_VisibleVariables(Machine(FreeRTOS))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(FreeRTOS))==(btrue);
  Gluing_List_Invariant(Machine(FreeRTOS))==(btrue);
  Abstract_List_Invariant(Machine(FreeRTOS))==(btrue);
  Expanded_List_Invariant(Machine(FreeRTOS))==(tickCount: TICK & tickMissed: TICK & schedulerRunning = active & ran(mutex_holder) <: tasks-{idle}\/{TASK_NULL} & !mt.(mt: queues & mt: mutexes & queue_items(mt) = {} => mutex_holder(mt): tasks & mutex_holder(mt)/=idle) & !(que,task).(que: queues & task: TASK & task: queue_sending(que) => task: blocked) & !(que,task).(que: queues & task: TASK & task: queue_receiving(que) => task: blocked) & queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & semaphores: POW(QUEUE) & semaphores <: queues & mutexes: POW(QUEUE) & mutexes <: queues & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_receiving(q1) => tk/:queue_sending(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_sending(q2) => tk/:queue_receiving(q1)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_receiving(q1) => tk/:queue_receiving(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_sending(q1) => tk/:queue_sending(q2)) & mutex_holder: QUEUE +-> TASK & mutexes = dom(mutex_holder) & !mt.(mt: mutexes & queue_items(mt) = {} => mutex_holder(mt)/=TASK_NULL) & !mt.(mt: mutexes & queue_items(mt)/={} => mutex_holder(mt) = TASK_NULL) & !mt.(mt: mutexes => queue_items(mt) = {} or queue_items(mt) = {ITEM_EMPTY}) & active: BOOL & tasks: FIN(TASK) & idle: TASK & TASK_NULL/:tasks & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & pending: FIN(TASK) & pending <: suspended\/blocked & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {} & tasks = suspended\/blocked\/ready & running: TASK & (active = TRUE => ready/={} & running: ready & idle: ready) & schedulerRunning: BOOL & schedulerSuspended: NATURAL);
  Context_List_Invariant(Machine(FreeRTOS))==(btrue);
  List_Invariant(Machine(FreeRTOS))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(FreeRTOS))==(btrue);
  Expanded_List_Assertions(Machine(FreeRTOS))==(!que.(que: QUEUE & que/:queues => que/:mutexes) & !mt.(mt: mutexes & queue_items(mt)/={} => queue_items(mt) = {ITEM_EMPTY}) & !mt.(mt: mutexes & queue_items(mt)/={ITEM_EMPTY} => queue_items(mt) = {}) & (active = TRUE => tasks/={};active = TRUE => idle: tasks;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => running: tasks;active = TRUE => running/:blocked;active = TRUE => running/:suspended));
  Context_List_Assertions(Machine(FreeRTOS))==(BIT <: NATURAL & configMAX_PRIORITIES: NATURAL);
  List_Assertions(Machine(FreeRTOS))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(FreeRTOS))==(queues,queue_items,queue_receiving,queue_sending,semaphores,mutexes,mutex_holder:={},{},{},{},{},{},{};(active,tasks:=FALSE,{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0) || blocked,ready,suspended,pending:={},{},{},{});schedulerRunning,schedulerSuspended:=FALSE,0;tickCount,tickMissed:=0,0);
  Context_List_Initialisation(Machine(FreeRTOS))==(skip);
  List_Initialisation(Machine(FreeRTOS))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(FreeRTOS))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(FreeRTOS),Machine(FreeRTOSBasic))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOS),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOS),Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(FreeRTOS),Machine(FreeRTOSBasic))==(btrue);
  List_Context_Constraints(Machine(FreeRTOS))==(btrue);
  List_Constraints(Machine(FreeRTOS))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(FreeRTOS))==(xQueueSendToBack,xQueueSend,xQueueSendToFront,xQueueReceive,xQueuePeek,xSemaphoreGive,xSemaphoreTake,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,vQueueDelete,vTaskPrioritySet,xQueueCreate);
  List_Operations(Machine(FreeRTOS))==(xQueueSendToBack,xQueueSend,xQueueSendToFront,xQueueReceive,xQueuePeek,xSemaphoreGive,xSemaphoreTake,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,vQueueDelete,vTaskPrioritySet,xQueueCreate)
END
&
THEORY ListInputX IS
  List_Input(Machine(FreeRTOS),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(FreeRTOS),vTaskPrioritySet)==(pxTask,uxNewPriority);
  List_Input(Machine(FreeRTOS),vQueueDelete)==(pxQueue);
  List_Input(Machine(FreeRTOS),xTaskResumeAll)==(?);
  List_Input(Machine(FreeRTOS),vTaskSuspendAll)==(?);
  List_Input(Machine(FreeRTOS),vTaskEndScheduler)==(?);
  List_Input(Machine(FreeRTOS),vTaskStartScheduler)==(?);
  List_Input(Machine(FreeRTOS),xTaskGetTickCount)==(?);
  List_Input(Machine(FreeRTOS),vTaskDelayUntil)==(pxPreviousWakeTime,xTimeIncrement);
  List_Input(Machine(FreeRTOS),vTaskDelay)==(xTicksToDelay);
  List_Input(Machine(FreeRTOS),uxTaskGetNumberOfTasks)==(?);
  List_Input(Machine(FreeRTOS),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Machine(FreeRTOS),uxTaskPriorityGet)==(pxTask);
  List_Input(Machine(FreeRTOS),vTaskResume)==(pxTaskToResume);
  List_Input(Machine(FreeRTOS),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Machine(FreeRTOS),vTaskDelete)==(pxTaskToDelete);
  List_Input(Machine(FreeRTOS),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Machine(FreeRTOS),xQueueSendToBack)==(queue,item,ticks);
  List_Input(Machine(FreeRTOS),xQueueSend)==(queue,item,ticks);
  List_Input(Machine(FreeRTOS),xQueueSendToFront)==(queue,item,ticks);
  List_Input(Machine(FreeRTOS),xQueueReceive)==(queue,ticks);
  List_Input(Machine(FreeRTOS),xQueuePeek)==(queue,ticks);
  List_Input(Machine(FreeRTOS),xSemaphoreGive)==(xSemaphore);
  List_Input(Machine(FreeRTOS),xSemaphoreTake)==(xSemaphore,xBlockTime)
END
&
THEORY ListOutputX IS
  List_Output(Machine(FreeRTOS),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(FreeRTOS),vTaskPrioritySet)==(?);
  List_Output(Machine(FreeRTOS),vQueueDelete)==(?);
  List_Output(Machine(FreeRTOS),xTaskResumeAll)==(?);
  List_Output(Machine(FreeRTOS),vTaskSuspendAll)==(?);
  List_Output(Machine(FreeRTOS),vTaskEndScheduler)==(?);
  List_Output(Machine(FreeRTOS),vTaskStartScheduler)==(?);
  List_Output(Machine(FreeRTOS),xTaskGetTickCount)==(numberOfTicks);
  List_Output(Machine(FreeRTOS),vTaskDelayUntil)==(?);
  List_Output(Machine(FreeRTOS),vTaskDelay)==(?);
  List_Output(Machine(FreeRTOS),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Machine(FreeRTOS),xTaskGetCurrentTaskHandle)==(cTask);
  List_Output(Machine(FreeRTOS),uxTaskPriorityGet)==(priority);
  List_Output(Machine(FreeRTOS),vTaskResume)==(?);
  List_Output(Machine(FreeRTOS),vTaskSuspend)==(rr);
  List_Output(Machine(FreeRTOS),vTaskDelete)==(?);
  List_Output(Machine(FreeRTOS),xTaskCreate)==(result,handle);
  List_Output(Machine(FreeRTOS),xQueueSendToBack)==(return);
  List_Output(Machine(FreeRTOS),xQueueSend)==(return);
  List_Output(Machine(FreeRTOS),xQueueSendToFront)==(return);
  List_Output(Machine(FreeRTOS),xQueueReceive)==(return,item);
  List_Output(Machine(FreeRTOS),xQueuePeek)==(return,item);
  List_Output(Machine(FreeRTOS),xSemaphoreGive)==(return);
  List_Output(Machine(FreeRTOS),xSemaphoreTake)==(return,item)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(FreeRTOS),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(FreeRTOS),vTaskPrioritySet)==(vTaskPrioritySet(pxTask,uxNewPriority));
  List_Header(Machine(FreeRTOS),vQueueDelete)==(vQueueDelete(pxQueue));
  List_Header(Machine(FreeRTOS),xTaskResumeAll)==(xTaskResumeAll);
  List_Header(Machine(FreeRTOS),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(FreeRTOS),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(FreeRTOS),vTaskStartScheduler)==(vTaskStartScheduler);
  List_Header(Machine(FreeRTOS),xTaskGetTickCount)==(numberOfTicks <-- xTaskGetTickCount);
  List_Header(Machine(FreeRTOS),vTaskDelayUntil)==(vTaskDelayUntil(pxPreviousWakeTime,xTimeIncrement));
  List_Header(Machine(FreeRTOS),vTaskDelay)==(vTaskDelay(xTicksToDelay));
  List_Header(Machine(FreeRTOS),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Machine(FreeRTOS),xTaskGetCurrentTaskHandle)==(cTask <-- xTaskGetCurrentTaskHandle);
  List_Header(Machine(FreeRTOS),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Machine(FreeRTOS),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Machine(FreeRTOS),vTaskSuspend)==(rr <-- vTaskSuspend(pxTaskToSuspend));
  List_Header(Machine(FreeRTOS),vTaskDelete)==(vTaskDelete(pxTaskToDelete));
  List_Header(Machine(FreeRTOS),xTaskCreate)==(result,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Machine(FreeRTOS),xQueueSendToBack)==(return <-- xQueueSendToBack(queue,item,ticks));
  List_Header(Machine(FreeRTOS),xQueueSend)==(return <-- xQueueSend(queue,item,ticks));
  List_Header(Machine(FreeRTOS),xQueueSendToFront)==(return <-- xQueueSendToFront(queue,item,ticks));
  List_Header(Machine(FreeRTOS),xQueueReceive)==(return,item <-- xQueueReceive(queue,ticks));
  List_Header(Machine(FreeRTOS),xQueuePeek)==(return,item <-- xQueuePeek(queue,ticks));
  List_Header(Machine(FreeRTOS),xSemaphoreGive)==(return <-- xSemaphoreGive(xSemaphore));
  List_Header(Machine(FreeRTOS),xSemaphoreTake)==(return,item <-- xSemaphoreTake(xSemaphore,xBlockTime))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(FreeRTOS),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(FreeRTOS),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  Own_Precondition(Machine(FreeRTOS),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle);
  List_Precondition(Machine(FreeRTOS),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle);
  Own_Precondition(Machine(FreeRTOS),vQueueDelete)==(pxQueue: queues);
  List_Precondition(Machine(FreeRTOS),vQueueDelete)==(pxQueue: queues);
  Own_Precondition(Machine(FreeRTOS),xTaskResumeAll)==(schedulerSuspended>0);
  List_Precondition(Machine(FreeRTOS),xTaskResumeAll)==(schedulerSuspended>0);
  Own_Precondition(Machine(FreeRTOS),vTaskSuspendAll)==(schedulerSuspended<MAXINT);
  List_Precondition(Machine(FreeRTOS),vTaskSuspendAll)==(schedulerSuspended<MAXINT);
  Own_Precondition(Machine(FreeRTOS),vTaskEndScheduler)==(schedulerRunning = TRUE);
  List_Precondition(Machine(FreeRTOS),vTaskEndScheduler)==(schedulerRunning = TRUE);
  Own_Precondition(Machine(FreeRTOS),vTaskStartScheduler)==(blocked = {} & suspended = {} & ready = {} & active = FALSE);
  List_Precondition(Machine(FreeRTOS),vTaskStartScheduler)==(blocked = {} & suspended = {} & ready = {} & active = FALSE);
  Own_Precondition(Machine(FreeRTOS),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(FreeRTOS),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  Own_Precondition(Machine(FreeRTOS),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1);
  List_Precondition(Machine(FreeRTOS),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1);
  Own_Precondition(Machine(FreeRTOS),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) & running: ready);
  List_Precondition(Machine(FreeRTOS),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) & running: ready);
  Own_Precondition(Machine(FreeRTOS),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(FreeRTOS),uxTaskGetNumberOfTasks)==(btrue);
  Own_Precondition(Machine(FreeRTOS),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(FreeRTOS),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  Own_Precondition(Machine(FreeRTOS),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(FreeRTOS),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  Own_Precondition(Machine(FreeRTOS),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & pxTaskToResume/:pending);
  List_Precondition(Machine(FreeRTOS),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & pxTaskToResume/:pending);
  Own_Precondition(Machine(FreeRTOS),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle);
  List_Precondition(Machine(FreeRTOS),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle);
  Own_Precondition(Machine(FreeRTOS),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder));
  List_Precondition(Machine(FreeRTOS),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder));
  Own_Precondition(Machine(FreeRTOS),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY);
  List_Precondition(Machine(FreeRTOS),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY);
  List_Precondition(Machine(FreeRTOS),xQueueSendToBack)==(queue: queues & item: ITEM & ticks: TICK & active = TRUE & running/=idle);
  List_Precondition(Machine(FreeRTOS),xQueueSend)==(queue: queues & item: ITEM & ticks: TICK & active = TRUE & running/=idle);
  List_Precondition(Machine(FreeRTOS),xQueueSendToFront)==(queue: queues & item: ITEM & ticks: TICK & active = TRUE & running/=idle);
  List_Precondition(Machine(FreeRTOS),xQueueReceive)==(queue: queues & ticks: TICK & active = TRUE & running/=idle);
  List_Precondition(Machine(FreeRTOS),xQueuePeek)==(queue: queues & ticks: TICK & active = TRUE & running/=idle);
  List_Precondition(Machine(FreeRTOS),xSemaphoreGive)==(active = TRUE & xSemaphore: QUEUE & xSemaphore: queues & xSemaphore: semaphores & running/=idle);
  List_Precondition(Machine(FreeRTOS),xSemaphoreTake)==(active = TRUE & running/=idle & xSemaphore: QUEUE & xSemaphore: queues & xSemaphore: semaphores & xBlockTime: TICK)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(FreeRTOS),xSemaphoreTake)==(active = TRUE & running/=idle & xSemaphore: QUEUE & xSemaphore: queues & xSemaphore: semaphores & xBlockTime: TICK & active = TRUE & running/=idle & xSemaphore: QUEUE & xSemaphore: queues & xBlockTime: TICK & FALSE: BOOL | xBlockTime>0 ==> (queue_items(xSemaphore) = {} ==> (xSemaphore: mutexes ==> (ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) [] not(xSemaphore: mutexes) ==> (ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) || queue_receiving:=queue_receiving<+{xSemaphore|->(queue_receiving(xSemaphore)\/{running})} || return,item:=pdTRUE,ITEM_NULL) [] not(queue_items(xSemaphore) = {}) ==> (@task.(task: TASK & task: queue_sending(xSemaphore) & task: blocked & task/:pending ==> (@(item$0).(item$0: ITEM & item$0: queue_items(xSemaphore) ==> (FALSE = FALSE ==> (xSemaphore: mutexes ==> (queue_items(xSemaphore) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{xSemaphore|->running},queue_items<+{xSemaphore|->queue_items(xSemaphore)-{ITEM_EMPTY}} [] not(queue_items(xSemaphore) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{xSemaphore|->TASK_NULL}) [] not(xSemaphore: mutexes) ==> queue_items:=queue_items<+{xSemaphore|->queue_items(xSemaphore)-{item$0}} || queue_sending:=queue_sending<+{xSemaphore|->queue_sending(xSemaphore)-{task}}) [] not(FALSE = FALSE) ==> skip || item:=item$0)) || (FALSE = FALSE ==> (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip)) [] not(FALSE = FALSE) ==> skip))) || return:=pdPASS)) [] not(xBlockTime>0) ==> (queue_items(xSemaphore)/={} ==> (@task.(task: TASK & task: queue_sending(xSemaphore) & task: blocked & task/:pending ==> (@(item$0).(item$0: ITEM & item$0: queue_items(xSemaphore) ==> (FALSE = FALSE ==> (xSemaphore: mutexes ==> (queue_items(xSemaphore) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{xSemaphore|->running},queue_items<+{xSemaphore|->queue_items(xSemaphore)-{ITEM_EMPTY}} [] not(queue_items(xSemaphore) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{xSemaphore|->TASK_NULL}) [] not(xSemaphore: mutexes) ==> queue_items:=queue_items<+{xSemaphore|->queue_items(xSemaphore)-{item$0}} || queue_sending:=queue_sending<+{xSemaphore|->queue_sending(xSemaphore)-{task}}) [] not(FALSE = FALSE) ==> skip || item:=item$0)) || (FALSE = FALSE ==> (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip)) [] not(FALSE = FALSE) ==> skip))) || return:=pdPASS) [] not(queue_items(xSemaphore)/={}) ==> return,item:=errQUEUE_EMPTY,ITEM_NULL));
  Expanded_List_Substitution(Machine(FreeRTOS),xSemaphoreGive)==(active = TRUE & xSemaphore: QUEUE & xSemaphore: queues & xSemaphore: semaphores & running/=idle & xSemaphore: queues & ITEM_NULL: ITEM & semGIVE_BLOCK_TIME: TICK & queueSEND_TO_BACK: COPY_POSITION & running/=idle & running: ready | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0) || queue_sending:=queue_sending<+{xSemaphore|->(queue_sending(xSemaphore)\/{running})} || return:=pdTRUE [] @task.(task: TASK & task: blocked & task: queue_receiving(xSemaphore) & task/:queue_sending(xSemaphore) & task/:pending ==> (xSemaphore: mutexes ==> (queue_items(xSemaphore) = {} ==> (queue_items,queue_receiving,mutex_holder:=queue_items<+{xSemaphore|->(queue_items(xSemaphore)\/{ITEM_EMPTY})},queue_receiving<+{xSemaphore|->queue_receiving(xSemaphore)-{task}},mutex_holder<+{xSemaphore|->TASK_NULL} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) [] not(queue_items(xSemaphore) = {}) ==> skip) [] not(xSemaphore: mutexes) ==> (queue_items,queue_receiving:=queue_items<+{xSemaphore|->(queue_items(xSemaphore)\/{ITEM_NULL})},queue_receiving<+{xSemaphore|->queue_receiving(xSemaphore)-{task}} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) || return:=pdPASS)) [] return:=errQUEUE_FULL);
  Expanded_List_Substitution(Machine(FreeRTOS),xQueuePeek)==(queue: queues & ticks: TICK & active = TRUE & running/=idle & active = TRUE & running/=idle & queue: QUEUE & queue: queues & ticks: TICK & TRUE: BOOL | ticks>0 ==> (queue_items(queue) = {} ==> (queue: mutexes ==> (ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) [] not(queue: mutexes) ==> (ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) || queue_receiving:=queue_receiving<+{queue|->(queue_receiving(queue)\/{running})} || return,item:=pdTRUE,ITEM_NULL) [] not(queue_items(queue) = {}) ==> (@task.(task: TASK & task: queue_sending(queue) & task: blocked & task/:pending ==> (@(item$0).(item$0: ITEM & item$0: queue_items(queue) ==> (TRUE = FALSE ==> (queue: mutexes ==> (queue_items(queue) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{queue|->running},queue_items<+{queue|->queue_items(queue)-{ITEM_EMPTY}} [] not(queue_items(queue) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{queue|->TASK_NULL}) [] not(queue: mutexes) ==> queue_items:=queue_items<+{queue|->queue_items(queue)-{item$0}} || queue_sending:=queue_sending<+{queue|->queue_sending(queue)-{task}}) [] not(TRUE = FALSE) ==> skip || item:=item$0)) || (TRUE = FALSE ==> (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip)) [] not(TRUE = FALSE) ==> skip))) || return:=pdPASS)) [] not(ticks>0) ==> (queue_items(queue)/={} ==> (@task.(task: TASK & task: queue_sending(queue) & task: blocked & task/:pending ==> (@(item$0).(item$0: ITEM & item$0: queue_items(queue) ==> (TRUE = FALSE ==> (queue: mutexes ==> (queue_items(queue) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{queue|->running},queue_items<+{queue|->queue_items(queue)-{ITEM_EMPTY}} [] not(queue_items(queue) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{queue|->TASK_NULL}) [] not(queue: mutexes) ==> queue_items:=queue_items<+{queue|->queue_items(queue)-{item$0}} || queue_sending:=queue_sending<+{queue|->queue_sending(queue)-{task}}) [] not(TRUE = FALSE) ==> skip || item:=item$0)) || (TRUE = FALSE ==> (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip)) [] not(TRUE = FALSE) ==> skip))) || return:=pdPASS) [] not(queue_items(queue)/={}) ==> return,item:=errQUEUE_EMPTY,ITEM_NULL));
  Expanded_List_Substitution(Machine(FreeRTOS),xQueueReceive)==(queue: queues & ticks: TICK & active = TRUE & running/=idle & active = TRUE & running/=idle & queue: QUEUE & queue: queues & ticks: TICK & FALSE: BOOL | ticks>0 ==> (queue_items(queue) = {} ==> (queue: mutexes ==> (ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) [] not(queue: mutexes) ==> (ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) || queue_receiving:=queue_receiving<+{queue|->(queue_receiving(queue)\/{running})} || return,item:=pdTRUE,ITEM_NULL) [] not(queue_items(queue) = {}) ==> (@task.(task: TASK & task: queue_sending(queue) & task: blocked & task/:pending ==> (@(item$0).(item$0: ITEM & item$0: queue_items(queue) ==> (FALSE = FALSE ==> (queue: mutexes ==> (queue_items(queue) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{queue|->running},queue_items<+{queue|->queue_items(queue)-{ITEM_EMPTY}} [] not(queue_items(queue) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{queue|->TASK_NULL}) [] not(queue: mutexes) ==> queue_items:=queue_items<+{queue|->queue_items(queue)-{item$0}} || queue_sending:=queue_sending<+{queue|->queue_sending(queue)-{task}}) [] not(FALSE = FALSE) ==> skip || item:=item$0)) || (FALSE = FALSE ==> (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip)) [] not(FALSE = FALSE) ==> skip))) || return:=pdPASS)) [] not(ticks>0) ==> (queue_items(queue)/={} ==> (@task.(task: TASK & task: queue_sending(queue) & task: blocked & task/:pending ==> (@(item$0).(item$0: ITEM & item$0: queue_items(queue) ==> (FALSE = FALSE ==> (queue: mutexes ==> (queue_items(queue) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{queue|->running},queue_items<+{queue|->queue_items(queue)-{ITEM_EMPTY}} [] not(queue_items(queue) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{queue|->TASK_NULL}) [] not(queue: mutexes) ==> queue_items:=queue_items<+{queue|->queue_items(queue)-{item$0}} || queue_sending:=queue_sending<+{queue|->queue_sending(queue)-{task}}) [] not(FALSE = FALSE) ==> skip || item:=item$0)) || (FALSE = FALSE ==> (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip)) [] not(FALSE = FALSE) ==> skip))) || return:=pdPASS) [] not(queue_items(queue)/={}) ==> return,item:=errQUEUE_EMPTY,ITEM_NULL));
  Expanded_List_Substitution(Machine(FreeRTOS),xQueueSendToFront)==(queue: queues & item: ITEM & ticks: TICK & active = TRUE & running/=idle & queue: queues & item: ITEM & ticks: TICK & queueSEND_TO_FRONT: COPY_POSITION & running/=idle & running: ready | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0) || queue_sending:=queue_sending<+{queue|->(queue_sending(queue)\/{running})} || return:=pdTRUE [] @task.(task: TASK & task: blocked & task: queue_receiving(queue) & task/:queue_sending(queue) & task/:pending ==> (queue: mutexes ==> (queue_items(queue) = {} ==> (queue_items,queue_receiving,mutex_holder:=queue_items<+{queue|->(queue_items(queue)\/{ITEM_EMPTY})},queue_receiving<+{queue|->queue_receiving(queue)-{task}},mutex_holder<+{queue|->TASK_NULL} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) [] not(queue_items(queue) = {}) ==> skip) [] not(queue: mutexes) ==> (queue_items,queue_receiving:=queue_items<+{queue|->(queue_items(queue)\/{item})},queue_receiving<+{queue|->queue_receiving(queue)-{task}} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) || return:=pdPASS)) [] return:=errQUEUE_FULL);
  Expanded_List_Substitution(Machine(FreeRTOS),xQueueSend)==(queue: queues & item: ITEM & ticks: TICK & active = TRUE & running/=idle & queue: queues & item: ITEM & ticks: TICK & queueSEND_TO_BACK: COPY_POSITION & running/=idle & running: ready | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0) || queue_sending:=queue_sending<+{queue|->(queue_sending(queue)\/{running})} || return:=pdTRUE [] @task.(task: TASK & task: blocked & task: queue_receiving(queue) & task/:queue_sending(queue) & task/:pending ==> (queue: mutexes ==> (queue_items(queue) = {} ==> (queue_items,queue_receiving,mutex_holder:=queue_items<+{queue|->(queue_items(queue)\/{ITEM_EMPTY})},queue_receiving<+{queue|->queue_receiving(queue)-{task}},mutex_holder<+{queue|->TASK_NULL} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) [] not(queue_items(queue) = {}) ==> skip) [] not(queue: mutexes) ==> (queue_items,queue_receiving:=queue_items<+{queue|->(queue_items(queue)\/{item})},queue_receiving<+{queue|->queue_receiving(queue)-{task}} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) || return:=pdPASS)) [] return:=errQUEUE_FULL);
  Expanded_List_Substitution(Machine(FreeRTOS),xQueueSendToBack)==(queue: queues & item: ITEM & ticks: TICK & active = TRUE & running/=idle & queue: queues & item: ITEM & ticks: TICK & queueSEND_TO_BACK: COPY_POSITION & running/=idle & running: ready | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0) || queue_sending:=queue_sending<+{queue|->(queue_sending(queue)\/{running})} || return:=pdTRUE [] @task.(task: TASK & task: blocked & task: queue_receiving(queue) & task/:queue_sending(queue) & task/:pending ==> (queue: mutexes ==> (queue_items(queue) = {} ==> (queue_items,queue_receiving,mutex_holder:=queue_items<+{queue|->(queue_items(queue)\/{ITEM_EMPTY})},queue_receiving<+{queue|->queue_receiving(queue)-{task}},mutex_holder<+{queue|->TASK_NULL} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) [] not(queue_items(queue) = {}) ==> skip) [] not(queue: mutexes) ==> (queue_items,queue_receiving:=queue_items<+{queue|->(queue_items(queue)\/{item})},queue_receiving<+{queue|->queue_receiving(queue)-{task}} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) || return:=pdPASS)) [] return:=errQUEUE_FULL);
  List_Substitution(Machine(FreeRTOS),xQueueCreate)==(CHOICE ANY pxQueue WHERE pxQueue: QUEUE & pxQueue/:queues THEN queues:=queues\/{pxQueue} || queue_items:=queue_items\/{pxQueue|->{}} || queue_receiving:=queue_receiving\/{pxQueue|->{}} || queue_sending:=queue_sending\/{pxQueue|->{}} || xQueueHandle:=pxQueue END OR xQueueHandle:=QUEUE_NULL END);
  Expanded_List_Substitution(Machine(FreeRTOS),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @pxQueue.(pxQueue: QUEUE & pxQueue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{pxQueue},queue_items\/{pxQueue|->{}},queue_receiving\/{pxQueue|->{}},queue_sending\/{pxQueue|->{}},pxQueue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(FreeRTOS),vTaskPrioritySet)==(t_setPriority(pxTask,uxNewPriority));
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle | @(running$0).(running$0: ready ==> running:=running$0) [] skip);
  List_Substitution(Machine(FreeRTOS),vQueueDelete)==(q_queueDelete(pxQueue));
  Expanded_List_Substitution(Machine(FreeRTOS),vQueueDelete)==(pxQueue: queues | queues,queue_items,queue_receiving,queue_sending:=queues-{pxQueue},{pxQueue}<<|queue_items,{pxQueue}<<|queue_receiving,{pxQueue}<<|queue_sending || (pxQueue: semaphores ==> semaphores:=semaphores-{pxQueue} [] not(pxQueue: semaphores) ==> skip) || (pxQueue: mutexes ==> mutexes,mutex_holder:=mutexes-{pxQueue},{pxQueue}<<|mutex_holder [] not(pxQueue: mutexes) ==> skip));
  List_Substitution(Machine(FreeRTOS),xTaskResumeAll)==(CHOICE resumeScheduler || ANY unblocked WHERE unblocked: FIN(TASK) & unblocked <: blocked THEN t_resumeAll(unblocked) || q_resumeAll(unblocked\/pending) || tickCount:=TICK_INCREMENT(tickCount,tickMissed) END OR skip END);
  Expanded_List_Substitution(Machine(FreeRTOS),xTaskResumeAll)==(schedulerSuspended>0 | schedulerSuspended:=schedulerSuspended-1 || @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked: FIN(TASK) & unblocked <: blocked & unblocked\/pending: POW(TASK) | unblocked/={} or pending/={} ==> (@(running$0).(running$0: unblocked\/pending ==> running:=running$0) [] skip || ready:=ready\/unblocked\/pending || blocked:=blocked-unblocked-pending || suspended:=suspended-pending || pending:={}) [] not(unblocked/={} or pending/={}) ==> skip || (queue_sending/={} ==> queue_sending:=remove_task(queue_sending,unblocked\/pending) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> queue_receiving:=remove_task(queue_receiving,unblocked\/pending) [] not(queue_receiving/={}) ==> skip)) || tickCount:=TICK_INCREMENT(tickCount,tickMissed))) [] skip);
  List_Substitution(Machine(FreeRTOS),vTaskSuspendAll)==(suspendScheduler);
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskSuspendAll)==(schedulerSuspended<MAXINT | schedulerSuspended:=schedulerSuspended+1);
  List_Substitution(Machine(FreeRTOS),vTaskEndScheduler)==(stopScheduler || t_endScheduler || q_endScheduler);
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskEndScheduler)==(schedulerRunning = TRUE | schedulerRunning:=FALSE || active,tasks,blocked,suspended,ready,pending:=FALSE,{},{},{},{},{} || queues,queue_items,queue_receiving,queue_sending,semaphores,mutexes,mutex_holder:={},{},{},{},{},{},{});
  List_Substitution(Machine(FreeRTOS),vTaskStartScheduler)==(CHOICE t_startScheduler || startScheduler OR skip END);
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskStartScheduler)==(blocked = {} & suspended = {} & ready = {} & active = FALSE | active:=TRUE || @idle_task.(idle_task: TASK & idle_task/:tasks & idle_task/=TASK_NULL ==> (tasks,ready,idle:=tasks\/{idle_task},ready\/{idle_task},idle_task || @(running$0).(running$0: ready\/{idle_task} ==> running:=running$0))) || schedulerRunning:=TRUE [] skip);
  List_Substitution(Machine(FreeRTOS),xTaskGetTickCount)==(numberOfTicks:=tickCount);
  Expanded_List_Substitution(Machine(FreeRTOS),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | numberOfTicks:=tickCount);
  List_Substitution(Machine(FreeRTOS),vTaskDelayUntil)==(IF schedulerRunning = TRUE THEN SELECT TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0 THEN t_delayTask(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement),running) ELSE skip END END);
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1 | schedulerRunning = TRUE ==> (TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0 ==> (running: TASK & running = running & running: ready & running/=idle & TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement): TICK | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) [] not(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0) ==> skip) [] not(schedulerRunning = TRUE) ==> skip);
  List_Substitution(Machine(FreeRTOS),vTaskDelay)==(t_delayTask(TICK_INCREMENT(tickCount,xTicksToDelay),running));
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) & running: ready | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0));
  List_Substitution(Machine(FreeRTOS),uxTaskGetNumberOfTasks)==(numberOfTasks <-- t_getNumberOfTasks);
  Expanded_List_Substitution(Machine(FreeRTOS),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  List_Substitution(Machine(FreeRTOS),xTaskGetCurrentTaskHandle)==(cTask <-- t_getCurrent);
  Expanded_List_Substitution(Machine(FreeRTOS),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | cTask:=running);
  List_Substitution(Machine(FreeRTOS),uxTaskPriorityGet)==(priority <-- t_getPriority(pxTask));
  Expanded_List_Substitution(Machine(FreeRTOS),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  List_Substitution(Machine(FreeRTOS),vTaskResume)==(t_resume(pxTaskToResume));
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & pxTaskToResume/:pending | ready:=ready\/{pxTaskToResume} || (@(running$0).(running$0: ready\/{pxTaskToResume} ==> running:=running$0) [] skip) || suspended:=suspended-{pxTaskToResume} || (pxTaskToResume: pending ==> pending:=pending-{pxTaskToResume} [] not(pxTaskToResume: pending) ==> skip));
  List_Substitution(Machine(FreeRTOS),vTaskSuspend)==(IF pxTaskToSuspend/:suspended THEN t_suspend(pxTaskToSuspend) || IF pxTaskToSuspend: blocked THEN q_removeFromEventListQueue(pxTaskToSuspend) END || rr:=pdTRUE ELSE rr:=pdFALSE END);
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle | pxTaskToSuspend/:suspended ==> (pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle | pxTaskToSuspend: ready ==> (ready:=ready-{pxTaskToSuspend} || (pxTaskToSuspend = running ==> @(running$0).(running$0: ready-{pxTaskToSuspend} ==> running:=running$0) [] not(pxTaskToSuspend = running) ==> skip)) [] not(pxTaskToSuspend: ready) ==> (pxTaskToSuspend: blocked ==> blocked:=blocked-{pxTaskToSuspend} [] not(pxTaskToSuspend: blocked) ==> skip) || suspended:=suspended\/{pxTaskToSuspend} || (pxTaskToSuspend: blocked ==> (pxTaskToSuspend: TASK | @pxQueue.(pxQueue: queues & pxTaskToSuspend: queue_receiving(pxQueue) ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{pxTaskToSuspend}}) || @pxQueue.(pxQueue: queues & pxTaskToSuspend: queue_sending(pxQueue) ==> queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{pxTaskToSuspend}})) [] not(pxTaskToSuspend: blocked) ==> skip) || rr:=pdTRUE) [] not(pxTaskToSuspend/:suspended) ==> rr:=pdFALSE);
  List_Substitution(Machine(FreeRTOS),vTaskDelete)==(t_delete(pxTaskToDelete) || q_removeFromEventListQueue(pxTaskToDelete));
  Expanded_List_Substitution(Machine(FreeRTOS),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder) | tasks:=tasks-{pxTaskToDelete} || (pxTaskToDelete: ready ==> (ready:=ready-{pxTaskToDelete} || (pxTaskToDelete = running ==> @(running$0).(running$0: ready-{pxTaskToDelete} ==> running:=running$0) [] not(pxTaskToDelete = running) ==> skip)) [] not(pxTaskToDelete: ready) ==> (pxTaskToDelete: blocked ==> blocked,pending:=blocked-{pxTaskToDelete},pending-{pxTaskToDelete} [] not(pxTaskToDelete: blocked) ==> (pxTaskToDelete: suspended ==> suspended,pending:=suspended-{pxTaskToDelete},pending-{pxTaskToDelete} [] not(pxTaskToDelete: suspended) ==> skip))) || (@pxQueue.(pxQueue: queues & pxTaskToDelete: queue_receiving(pxQueue) ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{pxTaskToDelete}}) || @pxQueue.(pxQueue: queues & pxTaskToDelete: queue_sending(pxQueue) ==> queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{pxTaskToDelete}})));
  List_Substitution(Machine(FreeRTOS),xTaskCreate)==(CHOICE handle <-- t_create(uxPriority) || result:=pdPASS OR result:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || handle:: TASK END);
  Expanded_List_Substitution(Machine(FreeRTOS),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY | @task.(task: TASK & task/:tasks & task/=TASK_NULL ==> (tasks,ready:=tasks\/{task},ready\/{task} || (running:=task [] skip) || handle:=task)) || result:=pdPASS [] (result:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || @(handle$0).(handle$0: TASK ==> handle:=handle$0)));
  List_Substitution(Machine(FreeRTOS),xQueueSendToBack)==(return <-- xQueueGenericSend(queue,item,ticks,queueSEND_TO_BACK));
  List_Substitution(Machine(FreeRTOS),xQueueSend)==(return <-- xQueueGenericSend(queue,item,ticks,queueSEND_TO_BACK));
  List_Substitution(Machine(FreeRTOS),xQueueSendToFront)==(return <-- xQueueGenericSend(queue,item,ticks,queueSEND_TO_FRONT));
  List_Substitution(Machine(FreeRTOS),xQueueReceive)==(return,item <-- xQueueGenericReceive(queue,ticks,FALSE));
  List_Substitution(Machine(FreeRTOS),xQueuePeek)==(return,item <-- xQueueGenericReceive(queue,ticks,TRUE));
  List_Substitution(Machine(FreeRTOS),xSemaphoreGive)==(return <-- xQueueGenericSend(xSemaphore,ITEM_NULL,semGIVE_BLOCK_TIME,queueSEND_TO_BACK));
  List_Substitution(Machine(FreeRTOS),xSemaphoreTake)==(return,item <-- xQueueGenericReceive(xSemaphore,xBlockTime,FALSE))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(FreeRTOS))==(remove_task);
  Inherited_List_Constants(Machine(FreeRTOS))==(remove_task);
  List_Constants(Machine(FreeRTOS))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(FreeRTOS),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Machine(FreeRTOS))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Machine(FreeRTOS))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Machine(FreeRTOS))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Machine(FreeRTOS))==(?);
  Inherited_List_Enumerated(Machine(FreeRTOS))==(?);
  Inherited_List_Defered(Machine(FreeRTOS))==(?);
  Inherited_List_Sets(Machine(FreeRTOS))==(?);
  List_Enumerated(Machine(FreeRTOS))==(?);
  List_Defered(Machine(FreeRTOS))==(?);
  List_Sets(Machine(FreeRTOS))==(?);
  Set_Definition(Machine(FreeRTOS),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(FreeRTOS),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(FreeRTOS),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(FreeRTOS))==(?);
  Expanded_List_HiddenConstants(Machine(FreeRTOS))==(?);
  List_HiddenConstants(Machine(FreeRTOS))==(?);
  External_List_HiddenConstants(Machine(FreeRTOS))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(FreeRTOS))==(btrue);
  Context_List_Properties(Machine(FreeRTOS))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}) & configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT);
  Inherited_List_Properties(Machine(FreeRTOS))==(remove_task: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> POW(TASK)) & remove_task = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | %q1.(q1: QUEUE & q1: dom(q_task) | q_task(q1)-unblocked)));
  List_Properties(Machine(FreeRTOS))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(FreeRTOS),Machine(FreeRTOSConfig))==(?);
  Seen_Context_List_Enumerated(Machine(FreeRTOS))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Machine(FreeRTOS))==(btrue);
  Seen_Context_List_Assertions(Machine(FreeRTOS))==(BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(FreeRTOS))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Machine(FreeRTOS))==(btrue);
  Seen_List_Operations(Machine(FreeRTOS),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(FreeRTOS),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Machine(FreeRTOS),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Machine(FreeRTOS),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(FreeRTOS),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(FreeRTOS),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Seen_Internal_List_Operations(Machine(FreeRTOS),Machine(Types))==(?);
  Seen_List_Operations(Machine(FreeRTOS),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(FreeRTOS),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(FreeRTOS),xQueueSendToBack)==(?);
  List_ANY_Var(Machine(FreeRTOS),xQueueSend)==(?);
  List_ANY_Var(Machine(FreeRTOS),xQueueSendToFront)==(?);
  List_ANY_Var(Machine(FreeRTOS),xQueueReceive)==(?);
  List_ANY_Var(Machine(FreeRTOS),xQueuePeek)==(?);
  List_ANY_Var(Machine(FreeRTOS),xSemaphoreGive)==(?);
  List_ANY_Var(Machine(FreeRTOS),xSemaphoreTake)==(?);
  List_ANY_Var(Machine(FreeRTOS),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(FreeRTOS)) == (? | remove_task | ? | V,tickMissed,tickCount,V,schedulerSuspended,schedulerRunning,idle,pending,running,suspended,ready,blocked,tasks,active,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues | xQueueSendToBack,xQueueSend,xQueueSendToFront,xQueueReceive,xQueuePeek,xSemaphoreGive,xSemaphoreTake | xQueueCreate,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,vQueueDelete,vTaskPrioritySet | seen(Machine(Types)),seen(Machine(FreeRTOSConfig)),included(Machine(FreeRTOSBasic)) | ? | FreeRTOS);
  List_Of_HiddenCst_Ids(Machine(FreeRTOS)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOS)) == (remove_task);
  List_Of_VisibleVar_Ids(Machine(FreeRTOS)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOS)) == (seen(Machine(Types)): (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(FreeRTOSBasic)) == (? | remove_task | tickMissed,tickCount | V,schedulerSuspended,schedulerRunning,idle,pending,running,suspended,ready,blocked,tasks,active,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues | xQueueGenericSend,xQueueGenericReceive,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,vQueueDelete,vTaskPrioritySet,vSemaphoreCreateBinary,xSemaphoreCreateCounting,xQueueCreateMutex,xSemaphoreCreateRecursiveMutex | xQueueCreate | seen(Machine(Types)),seen(Machine(FreeRTOSConfig)),included(Machine(Queue)),included(Machine(Task)),included(Machine(Scheduler)) | ? | FreeRTOSBasic);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSBasic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSBasic)) == (remove_task);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSBasic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSBasic)) == (seen(Machine(Types)): (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Scheduler)) == (? | ? | schedulerSuspended,schedulerRunning | ? | startScheduler,stopScheduler,suspendScheduler,resumeScheduler | ? | seen(Machine(Types)) | ? | Scheduler);
  List_Of_HiddenCst_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Scheduler)) == (?);
  List_Of_VisibleVar_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Scheduler)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(Task)) == (? | ? | idle,pending,running,suspended,ready,blocked,tasks,active | ? | t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_resumeIncrement,t_unblock,t_unblockMutex,t_setPriority,t_addPending,t_PriorityInherit | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task);
  List_Of_HiddenCst_Ids(Machine(Task)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task)) == (?);
  List_Of_VisibleVar_Ids(Machine(Task)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?);
  List_Of_Ids(Machine(Queue)) == (remove_task | ? | mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues | ? | xQueueCreate,q_queueDelete,q_sendItem,q_sendItemMutex,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_receivedItem,q_removeFromEventListQueue,q_endScheduler,q_resumeAll,q_createSemaphore,q_createMutex | ? | seen(Machine(Types)) | ? | Queue);
  List_Of_HiddenCst_Ids(Machine(Queue)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue)) == (remove_task);
  List_Of_VisibleVar_Ids(Machine(Queue)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(FreeRTOS)) == (Type(remove_task) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(FreeRTOS)) == (Type(tickCount) == Mvl(btype(INTEGER,?,?));Type(tickMissed) == Mvl(btype(INTEGER,?,?));Type(schedulerSuspended) == Mvl(btype(INTEGER,?,?));Type(schedulerRunning) == Mvl(btype(BOOL,?,?));Type(idle) == Mvl(atype(TASK,?,?));Type(pending) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?));Type(mutex_holder) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(mutexes) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(FreeRTOS)) == (Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?));Type(vTaskDelete) == Cst(No_type,atype(TASK,?,?));Type(vTaskSuspend) == Cst(etype(ERROR_DEFINITION,?,?),atype(TASK,?,?));Type(vTaskResume) == Cst(No_type,atype(TASK,?,?));Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(vTaskDelay) == Cst(No_type,btype(INTEGER,?,?));Type(vTaskDelayUntil) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(vTaskStartScheduler) == Cst(No_type,No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(xTaskResumeAll) == Cst(No_type,No_type);Type(vQueueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(vTaskPrioritySet) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(xSemaphoreTake) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xSemaphoreGive) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?));Type(xQueuePeek) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xQueueReceive) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xQueueSendToFront) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?));Type(xQueueSend) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?));Type(xQueueSendToBack) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(FreeRTOS)) == (Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?));Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(xSemaphoreTake) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xSemaphoreGive) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?));Type(xQueuePeek) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xQueueReceive) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xQueueSendToFront) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?));Type(xQueueSend) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?));Type(xQueueSendToBack) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?)))
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
