Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(FreeRTOSBasic))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(FreeRTOSBasic))==(Machine(FreeRTOSBasic));
  Level(Machine(FreeRTOSBasic))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(FreeRTOSBasic)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(FreeRTOSBasic))==(Types,FreeRTOSConfig)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(FreeRTOSBasic))==(Queue,Task);
  List_Includes(Machine(FreeRTOSBasic))==(Task,Queue)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(FreeRTOSBasic))==(?);
  Context_List_Variables(Machine(FreeRTOSBasic))==(?);
  Abstract_List_Variables(Machine(FreeRTOSBasic))==(?);
  Local_List_Variables(Machine(FreeRTOSBasic))==(?);
  List_Variables(Machine(FreeRTOSBasic))==(unblocked,idle,running,suspended,runable,blocked,tasks,active,tickMissed,tickCount,first_receiving,first_sending,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_full,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues);
  External_List_Variables(Machine(FreeRTOSBasic))==(unblocked,idle,running,suspended,runable,blocked,tasks,active,tickMissed,tickCount,first_receiving,first_sending,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_full,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(FreeRTOSBasic))==(?);
  Abstract_List_VisibleVariables(Machine(FreeRTOSBasic))==(?);
  External_List_VisibleVariables(Machine(FreeRTOSBasic))==(?);
  Expanded_List_VisibleVariables(Machine(FreeRTOSBasic))==(?);
  List_VisibleVariables(Machine(FreeRTOSBasic))==(?);
  Internal_List_VisibleVariables(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  Gluing_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  Abstract_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  Expanded_List_Invariant(Machine(FreeRTOSBasic))==(active: BOOL & tickCount: TICK & tickMissed: TICK & tasks: FIN(TASK) & blocked: FIN(TASK) & blocked <: tasks & unblocked: FIN(TASK) & unblocked <: blocked & runable: FIN(TASK) & runable <: tasks & suspended: FIN(TASK) & suspended <: tasks & runable/\blocked = {} & blocked/\suspended = {} & suspended/\runable = {} & tasks = suspended\/blocked\/runable & running: TASK & idle: TASK & (active = TRUE => runable/={} & running: runable & idle: runable & TASK_NULL/:tasks) & queues: POW(QUEUE) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_receiving) & queues = dom(queue_sending) & first_receiving: QUEUE +-> TASK & first_sending: QUEUE +-> TASK & dom(first_receiving) = dom(queue_receiving) & dom(first_sending) = dom(queue_sending) & !q1.(q1: queues & q1: dom(first_receiving) & queue_receiving(q1)/={} => first_receiving(q1): queue_receiving(q1)) & !q1.(q1: queues & q1: dom(first_sending) & queue_sending(q1)/={} => first_sending(q1): queue_sending(q1)) & queues_msg <: queues & queues_msg_full <: queues_msg & queues_msg_empty <: queues_msg & queues_msg_full/\queues_msg_empty = {} & queue_items: QUEUE +-> POW(ITEM) & queues_msg = dom(queue_items) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_receiving(q1) => tk/:queue_sending(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_sending(q2) => tk/:queue_receiving(q1)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_receiving(q1) => tk/:queue_receiving(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_sending(q1) => tk/:queue_sending(q2)) & semaphores: POW(QUEUE) & semaphores <: queues & semaphores_busy <: semaphores & semaphores_full <: semaphores & semaphores_busy/\semaphores_full = {} & mutexes <: queues & mutex_holder: QUEUE +-> TASK & mutexes = dom(mutex_holder) & mutexes_busy <: mutexes & !mt.(mt: mutexes_busy => mutex_holder(mt)/=TASK_NULL) & !mt.(mt: mutexes & mt/:mutexes_busy => mutex_holder(mt) = TASK_NULL) & queues_msg/\semaphores = {} & queues_msg/\mutexes = {} & mutexes/\semaphores = {});
  Context_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  List_Invariant(Machine(FreeRTOSBasic))==(!que.(que: queues => queue_sending(que) <: blocked\/suspended) & !que.(que: queues => queue_receiving(que) <: blocked\/suspended) & ran(mutex_holder) <: tasks\/{TASK_NULL} & !mt.(mt: mutexes => queue_sending(mt) = {}) & (active = TRUE => idle/:ran(mutex_holder) & !mt.(mt: mutexes_busy => mutex_holder(mt): tasks) & !mt.(mt: mutexes & mt/:mutexes_busy => mutex_holder(mt)/:tasks)))
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(FreeRTOSBasic))==(btrue);
  Expanded_List_Assertions(Machine(FreeRTOSBasic))==((active = TRUE => runable/={};active = TRUE => tasks/={};active = TRUE => idle: runable;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => idle/=TASK_NULL;active = TRUE => running: runable;active = TRUE => running/:blocked;active = TRUE => running/:suspended) & !que.(que: QUEUE & que/:queues => que/:mutexes) & !que.(que: QUEUE & que/:queues => que/:semaphores) & !que.(que: queues_msg & que: queues_msg_full => que/:queues_msg_empty) & !que.(que: queues_msg & que: queues_msg_empty => que/:queues_msg_full));
  Context_List_Assertions(Machine(FreeRTOSBasic))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT & configMAX_PRIORITIES: NATURAL);
  List_Assertions(Machine(FreeRTOSBasic))==(!mt.(mt: mutexes_busy & active = TRUE => mutex_holder(mt)/=idle) & !(que,task).(que: queues & task: TASK & task/:blocked & task/:suspended => task/:queue_sending(que)) & !(que,task).(que: queues & task: TASK & task/:blocked & task/:suspended => task/:queue_receiving(que)) & !(que,task).(que: queues & task: tasks & task: queue_sending(que) => task: blocked\/suspended) & !(que,task).(que: queues & task: tasks & task: queue_receiving(que) => task: blocked\/suspended))
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(FreeRTOSBasic))==(tickCount,tickMissed,active,tasks,blocked,runable,suspended,unblocked:=0,0,FALSE,{},{},{},{},{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0);queues,queues_msg,queue_items,queue_receiving,queue_sending,semaphores,semaphores_busy,mutexes,mutexes_busy,mutex_holder,queues_msg_full,queues_msg_empty,semaphores_full,first_sending,first_receiving:={},{},{},{},{},{},{},{},{},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(FreeRTOSBasic))==(skip);
  List_Initialisation(Machine(FreeRTOSBasic))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(Task))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(Queue))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(FreeRTOSBasic),Machine(Queue))==(btrue);
  List_Context_Constraints(Machine(FreeRTOSBasic))==(btrue);
  List_Constraints(Machine(FreeRTOSBasic))==(btrue);
  List_Constraints(Machine(FreeRTOSBasic),Machine(Task))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(FreeRTOSBasic))==(xTaskCreate,vTaskDelay,vTaskDelayUntil,vTaskDelete,vTaskEndScheduler,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,uxTaskPriorityGet,vTaskPrioritySet,vTaskResume,beforeResumeAll,xTaskResumeAll,vTaskStartScheduler,vTaskSuspend,vTaskSuspendAll,xQueueCreate,queueDelete,sendItem,receiveItem,vSemaphoreCreateBinary,vSemaphoreCreateCounting,deleteSemaphore,takeSemaphore,giveSemaphore,xQueueCreateMutex,takeMutex,giveMutex,xTaskGetTickCount,incrementTick,afterIncrementTick);
  List_Operations(Machine(FreeRTOSBasic))==(xTaskCreate,vTaskDelay,vTaskDelayUntil,vTaskDelete,vTaskEndScheduler,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,uxTaskPriorityGet,vTaskPrioritySet,vTaskResume,beforeResumeAll,xTaskResumeAll,vTaskStartScheduler,vTaskSuspend,vTaskSuspendAll,xQueueCreate,queueDelete,sendItem,receiveItem,vSemaphoreCreateBinary,vSemaphoreCreateCounting,deleteSemaphore,takeSemaphore,giveSemaphore,xQueueCreateMutex,takeMutex,giveMutex,xTaskGetTickCount,incrementTick,afterIncrementTick)
END
&
THEORY ListInputX IS
  List_Input(Machine(FreeRTOSBasic),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Machine(FreeRTOSBasic),vTaskDelay)==(xTicksToDelay);
  List_Input(Machine(FreeRTOSBasic),vTaskDelayUntil)==(pxPreviousWakeTime,xTimeIncrement);
  List_Input(Machine(FreeRTOSBasic),vTaskDelete)==(pxTaskToDelete);
  List_Input(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_Input(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(?);
  List_Input(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(pxTask);
  List_Input(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask,uxNewPriority);
  List_Input(Machine(FreeRTOSBasic),vTaskResume)==(pxTaskToResume);
  List_Input(Machine(FreeRTOSBasic),beforeResumeAll)==(?);
  List_Input(Machine(FreeRTOSBasic),xTaskResumeAll)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_Input(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(FreeRTOSBasic),queueDelete)==(pxQueue);
  List_Input(Machine(FreeRTOSBasic),sendItem)==(pxQueue,pvItemToQueue,xTicksToWait,copy_position);
  List_Input(Machine(FreeRTOSBasic),receiveItem)==(pxQueue,xTicksToWait,justPeeking);
  List_Input(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(?);
  List_Input(Machine(FreeRTOSBasic),vSemaphoreCreateCounting)==(maxCount,initialCount);
  List_Input(Machine(FreeRTOSBasic),deleteSemaphore)==(semaphore);
  List_Input(Machine(FreeRTOSBasic),takeSemaphore)==(semaphore,xTicksToWait);
  List_Input(Machine(FreeRTOSBasic),giveSemaphore)==(semaphore,xTicksToWait);
  List_Input(Machine(FreeRTOSBasic),xQueueCreateMutex)==(?);
  List_Input(Machine(FreeRTOSBasic),takeMutex)==(mutex,xTicksToWait);
  List_Input(Machine(FreeRTOSBasic),giveMutex)==(mutex,xTicksToWait);
  List_Input(Machine(FreeRTOSBasic),xTaskGetTickCount)==(?);
  List_Input(Machine(FreeRTOSBasic),incrementTick)==(?);
  List_Input(Machine(FreeRTOSBasic),afterIncrementTick)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(FreeRTOSBasic),xTaskCreate)==(result,handle);
  List_Output(Machine(FreeRTOSBasic),vTaskDelay)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskDelayUntil)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskDelete)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_Output(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(cTask);
  List_Output(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(priority);
  List_Output(Machine(FreeRTOSBasic),vTaskPrioritySet)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskResume)==(?);
  List_Output(Machine(FreeRTOSBasic),beforeResumeAll)==(?);
  List_Output(Machine(FreeRTOSBasic),xTaskResumeAll)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskSuspend)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_Output(Machine(FreeRTOSBasic),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(FreeRTOSBasic),queueDelete)==(?);
  List_Output(Machine(FreeRTOSBasic),sendItem)==(return);
  List_Output(Machine(FreeRTOSBasic),receiveItem)==(return,pvBuffer);
  List_Output(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(semaphore);
  List_Output(Machine(FreeRTOSBasic),vSemaphoreCreateCounting)==(semaphore);
  List_Output(Machine(FreeRTOSBasic),deleteSemaphore)==(?);
  List_Output(Machine(FreeRTOSBasic),takeSemaphore)==(return);
  List_Output(Machine(FreeRTOSBasic),giveSemaphore)==(return);
  List_Output(Machine(FreeRTOSBasic),xQueueCreateMutex)==(mutex);
  List_Output(Machine(FreeRTOSBasic),takeMutex)==(?);
  List_Output(Machine(FreeRTOSBasic),giveMutex)==(?);
  List_Output(Machine(FreeRTOSBasic),xTaskGetTickCount)==(numberOfTicks);
  List_Output(Machine(FreeRTOSBasic),incrementTick)==(?);
  List_Output(Machine(FreeRTOSBasic),afterIncrementTick)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(FreeRTOSBasic),xTaskCreate)==(result,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Machine(FreeRTOSBasic),vTaskDelay)==(vTaskDelay(xTicksToDelay));
  List_Header(Machine(FreeRTOSBasic),vTaskDelayUntil)==(vTaskDelayUntil(pxPreviousWakeTime,xTimeIncrement));
  List_Header(Machine(FreeRTOSBasic),vTaskDelete)==(vTaskDelete(pxTaskToDelete));
  List_Header(Machine(FreeRTOSBasic),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(cTask <-- xTaskGetCurrentTaskHandle);
  List_Header(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Machine(FreeRTOSBasic),vTaskPrioritySet)==(vTaskPrioritySet(pxTask,uxNewPriority));
  List_Header(Machine(FreeRTOSBasic),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Machine(FreeRTOSBasic),beforeResumeAll)==(beforeResumeAll);
  List_Header(Machine(FreeRTOSBasic),xTaskResumeAll)==(xTaskResumeAll);
  List_Header(Machine(FreeRTOSBasic),vTaskStartScheduler)==(vTaskStartScheduler);
  List_Header(Machine(FreeRTOSBasic),vTaskSuspend)==(vTaskSuspend(pxTaskToSuspend));
  List_Header(Machine(FreeRTOSBasic),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(FreeRTOSBasic),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(FreeRTOSBasic),queueDelete)==(queueDelete(pxQueue));
  List_Header(Machine(FreeRTOSBasic),sendItem)==(return <-- sendItem(pxQueue,pvItemToQueue,xTicksToWait,copy_position));
  List_Header(Machine(FreeRTOSBasic),receiveItem)==(return,pvBuffer <-- receiveItem(pxQueue,xTicksToWait,justPeeking));
  List_Header(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(semaphore <-- vSemaphoreCreateBinary);
  List_Header(Machine(FreeRTOSBasic),vSemaphoreCreateCounting)==(semaphore <-- vSemaphoreCreateCounting(maxCount,initialCount));
  List_Header(Machine(FreeRTOSBasic),deleteSemaphore)==(deleteSemaphore(semaphore));
  List_Header(Machine(FreeRTOSBasic),takeSemaphore)==(return <-- takeSemaphore(semaphore,xTicksToWait));
  List_Header(Machine(FreeRTOSBasic),giveSemaphore)==(return <-- giveSemaphore(semaphore,xTicksToWait));
  List_Header(Machine(FreeRTOSBasic),xQueueCreateMutex)==(mutex <-- xQueueCreateMutex);
  List_Header(Machine(FreeRTOSBasic),takeMutex)==(takeMutex(mutex,xTicksToWait));
  List_Header(Machine(FreeRTOSBasic),giveMutex)==(giveMutex(mutex,xTicksToWait));
  List_Header(Machine(FreeRTOSBasic),xTaskGetTickCount)==(numberOfTicks <-- xTaskGetTickCount);
  List_Header(Machine(FreeRTOSBasic),incrementTick)==(incrementTick);
  List_Header(Machine(FreeRTOSBasic),afterIncrementTick)==(afterIncrementTick)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(FreeRTOSBasic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY);
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & running: runable);
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1 & running: runable);
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder));
  List_Precondition(Machine(FreeRTOSBasic),vTaskEndScheduler)==(active = TRUE);
  List_Precondition(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle);
  List_Precondition(Machine(FreeRTOSBasic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & active = TRUE);
  List_Precondition(Machine(FreeRTOSBasic),beforeResumeAll)==(active = FALSE);
  List_Precondition(Machine(FreeRTOSBasic),xTaskResumeAll)==(active = FALSE);
  List_Precondition(Machine(FreeRTOSBasic),vTaskStartScheduler)==(active = FALSE);
  List_Precondition(Machine(FreeRTOSBasic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle);
  List_Precondition(Machine(FreeRTOSBasic),vTaskSuspendAll)==(active = TRUE);
  List_Precondition(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength: QUEUE_LENGTH & uxItemSize: NAT);
  List_Precondition(Machine(FreeRTOSBasic),queueDelete)==(pxQueue: queues_msg & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {});
  List_Precondition(Machine(FreeRTOSBasic),sendItem)==(pxQueue: queues_msg & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & running/=idle & active = TRUE & pvItemToQueue/:queue_items(pxQueue));
  List_Precondition(Machine(FreeRTOSBasic),receiveItem)==(active = TRUE & running/=idle & pxQueue: QUEUE & pxQueue: queues_msg & xTicksToWait: TICK & justPeeking: BOOL & running: runable & running/=TASK_NULL);
  List_Precondition(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(btrue);
  List_Precondition(Machine(FreeRTOSBasic),vSemaphoreCreateCounting)==(maxCount: QUEUE_LENGTH & initialCount: QUEUE_QUANT & initialCount<=maxCount);
  List_Precondition(Machine(FreeRTOSBasic),deleteSemaphore)==(semaphore: semaphores & queue_sending(semaphore)/={} & queue_receiving(semaphore)/={});
  List_Precondition(Machine(FreeRTOSBasic),takeSemaphore)==(semaphore: semaphores & xTicksToWait: TICK & running/=idle & active = TRUE & running/=TASK_NULL);
  List_Precondition(Machine(FreeRTOSBasic),giveSemaphore)==(semaphore: semaphores & xTicksToWait: TICK & running/=idle & active = TRUE & running/=TASK_NULL);
  List_Precondition(Machine(FreeRTOSBasic),xQueueCreateMutex)==(btrue);
  List_Precondition(Machine(FreeRTOSBasic),takeMutex)==(mutex: mutexes & xTicksToWait: TICK & active = TRUE & running/=idle);
  List_Precondition(Machine(FreeRTOSBasic),giveMutex)==(mutex: mutexes & mutex: mutexes_busy & mutex_holder(mutex) = running & xTicksToWait: TICK & active = TRUE);
  List_Precondition(Machine(FreeRTOSBasic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(FreeRTOSBasic),incrementTick)==(btrue);
  List_Precondition(Machine(FreeRTOSBasic),afterIncrementTick)==(active = TRUE)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(FreeRTOSBasic),afterIncrementTick)==(active = TRUE & unblocked: FIN(TASK) & unblocked <: blocked & unblocked = unblocked & unblocked: POW(TASK) | unblocked/={} ==> (@n_runable.(n_runable <: tasks & n_runable = runable\/unblocked ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))) || blocked:=blocked-unblocked || unblocked:={}) [] not(unblocked/={}) ==> skip || (queue_sending/={} ==> @(n_sending,n_first).(n_sending: QUEUE +-> POW(TASK) & dom(n_sending) = dom(queue_sending) & n_sending = remove_task(queue_sending,unblocked) & n_first: QUEUE +-> TASK & dom(n_first) = dom(first_sending) & !q1.(q1: queues & q1: dom(n_first) & n_sending(q1)/={} => n_first(q1): n_sending(q1)) ==> queue_sending,first_sending:=n_sending,n_first) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> @(n_receiving,n_first).(n_receiving: QUEUE +-> POW(TASK) & dom(n_receiving) = dom(queue_receiving) & n_receiving = remove_task(queue_receiving,unblocked) & n_first: QUEUE +-> TASK & dom(n_first) = dom(first_receiving) & !q1.(q1: queues & q1: dom(n_first) & n_receiving(q1)/={} => n_first(q1): n_receiving(q1)) ==> queue_receiving,first_receiving:=n_receiving,n_first) [] not(queue_receiving/={}) ==> skip)));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),incrementTick)==(btrue | active = TRUE ==> tickCount:=TICK_INCREMENT(tickCount,1) [] not(active = TRUE) ==> tickMissed:=TICK_INCREMENT(tickMissed,1) || @n_unblocked.(n_unblocked: FIN(TASK) & n_unblocked <: blocked ==> unblocked:=n_unblocked));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | numberOfTicks:=tickCount);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),giveMutex)==(mutex: mutexes & mutex: mutexes_busy & mutex_holder(mutex) = running & xTicksToWait: TICK & active = TRUE & mutex: mutexes & mutex: mutexes_busy | mutexes_busy,mutex_holder:=mutexes_busy-{mutex},mutex_holder<+{mutex|->TASK_NULL} || @(n_receiving,n_first).(n_receiving: POW(TASK) & n_receiving = queue_receiving(mutex)-{first_receiving(mutex)} & n_first: TASK & n_first: n_receiving ==> queue_receiving,first_receiving:=queue_receiving<+{mutex|->n_receiving},first_receiving<+{mutex|->n_first}) || (queue_receiving(mutex)/={} ==> (first_receiving(mutex): TASK & first_receiving(mutex): tasks & first_receiving(mutex): blocked\/suspended & active = TRUE & running/=idle | first_receiving(mutex): blocked ==> (blocked:=blocked-{first_receiving(mutex)} || (first_receiving(mutex): unblocked ==> unblocked:=unblocked-{first_receiving(mutex)} [] not(first_receiving(mutex): unblocked) ==> skip)) [] not(first_receiving(mutex): blocked) ==> skip || (first_receiving(mutex): suspended ==> suspended:=suspended-{first_receiving(mutex)} [] not(first_receiving(mutex): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_receiving(mutex)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_receiving(mutex)/={}) ==> skip));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),takeMutex)==(mutex: mutexes & xTicksToWait: TICK & active = TRUE & running/=idle | mutex: mutexes_busy ==> (xTicksToWait: TICK & mutex_holder(mutex): tasks & mutex_holder(mutex)/=idle & running/=idle & running: runable & active = TRUE & mutex: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (@(running$0).(running$0: n_runable ==> running:=running$0) || runable:=n_runable)) || blocked:=blocked\/{running} || (queue_receiving:=queue_receiving<+{mutex|->(queue_receiving(mutex)\/{running})} || (queue_receiving(mutex) = {} ==> first_receiving:=first_receiving<+{mutex|->running} [] not(queue_receiving(mutex) = {}) ==> skip))) [] not(mutex: mutexes_busy) ==> (mutex: mutexes & mutex/:mutexes_busy & running: TASK & running/=TASK_NULL | mutexes_busy,mutex_holder:=mutexes_busy\/{mutex},mutex_holder<+{mutex|->running}));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueCreateMutex)==(btrue | @(mutex$0).(mutex$0: QUEUE & mutex$0/:queues ==> queues,mutexes,queue_receiving,first_receiving,queue_sending,first_sending,mutex_holder,mutex:=queues\/{mutex$0},mutexes\/{mutex$0},queue_receiving\/{mutex$0|->{}},first_receiving\/{mutex$0|->TASK_NULL},queue_sending\/{mutex$0|->{}},first_sending\/{mutex$0|->TASK_NULL},mutex_holder\/{mutex$0|->TASK_NULL},mutex$0) [] mutex:=QUEUE_NULL);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),giveSemaphore)==(semaphore: semaphores & xTicksToWait: TICK & running/=idle & active = TRUE & running/=TASK_NULL | semaphore/:semaphores_full ==> (semaphore: semaphores | semaphore/:semaphores_full ==> (semaphore: semaphores_busy ==> semaphores_busy:=semaphores_busy-{semaphore} [] not(semaphore: semaphores_busy) ==> skip || (semaphores_full:=semaphores_full\/{semaphore} [] skip) || @(n_receiving,n_first).(n_receiving: POW(TASK) & n_receiving = queue_receiving(semaphore)-{first_receiving(semaphore)} & n_first: TASK & n_first: n_receiving ==> queue_receiving,first_receiving:=queue_receiving<+{semaphore|->n_receiving},first_receiving<+{semaphore|->n_first})) [] not(semaphore/:semaphores_full) ==> skip || (queue_receiving(semaphore)/={} ==> (first_receiving(semaphore): TASK & first_receiving(semaphore): blocked\/suspended & active = TRUE | first_receiving(semaphore): blocked ==> (blocked:=blocked-{first_receiving(semaphore)} || (first_receiving(semaphore): unblocked ==> unblocked:=unblocked-{first_receiving(semaphore)} [] not(first_receiving(semaphore): unblocked) ==> skip)) [] not(first_receiving(semaphore): blocked) ==> skip || (first_receiving(semaphore): suspended ==> suspended:=suspended-{first_receiving(semaphore)} [] not(first_receiving(semaphore): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_receiving(semaphore)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_receiving(semaphore)/={}) ==> skip) || return:=pdPASS) [] not(semaphore/:semaphores_full) ==> (running: TASK & running = running & running: runable & running/=idle & TICK_INCREMENT(xTicksToWait,tickCount): TICK & semaphore: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) & running: TASK & running: tasks & running/=idle & semaphore: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running} || (queue_sending:=queue_sending<+{semaphore|->(queue_sending(semaphore)\/{running})} || (queue_sending(semaphore) = {} ==> first_sending:=first_sending<+{semaphore|->running} [] not(queue_sending(semaphore) = {}) ==> skip)) || return:=pdPASS [] (running: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || (running = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(running = running) ==> skip))) [] not(running: runable) ==> (running: blocked ==> (blocked:=blocked-{running} || (running: unblocked ==> unblocked:=unblocked-{running} [] not(running: unblocked) ==> skip)) [] not(running: blocked) ==> skip) || suspended:=suspended\/{running} || (queue_sending:=queue_sending<+{semaphore|->(queue_sending(semaphore)\/{running})} || (queue_sending(semaphore) = {} ==> first_sending:=first_sending<+{semaphore|->running} [] not(queue_sending(semaphore) = {}) ==> skip)) || return:=pdPASS) [] return:=pdFAIL));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),takeSemaphore)==(semaphore: semaphores & xTicksToWait: TICK & running/=idle & active = TRUE & running/=TASK_NULL | semaphore/:semaphores_busy ==> (semaphore: semaphores & semaphore/:semaphores_busy | semaphore: semaphores_full ==> semaphores_full:=semaphores_full-{semaphore} [] not(semaphore: semaphores_full) ==> skip || (semaphores_busy:=semaphores_busy\/{semaphore} [] skip) || @(n_sending,n_first).(n_sending: POW(TASK) & n_sending = queue_sending(semaphore)-{first_sending(semaphore)} & n_first: TASK & n_first: n_sending ==> queue_sending,first_sending:=queue_sending<+{semaphore|->n_sending},first_sending<+{semaphore|->n_first}) || (queue_sending(semaphore)/={} ==> (first_sending(semaphore): TASK & first_sending(semaphore): blocked\/suspended & active = TRUE | first_sending(semaphore): blocked ==> (blocked:=blocked-{first_sending(semaphore)} || (first_sending(semaphore): unblocked ==> unblocked:=unblocked-{first_sending(semaphore)} [] not(first_sending(semaphore): unblocked) ==> skip)) [] not(first_sending(semaphore): blocked) ==> skip || (first_sending(semaphore): suspended ==> suspended:=suspended-{first_sending(semaphore)} [] not(first_sending(semaphore): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_sending(semaphore)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_sending(semaphore)/={}) ==> skip) || return:=pdPASS) [] not(semaphore/:semaphores_busy) ==> (running: TASK & running = running & running: runable & running/=idle & TICK_INCREMENT(xTicksToWait,tickCount): TICK & semaphore: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) & running: TASK & running: tasks & running/=idle & semaphore: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running} || (queue_receiving:=queue_receiving<+{semaphore|->(queue_receiving(semaphore)\/{running})} || (queue_receiving(semaphore) = {} ==> first_receiving:=first_receiving<+{semaphore|->running} [] not(queue_receiving(semaphore) = {}) ==> skip)) || return:=pdPASS [] (running: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || (running = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(running = running) ==> skip))) [] not(running: runable) ==> (running: blocked ==> (blocked:=blocked-{running} || (running: unblocked ==> unblocked:=unblocked-{running} [] not(running: unblocked) ==> skip)) [] not(running: blocked) ==> skip) || suspended:=suspended\/{running} || (queue_receiving:=queue_receiving<+{semaphore|->(queue_receiving(semaphore)\/{running})} || (queue_receiving(semaphore) = {} ==> first_receiving:=first_receiving<+{semaphore|->running} [] not(queue_receiving(semaphore) = {}) ==> skip)) || return:=pdPASS) [] return:=pdFAIL));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),deleteSemaphore)==(semaphore: semaphores & queue_sending(semaphore)/={} & queue_receiving(semaphore)/={} & semaphore: semaphores | queues,semaphores,queue_receiving,first_receiving,queue_sending,first_sending:=queues-{semaphore},semaphores-{semaphore},{semaphore}<<|queue_receiving,{semaphore}<<|first_receiving,{semaphore}<<|queue_sending,{semaphore}<<|first_sending || (semaphore: semaphores_busy ==> semaphores_busy:=semaphores_busy-{semaphore} [] not(semaphore: semaphores_busy) ==> skip) || (semaphore: semaphores_full ==> semaphores_full:=semaphores_full-{semaphore} [] not(semaphore: semaphores_full) ==> skip));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vSemaphoreCreateCounting)==(maxCount: QUEUE_LENGTH & initialCount: QUEUE_QUANT & initialCount<=maxCount | @(semaphore$0).(semaphore$0: QUEUE & semaphore$0/:queues ==> (queues,queue_receiving,first_receiving,queue_sending,first_sending,semaphores:=queues\/{semaphore$0},queue_receiving\/{semaphore$0|->{}},first_receiving\/{semaphore$0|->TASK_NULL},queue_sending\/{semaphore$0|->{}},first_sending\/{semaphore$0|->TASK_NULL},semaphores\/{semaphore$0} || (semaphores_busy:=semaphores_busy\/{semaphore$0} [] semaphores_full:=semaphores_full\/{semaphore$0} [] skip) || semaphore:=semaphore$0)) [] semaphore:=QUEUE_NULL);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(btrue & 1: QUEUE_LENGTH & 1: QUEUE_QUANT & 1<=1 | @(semaphore$0).(semaphore$0: QUEUE & semaphore$0/:queues ==> (queues,queue_receiving,first_receiving,queue_sending,first_sending,semaphores:=queues\/{semaphore$0},queue_receiving\/{semaphore$0|->{}},first_receiving\/{semaphore$0|->TASK_NULL},queue_sending\/{semaphore$0|->{}},first_sending\/{semaphore$0|->TASK_NULL},semaphores\/{semaphore$0} || (semaphores_busy:=semaphores_busy\/{semaphore$0} [] semaphores_full:=semaphores_full\/{semaphore$0} [] skip) || semaphore:=semaphore$0)) [] semaphore:=QUEUE_NULL);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),receiveItem)==(active = TRUE & running/=idle & pxQueue: QUEUE & pxQueue: queues_msg & xTicksToWait: TICK & justPeeking: BOOL & running: runable & running/=TASK_NULL | pxQueue: queues_msg_empty ==> (running: TASK & running = running & running: runable & running/=idle & TICK_INCREMENT(xTicksToWait,tickCount): TICK & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) & running: TASK & running: tasks & running/=idle & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running} || (queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{running})} || (queue_receiving(pxQueue) = {} ==> first_receiving:=first_receiving<+{pxQueue|->running} [] not(queue_receiving(pxQueue) = {}) ==> skip)) || return,pvBuffer:=pdPASS,ITEM_NULL [] (running: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || (running = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(running = running) ==> skip))) [] not(running: runable) ==> (running: blocked ==> (blocked:=blocked-{running} || (running: unblocked ==> unblocked:=unblocked-{running} [] not(running: unblocked) ==> skip)) [] not(running: blocked) ==> skip) || suspended:=suspended\/{running} || (queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{running})} || (queue_receiving(pxQueue) = {} ==> first_receiving:=first_receiving<+{pxQueue|->running} [] not(queue_receiving(pxQueue) = {}) ==> skip)) || return,pvBuffer:=pdPASS,ITEM_NULL) [] return,pvBuffer:=pdFAIL,ITEM_NULL) [] not(pxQueue: queues_msg_empty) ==> (pxQueue: queues_msg & justPeeking: BOOL & pxQueue/:queues_msg_empty | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = FALSE ==> (queue_sending(pxQueue)/={} ==> @(n_sending,n_first).(n_sending: POW(TASK) & n_first: TASK & n_sending = queue_sending(pxQueue)-{first_sending(pxQueue)} & n_first: n_sending ==> (queue_items,queue_sending,first_sending:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}},queue_sending<+{pxQueue|->n_sending},first_sending<+{pxQueue|->n_first} || (pxQueue: queues_msg_full ==> queues_msg_full:=queues_msg_full-{pxQueue} [] not(pxQueue: queues_msg_full) ==> skip) || (queues_msg_empty:=queues_msg_empty\/{pxQueue} [] skip))) [] not(queue_sending(pxQueue)/={}) ==> skip) [] not(justPeeking = FALSE) ==> skip || pvBuffer:=item)) || return:=pdPASS || (justPeeking = FALSE ==> (queue_sending(pxQueue)/={} ==> (first_sending(pxQueue): TASK & first_sending(pxQueue): blocked\/suspended & active = TRUE | first_sending(pxQueue): blocked ==> (blocked:=blocked-{first_sending(pxQueue)} || (first_sending(pxQueue): unblocked ==> unblocked:=unblocked-{first_sending(pxQueue)} [] not(first_sending(pxQueue): unblocked) ==> skip)) [] not(first_sending(pxQueue): blocked) ==> skip || (first_sending(pxQueue): suspended ==> suspended:=suspended-{first_sending(pxQueue)} [] not(first_sending(pxQueue): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_sending(pxQueue)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_sending(pxQueue)/={}) ==> skip) [] not(justPeeking = FALSE) ==> skip)));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),sendItem)==(pxQueue: queues_msg & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & running/=idle & active = TRUE & pvItemToQueue/:queue_items(pxQueue) | pxQueue/:queues_msg_full ==> (pxQueue: queues_msg & pvItemToQueue: ITEM & pvItemToQueue/:queue_items(pxQueue) & copy_position: COPY_POSITION & pxQueue/:queues_msg_full | queue_items:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pvItemToQueue})} || (queue_receiving(pxQueue)/={} ==> @(n_receiving,n_first).(n_receiving: POW(TASK) & n_first: TASK & n_receiving = queue_receiving(pxQueue)-{first_receiving(pxQueue)} & n_first: n_receiving ==> queue_receiving,first_receiving:=queue_receiving<+{pxQueue|->n_receiving},first_receiving<+{pxQueue|->n_first}) [] not(queue_receiving(pxQueue)/={}) ==> skip) || (pxQueue: queues_msg_empty ==> queues_msg_empty:=queues_msg_empty-{pxQueue} [] not(pxQueue: queues_msg_empty) ==> skip) || (queues_msg_full:=queues_msg_full\/{pxQueue} [] skip) || (queue_receiving(pxQueue)/={} ==> (first_receiving(pxQueue): TASK & first_receiving(pxQueue): blocked\/suspended & active = TRUE | first_receiving(pxQueue): blocked ==> (blocked:=blocked-{first_receiving(pxQueue)} || (first_receiving(pxQueue): unblocked ==> unblocked:=unblocked-{first_receiving(pxQueue)} [] not(first_receiving(pxQueue): unblocked) ==> skip)) [] not(first_receiving(pxQueue): blocked) ==> skip || (first_receiving(pxQueue): suspended ==> suspended:=suspended-{first_receiving(pxQueue)} [] not(first_receiving(pxQueue): suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{first_receiving(pxQueue)} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip)))) [] not(queue_receiving(pxQueue)/={}) ==> skip) || return:=pdPASS) [] not(pxQueue/:queues_msg_full) ==> (running: TASK & running = running & running: runable & running/=idle & TICK_INCREMENT(xTicksToWait,tickCount): TICK & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) & running: TASK & running: tasks & running/=idle & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running} || (queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{running})} || (queue_sending(pxQueue) = {} ==> first_sending:=first_sending<+{pxQueue|->running} [] not(queue_sending(pxQueue) = {}) ==> skip)) || return:=pdPASS [] (running: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || (running = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(running = running) ==> skip))) [] not(running: runable) ==> (running: blocked ==> (blocked:=blocked-{running} || (running: unblocked ==> unblocked:=unblocked-{running} [] not(running: unblocked) ==> skip)) [] not(running: blocked) ==> skip) || suspended:=suspended\/{running} || (queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{running})} || (queue_sending(pxQueue) = {} ==> first_sending:=first_sending<+{pxQueue|->running} [] not(queue_sending(pxQueue) = {}) ==> skip)) || return:=pdPASS) [] return:=pdFAIL));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),queueDelete)==(pxQueue: queues_msg & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {} & pxQueue: queues & pxQueue/:semaphores & pxQueue/:mutexes & queue_receiving(pxQueue) = {} & queue_sending(pxQueue) = {} | queues,queues_msg,queue_items,queue_receiving,queue_sending,first_sending,first_receiving:=queues-{pxQueue},queues_msg-{pxQueue},{pxQueue}<<|queue_items,{pxQueue}<<|queue_receiving,{pxQueue}<<|queue_sending,{pxQueue}<<|first_sending,{pxQueue}<<|first_receiving || (pxQueue: queues_msg_full ==> queues_msg_full:=queues_msg_full-{pxQueue} [] not(pxQueue: queues_msg_full) ==> skip) || (pxQueue: queues_msg_empty ==> queues_msg_empty:=queues_msg_empty-{pxQueue} [] not(pxQueue: queues_msg_empty) ==> skip));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength: QUEUE_LENGTH & uxItemSize: NAT | @pxQueue.(pxQueue: QUEUE & pxQueue/:queues ==> queues,queues_msg,queue_items,queue_receiving,queue_sending,queues_msg_empty,xQueueHandle,first_sending,first_receiving:=queues\/{pxQueue},queues_msg\/{pxQueue},queue_items\/{pxQueue|->{}},queue_receiving\/{pxQueue|->{}},queue_sending\/{pxQueue|->{}},queues_msg_empty\/{pxQueue},pxQueue,first_sending\/{pxQueue|->TASK_NULL},first_receiving\/{pxQueue|->TASK_NULL}) [] xQueueHandle:=QUEUE_NULL);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskSuspendAll)==(active = TRUE | active:=FALSE);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle | pxTaskToSuspend/:suspended ==> (pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle & pxTaskToSuspend: TASK | pxTaskToSuspend: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{pxTaskToSuspend} ==> (runable:=n_runable || (pxTaskToSuspend = running ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(pxTaskToSuspend = running) ==> skip))) [] not(pxTaskToSuspend: runable) ==> (pxTaskToSuspend: blocked ==> (blocked:=blocked-{pxTaskToSuspend} || (pxTaskToSuspend: unblocked ==> unblocked:=unblocked-{pxTaskToSuspend} [] not(pxTaskToSuspend: unblocked) ==> skip)) [] not(pxTaskToSuspend: blocked) ==> skip) || suspended:=suspended\/{pxTaskToSuspend} || (@(pxQueue,n_receiving,n_first).(pxQueue: queues & pxTaskToSuspend: queue_receiving(pxQueue) & n_receiving: POW(TASK) & n_receiving = queue_receiving(pxQueue)-{first_receiving(pxQueue)} & n_first: TASK & n_first: queue_receiving(pxQueue) ==> queue_receiving,first_receiving:=queue_receiving<+{pxQueue|->n_receiving},first_receiving<+{pxQueue|->n_first}) || @(pxQueue,n_sending,n_first).(pxQueue: queues & n_sending: POW(TASK) & n_first: TASK & pxTaskToSuspend: queue_sending(pxQueue) & n_sending = queue_sending(pxQueue)-{first_sending(pxQueue)} & n_first = first_sending(pxQueue) ==> queue_sending,first_sending:=queue_sending<+{pxQueue|->n_sending},first_sending<+{pxQueue|->n_first}))) [] not(pxTaskToSuspend/:suspended) ==> skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskStartScheduler)==(active = FALSE | active:=TRUE || @(idle_task,n_runable).(idle_task: TASK & idle_task/:tasks & n_runable <: tasks & n_runable = runable\/{idle_task} ==> (idle,tasks,runable:=idle_task,tasks\/{idle_task},n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) [] skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskResumeAll)==(active = FALSE & unblocked: FIN(TASK) & unblocked <: blocked & unblocked = unblocked & unblocked: POW(TASK) | unblocked/={} ==> (@n_runable.(n_runable <: tasks & n_runable = runable\/unblocked ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))) || blocked:=blocked-unblocked || unblocked:={}) [] not(unblocked/={}) ==> skip || (queue_sending/={} ==> @(n_sending,n_first).(n_sending: QUEUE +-> POW(TASK) & dom(n_sending) = dom(queue_sending) & n_sending = remove_task(queue_sending,unblocked) & n_first: QUEUE +-> TASK & dom(n_first) = dom(first_sending) & !q1.(q1: queues & q1: dom(n_first) & n_sending(q1)/={} => n_first(q1): n_sending(q1)) ==> queue_sending,first_sending:=n_sending,n_first) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> @(n_receiving,n_first).(n_receiving: QUEUE +-> POW(TASK) & dom(n_receiving) = dom(queue_receiving) & n_receiving = remove_task(queue_receiving,unblocked) & n_first: QUEUE +-> TASK & dom(n_first) = dom(first_receiving) & !q1.(q1: queues & q1: dom(n_first) & n_receiving(q1)/={} => n_first(q1): n_receiving(q1)) ==> queue_receiving,first_receiving:=n_receiving,n_first) [] not(queue_receiving/={}) ==> skip)));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),beforeResumeAll)==(active = FALSE | tickCount,tickMissed:=TICK_INCREMENT(tickCount,tickMissed),0 || @n_unblocked.(n_unblocked: FIN(TASK) & n_unblocked <: blocked ==> unblocked:=n_unblocked));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & active = TRUE & pxTaskToResume: TASK & pxTaskToResume: suspended & active = TRUE & pxTaskToResume: TASK | @n_runable.(n_runable <: tasks & n_runable = runable\/{pxTaskToResume} ==> (runable:=n_runable || (@(running$0).(running$0: n_runable ==> running:=running$0) [] skip))) || suspended:=suspended-{pxTaskToResume} || (@(pxQueue,n_receiving,n_first).(pxQueue: queues & pxTaskToResume: queue_receiving(pxQueue) & n_receiving: POW(TASK) & n_receiving = queue_receiving(pxQueue)-{first_receiving(pxQueue)} & n_first: TASK & n_first: queue_receiving(pxQueue) ==> queue_receiving,first_receiving:=queue_receiving<+{pxQueue|->n_receiving},first_receiving<+{pxQueue|->n_first}) || @(pxQueue,n_sending,n_first).(pxQueue: queues & n_sending: POW(TASK) & n_first: TASK & pxTaskToResume: queue_sending(pxQueue) & n_sending = queue_sending(pxQueue)-{first_sending(pxQueue)} & n_first = first_sending(pxQueue) ==> queue_sending,first_sending:=queue_sending<+{pxQueue|->n_sending},first_sending<+{pxQueue|->n_first})));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle & pxTask: tasks & uxNewPriority: PRIORITY & pxTask/=idle & active = TRUE | @(running$0).(running$0: runable ==> running:=running$0) [] skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 & pxTask: TASK & pxTask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 & btrue | cTask:=running);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskEndScheduler)==(active = TRUE & active = TRUE & btrue | active,tasks,blocked,suspended,runable,unblocked:=FALSE,{},{},{},{},{} || queues,queues_msg,queues_msg_empty,queues_msg_full,queue_items,queue_receiving,first_receiving,queue_sending,first_sending,semaphores,semaphores_busy,mutexes,mutexes_busy,mutex_holder,semaphores_full:={},{},{},{},{},{},{},{},{},{},{},{},{},{},{});
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder) & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete: TASK | tasks:=tasks-{pxTaskToDelete} || (pxTaskToDelete: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{pxTaskToDelete} ==> (runable:=n_runable || (pxTaskToDelete = running ==> (active = TRUE ==> @(running$0).(running$0: n_runable ==> running:=running$0) [] not(active = TRUE) ==> skip) [] not(pxTaskToDelete = running) ==> skip))) [] not(pxTaskToDelete: runable) ==> (pxTaskToDelete: blocked ==> (blocked:=blocked-{pxTaskToDelete} || (pxTaskToDelete: unblocked ==> unblocked:=unblocked-{pxTaskToDelete} [] not(pxTaskToDelete: unblocked) ==> skip)) [] not(pxTaskToDelete: blocked) ==> (pxTaskToDelete: suspended ==> suspended:=suspended-{pxTaskToDelete} [] not(pxTaskToDelete: suspended) ==> skip))) || (@(pxQueue,n_receiving,n_first).(pxQueue: queues & pxTaskToDelete: queue_receiving(pxQueue) & n_receiving: POW(TASK) & n_receiving = queue_receiving(pxQueue)-{first_receiving(pxQueue)} & n_first: TASK & n_first: queue_receiving(pxQueue) ==> queue_receiving,first_receiving:=queue_receiving<+{pxQueue|->n_receiving},first_receiving<+{pxQueue|->n_first}) || @(pxQueue,n_sending,n_first).(pxQueue: queues & n_sending: POW(TASK) & n_first: TASK & pxTaskToDelete: queue_sending(pxQueue) & n_sending = queue_sending(pxQueue)-{first_sending(pxQueue)} & n_first = first_sending(pxQueue) ==> queue_sending,first_sending:=queue_sending<+{pxQueue|->n_sending},first_sending<+{pxQueue|->n_first})));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1 & running: runable | xTimeIncrement>0 ==> (running: TASK & running = running & running: runable & running/=idle & TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement): TICK | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running}) [] not(xTimeIncrement>0) ==> (active = TRUE ==> (active = TRUE | @(running$0).(running$0: runable ==> running:=running$0)) [] not(active = TRUE) ==> skip));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & running: runable | xTicksToDelay>0 ==> (running: TASK & running = running & running: runable & running/=idle & TICK_INCREMENT(xTicksToDelay,tickCount): TICK | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @(running$0).(running$0: n_runable ==> running:=running$0))) || blocked:=blocked\/{running}) [] not(xTicksToDelay>0) ==> (active = TRUE ==> (active = TRUE | @(running$0).(running$0: runable ==> running:=running$0)) [] not(active = TRUE) ==> skip));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY & uxPriority: PRIORITY | @(task,n_runable).(task: TASK & task/:tasks & n_runable <: tasks & n_runable = runable\/{task} & task/=TASK_NULL ==> (tasks,runable:=tasks\/{task},n_runable || (skip [] @(running$0).(running$0: n_runable ==> running:=running$0)) || handle:=task)) || result:=pdPASS [] result,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL);
  List_Substitution(Machine(FreeRTOSBasic),xTaskCreate)==(CHOICE handle <-- t_create(uxPriority) || result:=pdPASS OR result:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || handle:=TASK_NULL END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelay)==(IF xTicksToDelay>0 THEN t_delayTask(TICK_INCREMENT(xTicksToDelay,tickCount),running) ELSE IF active = TRUE THEN t_yield END END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelayUntil)==(IF xTimeIncrement>0 THEN t_delayTask(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement),running) ELSE IF active = TRUE THEN t_yield END END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelete)==(t_delete(pxTaskToDelete) || q_removeFromEventListQueue(pxTaskToDelete));
  List_Substitution(Machine(FreeRTOSBasic),vTaskEndScheduler)==(t_endScheduler || q_endScheduler);
  List_Substitution(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(cTask <-- t_getCurrent);
  List_Substitution(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(numberOfTasks <-- t_getNumberOfTasks);
  List_Substitution(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(priority <-- t_getPriority(pxTask));
  List_Substitution(Machine(FreeRTOSBasic),vTaskPrioritySet)==(t_setPriority(pxTask,uxNewPriority));
  List_Substitution(Machine(FreeRTOSBasic),vTaskResume)==(t_resume(pxTaskToResume) || q_removeFromEventListQueue(pxTaskToResume));
  List_Substitution(Machine(FreeRTOSBasic),beforeResumeAll)==(t_beforeResumeAll);
  List_Substitution(Machine(FreeRTOSBasic),xTaskResumeAll)==(t_resumeAll(unblocked) || q_resumeAll(unblocked));
  List_Substitution(Machine(FreeRTOSBasic),vTaskStartScheduler)==(CHOICE t_startScheduler OR skip END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskSuspend)==(IF pxTaskToSuspend/:suspended THEN t_suspend(pxTaskToSuspend) || q_removeFromEventListQueue(pxTaskToSuspend) END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskSuspendAll)==(t_suspendAll);
  List_Substitution(Machine(FreeRTOSBasic),xQueueCreate)==(CHOICE xQueueHandle <-- q_queueCreate(uxQueueLength,uxItemSize) OR xQueueHandle:=QUEUE_NULL END);
  List_Substitution(Machine(FreeRTOSBasic),queueDelete)==(q_queueDelete(pxQueue));
  List_Substitution(Machine(FreeRTOSBasic),sendItem)==(IF pxQueue/:queues_msg_full THEN q_sendItem(pxQueue,pvItemToQueue,copy_position) || IF queue_receiving(pxQueue)/={} THEN t_removeFromEventList(first_receiving(pxQueue)) END || return:=pdPASS ELSE CHOICE t_delayTask(TICK_INCREMENT(xTicksToWait,tickCount),running) || q_insertTaskWaitingToSend(pxQueue,running) || return:=pdPASS OR t_suspend(running) || q_insertTaskWaitingToSend(pxQueue,running) || return:=pdPASS OR return:=pdFAIL END END);
  List_Substitution(Machine(FreeRTOSBasic),receiveItem)==(IF pxQueue: queues_msg_empty THEN CHOICE t_delayTask(TICK_INCREMENT(xTicksToWait,tickCount),running) || q_insertTaskWaitingToReceive(pxQueue,running) || return,pvBuffer:=pdPASS,ITEM_NULL OR t_suspend(running) || q_insertTaskWaitingToReceive(pxQueue,running) || return,pvBuffer:=pdPASS,ITEM_NULL OR return,pvBuffer:=pdFAIL,ITEM_NULL END ELSE pvBuffer <-- q_receivedItem(pxQueue,justPeeking) || return:=pdPASS || IF justPeeking = FALSE THEN IF queue_sending(pxQueue)/={} THEN t_removeFromEventList(first_sending(pxQueue)) END END END);
  List_Substitution(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(CHOICE semaphore <-- q_createSemaphore(1,1) OR semaphore:=QUEUE_NULL END);
  List_Substitution(Machine(FreeRTOSBasic),vSemaphoreCreateCounting)==(CHOICE semaphore <-- q_createSemaphore(maxCount,initialCount) OR semaphore:=QUEUE_NULL END);
  List_Substitution(Machine(FreeRTOSBasic),deleteSemaphore)==(q_deleteSemaphore(semaphore));
  List_Substitution(Machine(FreeRTOSBasic),takeSemaphore)==(IF semaphore/:semaphores_busy THEN q_takeSemaphore(semaphore) || IF queue_sending(semaphore)/={} THEN t_removeFromEventList(first_sending(semaphore)) END || return:=pdPASS ELSE CHOICE t_delayTask(TICK_INCREMENT(xTicksToWait,tickCount),running) || q_insertTaskWaitingToReceive(semaphore,running) || return:=pdPASS OR t_suspend(running) || q_insertTaskWaitingToReceive(semaphore,running) || return:=pdPASS OR return:=pdFAIL END END);
  List_Substitution(Machine(FreeRTOSBasic),giveSemaphore)==(IF semaphore/:semaphores_full THEN q_giveSemaphore(semaphore) || IF queue_receiving(semaphore)/={} THEN t_removeFromEventList(first_receiving(semaphore)) END || return:=pdPASS ELSE CHOICE t_delayTask(TICK_INCREMENT(xTicksToWait,tickCount),running) || q_insertTaskWaitingToSend(semaphore,running) || return:=pdPASS OR t_suspend(running) || q_insertTaskWaitingToSend(semaphore,running) || return:=pdPASS OR return:=pdFAIL END END);
  List_Substitution(Machine(FreeRTOSBasic),xQueueCreateMutex)==(CHOICE mutex <-- q_createMutex OR mutex:=QUEUE_NULL END);
  List_Substitution(Machine(FreeRTOSBasic),takeMutex)==(IF mutex: mutexes_busy THEN t_priorityInherit(mutex_holder(mutex),xTicksToWait) || q_insertTaskWaitingToReceive(mutex,running) ELSE q_takeMutex(mutex,running) END);
  List_Substitution(Machine(FreeRTOSBasic),giveMutex)==(q_giveMutex(mutex) || IF queue_receiving(mutex)/={} THEN t_returnPriority(first_receiving(mutex)) END);
  List_Substitution(Machine(FreeRTOSBasic),xTaskGetTickCount)==(numberOfTicks:=tickCount);
  List_Substitution(Machine(FreeRTOSBasic),incrementTick)==(t_incrementTick);
  List_Substitution(Machine(FreeRTOSBasic),afterIncrementTick)==(t_resumeAll(unblocked) || q_resumeAll(unblocked))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(FreeRTOSBasic))==(remove_task,update_first);
  Inherited_List_Constants(Machine(FreeRTOSBasic))==(remove_task,update_first);
  List_Constants(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(FreeRTOSBasic),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Machine(FreeRTOSBasic))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Machine(FreeRTOSBasic))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Machine(FreeRTOSBasic))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Machine(FreeRTOSBasic))==(?);
  Inherited_List_Enumerated(Machine(FreeRTOSBasic))==(?);
  Inherited_List_Defered(Machine(FreeRTOSBasic))==(?);
  Inherited_List_Sets(Machine(FreeRTOSBasic))==(?);
  List_Enumerated(Machine(FreeRTOSBasic))==(?);
  List_Defered(Machine(FreeRTOSBasic))==(?);
  List_Sets(Machine(FreeRTOSBasic))==(?);
  Set_Definition(Machine(FreeRTOSBasic),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(FreeRTOSBasic),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(FreeRTOSBasic),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(FreeRTOSBasic))==(?);
  Expanded_List_HiddenConstants(Machine(FreeRTOSBasic))==(?);
  List_HiddenConstants(Machine(FreeRTOSBasic))==(?);
  External_List_HiddenConstants(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(FreeRTOSBasic))==(btrue);
  Context_List_Properties(Machine(FreeRTOSBasic))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}) & configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & PRIORITY = 0..configMAX_PRIORITIES-1);
  Inherited_List_Properties(Machine(FreeRTOSBasic))==(remove_task: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> POW(TASK)) & remove_task = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | %q1.(q1: QUEUE & q1: dom(q_task) | q_task(q1)-unblocked)) & update_first: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> TASK) & update_first = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | {q1,task | q1: QUEUE & q1: dom(q_task) & q_task(q1)-unblocked/={} & task: TASK & task: q_task(q1)-unblocked}));
  List_Properties(Machine(FreeRTOSBasic))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(?);
  Seen_Context_List_Enumerated(Machine(FreeRTOSBasic))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  Seen_Context_List_Assertions(Machine(FreeRTOSBasic))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  Seen_Context_List_Properties(Machine(FreeRTOSBasic))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Machine(FreeRTOSBasic))==(btrue);
  Seen_List_Operations(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Machine(FreeRTOSBasic),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Machine(FreeRTOSBasic),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Machine(FreeRTOSBasic),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Machine(FreeRTOSBasic),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Seen_Internal_List_Operations(Machine(FreeRTOSBasic),Machine(Types))==(?);
  Seen_List_Operations(Machine(FreeRTOSBasic),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(FreeRTOSBasic),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskCreate)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskDelay)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskDelayUntil)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskDelete)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskPrioritySet)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskResume)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),beforeResumeAll)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskResumeAll)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskSuspend)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xQueueCreate)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),queueDelete)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),sendItem)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),receiveItem)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vSemaphoreCreateCounting)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),deleteSemaphore)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),takeSemaphore)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),giveSemaphore)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xQueueCreateMutex)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),takeMutex)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),giveMutex)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskGetTickCount)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),incrementTick)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),afterIncrementTick)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(FreeRTOSBasic)) == (? | remove_task,update_first | ? | first_receiving,first_sending,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes_busy,mutexes,semaphores_full,semaphores_busy,semaphores,queues_msg_empty,queues_msg_full,queues_msg,queues,unblocked,idle,running,suspended,runable,blocked,tasks,active,tickMissed,tickCount | xTaskCreate,vTaskDelay,vTaskDelayUntil,vTaskDelete,vTaskEndScheduler,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,uxTaskPriorityGet,vTaskPrioritySet,vTaskResume,beforeResumeAll,xTaskResumeAll,vTaskStartScheduler,vTaskSuspend,vTaskSuspendAll,xQueueCreate,queueDelete,sendItem,receiveItem,vSemaphoreCreateBinary,vSemaphoreCreateCounting,deleteSemaphore,takeSemaphore,giveSemaphore,xQueueCreateMutex,takeMutex,giveMutex,xTaskGetTickCount,incrementTick,afterIncrementTick | ? | seen(Machine(Types)),seen(Machine(FreeRTOSConfig)),included(Machine(Task)),included(Machine(Queue)) | ? | FreeRTOSBasic);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSBasic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSBasic)) == (remove_task,update_first);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSBasic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSBasic)) == (seen(Machine(Types)): (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | ? | ? | ?));
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
  List_Of_Ids(Machine(Task)) == (? | ? | unblocked,idle,running,suspended,runable,blocked,tasks,active,tickMissed,tickCount | ? | t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_removeFromEventList,t_setPriority,t_suspendAll,t_priorityInherit,t_returnPriority,t_incrementTick,t_resumeAll,t_beforeResumeAll | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task);
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
  Constants(Machine(FreeRTOSBasic)) == (Type(update_first) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*atype(TASK,?,?))));Type(remove_task) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(FreeRTOSBasic)) == (Type(tickCount) == Mvl(btype(INTEGER,?,?));Type(tickMissed) == Mvl(btype(INTEGER,?,?));Type(active) == Mvl(btype(BOOL,?,?));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(runable) == Mvl(SetOf(atype(TASK,?,?)));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(idle) == Mvl(atype(TASK,?,?));Type(unblocked) == Mvl(SetOf(atype(TASK,?,?)));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg_full) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queues_msg_empty) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores_busy) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores_full) == Mvl(SetOf(atype(QUEUE,?,?)));Type(mutexes) == Mvl(SetOf(atype(QUEUE,?,?)));Type(mutexes_busy) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(mutex_holder) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(first_sending) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(first_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(FreeRTOSBasic)) == (Type(afterIncrementTick) == Cst(No_type,No_type);Type(incrementTick) == Cst(No_type,No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(giveMutex) == Cst(No_type,atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(takeMutex) == Cst(No_type,atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xQueueCreateMutex) == Cst(atype(QUEUE,?,?),No_type);Type(giveSemaphore) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(takeSemaphore) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(deleteSemaphore) == Cst(No_type,atype(QUEUE,?,?));Type(vSemaphoreCreateCounting) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vSemaphoreCreateBinary) == Cst(atype(QUEUE,?,?),No_type);Type(receiveItem) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*btype(BOOL,?,?));Type(sendItem) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?)*etype(COPY_POSITION,?,?));Type(queueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(vTaskSuspend) == Cst(No_type,atype(TASK,?,?));Type(vTaskStartScheduler) == Cst(No_type,No_type);Type(xTaskResumeAll) == Cst(No_type,No_type);Type(beforeResumeAll) == Cst(No_type,No_type);Type(vTaskResume) == Cst(No_type,atype(TASK,?,?));Type(vTaskPrioritySet) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(vTaskDelete) == Cst(No_type,atype(TASK,?,?));Type(vTaskDelayUntil) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskDelay) == Cst(No_type,btype(INTEGER,?,?));Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)));
  Observers(Machine(FreeRTOSBasic)) == (Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(xQueueCreateMutex) == Cst(atype(QUEUE,?,?),No_type);Type(vSemaphoreCreateCounting) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vSemaphoreCreateBinary) == Cst(atype(QUEUE,?,?),No_type);Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)))
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
