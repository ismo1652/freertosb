Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(FreeRTOSBasic_r))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(FreeRTOSBasic_r))==(Machine(FreeRTOSBasic));
  Level(Refinement(FreeRTOSBasic_r))==(1);
  Upper_Level(Refinement(FreeRTOSBasic_r))==(Machine(FreeRTOSBasic))
END
&
THEORY LoadedStructureX IS
  Refinement(FreeRTOSBasic_r)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(FreeRTOSBasic_r))==(Types,FreeRTOSConfig)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(FreeRTOSBasic_r))==(Queue,Task);
  List_Includes(Refinement(FreeRTOSBasic_r))==(Task,Queue)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(FreeRTOSBasic_r))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(FreeRTOSBasic_r))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(FreeRTOSBasic_r))==(?);
  Context_List_Variables(Refinement(FreeRTOSBasic_r))==(?);
  Abstract_List_Variables(Refinement(FreeRTOSBasic_r))==(tickMissed,tickCount,unblocked,idle,running,suspended,runable,blocked,tasks,active,first_receiving,first_sending,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_full,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues);
  Local_List_Variables(Refinement(FreeRTOSBasic_r))==(tickMissed,tickCount);
  List_Variables(Refinement(FreeRTOSBasic_r))==(tickMissed,tickCount,unblocked,idle,running,suspended,runable,blocked,tasks,active,first_receiving,first_sending,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_full,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues);
  External_List_Variables(Refinement(FreeRTOSBasic_r))==(tickMissed,tickCount,unblocked,idle,running,suspended,runable,blocked,tasks,active,first_receiving,first_sending,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_full,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(FreeRTOSBasic_r))==(?);
  Abstract_List_VisibleVariables(Refinement(FreeRTOSBasic_r))==(?);
  External_List_VisibleVariables(Refinement(FreeRTOSBasic_r))==(?);
  Expanded_List_VisibleVariables(Refinement(FreeRTOSBasic_r))==(?);
  List_VisibleVariables(Refinement(FreeRTOSBasic_r))==(?);
  Internal_List_VisibleVariables(Refinement(FreeRTOSBasic_r))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(FreeRTOSBasic_r))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(FreeRTOSBasic_r))==(btrue);
  Abstract_List_Invariant(Refinement(FreeRTOSBasic_r))==(tickCount: TICK & tickMissed: TICK & !que.(que: queues => queue_sending(que) <: blocked\/suspended) & !que.(que: queues => queue_receiving(que) <: blocked\/suspended) & ran(mutex_holder) <: tasks\/{TASK_NULL} & !mt.(mt: mutexes => queue_sending(mt) = {}) & (active = TRUE => idle/:ran(mutex_holder) & !mt.(mt: mutexes_busy => mutex_holder(mt): tasks) & !mt.(mt: mutexes & mt/:mutexes_busy => mutex_holder(mt)/:tasks)) & active: BOOL & tasks: FIN(TASK) & blocked: FIN(TASK) & blocked <: tasks & unblocked: FIN(TASK) & unblocked <: blocked & runable: FIN(TASK) & runable <: tasks & suspended: FIN(TASK) & suspended <: tasks & runable/\blocked = {} & blocked/\suspended = {} & suspended/\runable = {} & tasks = suspended\/blocked\/runable & running: TASK & idle: TASK & (active = TRUE => runable/={} & running: runable & idle: runable & TASK_NULL/:tasks) & queues: POW(QUEUE) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_receiving) & queues = dom(queue_sending) & first_receiving: QUEUE +-> TASK & first_sending: QUEUE +-> TASK & dom(first_receiving) = dom(queue_receiving) & dom(first_sending) = dom(queue_sending) & !q1.(q1: queues & q1: dom(first_receiving) & queue_receiving(q1)/={} => first_receiving(q1): queue_receiving(q1)) & !q1.(q1: queues & q1: dom(first_sending) & queue_sending(q1)/={} => first_sending(q1): queue_sending(q1)) & queues_msg <: queues & queues_msg_full <: queues_msg & queues_msg_empty <: queues_msg & queues_msg_full/\queues_msg_empty = {} & queue_items: QUEUE +-> POW(ITEM) & queues_msg = dom(queue_items) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_receiving(q1) => tk/:queue_sending(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_sending(q2) => tk/:queue_receiving(q1)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_receiving(q1) => tk/:queue_receiving(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_sending(q1) => tk/:queue_sending(q2)) & semaphores: POW(QUEUE) & semaphores <: queues & semaphores_busy <: semaphores & semaphores_full <: semaphores & semaphores_busy/\semaphores_full = {} & mutexes <: queues & mutex_holder: QUEUE +-> TASK & mutexes = dom(mutex_holder) & mutexes_busy <: mutexes & !mt.(mt: mutexes_busy => mutex_holder(mt)/=TASK_NULL) & !mt.(mt: mutexes & mt/:mutexes_busy => mutex_holder(mt) = TASK_NULL) & queues_msg/\semaphores = {} & queues_msg/\mutexes = {} & mutexes/\semaphores = {});
  Expanded_List_Invariant(Refinement(FreeRTOSBasic_r))==(active: BOOL & tasks: FIN(TASK) & blocked: FIN(TASK) & blocked <: tasks & unblocked: FIN(TASK) & unblocked <: blocked & runable: FIN(TASK) & runable <: tasks & suspended: FIN(TASK) & suspended <: tasks & runable/\blocked = {} & blocked/\suspended = {} & suspended/\runable = {} & tasks = suspended\/blocked\/runable & running: TASK & idle: TASK & (active = TRUE => runable/={} & running: runable & idle: runable & TASK_NULL/:tasks) & queues: POW(QUEUE) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_receiving) & queues = dom(queue_sending) & first_receiving: QUEUE +-> TASK & first_sending: QUEUE +-> TASK & dom(first_receiving) = dom(queue_receiving) & dom(first_sending) = dom(queue_sending) & !q1.(q1: queues & q1: dom(first_receiving) & queue_receiving(q1)/={} => first_receiving(q1): queue_receiving(q1)) & !q1.(q1: queues & q1: dom(first_sending) & queue_sending(q1)/={} => first_sending(q1): queue_sending(q1)) & queues_msg <: queues & queues_msg_full <: queues_msg & queues_msg_empty <: queues_msg & queues_msg_full/\queues_msg_empty = {} & queue_items: QUEUE +-> POW(ITEM) & queues_msg = dom(queue_items) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_receiving(q1) => tk/:queue_sending(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_sending(q2) => tk/:queue_receiving(q1)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_receiving(q1) => tk/:queue_receiving(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_sending(q1) => tk/:queue_sending(q2)) & semaphores: POW(QUEUE) & semaphores <: queues & semaphores_busy <: semaphores & semaphores_full <: semaphores & semaphores_busy/\semaphores_full = {} & mutexes <: queues & mutex_holder: QUEUE +-> TASK & mutexes = dom(mutex_holder) & mutexes_busy <: mutexes & !mt.(mt: mutexes_busy => mutex_holder(mt)/=TASK_NULL) & !mt.(mt: mutexes & mt/:mutexes_busy => mutex_holder(mt) = TASK_NULL) & queues_msg/\semaphores = {} & queues_msg/\mutexes = {} & mutexes/\semaphores = {});
  Context_List_Invariant(Refinement(FreeRTOSBasic_r))==(btrue);
  List_Invariant(Refinement(FreeRTOSBasic_r))==(btrue)
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(FreeRTOSBasic_r))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Refinement(FreeRTOSBasic_r))==(!mt.(mt: mutexes_busy & active = TRUE => mutex_holder(mt)/=idle) & !(que,task).(que: queues & task: TASK & task/:blocked & task/:suspended => task/:queue_sending(que)) & !(que,task).(que: queues & task: TASK & task/:blocked & task/:suspended => task/:queue_receiving(que)) & !(que,task).(que: queues & task: tasks & task: queue_sending(que) => task: blocked\/suspended) & !(que,task).(que: queues & task: tasks & task: queue_receiving(que) => task: blocked\/suspended) & (active = TRUE => runable/={};active = TRUE => tasks/={};active = TRUE => idle: runable;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => idle/=TASK_NULL;active = TRUE => running: runable;active = TRUE => running/:blocked;active = TRUE => running/:suspended) & !que.(que: QUEUE & que/:queues => que/:mutexes) & !que.(que: QUEUE & que/:queues => que/:semaphores) & !que.(que: queues_msg & que: queues_msg_full => que/:queues_msg_empty) & !que.(que: queues_msg & que: queues_msg_empty => que/:queues_msg_full));
  Expanded_List_Assertions(Refinement(FreeRTOSBasic_r))==((active = TRUE => runable/={};active = TRUE => tasks/={};active = TRUE => idle: runable;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => idle/=TASK_NULL;active = TRUE => running: runable;active = TRUE => running/:blocked;active = TRUE => running/:suspended) & !que.(que: QUEUE & que/:queues => que/:mutexes) & !que.(que: QUEUE & que/:queues => que/:semaphores) & !que.(que: queues_msg & que: queues_msg_full => que/:queues_msg_empty) & !que.(que: queues_msg & que: queues_msg_empty => que/:queues_msg_full));
  Context_List_Assertions(Refinement(FreeRTOSBasic_r))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT & configMAX_PRIORITIES: NATURAL);
  List_Assertions(Refinement(FreeRTOSBasic_r))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(FreeRTOSBasic_r))==(active,tasks,blocked,runable,suspended,unblocked:=FALSE,{},{},{},{},{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0);queues,queues_msg,queue_items,queue_receiving,queue_sending,semaphores,semaphores_busy,mutexes,mutexes_busy,mutex_holder,queues_msg_full,queues_msg_empty,semaphores_full,first_sending,first_receiving:={},{},{},{},{},{},{},{},{},{},{},{},{},{},{};tickCount,tickMissed:=0,0);
  Context_List_Initialisation(Refinement(FreeRTOSBasic_r))==(skip);
  List_Initialisation(Refinement(FreeRTOSBasic_r))==(tickCount:=0 || tickMissed:=0)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(FreeRTOSBasic_r))==(xTaskCreate,vTaskDelay,vTaskDelayUntil,vTaskDelete,vTaskEndScheduler,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,uxTaskPriorityGet,vTaskPrioritySet,vTaskResume,beforeResumeAll,xTaskResumeAll,vTaskStartScheduler,vTaskSuspend,vTaskSuspendAll,xQueueCreate,queueDelete,sendItem,receiveItem,createSemaphore,deleteSemaphore,takeSemaphore,giveSemaphore,createMutex,takeMutex,giveMutex,getTickCount,incrementTick,afterIncrementTick,xQueueCreateMutex,xSemaphoreCreateRecursiveMutex);
  List_Operations(Refinement(FreeRTOSBasic_r))==(xTaskCreate,vTaskDelay,vTaskDelayUntil,vTaskDelete,vTaskEndScheduler,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,uxTaskPriorityGet,vTaskPrioritySet,vTaskResume,beforeResumeAll,xTaskResumeAll,vTaskStartScheduler,vTaskSuspend,vTaskSuspendAll,xQueueCreate,queueDelete,sendItem,receiveItem,createSemaphore,deleteSemaphore,takeSemaphore,giveSemaphore,createMutex,takeMutex,giveMutex,getTickCount,incrementTick,afterIncrementTick,xQueueCreateMutex,xSemaphoreCreateRecursiveMutex)
END
&
THEORY ListInputX IS
  List_Input(Refinement(FreeRTOSBasic_r),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskDelay)==(xTicksToDelay);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskDelayUntil)==(pxPreviousWakeTime,xTimeIncrement);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskDelete)==(pxTaskToDelete);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskEndScheduler)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),uxTaskGetNumberOfTasks)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),uxTaskPriorityGet)==(pxTask);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskPrioritySet)==(pxTask,uxNewPriority);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskResume)==(pxTaskToResume);
  List_Input(Refinement(FreeRTOSBasic_r),beforeResumeAll)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),xTaskResumeAll)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskStartScheduler)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Refinement(FreeRTOSBasic_r),vTaskSuspendAll)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Refinement(FreeRTOSBasic_r),queueDelete)==(pxQueue);
  List_Input(Refinement(FreeRTOSBasic_r),sendItem)==(pxQueue,pvItemToQueue,xTicksToWait,copy_position);
  List_Input(Refinement(FreeRTOSBasic_r),receiveItem)==(pxQueue,xTicksToWait,justPeeking);
  List_Input(Refinement(FreeRTOSBasic_r),createSemaphore)==(maxCount,initialCount);
  List_Input(Refinement(FreeRTOSBasic_r),deleteSemaphore)==(semaphore);
  List_Input(Refinement(FreeRTOSBasic_r),takeSemaphore)==(semaphore,xTicksToWait);
  List_Input(Refinement(FreeRTOSBasic_r),giveSemaphore)==(semaphore,xTicksToWait);
  List_Input(Refinement(FreeRTOSBasic_r),createMutex)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),takeMutex)==(mutex,xTicksToWait);
  List_Input(Refinement(FreeRTOSBasic_r),giveMutex)==(mutex,xTicksToWait);
  List_Input(Refinement(FreeRTOSBasic_r),getTickCount)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),incrementTick)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),afterIncrementTick)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),xQueueCreateMutex)==(?);
  List_Input(Refinement(FreeRTOSBasic_r),xSemaphoreCreateRecursiveMutex)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(FreeRTOSBasic_r),xTaskCreate)==(result,handle);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskDelay)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskDelayUntil)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskDelete)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskEndScheduler)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),xTaskGetCurrentTaskHandle)==(cTask);
  List_Output(Refinement(FreeRTOSBasic_r),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Refinement(FreeRTOSBasic_r),uxTaskPriorityGet)==(priority);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskPrioritySet)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskResume)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),beforeResumeAll)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),xTaskResumeAll)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskStartScheduler)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskSuspend)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),vTaskSuspendAll)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),xQueueCreate)==(xQueueHandle);
  List_Output(Refinement(FreeRTOSBasic_r),queueDelete)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),sendItem)==(return);
  List_Output(Refinement(FreeRTOSBasic_r),receiveItem)==(return,pvBuffer);
  List_Output(Refinement(FreeRTOSBasic_r),createSemaphore)==(semaphore);
  List_Output(Refinement(FreeRTOSBasic_r),deleteSemaphore)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),takeSemaphore)==(return);
  List_Output(Refinement(FreeRTOSBasic_r),giveSemaphore)==(return);
  List_Output(Refinement(FreeRTOSBasic_r),createMutex)==(mutex);
  List_Output(Refinement(FreeRTOSBasic_r),takeMutex)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),giveMutex)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),getTickCount)==(numberOfTicks);
  List_Output(Refinement(FreeRTOSBasic_r),incrementTick)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),afterIncrementTick)==(?);
  List_Output(Refinement(FreeRTOSBasic_r),xQueueCreateMutex)==(xQueueHandle);
  List_Output(Refinement(FreeRTOSBasic_r),xSemaphoreCreateRecursiveMutex)==(xQueueHandle)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(FreeRTOSBasic_r),xTaskCreate)==(result,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Refinement(FreeRTOSBasic_r),vTaskDelay)==(vTaskDelay(xTicksToDelay));
  List_Header(Refinement(FreeRTOSBasic_r),vTaskDelayUntil)==(vTaskDelayUntil(pxPreviousWakeTime,xTimeIncrement));
  List_Header(Refinement(FreeRTOSBasic_r),vTaskDelete)==(vTaskDelete(pxTaskToDelete));
  List_Header(Refinement(FreeRTOSBasic_r),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Refinement(FreeRTOSBasic_r),xTaskGetCurrentTaskHandle)==(cTask <-- xTaskGetCurrentTaskHandle);
  List_Header(Refinement(FreeRTOSBasic_r),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Refinement(FreeRTOSBasic_r),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Refinement(FreeRTOSBasic_r),vTaskPrioritySet)==(vTaskPrioritySet(pxTask,uxNewPriority));
  List_Header(Refinement(FreeRTOSBasic_r),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Refinement(FreeRTOSBasic_r),beforeResumeAll)==(beforeResumeAll);
  List_Header(Refinement(FreeRTOSBasic_r),xTaskResumeAll)==(xTaskResumeAll);
  List_Header(Refinement(FreeRTOSBasic_r),vTaskStartScheduler)==(vTaskStartScheduler);
  List_Header(Refinement(FreeRTOSBasic_r),vTaskSuspend)==(vTaskSuspend(pxTaskToSuspend));
  List_Header(Refinement(FreeRTOSBasic_r),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Refinement(FreeRTOSBasic_r),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Refinement(FreeRTOSBasic_r),queueDelete)==(queueDelete(pxQueue));
  List_Header(Refinement(FreeRTOSBasic_r),sendItem)==(return <-- sendItem(pxQueue,pvItemToQueue,xTicksToWait,copy_position));
  List_Header(Refinement(FreeRTOSBasic_r),receiveItem)==(return,pvBuffer <-- receiveItem(pxQueue,xTicksToWait,justPeeking));
  List_Header(Refinement(FreeRTOSBasic_r),createSemaphore)==(semaphore <-- createSemaphore(maxCount,initialCount));
  List_Header(Refinement(FreeRTOSBasic_r),deleteSemaphore)==(deleteSemaphore(semaphore));
  List_Header(Refinement(FreeRTOSBasic_r),takeSemaphore)==(return <-- takeSemaphore(semaphore,xTicksToWait));
  List_Header(Refinement(FreeRTOSBasic_r),giveSemaphore)==(return <-- giveSemaphore(semaphore,xTicksToWait));
  List_Header(Refinement(FreeRTOSBasic_r),createMutex)==(mutex <-- createMutex);
  List_Header(Refinement(FreeRTOSBasic_r),takeMutex)==(takeMutex(mutex,xTicksToWait));
  List_Header(Refinement(FreeRTOSBasic_r),giveMutex)==(giveMutex(mutex,xTicksToWait));
  List_Header(Refinement(FreeRTOSBasic_r),getTickCount)==(numberOfTicks <-- getTickCount);
  List_Header(Refinement(FreeRTOSBasic_r),incrementTick)==(incrementTick);
  List_Header(Refinement(FreeRTOSBasic_r),afterIncrementTick)==(afterIncrementTick);
  List_Header(Refinement(FreeRTOSBasic_r),xQueueCreateMutex)==(xQueueHandle <-- xQueueCreateMutex);
  List_Header(Refinement(FreeRTOSBasic_r),xSemaphoreCreateRecursiveMutex)==(xQueueHandle <-- xSemaphoreCreateRecursiveMutex)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(FreeRTOSBasic_r),xTaskCreate)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY);
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskDelay)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & running: runable);
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskDelayUntil)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1 & running: runable);
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskDelete)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder));
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskEndScheduler)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskEndScheduler)==(active = TRUE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),xTaskGetCurrentTaskHandle)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  Own_Precondition(Refinement(FreeRTOSBasic_r),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),uxTaskGetNumberOfTasks)==(btrue);
  Own_Precondition(Refinement(FreeRTOSBasic_r),uxTaskPriorityGet)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskPrioritySet)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle);
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskResume)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & active = TRUE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),beforeResumeAll)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),beforeResumeAll)==(active = FALSE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),xTaskResumeAll)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),xTaskResumeAll)==(active = FALSE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskStartScheduler)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskStartScheduler)==(active = FALSE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskSuspend)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle);
  Own_Precondition(Refinement(FreeRTOSBasic_r),vTaskSuspendAll)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),vTaskSuspendAll)==(active = TRUE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),xQueueCreate)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),xQueueCreate)==(uxQueueLength: QUEUE_LENGTH & uxItemSize: NAT);
  Own_Precondition(Refinement(FreeRTOSBasic_r),queueDelete)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),queueDelete)==(pxQueue: queues_msg & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {});
  Own_Precondition(Refinement(FreeRTOSBasic_r),sendItem)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),sendItem)==(pxQueue: queues_msg & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & running/=idle & active = TRUE & pvItemToQueue/:queue_items(pxQueue));
  Own_Precondition(Refinement(FreeRTOSBasic_r),receiveItem)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),receiveItem)==(active = TRUE & running/=idle & pxQueue: QUEUE & pxQueue: queues_msg & xTicksToWait: TICK & justPeeking: BOOL & running: runable & running/=TASK_NULL);
  Own_Precondition(Refinement(FreeRTOSBasic_r),createSemaphore)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),createSemaphore)==(maxCount: QUEUE_LENGTH & initialCount: QUEUE_QUANT & initialCount<=maxCount);
  Own_Precondition(Refinement(FreeRTOSBasic_r),deleteSemaphore)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),deleteSemaphore)==(semaphore: semaphores & queue_sending(semaphore)/={} & queue_receiving(semaphore)/={});
  Own_Precondition(Refinement(FreeRTOSBasic_r),takeSemaphore)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),takeSemaphore)==(semaphore: semaphores & xTicksToWait: TICK & running/=idle & active = TRUE & running/=TASK_NULL);
  Own_Precondition(Refinement(FreeRTOSBasic_r),giveSemaphore)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),giveSemaphore)==(semaphore: semaphores & xTicksToWait: TICK & running/=idle & active = TRUE & running/=TASK_NULL);
  Own_Precondition(Refinement(FreeRTOSBasic_r),createMutex)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),createMutex)==(btrue);
  Own_Precondition(Refinement(FreeRTOSBasic_r),takeMutex)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),takeMutex)==(mutex: mutexes & xTicksToWait: TICK & active = TRUE & running/=idle);
  Own_Precondition(Refinement(FreeRTOSBasic_r),giveMutex)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),giveMutex)==(mutex: mutexes & mutex: mutexes_busy & mutex_holder(mutex) = running & xTicksToWait: TICK & active = TRUE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),getTickCount)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),getTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  Own_Precondition(Refinement(FreeRTOSBasic_r),incrementTick)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),incrementTick)==(active = TRUE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),afterIncrementTick)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),afterIncrementTick)==(active = TRUE);
  Own_Precondition(Refinement(FreeRTOSBasic_r),xQueueCreateMutex)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),xQueueCreateMutex)==(btrue);
  Own_Precondition(Refinement(FreeRTOSBasic_r),xSemaphoreCreateRecursiveMutex)==(btrue);
  List_Precondition(Refinement(FreeRTOSBasic_r),xSemaphoreCreateRecursiveMutex)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),xSemaphoreCreateRecursiveMutex)==(btrue | @mutex.(mutex: QUEUE & mutex/:queues ==> queues,mutexes,queue_receiving,first_receiving,queue_sending,first_sending,mutex_holder,xQueueHandle:=queues\/{mutex},mutexes\/{mutex},queue_receiving\/{mutex|->{}},first_receiving\/{mutex|->TASK_NULL},queue_sending\/{mutex|->{}},first_sending\/{mutex|->TASK_NULL},mutex_holder\/{mutex|->TASK_NULL},mutex));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),xQueueCreateMutex)==(btrue | @mutex.(mutex: QUEUE & mutex/:queues ==> queues,mutexes,queue_receiving,first_receiving,queue_sending,first_sending,mutex_holder,xQueueHandle:=queues\/{mutex},mutexes\/{mutex},queue_receiving\/{mutex|->{}},first_receiving\/{mutex|->TASK_NULL},queue_sending\/{mutex|->{}},first_sending\/{mutex|->TASK_NULL},mutex_holder\/{mutex|->TASK_NULL},mutex));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),afterIncrementTick)==(active = TRUE & unblocked: FIN(TASK) & unblocked <: blocked & unblocked = unblocked & unblocked: POW(TASK) | unblocked/={} ==> (@n_runable.(n_runable <: tasks & n_runable = runable\/unblocked ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))) || blocked:=blocked-unblocked || unblocked:={}) [] not(unblocked/={}) ==> skip || (queue_sending/={} ==> @(n_sending,n_first).(n_sending: QUEUE +-> POW(TASK) & dom(n_sending) = dom(queue_sending) & n_sending = remove_task(queue_sending,unblocked) & n_first: QUEUE +-> TASK & dom(n_first) = dom(first_sending) & !q1.(q1: queues & q1: dom(n_first) & n_sending(q1)/={} => n_first(q1): n_sending(q1)) ==> queue_sending,first_sending:=n_sending,n_first) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> @(n_receiving,n_first).(n_receiving: QUEUE +-> POW(TASK) & dom(n_receiving) = dom(queue_receiving) & n_receiving = remove_task(queue_receiving,unblocked) & n_first: QUEUE +-> TASK & dom(n_first) = dom(first_receiving) & !q1.(q1: queues & q1: dom(n_first) & n_receiving(q1)/={} => n_first(q1): n_receiving(q1)) ==> queue_receiving,first_receiving:=n_receiving,n_first) [] not(queue_receiving/={}) ==> skip)));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),incrementTick)==(active = TRUE & active = TRUE & TICK_INCREMENT(tickCount,1): TICK | tickCount:=TICK_INCREMENT(tickCount,1) || @n_unblocked.(n_unblocked: FIN(TASK) & n_unblocked <: blocked ==> unblocked:=n_unblocked));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),getTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | numberOfTicks:=tickCount);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),giveMutex)==(mutex: mutexes & mutex: mutexes_busy & mutex_holder(mutex) = running & xTicksToWait: TICK & active = TRUE & mutex: mutexes & mutex: mutexes_busy | mutexes_busy,mutex_holder:=mutexes_busy-{mutex},mutex_holder<+{mutex|->TASK_NULL} || @(n_receiving,n_first).(n_receiving: POW(TASK) & n_receiving = queue_receiving(mutex)-{first_receiving(mutex)} & n_first: TASK & n_first: n_receiving ==> queue_receiving,first_receiving:=queue_receiving<+{mutex|->n_receiving},first_receiving<+{mutex|->n_first}) || (queue_receiving(mutex)/={} ==> (first_receiving(mutex): TASK & first_receiving(mutex): tasks & first_receiving(mutex): blocked\/suspended & active = TRUE & running/=idle | first_receiving(mutex): blocked ==> (blocked:=blocked-{first_receiving(mutex)} || (first_receiving(mutex): unblocked ==> unblocked:=unblocked-{first_receiving(mutex)} [] not(first_receiving(mutex): unblocked) ==> skip)) [] not(first_receiving(mutex): blocked) ==> skip || (first_receiving(mutex): suspended ==> suspended:=suspended-{first_receiving(mutex)} [] not(first_receiving(mutex): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_receiving(mutex)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_receiving(mutex)/={}) ==> skip));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),takeMutex)==(mutex: mutexes & xTicksToWait: TICK & active = TRUE & running/=idle | mutex: mutexes_busy ==> (xTicksToWait: TICK & mutex_holder(mutex): tasks & mutex_holder(mutex)/=idle & running/=idle & running: runable & active = TRUE & mutex: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (@(running$0).(running$0: n_runable ==> running:=running$0) || runable:=n_runable)) || blocked:=blocked\/{running} || (queue_receiving:=queue_receiving<+{mutex|->(queue_receiving(mutex)\/{running})} || (queue_receiving(mutex) = {} ==> first_receiving:=first_receiving<+{mutex|->running} [] not(queue_receiving(mutex) = {}) ==> skip))) [] not(mutex: mutexes_busy) ==> (mutex: mutexes & mutex/:mutexes_busy & running: TASK & running/=TASK_NULL | mutexes_busy,mutex_holder:=mutexes_busy\/{mutex},mutex_holder<+{mutex|->running}));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),createMutex)==(btrue | @(mutex$0).(mutex$0: QUEUE & mutex$0/:queues ==> queues,mutexes,queue_receiving,first_receiving,queue_sending,first_sending,mutex_holder,mutex:=queues\/{mutex$0},mutexes\/{mutex$0},queue_receiving\/{mutex$0|->{}},first_receiving\/{mutex$0|->TASK_NULL},queue_sending\/{mutex$0|->{}},first_sending\/{mutex$0|->TASK_NULL},mutex_holder\/{mutex$0|->TASK_NULL},mutex$0) [] mutex:=QUEUE_NULL);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),giveSemaphore)==(semaphore: semaphores & xTicksToWait: TICK & running/=idle & active = TRUE & running/=TASK_NULL | semaphore/:semaphores_full ==> (semaphore: semaphores | semaphore: semaphores_busy ==> semaphores_busy:=semaphores_busy-{semaphore} [] not(semaphore: semaphores_busy) ==> skip [] skip || @(n_receiving,n_first).(n_receiving: POW(TASK) & n_receiving = queue_receiving(semaphore)-{first_receiving(semaphore)} & n_first: TASK & n_first: n_receiving ==> queue_receiving,first_receiving:=queue_receiving<+{semaphore|->n_receiving},first_receiving<+{semaphore|->n_first}) || (queue_receiving(semaphore)/={} ==> (first_receiving(semaphore): TASK & first_receiving(semaphore): blocked\/suspended & active = TRUE | first_receiving(semaphore): blocked ==> (blocked:=blocked-{first_receiving(semaphore)} || (first_receiving(semaphore): unblocked ==> unblocked:=unblocked-{first_receiving(semaphore)} [] not(first_receiving(semaphore): unblocked) ==> skip)) [] not(first_receiving(semaphore): blocked) ==> skip || (first_receiving(semaphore): suspended ==> suspended:=suspended-{first_receiving(semaphore)} [] not(first_receiving(semaphore): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_receiving(semaphore)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_receiving(semaphore)/={}) ==> skip) || return:=pdPASS) [] not(semaphore/:semaphores_full) ==> (xTicksToWait = 0 ==> return:=pdFAIL [] not(xTicksToWait = 0) ==> (xTicksToWait = MAX_DELAY ==> (running: TASK & running: tasks & running/=idle & semaphore: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | running: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || (running = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(running = running) ==> skip))) [] not(running: runable) ==> (running: blocked ==> (blocked:=blocked-{running} || (running: unblocked ==> unblocked:=unblocked-{running} [] not(running: unblocked) ==> skip)) [] not(running: blocked) ==> skip) || suspended:=suspended\/{running} || (queue_sending:=queue_sending<+{semaphore|->(queue_sending(semaphore)\/{running})} || (queue_sending(semaphore) = {} ==> first_sending:=first_sending<+{semaphore|->running} [] not(queue_sending(semaphore) = {}) ==> skip)) || return:=pdPASS) [] not(xTicksToWait = MAX_DELAY) ==> (running: TASK & running = running & running: runable & running/=idle & xTicksToWait: TICK & semaphore: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running} || (queue_sending:=queue_sending<+{semaphore|->(queue_sending(semaphore)\/{running})} || (queue_sending(semaphore) = {} ==> first_sending:=first_sending<+{semaphore|->running} [] not(queue_sending(semaphore) = {}) ==> skip)) || return:=pdPASS))));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),takeSemaphore)==(semaphore: semaphores & xTicksToWait: TICK & running/=idle & active = TRUE & running/=TASK_NULL | semaphore/:semaphores_busy ==> (semaphore: semaphores & semaphore/:semaphores_busy | semaphore: semaphores_full ==> semaphores_full:=semaphores_full-{semaphore} [] not(semaphore: semaphores_full) ==> (semaphores_busy:=semaphores_busy\/{semaphore} [] skip) || @(n_sending,n_first).(n_sending: POW(TASK) & n_sending = queue_sending(semaphore)-{first_sending(semaphore)} & n_first: TASK & n_first: n_sending ==> queue_sending,first_sending:=queue_sending<+{semaphore|->n_sending},first_sending<+{semaphore|->n_first}) || (queue_sending(semaphore)/={} ==> (first_sending(semaphore): TASK & first_sending(semaphore): blocked\/suspended & active = TRUE | first_sending(semaphore): blocked ==> (blocked:=blocked-{first_sending(semaphore)} || (first_sending(semaphore): unblocked ==> unblocked:=unblocked-{first_sending(semaphore)} [] not(first_sending(semaphore): unblocked) ==> skip)) [] not(first_sending(semaphore): blocked) ==> skip || (first_sending(semaphore): suspended ==> suspended:=suspended-{first_sending(semaphore)} [] not(first_sending(semaphore): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_sending(semaphore)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_sending(semaphore)/={}) ==> skip) || return:=pdPASS) [] not(semaphore/:semaphores_busy) ==> (xTicksToWait = 0 ==> return:=pdFAIL [] not(xTicksToWait = 0) ==> (xTicksToWait = MAX_DELAY ==> (running: TASK & running: tasks & running/=idle & semaphore: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | running: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || (running = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(running = running) ==> skip))) [] not(running: runable) ==> (running: blocked ==> (blocked:=blocked-{running} || (running: unblocked ==> unblocked:=unblocked-{running} [] not(running: unblocked) ==> skip)) [] not(running: blocked) ==> skip) || suspended:=suspended\/{running} || (queue_receiving:=queue_receiving<+{semaphore|->(queue_receiving(semaphore)\/{running})} || (queue_receiving(semaphore) = {} ==> first_receiving:=first_receiving<+{semaphore|->running} [] not(queue_receiving(semaphore) = {}) ==> skip)) || return:=pdPASS) [] not(xTicksToWait = MAX_DELAY) ==> (running: TASK & running = running & running: runable & running/=idle & xTicksToWait: TICK & semaphore: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running} || (queue_receiving:=queue_receiving<+{semaphore|->(queue_receiving(semaphore)\/{running})} || (queue_receiving(semaphore) = {} ==> first_receiving:=first_receiving<+{semaphore|->running} [] not(queue_receiving(semaphore) = {}) ==> skip)) || return:=pdPASS))));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),deleteSemaphore)==(semaphore: semaphores & queue_sending(semaphore)/={} & queue_receiving(semaphore)/={} & semaphore: semaphores | queues,semaphores,queue_receiving,first_receiving,queue_sending,first_sending:=queues-{semaphore},semaphores-{semaphore},{semaphore}<<|queue_receiving,{semaphore}<<|first_receiving,{semaphore}<<|queue_sending,{semaphore}<<|first_sending || (semaphore: semaphores_busy ==> semaphores_busy:=semaphores_busy-{semaphore} [] not(semaphore: semaphores_busy) ==> skip) || (semaphore: semaphores_full ==> semaphores_full:=semaphores_full-{semaphore} [] not(semaphore: semaphores_full) ==> skip));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),createSemaphore)==(maxCount: QUEUE_LENGTH & initialCount: QUEUE_QUANT & initialCount<=maxCount | @(semaphore$0).(semaphore$0: QUEUE & semaphore$0/:queues ==> (queues,queue_receiving,first_receiving,queue_sending,first_sending,semaphores:=queues\/{semaphore$0},queue_receiving\/{semaphore$0|->{}},first_receiving\/{semaphore$0|->TASK_NULL},queue_sending\/{semaphore$0|->{}},first_sending\/{semaphore$0|->TASK_NULL},semaphores\/{semaphore$0} || (semaphores_busy:=semaphores_busy\/{semaphore$0} [] semaphores_full:=semaphores_full\/{semaphore$0} [] skip) || semaphore:=semaphore$0)) [] semaphore:=QUEUE_NULL);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),receiveItem)==(active = TRUE & running/=idle & pxQueue: QUEUE & pxQueue: queues_msg & xTicksToWait: TICK & justPeeking: BOOL & running: runable & running/=TASK_NULL | pxQueue: queues_msg_empty ==> (xTicksToWait = 0 ==> return,pvBuffer:=pdFAIL,ITEM_NULL [] not(xTicksToWait = 0) ==> (xTicksToWait = MAX_DELAY ==> (running: TASK & running: tasks & running/=idle & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | running: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || (running = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(running = running) ==> skip))) [] not(running: runable) ==> (running: blocked ==> (blocked:=blocked-{running} || (running: unblocked ==> unblocked:=unblocked-{running} [] not(running: unblocked) ==> skip)) [] not(running: blocked) ==> skip) || suspended:=suspended\/{running} || (queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{running})} || (queue_receiving(pxQueue) = {} ==> first_receiving:=first_receiving<+{pxQueue|->running} [] not(queue_receiving(pxQueue) = {}) ==> skip)) || return,pvBuffer:=pdPASS,ITEM_NULL) [] not(xTicksToWait = MAX_DELAY) ==> (running: TASK & running = running & running: runable & running/=idle & xTicksToWait: TICK & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running} || (queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{running})} || (queue_receiving(pxQueue) = {} ==> first_receiving:=first_receiving<+{pxQueue|->running} [] not(queue_receiving(pxQueue) = {}) ==> skip)) || return,pvBuffer:=pdPASS,ITEM_NULL))) [] not(pxQueue: queues_msg_empty) ==> (pxQueue: queues_msg & justPeeking: BOOL & pxQueue/:queues_msg_empty | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = FALSE ==> (queue_sending(pxQueue)/={} ==> @(n_sending,n_first).(n_sending: POW(TASK) & n_first: TASK & n_sending = queue_sending(pxQueue)-{first_sending(pxQueue)} & n_first: n_sending ==> (queue_items,queue_sending,first_sending:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}},queue_sending<+{pxQueue|->n_sending},first_sending<+{pxQueue|->n_first} || (pxQueue: queues_msg_full ==> queues_msg_full:=queues_msg_full-{pxQueue} [] not(pxQueue: queues_msg_full) ==> skip) || (queues_msg_empty:=queues_msg_empty\/{pxQueue} [] skip))) [] not(queue_sending(pxQueue)/={}) ==> skip) [] not(justPeeking = FALSE) ==> skip || pvBuffer:=item)) || return:=pdPASS || (justPeeking = FALSE ==> (queue_sending(pxQueue)/={} ==> (first_sending(pxQueue): TASK & first_sending(pxQueue): blocked\/suspended & active = TRUE | first_sending(pxQueue): blocked ==> (blocked:=blocked-{first_sending(pxQueue)} || (first_sending(pxQueue): unblocked ==> unblocked:=unblocked-{first_sending(pxQueue)} [] not(first_sending(pxQueue): unblocked) ==> skip)) [] not(first_sending(pxQueue): blocked) ==> skip || (first_sending(pxQueue): suspended ==> suspended:=suspended-{first_sending(pxQueue)} [] not(first_sending(pxQueue): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_sending(pxQueue)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_sending(pxQueue)/={}) ==> skip) [] not(justPeeking = FALSE) ==> skip)));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),sendItem)==(pxQueue: queues_msg & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & running/=idle & active = TRUE & pvItemToQueue/:queue_items(pxQueue) | pxQueue/:queues_msg_full ==> (pxQueue: queues_msg & pvItemToQueue: ITEM & pvItemToQueue/:queue_items(pxQueue) & copy_position: COPY_POSITION & pxQueue/:queues_msg_full | queue_items:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pvItemToQueue})} || (queue_receiving(pxQueue)/={} ==> @(n_receiving,n_first).(n_receiving: POW(TASK) & n_first: TASK & n_receiving = queue_receiving(pxQueue)-{first_receiving(pxQueue)} & n_first: n_receiving ==> queue_receiving,first_receiving:=queue_receiving<+{pxQueue|->n_receiving},first_receiving<+{pxQueue|->n_first}) [] not(queue_receiving(pxQueue)/={}) ==> skip) || (pxQueue: queues_msg_empty ==> queues_msg_empty:=queues_msg_empty-{pxQueue} [] not(pxQueue: queues_msg_empty) ==> skip) || (queues_msg_full:=queues_msg_full\/{pxQueue} [] skip) || (queue_receiving(pxQueue)/={} ==> (first_receiving(pxQueue): TASK & first_receiving(pxQueue): blocked\/suspended & active = TRUE | first_receiving(pxQueue): blocked ==> (blocked:=blocked-{first_receiving(pxQueue)} || (first_receiving(pxQueue): unblocked ==> unblocked:=unblocked-{first_receiving(pxQueue)} [] not(first_receiving(pxQueue): unblocked) ==> skip)) [] not(first_receiving(pxQueue): blocked) ==> skip || (first_receiving(pxQueue): suspended ==> suspended:=suspended-{first_receiving(pxQueue)} [] not(first_receiving(pxQueue): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_receiving(pxQueue)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_receiving(pxQueue)/={}) ==> skip) || return:=pdPASS) [] not(pxQueue/:queues_msg_full) ==> (xTicksToWait = 0 ==> return:=pdFAIL [] not(xTicksToWait = 0) ==> (xTicksToWait = MAX_DELAY ==> (running: TASK & running: tasks & running/=idle & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | running: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || (running = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(running = running) ==> skip))) [] not(running: runable) ==> (running: blocked ==> (blocked:=blocked-{running} || (running: unblocked ==> unblocked:=unblocked-{running} [] not(running: unblocked) ==> skip)) [] not(running: blocked) ==> skip) || suspended:=suspended\/{running} || (queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{running})} || (queue_sending(pxQueue) = {} ==> first_sending:=first_sending<+{pxQueue|->running} [] not(queue_sending(pxQueue) = {}) ==> skip)) || return:=pdPASS) [] not(xTicksToWait = MAX_DELAY) ==> (running: TASK & running = running & running: runable & running/=idle & xTicksToWait: TICK & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running} || (queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{running})} || (queue_sending(pxQueue) = {} ==> first_sending:=first_sending<+{pxQueue|->running} [] not(queue_sending(pxQueue) = {}) ==> skip)) || return:=pdPASS))));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),queueDelete)==(pxQueue: queues_msg & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {} & pxQueue: queues & pxQueue/:semaphores & pxQueue/:mutexes & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {} | queues,queues_msg,queue_items,queue_receiving,queue_sending,first_sending,first_receiving:=queues-{pxQueue},queues_msg-{pxQueue},{pxQueue}<<|queue_items,{pxQueue}<<|queue_receiving,{pxQueue}<<|queue_sending,{pxQueue}<<|first_sending,{pxQueue}<<|first_receiving || (pxQueue: queues_msg_full ==> queues_msg_full:=queues_msg_full-{pxQueue} [] not(pxQueue: queues_msg_full) ==> skip) || (pxQueue: queues_msg_empty ==> queues_msg_empty:=queues_msg_empty-{pxQueue} [] not(pxQueue: queues_msg_empty) ==> skip));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),xQueueCreate)==(uxQueueLength: QUEUE_LENGTH & uxItemSize: NAT | @pxQueue.(pxQueue: QUEUE & pxQueue/:queues ==> queues,queues_msg,queue_items,queue_receiving,queue_sending,queues_msg_empty,xQueueHandle,first_sending,first_receiving:=queues\/{pxQueue},queues_msg\/{pxQueue},queue_items\/{pxQueue|->{}},queue_receiving\/{pxQueue|->{}},queue_sending\/{pxQueue|->{}},queues_msg_empty\/{pxQueue},pxQueue,first_sending\/{pxQueue|->TASK_NULL},first_receiving\/{pxQueue|->TASK_NULL}) [] xQueueHandle:=QUEUE_NULL);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskSuspendAll)==(active = TRUE | active:=FALSE);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle | pxTaskToSuspend/:suspended ==> (pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle & pxTaskToSuspend: TASK | pxTaskToSuspend: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{pxTaskToSuspend} ==> (runable:=n_runable || (pxTaskToSuspend = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(pxTaskToSuspend = running) ==> skip))) [] not(pxTaskToSuspend: runable) ==> (pxTaskToSuspend: blocked ==> (blocked:=blocked-{pxTaskToSuspend} || (pxTaskToSuspend: unblocked ==> unblocked:=unblocked-{pxTaskToSuspend} [] not(pxTaskToSuspend: unblocked) ==> skip)) [] not(pxTaskToSuspend: blocked) ==> skip) || suspended:=suspended\/{pxTaskToSuspend} || (@(pxQueue,n_receiving,n_first).(pxQueue: queues & pxTaskToSuspend: queue_receiving(pxQueue) & n_receiving: POW(TASK) & n_receiving = queue_receiving(pxQueue)-{first_receiving(pxQueue)} & n_first: TASK & n_first: queue_receiving(pxQueue) ==> queue_receiving,first_receiving:=queue_receiving<+{pxQueue|->n_receiving},first_receiving<+{pxQueue|->n_first}) || @(pxQueue,n_sending,n_first).(pxQueue: queues & n_sending: POW(TASK) & n_first: TASK & pxTaskToSuspend: queue_sending(pxQueue) & n_sending = queue_sending(pxQueue)-{first_sending(pxQueue)} & n_first = first_sending(pxQueue) ==> queue_sending,first_sending:=queue_sending<+{pxQueue|->n_sending},first_sending<+{pxQueue|->n_first}))) [] not(pxTaskToSuspend/:suspended) ==> skip);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskStartScheduler)==(active = FALSE | active:=TRUE || @(idle_task,n_runable).(idle_task: TASK & idle_task/:tasks & n_runable <: tasks & n_runable = runable\/{idle_task} ==> (idle,tasks,runable:=idle_task,tasks\/{idle_task},n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) [] skip);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),xTaskResumeAll)==(active = FALSE & unblocked: FIN(TASK) & unblocked <: blocked & unblocked = unblocked & unblocked: POW(TASK) | unblocked/={} ==> (@n_runable.(n_runable <: tasks & n_runable = runable\/unblocked ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))) || blocked:=blocked-unblocked || unblocked:={}) [] not(unblocked/={}) ==> skip || (queue_sending/={} ==> @(n_sending,n_first).(n_sending: QUEUE +-> POW(TASK) & dom(n_sending) = dom(queue_sending) & n_sending = remove_task(queue_sending,unblocked) & n_first: QUEUE +-> TASK & dom(n_first) = dom(first_sending) & !q1.(q1: queues & q1: dom(n_first) & n_sending(q1)/={} => n_first(q1): n_sending(q1)) ==> queue_sending,first_sending:=n_sending,n_first) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> @(n_receiving,n_first).(n_receiving: QUEUE +-> POW(TASK) & dom(n_receiving) = dom(queue_receiving) & n_receiving = remove_task(queue_receiving,unblocked) & n_first: QUEUE +-> TASK & dom(n_first) = dom(first_receiving) & !q1.(q1: queues & q1: dom(n_first) & n_receiving(q1)/={} => n_first(q1): n_receiving(q1)) ==> queue_receiving,first_receiving:=n_receiving,n_first) [] not(queue_receiving/={}) ==> skip)) || tickCount:=TICK_INCREMENT(tickCount,tickMissed));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),beforeResumeAll)==(active = FALSE & tickCount: TICK & TICK_INCREMENT(tickCount,tickMissed): TICK | @n_unblocked.(n_unblocked: FIN(TASK) & n_unblocked <: blocked ==> unblocked:=n_unblocked));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & active = TRUE & pxTaskToResume: TASK & pxTaskToResume: suspended & active = TRUE & pxTaskToResume: TASK | @n_runable.(n_runable <: tasks & n_runable = runable\/{pxTaskToResume} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))) || suspended:=suspended-{pxTaskToResume} || (@(pxQueue,n_receiving,n_first).(pxQueue: queues & pxTaskToResume: queue_receiving(pxQueue) & n_receiving: POW(TASK) & n_receiving = queue_receiving(pxQueue)-{first_receiving(pxQueue)} & n_first: TASK & n_first: queue_receiving(pxQueue) ==> queue_receiving,first_receiving:=queue_receiving<+{pxQueue|->n_receiving},first_receiving<+{pxQueue|->n_first}) || @(pxQueue,n_sending,n_first).(pxQueue: queues & n_sending: POW(TASK) & n_first: TASK & pxTaskToResume: queue_sending(pxQueue) & n_sending = queue_sending(pxQueue)-{first_sending(pxQueue)} & n_first = first_sending(pxQueue) ==> queue_sending,first_sending:=queue_sending<+{pxQueue|->n_sending},first_sending<+{pxQueue|->n_first})));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle & pxTask: tasks & uxNewPriority: PRIORITY & pxTask/=idle & active = TRUE | @(running$0).(running$0: runable ==> running:=running$0) [] skip);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 & pxTask: TASK & pxTask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 & btrue | cTask:=running);
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskEndScheduler)==(active = TRUE & active = TRUE & btrue | active,tasks,blocked,suspended,runable,unblocked:=FALSE,{},{},{},{},{} || queues,queues_msg,queues_msg_empty,queues_msg_full,queue_items,queue_receiving,first_receiving,queue_sending,first_sending,semaphores,semaphores_busy,mutexes,mutexes_busy,mutex_holder,semaphores_full:={},{},{},{},{},{},{},{},{},{},{},{},{},{},{});
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder) & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete: TASK | tasks:=tasks-{pxTaskToDelete} || (pxTaskToDelete: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{pxTaskToDelete} ==> (runable:=n_runable || (pxTaskToDelete = running ==> (active = TRUE ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(active = TRUE) ==> skip) [] not(pxTaskToDelete = running) ==> skip))) [] not(pxTaskToDelete: runable) ==> (pxTaskToDelete: blocked ==> (blocked:=blocked-{pxTaskToDelete} || (pxTaskToDelete: unblocked ==> unblocked:=unblocked-{pxTaskToDelete} [] not(pxTaskToDelete: unblocked) ==> skip)) [] not(pxTaskToDelete: blocked) ==> (pxTaskToDelete: suspended ==> suspended:=suspended-{pxTaskToDelete} [] not(pxTaskToDelete: suspended) ==> skip))) || (@(pxQueue,n_receiving,n_first).(pxQueue: queues & pxTaskToDelete: queue_receiving(pxQueue) & n_receiving: POW(TASK) & n_receiving = queue_receiving(pxQueue)-{first_receiving(pxQueue)} & n_first: TASK & n_first: queue_receiving(pxQueue) ==> queue_receiving,first_receiving:=queue_receiving<+{pxQueue|->n_receiving},first_receiving<+{pxQueue|->n_first}) || @(pxQueue,n_sending,n_first).(pxQueue: queues & n_sending: POW(TASK) & n_first: TASK & pxTaskToDelete: queue_sending(pxQueue) & n_sending = queue_sending(pxQueue)-{first_sending(pxQueue)} & n_first = first_sending(pxQueue) ==> queue_sending,first_sending:=queue_sending<+{pxQueue|->n_sending},first_sending<+{pxQueue|->n_first})));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1 & running: runable | xTimeIncrement>0 ==> (running: TASK & running = running & running: runable & running/=idle & TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement): TICK | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running}) [] not(xTimeIncrement>0) ==> (active = TRUE ==> (active = TRUE | @(running$0).(running$0: runable ==> running:=running$0)) [] not(active = TRUE) ==> skip));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & running: runable | xTicksToDelay>0 ==> (running: TASK & running = running & running: runable & running/=idle & TICK_INCREMENT(tickCount,xTicksToDelay): TICK | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running}) [] not(xTicksToDelay>0) ==> (active = TRUE ==> (active = TRUE | @(running$0).(running$0: runable ==> running:=running$0)) [] not(active = TRUE) ==> skip));
  Expanded_List_Substitution(Refinement(FreeRTOSBasic_r),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY & uxPriority: PRIORITY | @(task,n_runable).(task: TASK & task/:tasks & n_runable <: tasks & n_runable = runable\/{task} & task/=TASK_NULL ==> (tasks,runable:=tasks\/{task},n_runable || (skip [] @(running$0).(running$0: n_runable ==> running:=running$0)) || handle:=task)) || result:=pdPASS [] result,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL);
  List_Substitution(Refinement(FreeRTOSBasic_r),xTaskCreate)==(CHOICE handle <-- t_create(uxPriority) || result:=pdPASS OR result:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || handle:=TASK_NULL END);
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskDelay)==(IF xTicksToDelay>0 THEN t_delayTask(TICK_INCREMENT(tickCount,xTicksToDelay),running) ELSE IF active = TRUE THEN t_yield END END);
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskDelayUntil)==(IF xTimeIncrement>0 THEN t_delayTask(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement),running) ELSE IF active = TRUE THEN t_yield END END);
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskDelete)==(t_delete(pxTaskToDelete) || q_removeFromEventListQueue(pxTaskToDelete));
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskEndScheduler)==(t_endScheduler || q_endScheduler);
  List_Substitution(Refinement(FreeRTOSBasic_r),xTaskGetCurrentTaskHandle)==(cTask <-- t_getCurrent);
  List_Substitution(Refinement(FreeRTOSBasic_r),uxTaskGetNumberOfTasks)==(numberOfTasks <-- t_getNumberOfTasks);
  List_Substitution(Refinement(FreeRTOSBasic_r),uxTaskPriorityGet)==(priority <-- t_getPriority(pxTask));
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskPrioritySet)==(t_setPriority(pxTask,uxNewPriority));
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskResume)==(t_resume(pxTaskToResume) || q_removeFromEventListQueue(pxTaskToResume));
  List_Substitution(Refinement(FreeRTOSBasic_r),beforeResumeAll)==(t_beforeResumeAll(tickCount,TICK_INCREMENT(tickCount,tickMissed)));
  List_Substitution(Refinement(FreeRTOSBasic_r),xTaskResumeAll)==(t_resumeAll(unblocked) || q_resumeAll(unblocked) || tickCount:=TICK_INCREMENT(tickCount,tickMissed));
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskStartScheduler)==(CHOICE t_startScheduler OR skip END);
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskSuspend)==(IF pxTaskToSuspend/:suspended THEN t_suspend(pxTaskToSuspend) || q_removeFromEventListQueue(pxTaskToSuspend) END);
  List_Substitution(Refinement(FreeRTOSBasic_r),vTaskSuspendAll)==(t_suspendAll);
  List_Substitution(Refinement(FreeRTOSBasic_r),xQueueCreate)==(CHOICE xQueueHandle <-- q_queueCreate(uxQueueLength,uxItemSize) OR xQueueHandle:=QUEUE_NULL END);
  List_Substitution(Refinement(FreeRTOSBasic_r),queueDelete)==(q_queueDelete(pxQueue));
  List_Substitution(Refinement(FreeRTOSBasic_r),sendItem)==(IF pxQueue/:queues_msg_full THEN q_sendItem(pxQueue,pvItemToQueue,copy_position) || IF queue_receiving(pxQueue)/={} THEN t_removeFromEventList(first_receiving(pxQueue)) END || return:=pdPASS ELSE IF xTicksToWait = 0 THEN return:=pdFAIL ELSIF xTicksToWait = MAX_DELAY THEN t_suspend(running) || q_insertTaskWaitingToSend(pxQueue,running) || return:=pdPASS ELSE t_delayTask(xTicksToWait,running) || q_insertTaskWaitingToSend(pxQueue,running) || return:=pdPASS END END);
  List_Substitution(Refinement(FreeRTOSBasic_r),receiveItem)==(IF pxQueue: queues_msg_empty THEN IF xTicksToWait = 0 THEN return,pvBuffer:=pdFAIL,ITEM_NULL ELSIF xTicksToWait = MAX_DELAY THEN t_suspend(running) || q_insertTaskWaitingToReceive(pxQueue,running) || return,pvBuffer:=pdPASS,ITEM_NULL ELSE t_delayTask(xTicksToWait,running) || q_insertTaskWaitingToReceive(pxQueue,running) || return,pvBuffer:=pdPASS,ITEM_NULL END ELSE pvBuffer <-- q_receivedItem(pxQueue,justPeeking) || return:=pdPASS || IF justPeeking = FALSE THEN IF queue_sending(pxQueue)/={} THEN t_removeFromEventList(first_sending(pxQueue)) END END END);
  List_Substitution(Refinement(FreeRTOSBasic_r),createSemaphore)==(CHOICE semaphore <-- q_createSemaphore(maxCount,initialCount) OR semaphore:=QUEUE_NULL END);
  List_Substitution(Refinement(FreeRTOSBasic_r),deleteSemaphore)==(q_deleteSemaphore(semaphore));
  List_Substitution(Refinement(FreeRTOSBasic_r),takeSemaphore)==(IF semaphore/:semaphores_busy THEN q_takeSemaphore(semaphore) || IF queue_sending(semaphore)/={} THEN t_removeFromEventList(first_sending(semaphore)) END || return:=pdPASS ELSE IF xTicksToWait = 0 THEN return:=pdFAIL ELSIF xTicksToWait = MAX_DELAY THEN t_suspend(running) || q_insertTaskWaitingToReceive(semaphore,running) || return:=pdPASS ELSE t_delayTask(xTicksToWait,running) || q_insertTaskWaitingToReceive(semaphore,running) || return:=pdPASS END END);
  List_Substitution(Refinement(FreeRTOSBasic_r),giveSemaphore)==(IF semaphore/:semaphores_full THEN q_giveSemaphore(semaphore) || IF queue_receiving(semaphore)/={} THEN t_removeFromEventList(first_receiving(semaphore)) END || return:=pdPASS ELSE IF xTicksToWait = 0 THEN return:=pdFAIL ELSIF xTicksToWait = MAX_DELAY THEN t_suspend(running) || q_insertTaskWaitingToSend(semaphore,running) || return:=pdPASS ELSE t_delayTask(xTicksToWait,running) || q_insertTaskWaitingToSend(semaphore,running) || return:=pdPASS END END);
  List_Substitution(Refinement(FreeRTOSBasic_r),createMutex)==(CHOICE mutex <-- q_createMutex OR mutex:=QUEUE_NULL END);
  List_Substitution(Refinement(FreeRTOSBasic_r),takeMutex)==(IF mutex: mutexes_busy THEN t_priorityInherit(mutex_holder(mutex),xTicksToWait) || q_insertTaskWaitingToReceive(mutex,running) ELSE q_takeMutex(mutex,running) END);
  List_Substitution(Refinement(FreeRTOSBasic_r),giveMutex)==(q_giveMutex(mutex) || IF queue_receiving(mutex)/={} THEN t_returnPriority(first_receiving(mutex)) END);
  List_Substitution(Refinement(FreeRTOSBasic_r),getTickCount)==(numberOfTicks:=tickCount);
  List_Substitution(Refinement(FreeRTOSBasic_r),incrementTick)==(tickCount:=TICK_INCREMENT(tickCount,1) || t_incrementTick(TICK_INCREMENT(tickCount,1)));
  List_Substitution(Refinement(FreeRTOSBasic_r),afterIncrementTick)==(t_resumeAll(unblocked) || q_resumeAll(unblocked));
  List_Substitution(Refinement(FreeRTOSBasic_r),xQueueCreateMutex)==(xQueueHandle <-- q_createMutex);
  List_Substitution(Refinement(FreeRTOSBasic_r),xSemaphoreCreateRecursiveMutex)==(xQueueHandle <-- q_createMutex)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(FreeRTOSBasic_r))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(FreeRTOSBasic_r),Machine(Task))==(?);
  List_Instanciated_Parameters(Refinement(FreeRTOSBasic_r),Machine(Queue))==(?);
  List_Instanciated_Parameters(Refinement(FreeRTOSBasic_r),Machine(Types))==(?);
  List_Instanciated_Parameters(Refinement(FreeRTOSBasic_r),Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(FreeRTOSBasic_r),Machine(Queue))==(btrue);
  List_Constraints(Refinement(FreeRTOSBasic_r))==(btrue);
  List_Context_Constraints(Refinement(FreeRTOSBasic_r))==(btrue);
  List_Constraints(Refinement(FreeRTOSBasic_r),Machine(Task))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(FreeRTOSBasic_r))==(remove_task,update_first,remove_task,update_first);
  Inherited_List_Constants(Refinement(FreeRTOSBasic_r))==(remove_task,update_first);
  List_Constants(Refinement(FreeRTOSBasic_r))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(FreeRTOSBasic_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Refinement(FreeRTOSBasic_r))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Refinement(FreeRTOSBasic_r))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Refinement(FreeRTOSBasic_r))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Refinement(FreeRTOSBasic_r))==(?);
  Inherited_List_Enumerated(Refinement(FreeRTOSBasic_r))==(?);
  Inherited_List_Defered(Refinement(FreeRTOSBasic_r))==(?);
  Inherited_List_Sets(Refinement(FreeRTOSBasic_r))==(?);
  List_Enumerated(Refinement(FreeRTOSBasic_r))==(?);
  List_Defered(Refinement(FreeRTOSBasic_r))==(?);
  List_Sets(Refinement(FreeRTOSBasic_r))==(?);
  Set_Definition(Refinement(FreeRTOSBasic_r),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(FreeRTOSBasic_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(FreeRTOSBasic_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(FreeRTOSBasic_r))==(?);
  Expanded_List_HiddenConstants(Refinement(FreeRTOSBasic_r))==(?);
  List_HiddenConstants(Refinement(FreeRTOSBasic_r))==(?);
  External_List_HiddenConstants(Refinement(FreeRTOSBasic_r))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(FreeRTOSBasic_r))==(remove_task: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> POW(TASK)) & remove_task = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | %q1.(q1: QUEUE & q1: dom(q_task) | q_task(q1)-unblocked)) & update_first: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> TASK) & update_first = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | {q1,task | q1: QUEUE & q1: dom(q_task) & q_task(q1)-unblocked/={} & task: TASK & task: q_task(q1)-unblocked}));
  Context_List_Properties(Refinement(FreeRTOSBasic_r))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}) & configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & PRIORITY = 0..configMAX_PRIORITIES-1);
  Inherited_List_Properties(Refinement(FreeRTOSBasic_r))==(remove_task: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> POW(TASK)) & remove_task = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | %q1.(q1: QUEUE & q1: dom(q_task) | q_task(q1)-unblocked)) & update_first: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> TASK) & update_first = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | {q1,task | q1: QUEUE & q1: dom(q_task) & q_task(q1)-unblocked/={} & task: TASK & task: q_task(q1)-unblocked}));
  List_Properties(Refinement(FreeRTOSBasic_r))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(FreeRTOSBasic_r),Machine(FreeRTOSConfig))==(?);
  Seen_Context_List_Enumerated(Refinement(FreeRTOSBasic_r))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Refinement(FreeRTOSBasic_r))==(btrue);
  Seen_Context_List_Assertions(Refinement(FreeRTOSBasic_r))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  Seen_Context_List_Properties(Refinement(FreeRTOSBasic_r))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Refinement(FreeRTOSBasic_r))==(btrue);
  Seen_List_Operations(Refinement(FreeRTOSBasic_r),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Refinement(FreeRTOSBasic_r),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Refinement(FreeRTOSBasic_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Refinement(FreeRTOSBasic_r),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(FreeRTOSBasic_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(FreeRTOSBasic_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Seen_Internal_List_Operations(Refinement(FreeRTOSBasic_r),Machine(Types))==(?);
  Seen_List_Operations(Refinement(FreeRTOSBasic_r),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Refinement(FreeRTOSBasic_r),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(FreeRTOSBasic_r),xTaskCreate)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskDelay)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskDelayUntil)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskDelete)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskEndScheduler)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),xTaskGetCurrentTaskHandle)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),uxTaskGetNumberOfTasks)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),uxTaskPriorityGet)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskPrioritySet)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskResume)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),beforeResumeAll)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),xTaskResumeAll)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskStartScheduler)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskSuspend)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),vTaskSuspendAll)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),xQueueCreate)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),queueDelete)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),sendItem)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),receiveItem)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),createSemaphore)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),deleteSemaphore)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),takeSemaphore)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),giveSemaphore)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),createMutex)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),takeMutex)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),giveMutex)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),getTickCount)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),incrementTick)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),afterIncrementTick)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),xQueueCreateMutex)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),xSemaphoreCreateRecursiveMutex)==(?);
  List_ANY_Var(Refinement(FreeRTOSBasic_r),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(FreeRTOSBasic_r)) == (? | remove_task,update_first | tickMissed,tickCount | first_receiving,first_sending,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_full,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues,unblocked,idle,running,suspended,runable,blocked,tasks,active | xTaskCreate,vTaskDelay,vTaskDelayUntil,vTaskDelete,vTaskEndScheduler,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,uxTaskPriorityGet,vTaskPrioritySet,vTaskResume,beforeResumeAll,xTaskResumeAll,vTaskStartScheduler,vTaskSuspend,vTaskSuspendAll,xQueueCreate,queueDelete,sendItem,receiveItem,createSemaphore,deleteSemaphore,takeSemaphore,giveSemaphore,createMutex,takeMutex,giveMutex,getTickCount,incrementTick,afterIncrementTick,xQueueCreateMutex,xSemaphoreCreateRecursiveMutex | ? | seen(Machine(Types)),seen(Machine(FreeRTOSConfig)),included(Machine(Task)),included(Machine(Queue)) | ? | FreeRTOSBasic_r);
  List_Of_HiddenCst_Ids(Refinement(FreeRTOSBasic_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(FreeRTOSBasic_r)) == (remove_task,update_first);
  List_Of_VisibleVar_Ids(Refinement(FreeRTOSBasic_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(FreeRTOSBasic_r)) == (seen(Machine(Types)): (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Queue)) == (remove_task,update_first | ? | first_receiving,first_sending,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_full,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues | ? | q_queueCreate,q_queueDelete,q_sendItem,q_receivedItem,q_insertTaskWaitingToSend,q_insertTaskWaitingToReceive,q_removeFromEventListQueue,q_createSemaphore,q_deleteSemaphore,q_takeSemaphore,q_giveSemaphore,q_createMutex,q_takeMutex,q_giveMutex,q_endScheduler,q_resumeAll | ? | seen(Machine(Types)) | ? | Queue);
  List_Of_HiddenCst_Ids(Machine(Queue)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue)) == (remove_task,update_first);
  List_Of_VisibleVar_Ids(Machine(Queue)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(Task)) == (? | ? | unblocked,idle,running,suspended,runable,blocked,tasks,active | ? | t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_suspendAll,t_priorityInherit,t_returnPriority,t_incrementTick,t_beforeResumeAll | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task);
  List_Of_HiddenCst_Ids(Machine(Task)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task)) == (?);
  List_Of_VisibleVar_Ids(Machine(Task)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Refinement(FreeRTOSBasic_r)) == (Type(update_first) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*atype(TASK,?,?))));Type(remove_task) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));Type(remove_task) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));Type(update_first) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)))))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(FreeRTOSBasic_r)) == (Type(active) == Mvl(btype(BOOL,?,?));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(runable) == Mvl(SetOf(atype(TASK,?,?)));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(idle) == Mvl(atype(TASK,?,?));Type(unblocked) == Mvl(SetOf(atype(TASK,?,?)));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg_full) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg_empty) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores_busy) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores_full) == Mvl(SetOf(atype(QUEUE,?,?)));Type(mutexes) == Mvl(SetOf(atype(QUEUE,?,?)));Type(mutexes_busy) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(mutex_holder) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(first_sending) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(first_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(tickMissed) == Mvl(btype(INTEGER,?,?));Type(tickCount) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(FreeRTOSBasic_r)) == (Type(xSemaphoreCreateRecursiveMutex) == Cst(atype(QUEUE,?,?),No_type);Type(xQueueCreateMutex) == Cst(atype(QUEUE,?,?),No_type);Type(afterIncrementTick) == Cst(No_type,No_type);Type(incrementTick) == Cst(No_type,No_type);Type(getTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(giveMutex) == Cst(No_type,atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(takeMutex) == Cst(No_type,atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(createMutex) == Cst(atype(QUEUE,?,?),No_type);Type(giveSemaphore) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(takeSemaphore) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(deleteSemaphore) == Cst(No_type,atype(QUEUE,?,?));Type(createSemaphore) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(receiveItem) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*btype(BOOL,?,?));Type(sendItem) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?)*etype(COPY_POSITION,?,?));Type(queueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(vTaskSuspend) == Cst(No_type,atype(TASK,?,?));Type(vTaskStartScheduler) == Cst(No_type,No_type);Type(xTaskResumeAll) == Cst(No_type,No_type);Type(beforeResumeAll) == Cst(No_type,No_type);Type(vTaskResume) == Cst(No_type,atype(TASK,?,?));Type(vTaskPrioritySet) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(vTaskDelete) == Cst(No_type,atype(TASK,?,?));Type(vTaskDelayUntil) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskDelay) == Cst(No_type,btype(INTEGER,?,?));Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)))
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
