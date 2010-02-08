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
  Inherited_List_Includes(Machine(FreeRTOSBasic))==(Scheduler,Task,Queue);
  List_Includes(Machine(FreeRTOSBasic))==(Queue,Task,Scheduler)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(FreeRTOSBasic))==(xQueueCreate)
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
  Local_List_Variables(Machine(FreeRTOSBasic))==(tickMissed,tickCount);
  List_Variables(Machine(FreeRTOSBasic))==(tickMissed,tickCount,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues,idle,pending,running,suspended,ready,blocked,tasks,active,schedulerSuspended,schedulerRunning);
  External_List_Variables(Machine(FreeRTOSBasic))==(tickMissed,tickCount,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues,idle,pending,running,suspended,ready,blocked,tasks,active,schedulerSuspended,schedulerRunning)
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
  Expanded_List_Invariant(Machine(FreeRTOSBasic))==(queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & semaphores: POW(QUEUE) & semaphores <: queues & mutexes: POW(QUEUE) & mutexes <: queues & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_receiving(q1) => tk/:queue_sending(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & tk: TASK & tk: queue_sending(q2) => tk/:queue_receiving(q1)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_receiving(q1) => tk/:queue_receiving(q2)) & !(q1,q2,tk).(q1: queues & q2: queues & q1/=q2 & tk: TASK & tk: queue_sending(q1) => tk/:queue_sending(q2)) & mutex_holder: QUEUE +-> TASK & mutexes = dom(mutex_holder) & !mt.(mt: mutexes & queue_items(mt) = {} => mutex_holder(mt)/=TASK_NULL) & !mt.(mt: mutexes & queue_items(mt)/={} => mutex_holder(mt) = TASK_NULL) & !mt.(mt: mutexes => queue_items(mt) = {} or queue_items(mt) = {ITEM_EMPTY}) & active: BOOL & tasks: FIN(TASK) & idle: TASK & TASK_NULL/:tasks & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & pending: FIN(TASK) & pending <: suspended\/blocked & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {} & tasks = suspended\/blocked\/ready & running: TASK & (active = TRUE => ready/={} & running: ready & idle: ready) & schedulerRunning: BOOL & schedulerSuspended: NATURAL);
  Context_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  List_Invariant(Machine(FreeRTOSBasic))==(tickCount: TICK & tickMissed: TICK & schedulerRunning = active & ran(mutex_holder) <: tasks-{idle}\/{TASK_NULL} & !mt.(mt: queues & mt: mutexes & queue_items(mt) = {} => mutex_holder(mt): tasks & mutex_holder(mt)/=idle) & !(que,task).(que: queues & task: TASK & task: queue_sending(que) => task: blocked) & !(que,task).(que: queues & task: TASK & task: queue_receiving(que) => task: blocked))
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(FreeRTOSBasic))==(btrue);
  Expanded_List_Assertions(Machine(FreeRTOSBasic))==(!que.(que: QUEUE & que/:queues => que/:mutexes) & !mt.(mt: mutexes & queue_items(mt)/={} => queue_items(mt) = {ITEM_EMPTY}) & !mt.(mt: mutexes & queue_items(mt)/={ITEM_EMPTY} => queue_items(mt) = {}) & (active = TRUE => tasks/={};active = TRUE => idle: tasks;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => running: tasks;active = TRUE => running/:blocked;active = TRUE => running/:suspended));
  Context_List_Assertions(Machine(FreeRTOSBasic))==(BIT <: NATURAL & configMAX_PRIORITIES: NATURAL);
  List_Assertions(Machine(FreeRTOSBasic))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(FreeRTOSBasic))==(queues,queue_items,queue_receiving,queue_sending,semaphores,mutexes,mutex_holder:={},{},{},{},{},{},{};(active,tasks:=FALSE,{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0) || blocked,ready,suspended,pending:={},{},{},{});schedulerRunning,schedulerSuspended:=FALSE,0;tickCount,tickMissed:=0,0);
  Context_List_Initialisation(Machine(FreeRTOSBasic))==(skip);
  List_Initialisation(Machine(FreeRTOSBasic))==(tickCount:=0 || tickMissed:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(Queue))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(Task))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(Scheduler))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(FreeRTOSBasic),Machine(Scheduler))==(btrue);
  List_Context_Constraints(Machine(FreeRTOSBasic))==(btrue);
  List_Constraints(Machine(FreeRTOSBasic))==(btrue);
  List_Constraints(Machine(FreeRTOSBasic),Machine(Task))==(btrue);
  List_Constraints(Machine(FreeRTOSBasic),Machine(Queue))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(FreeRTOSBasic))==(xQueueGenericSend,xQueueGenericReceive,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,vQueueDelete,vTaskPrioritySet,vSemaphoreCreateBinary,xSemaphoreCreateCounting,xQueueCreateMutex,xSemaphoreCreateRecursiveMutex,xQueueCreate);
  List_Operations(Machine(FreeRTOSBasic))==(xQueueGenericSend,xQueueGenericReceive,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,vQueueDelete,vTaskPrioritySet,vSemaphoreCreateBinary,xSemaphoreCreateCounting,xQueueCreateMutex,xSemaphoreCreateRecursiveMutex,xQueueCreate)
END
&
THEORY ListInputX IS
  List_Input(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(FreeRTOSBasic),xQueueGenericSend)==(pxQueue,pvItemToQueue,xTicksToWait,copy_position);
  List_Input(Machine(FreeRTOSBasic),xQueueGenericReceive)==(pxQueue,xTicksToWait,justPeeking);
  List_Input(Machine(FreeRTOSBasic),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Machine(FreeRTOSBasic),vTaskDelete)==(pxTaskToDelete);
  List_Input(Machine(FreeRTOSBasic),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Machine(FreeRTOSBasic),vTaskResume)==(pxTaskToResume);
  List_Input(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(pxTask);
  List_Input(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskDelay)==(xTicksToDelay);
  List_Input(Machine(FreeRTOSBasic),vTaskDelayUntil)==(pxPreviousWakeTime,xTimeIncrement);
  List_Input(Machine(FreeRTOSBasic),xTaskGetTickCount)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_Input(Machine(FreeRTOSBasic),xTaskResumeAll)==(?);
  List_Input(Machine(FreeRTOSBasic),incrementTick)==(?);
  List_Input(Machine(FreeRTOSBasic),vQueueDelete)==(pxQueue);
  List_Input(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask,uxNewPriority);
  List_Input(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(?);
  List_Input(Machine(FreeRTOSBasic),xSemaphoreCreateCounting)==(uxMaxCount,uxInitialCount);
  List_Input(Machine(FreeRTOSBasic),xQueueCreateMutex)==(?);
  List_Input(Machine(FreeRTOSBasic),xSemaphoreCreateRecursiveMutex)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(FreeRTOSBasic),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(FreeRTOSBasic),xQueueGenericSend)==(return);
  List_Output(Machine(FreeRTOSBasic),xQueueGenericReceive)==(return,pvBuffer);
  List_Output(Machine(FreeRTOSBasic),xTaskCreate)==(result,handle);
  List_Output(Machine(FreeRTOSBasic),vTaskDelete)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskSuspend)==(rr);
  List_Output(Machine(FreeRTOSBasic),vTaskResume)==(?);
  List_Output(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(priority);
  List_Output(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(cTask);
  List_Output(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Machine(FreeRTOSBasic),vTaskDelay)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskDelayUntil)==(?);
  List_Output(Machine(FreeRTOSBasic),xTaskGetTickCount)==(numberOfTicks);
  List_Output(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_Output(Machine(FreeRTOSBasic),xTaskResumeAll)==(?);
  List_Output(Machine(FreeRTOSBasic),incrementTick)==(?);
  List_Output(Machine(FreeRTOSBasic),vQueueDelete)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskPrioritySet)==(?);
  List_Output(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(semaphore);
  List_Output(Machine(FreeRTOSBasic),xSemaphoreCreateCounting)==(semaphore);
  List_Output(Machine(FreeRTOSBasic),xQueueCreateMutex)==(xQueueHandle);
  List_Output(Machine(FreeRTOSBasic),xSemaphoreCreateRecursiveMutex)==(xQueueHandle)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(FreeRTOSBasic),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(FreeRTOSBasic),xQueueGenericSend)==(return <-- xQueueGenericSend(pxQueue,pvItemToQueue,xTicksToWait,copy_position));
  List_Header(Machine(FreeRTOSBasic),xQueueGenericReceive)==(return,pvBuffer <-- xQueueGenericReceive(pxQueue,xTicksToWait,justPeeking));
  List_Header(Machine(FreeRTOSBasic),xTaskCreate)==(result,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Machine(FreeRTOSBasic),vTaskDelete)==(vTaskDelete(pxTaskToDelete));
  List_Header(Machine(FreeRTOSBasic),vTaskSuspend)==(rr <-- vTaskSuspend(pxTaskToSuspend));
  List_Header(Machine(FreeRTOSBasic),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(cTask <-- xTaskGetCurrentTaskHandle);
  List_Header(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Machine(FreeRTOSBasic),vTaskDelay)==(vTaskDelay(xTicksToDelay));
  List_Header(Machine(FreeRTOSBasic),vTaskDelayUntil)==(vTaskDelayUntil(pxPreviousWakeTime,xTimeIncrement));
  List_Header(Machine(FreeRTOSBasic),xTaskGetTickCount)==(numberOfTicks <-- xTaskGetTickCount);
  List_Header(Machine(FreeRTOSBasic),vTaskStartScheduler)==(vTaskStartScheduler);
  List_Header(Machine(FreeRTOSBasic),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(FreeRTOSBasic),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(FreeRTOSBasic),xTaskResumeAll)==(xTaskResumeAll);
  List_Header(Machine(FreeRTOSBasic),incrementTick)==(incrementTick);
  List_Header(Machine(FreeRTOSBasic),vQueueDelete)==(vQueueDelete(pxQueue));
  List_Header(Machine(FreeRTOSBasic),vTaskPrioritySet)==(vTaskPrioritySet(pxTask,uxNewPriority));
  List_Header(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(semaphore <-- vSemaphoreCreateBinary);
  List_Header(Machine(FreeRTOSBasic),xSemaphoreCreateCounting)==(semaphore <-- xSemaphoreCreateCounting(uxMaxCount,uxInitialCount));
  List_Header(Machine(FreeRTOSBasic),xQueueCreateMutex)==(xQueueHandle <-- xQueueCreateMutex);
  List_Header(Machine(FreeRTOSBasic),xSemaphoreCreateRecursiveMutex)==(xQueueHandle <-- xSemaphoreCreateRecursiveMutex)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(FreeRTOSBasic),xQueueGenericSend)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & running/=idle & running: ready);
  List_Precondition(Machine(FreeRTOSBasic),xQueueGenericReceive)==(active = TRUE & running/=idle & pxQueue: QUEUE & pxQueue: queues & xTicksToWait: TICK & justPeeking: BOOL);
  List_Precondition(Machine(FreeRTOSBasic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY);
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder));
  List_Precondition(Machine(FreeRTOSBasic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle);
  List_Precondition(Machine(FreeRTOSBasic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & pxTaskToResume/:pending);
  List_Precondition(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) & running: ready);
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1);
  List_Precondition(Machine(FreeRTOSBasic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(FreeRTOSBasic),vTaskStartScheduler)==(blocked = {} & suspended = {} & ready = {} & active = FALSE);
  List_Precondition(Machine(FreeRTOSBasic),vTaskEndScheduler)==(schedulerRunning = TRUE);
  List_Precondition(Machine(FreeRTOSBasic),vTaskSuspendAll)==(schedulerSuspended<MAXINT);
  List_Precondition(Machine(FreeRTOSBasic),xTaskResumeAll)==(schedulerSuspended>0);
  List_Precondition(Machine(FreeRTOSBasic),incrementTick)==(schedulerRunning = TRUE);
  List_Precondition(Machine(FreeRTOSBasic),vQueueDelete)==(pxQueue: queues);
  List_Precondition(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle);
  List_Precondition(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(btrue);
  List_Precondition(Machine(FreeRTOSBasic),xSemaphoreCreateCounting)==(uxMaxCount: NAT & uxInitialCount: NAT & 1<=uxInitialCount & uxInitialCount<=uxMaxCount);
  List_Precondition(Machine(FreeRTOSBasic),xQueueCreateMutex)==(btrue);
  List_Precondition(Machine(FreeRTOSBasic),xSemaphoreCreateRecursiveMutex)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xSemaphoreCreateRecursiveMutex)==(btrue | @mutex.(mutex: QUEUE & mutex/:queues ==> queues,mutexes,queue_items,queue_receiving,queue_sending,mutex_holder,xQueueHandle:=queues\/{mutex},mutexes\/{mutex},queue_items\/{mutex|->{ITEM_EMPTY}},queue_receiving\/{mutex|->{}},queue_sending\/{mutex|->{}},mutex_holder\/{mutex|->TASK_NULL},mutex));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueCreateMutex)==(btrue | @mutex.(mutex: QUEUE & mutex/:queues ==> queues,mutexes,queue_items,queue_receiving,queue_sending,mutex_holder,xQueueHandle:=queues\/{mutex},mutexes\/{mutex},queue_items\/{mutex|->{ITEM_EMPTY}},queue_receiving\/{mutex|->{}},queue_sending\/{mutex|->{}},mutex_holder\/{mutex|->TASK_NULL},mutex));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xSemaphoreCreateCounting)==(uxMaxCount: NAT & uxInitialCount: NAT & 1<=uxInitialCount & uxInitialCount<=uxMaxCount & uxMaxCount: NAT & uxMaxCount>0 & uxInitialCount: NAT & uxInitialCount<=uxMaxCount | @(semaphore$0,s_items$0).(semaphore$0: QUEUE & semaphore$0/:queues & semaphore$0/:mutexes & s_items$0: POW(ITEM) & card(s_items$0) = uxInitialCount ==> queues,semaphores,queue_items,queue_receiving,queue_sending,semaphore:=queues\/{semaphore$0},semaphores\/{semaphore$0},queue_items\/{semaphore$0|->s_items$0},queue_receiving\/{semaphore$0|->{}},queue_sending\/{semaphore$0|->{}},semaphore$0));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(btrue & 1: NAT & 1>0 & 1: NAT & 1<=1 | @(semaphore$0,s_items$0).(semaphore$0: QUEUE & semaphore$0/:queues & semaphore$0/:mutexes & s_items$0: POW(ITEM) & card(s_items$0) = 1 ==> queues,semaphores,queue_items,queue_receiving,queue_sending,semaphore:=queues\/{semaphore$0},semaphores\/{semaphore$0},queue_items\/{semaphore$0|->s_items$0},queue_receiving\/{semaphore$0|->{}},queue_sending\/{semaphore$0|->{}},semaphore$0));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle & pxTask: tasks & uxNewPriority: PRIORITY & pxTask/=idle | @(running$0).(running$0: ready ==> running:=running$0) [] skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vQueueDelete)==(pxQueue: queues | queues,queue_items,queue_receiving,queue_sending:=queues-{pxQueue},{pxQueue}<<|queue_items,{pxQueue}<<|queue_receiving,{pxQueue}<<|queue_sending || (pxQueue: semaphores ==> semaphores:=semaphores-{pxQueue} [] not(pxQueue: semaphores) ==> skip) || (pxQueue: mutexes ==> mutexes,mutex_holder:=mutexes-{pxQueue},{pxQueue}<<|mutex_holder [] not(pxQueue: mutexes) ==> skip));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),incrementTick)==(schedulerRunning = TRUE | schedulerSuspended = 0 ==> tickCount:=TICK_INCREMENT(tickCount,1) [] not(schedulerSuspended = 0) ==> tickMissed:=TICK_INCREMENT(tickCount,1) || @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked & unblocked/\pending = {} ==> (unblocked: FIN(TASK) & unblocked <: blocked & unblocked/\pending = {} & unblocked: POW(TASK) | unblocked/={} ==> (@(running$0).(running$0: unblocked ==> running:=running$0) [] skip || ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip || (queue_sending/={} ==> queue_sending:=remove_task(queue_sending,unblocked) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> queue_receiving:=remove_task(queue_receiving,unblocked) [] not(queue_receiving/={}) ==> skip)))));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskResumeAll)==(schedulerSuspended>0 | schedulerSuspended:=schedulerSuspended-1 || @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked: FIN(TASK) & unblocked <: blocked & unblocked\/pending: POW(TASK) | unblocked/={} or pending/={} ==> (@(running$0).(running$0: unblocked\/pending ==> running:=running$0) [] skip || ready:=ready\/unblocked\/pending || blocked:=blocked-unblocked-pending || suspended:=suspended-pending || pending:={}) [] not(unblocked/={} or pending/={}) ==> skip || (queue_sending/={} ==> queue_sending:=remove_task(queue_sending,unblocked\/pending) [] not(queue_sending/={}) ==> skip || (queue_receiving/={} ==> queue_receiving:=remove_task(queue_receiving,unblocked\/pending) [] not(queue_receiving/={}) ==> skip)) || tickCount:=TICK_INCREMENT(tickCount,tickMissed))) [] skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskSuspendAll)==(schedulerSuspended<MAXINT | schedulerSuspended:=schedulerSuspended+1);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskEndScheduler)==(schedulerRunning = TRUE & schedulerRunning = TRUE & active = TRUE & btrue | schedulerRunning:=FALSE || active,tasks,blocked,suspended,ready,pending:=FALSE,{},{},{},{},{} || queues,queue_items,queue_receiving,queue_sending,semaphores,mutexes,mutex_holder:={},{},{},{},{},{},{});
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskStartScheduler)==(blocked = {} & suspended = {} & ready = {} & active = FALSE & active = FALSE & schedulerRunning = FALSE | active:=TRUE || @idle_task.(idle_task: TASK & idle_task/:tasks & idle_task/=TASK_NULL ==> (tasks,ready,idle:=tasks\/{idle_task},ready\/{idle_task},idle_task || @(running$0).(running$0: ready\/{idle_task} ==> running:=running$0))) || schedulerRunning:=TRUE [] skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | numberOfTicks:=tickCount);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1 | schedulerRunning = TRUE ==> (TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0 ==> (running: TASK & running = running & running: ready & running/=idle & TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement): TICK | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) [] not(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0) ==> skip) [] not(schedulerRunning = TRUE) ==> skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) & running: ready & running: TASK & running = running & running: ready & running/=idle & TICK_INCREMENT(tickCount,xTicksToDelay): TICK | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 & btrue | cTask:=running);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 & pxTask: TASK & pxTask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & pxTaskToResume/:pending & pxTaskToResume: TASK & pxTaskToResume: suspended & pxTaskToResume/:pending | ready:=ready\/{pxTaskToResume} || (@(running$0).(running$0: ready\/{pxTaskToResume} ==> running:=running$0) [] skip) || suspended:=suspended-{pxTaskToResume} || (pxTaskToResume: pending ==> pending:=pending-{pxTaskToResume} [] not(pxTaskToResume: pending) ==> skip));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle | pxTaskToSuspend/:suspended ==> (pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle | pxTaskToSuspend: ready ==> (ready:=ready-{pxTaskToSuspend} || (pxTaskToSuspend = running ==> @(running$0).(running$0: ready-{pxTaskToSuspend} ==> running:=running$0) [] not(pxTaskToSuspend = running) ==> skip)) [] not(pxTaskToSuspend: ready) ==> (pxTaskToSuspend: blocked ==> blocked:=blocked-{pxTaskToSuspend} [] not(pxTaskToSuspend: blocked) ==> skip) || suspended:=suspended\/{pxTaskToSuspend} || (pxTaskToSuspend: blocked ==> (pxTaskToSuspend: TASK | @pxQueue.(pxQueue: queues & pxTaskToSuspend: queue_receiving(pxQueue) ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{pxTaskToSuspend}}) || @pxQueue.(pxQueue: queues & pxTaskToSuspend: queue_sending(pxQueue) ==> queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{pxTaskToSuspend}})) [] not(pxTaskToSuspend: blocked) ==> skip) || rr:=pdTRUE) [] not(pxTaskToSuspend/:suspended) ==> rr:=pdFALSE);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete/:ran(mutex_holder) & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete: TASK | tasks:=tasks-{pxTaskToDelete} || (pxTaskToDelete: ready ==> (ready:=ready-{pxTaskToDelete} || (pxTaskToDelete = running ==> @(running$0).(running$0: ready-{pxTaskToDelete} ==> running:=running$0) [] not(pxTaskToDelete = running) ==> skip)) [] not(pxTaskToDelete: ready) ==> (pxTaskToDelete: blocked ==> blocked,pending:=blocked-{pxTaskToDelete},pending-{pxTaskToDelete} [] not(pxTaskToDelete: blocked) ==> (pxTaskToDelete: suspended ==> suspended,pending:=suspended-{pxTaskToDelete},pending-{pxTaskToDelete} [] not(pxTaskToDelete: suspended) ==> skip))) || (@pxQueue.(pxQueue: queues & pxTaskToDelete: queue_receiving(pxQueue) ==> queue_receiving:=queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{pxTaskToDelete}}) || @pxQueue.(pxQueue: queues & pxTaskToDelete: queue_sending(pxQueue) ==> queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{pxTaskToDelete}})));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY & uxPriority: PRIORITY | @task.(task: TASK & task/:tasks & task/=TASK_NULL ==> (tasks,ready:=tasks\/{task},ready\/{task} || (running:=task [] skip) || handle:=task)) || result:=pdPASS [] (result:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || @(handle$0).(handle$0: TASK ==> handle:=handle$0)));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueGenericReceive)==(active = TRUE & running/=idle & pxQueue: QUEUE & pxQueue: queues & xTicksToWait: TICK & justPeeking: BOOL | xTicksToWait>0 ==> (queue_items(pxQueue) = {} ==> (pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | pxQueue: mutexes ==> (xTicksToWait: TICK & mutex_holder(pxQueue): tasks & mutex_holder(pxQueue)/=idle & running/=idle & running: ready | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) [] not(pxQueue: mutexes) ==> (running: TASK & running = running & running: ready & running/=idle & xTicksToWait: TICK | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0)) || queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{running})} || return,pvBuffer:=pdTRUE,ITEM_NULL) [] not(queue_items(pxQueue) = {}) ==> (@task.(task: TASK & task: queue_sending(pxQueue) & task: blocked & task/:pending ==> (pxQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & running: TASK & running/=TASK_NULL | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = FALSE ==> (pxQueue: mutexes ==> (queue_items(pxQueue) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{pxQueue|->running},queue_items<+{pxQueue|->queue_items(pxQueue)-{ITEM_EMPTY}} [] not(queue_items(pxQueue) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{pxQueue|->TASK_NULL}) [] not(pxQueue: mutexes) ==> queue_items:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}} || queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}}) [] not(justPeeking = FALSE) ==> skip || pvBuffer:=item)) || (justPeeking = FALSE ==> (task: TASK & task: blocked & task/:pending | blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip)) [] not(justPeeking = FALSE) ==> skip))) || return:=pdPASS)) [] not(xTicksToWait>0) ==> (queue_items(pxQueue)/={} ==> (@task.(task: TASK & task: queue_sending(pxQueue) & task: blocked & task/:pending ==> (pxQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(pxQueue) & queue_items(pxQueue)/={} & running: TASK & running/=TASK_NULL | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = FALSE ==> (pxQueue: mutexes ==> (queue_items(pxQueue) = {ITEM_EMPTY} ==> mutex_holder,queue_items:=mutex_holder<+{pxQueue|->running},queue_items<+{pxQueue|->queue_items(pxQueue)-{ITEM_EMPTY}} [] not(queue_items(pxQueue) = {ITEM_EMPTY}) ==> mutex_holder:=mutex_holder<+{pxQueue|->TASK_NULL}) [] not(pxQueue: mutexes) ==> queue_items:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}} || queue_sending:=queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}}) [] not(justPeeking = FALSE) ==> skip || pvBuffer:=item)) || (justPeeking = FALSE ==> (task: TASK & task: blocked & task/:pending | blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip)) [] not(justPeeking = FALSE) ==> skip))) || return:=pdPASS) [] not(queue_items(pxQueue)/={}) ==> return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueGenericSend)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & running/=idle & running: ready & running: TASK & running = running & running: ready & running/=idle & xTicksToWait: TICK & pxQueue: queues & running: TASK & !q1.(q1: queues => running/:queue_sending(q1) & running/:queue_receiving(q1)) | ready,blocked:=ready-{running},blocked\/{running} || @(running$0).(running$0: ready-{running} ==> running:=running$0) || queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{running})} || return:=pdTRUE [] @task.(task: TASK & task: blocked & task: queue_receiving(pxQueue) & task/:queue_sending(pxQueue) & task/:pending ==> (pxQueue: mutexes ==> (queue_items(pxQueue) = {} ==> (pxQueue: mutexes & task: TASK & task: queue_receiving(pxQueue) & queue_items(pxQueue) = {} & task: TASK & task: blocked & task/:pending | queue_items,queue_receiving,mutex_holder:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{ITEM_EMPTY})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}},mutex_holder<+{pxQueue|->TASK_NULL} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) [] not(queue_items(pxQueue) = {}) ==> skip) [] not(pxQueue: mutexes) ==> (pxQueue: queues & pxQueue/:mutexes & pvItemToQueue: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & task: TASK & task: blocked & task/:pending | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pvItemToQueue})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}} || (blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip))) || return:=pdPASS)) [] return:=errQUEUE_FULL);
  List_Substitution(Machine(FreeRTOSBasic),xQueueCreate)==(CHOICE ANY pxQueue WHERE pxQueue: QUEUE & pxQueue/:queues THEN queues:=queues\/{pxQueue} || queue_items:=queue_items\/{pxQueue|->{}} || queue_receiving:=queue_receiving\/{pxQueue|->{}} || queue_sending:=queue_sending\/{pxQueue|->{}} || xQueueHandle:=pxQueue END OR xQueueHandle:=QUEUE_NULL END);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @pxQueue.(pxQueue: QUEUE & pxQueue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{pxQueue},queue_items\/{pxQueue|->{}},queue_receiving\/{pxQueue|->{}},queue_sending\/{pxQueue|->{}},pxQueue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(FreeRTOSBasic),xQueueGenericSend)==(CHOICE t_delayTask(xTicksToWait,running) || q_insertTaskWaitingToSend(pxQueue,running) || return:=pdTRUE OR ANY task WHERE task: TASK & task: blocked & task: queue_receiving(pxQueue) & task/:queue_sending(pxQueue) & task/:pending THEN IF pxQueue: mutexes THEN IF queue_items(pxQueue) = {} THEN q_sendItemMutex(pxQueue,task) || t_unblockMutex(task) END ELSE q_sendItem(pxQueue,pvItemToQueue,task,copy_position) || t_unblock(task) END || return:=pdPASS END OR return:=errQUEUE_FULL END);
  List_Substitution(Machine(FreeRTOSBasic),xQueueGenericReceive)==(IF xTicksToWait>0 THEN IF queue_items(pxQueue) = {} THEN IF pxQueue: mutexes THEN t_PriorityInherit(xTicksToWait,mutex_holder(pxQueue)) ELSE t_delayTask(xTicksToWait,running) END || q_insertTaskWaitingToReceive(pxQueue,running) || return,pvBuffer:=pdTRUE,ITEM_NULL ELSE ANY task WHERE task: TASK & task: queue_sending(pxQueue) & task: blocked & task/:pending THEN pvBuffer <-- q_receivedItem(pxQueue,justPeeking,task,running) || IF justPeeking = FALSE THEN t_unblock(task) END END || return:=pdPASS END ELSE IF queue_items(pxQueue)/={} THEN ANY task WHERE task: TASK & task: queue_sending(pxQueue) & task: blocked & task/:pending THEN pvBuffer <-- q_receivedItem(pxQueue,justPeeking,task,running) || IF justPeeking = FALSE THEN t_unblock(task) END END || return:=pdPASS ELSE return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL END END);
  List_Substitution(Machine(FreeRTOSBasic),xTaskCreate)==(CHOICE handle <-- t_create(uxPriority) || result:=pdPASS OR result:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || handle:: TASK END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelete)==(t_delete(pxTaskToDelete) || q_removeFromEventListQueue(pxTaskToDelete));
  List_Substitution(Machine(FreeRTOSBasic),vTaskSuspend)==(IF pxTaskToSuspend/:suspended THEN t_suspend(pxTaskToSuspend) || IF pxTaskToSuspend: blocked THEN q_removeFromEventListQueue(pxTaskToSuspend) END || rr:=pdTRUE ELSE rr:=pdFALSE END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskResume)==(t_resume(pxTaskToResume));
  List_Substitution(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(priority <-- t_getPriority(pxTask));
  List_Substitution(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(cTask <-- t_getCurrent);
  List_Substitution(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(numberOfTasks <-- t_getNumberOfTasks);
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelay)==(t_delayTask(TICK_INCREMENT(tickCount,xTicksToDelay),running));
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelayUntil)==(IF schedulerRunning = TRUE THEN SELECT TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0 THEN t_delayTask(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement),running) ELSE skip END END);
  List_Substitution(Machine(FreeRTOSBasic),xTaskGetTickCount)==(numberOfTicks:=tickCount);
  List_Substitution(Machine(FreeRTOSBasic),vTaskStartScheduler)==(CHOICE t_startScheduler || startScheduler OR skip END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskEndScheduler)==(stopScheduler || t_endScheduler || q_endScheduler);
  List_Substitution(Machine(FreeRTOSBasic),vTaskSuspendAll)==(suspendScheduler);
  List_Substitution(Machine(FreeRTOSBasic),xTaskResumeAll)==(CHOICE resumeScheduler || ANY unblocked WHERE unblocked: FIN(TASK) & unblocked <: blocked THEN t_resumeAll(unblocked) || q_resumeAll(unblocked\/pending) || tickCount:=TICK_INCREMENT(tickCount,tickMissed) END OR skip END);
  List_Substitution(Machine(FreeRTOSBasic),incrementTick)==(IF schedulerSuspended = 0 THEN tickCount:=TICK_INCREMENT(tickCount,1) ELSE tickMissed:=TICK_INCREMENT(tickCount,1) END || ANY unblocked WHERE unblocked: FIN(TASK) & unblocked <: blocked & unblocked/\pending = {} THEN t_resumeIncrement(unblocked) || q_resumeAll(unblocked) END);
  List_Substitution(Machine(FreeRTOSBasic),vQueueDelete)==(q_queueDelete(pxQueue));
  List_Substitution(Machine(FreeRTOSBasic),vTaskPrioritySet)==(t_setPriority(pxTask,uxNewPriority));
  List_Substitution(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(semaphore <-- q_createSemaphore(1,1));
  List_Substitution(Machine(FreeRTOSBasic),xSemaphoreCreateCounting)==(semaphore <-- q_createSemaphore(uxMaxCount,uxInitialCount));
  List_Substitution(Machine(FreeRTOSBasic),xQueueCreateMutex)==(xQueueHandle <-- q_createMutex);
  List_Substitution(Machine(FreeRTOSBasic),xSemaphoreCreateRecursiveMutex)==(xQueueHandle <-- q_createMutex)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(FreeRTOSBasic))==(remove_task);
  Inherited_List_Constants(Machine(FreeRTOSBasic))==(remove_task);
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
  Context_List_Properties(Machine(FreeRTOSBasic))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}) & configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT);
  Inherited_List_Properties(Machine(FreeRTOSBasic))==(remove_task: (QUEUE +-> POW(TASK))*POW(TASK) --> (QUEUE +-> POW(TASK)) & remove_task = %(q_task,unblocked).(q_task: QUEUE +-> POW(TASK) & unblocked: POW(TASK) | %q1.(q1: QUEUE & q1: dom(q_task) | q_task(q1)-unblocked)));
  List_Properties(Machine(FreeRTOSBasic))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(?);
  Seen_Context_List_Enumerated(Machine(FreeRTOSBasic))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  Seen_Context_List_Assertions(Machine(FreeRTOSBasic))==(BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(FreeRTOSBasic))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
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
  List_ANY_Var(Machine(FreeRTOSBasic),xQueueGenericSend)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(FreeRTOSBasic),xQueueGenericReceive)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskCreate)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskDelete)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskSuspend)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskResume)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskDelay)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskDelayUntil)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskGetTickCount)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskResumeAll)==(Var(unblocked) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(FreeRTOSBasic),incrementTick)==(Var(unblocked) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Machine(FreeRTOSBasic),vQueueDelete)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskPrioritySet)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vSemaphoreCreateBinary)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xSemaphoreCreateCounting)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xQueueCreateMutex)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xSemaphoreCreateRecursiveMutex)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(FreeRTOSBasic)) == (? | remove_task | tickMissed,tickCount | V,schedulerSuspended,schedulerRunning,idle,pending,running,suspended,ready,blocked,tasks,active,mutex_holder,queue_sending,queue_receiving,queue_items,mutexes,semaphores,queues | xQueueGenericSend,xQueueGenericReceive,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,vQueueDelete,vTaskPrioritySet,vSemaphoreCreateBinary,xSemaphoreCreateCounting,xQueueCreateMutex,xSemaphoreCreateRecursiveMutex | xQueueCreate | seen(Machine(Types)),seen(Machine(FreeRTOSConfig)),included(Machine(Queue)),included(Machine(Task)),included(Machine(Scheduler)) | ? | FreeRTOSBasic);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSBasic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSBasic)) == (remove_task);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSBasic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSBasic)) == (seen(Machine(Types)): (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Scheduler)) == (? | ? | schedulerSuspended,schedulerRunning | ? | startScheduler,stopScheduler,suspendScheduler,resumeScheduler | ? | seen(Machine(Types)) | ? | Scheduler);
  List_Of_HiddenCst_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Scheduler)) == (?);
  List_Of_VisibleVar_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Scheduler)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER);
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
  Constants(Machine(FreeRTOSBasic)) == (Type(remove_task) == Cst(SetOf(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(FreeRTOSBasic)) == (Type(queues) == Mvl(SetOf(atype(QUEUE,?,?)));Type(semaphores) == Mvl(SetOf(atype(QUEUE,?,?)));Type(mutexes) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(mutex_holder) == Mvl(SetOf(atype(QUEUE,?,?)*atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(pending) == Mvl(SetOf(atype(TASK,?,?)));Type(idle) == Mvl(atype(TASK,?,?));Type(schedulerRunning) == Mvl(btype(BOOL,?,?));Type(schedulerSuspended) == Mvl(btype(INTEGER,?,?));Type(tickMissed) == Mvl(btype(INTEGER,?,?));Type(tickCount) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(FreeRTOSBasic)) == (Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(xSemaphoreCreateRecursiveMutex) == Cst(atype(QUEUE,?,?),No_type);Type(xQueueCreateMutex) == Cst(atype(QUEUE,?,?),No_type);Type(xSemaphoreCreateCounting) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vSemaphoreCreateBinary) == Cst(atype(QUEUE,?,?),No_type);Type(vTaskPrioritySet) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(vQueueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(incrementTick) == Cst(No_type,No_type);Type(xTaskResumeAll) == Cst(No_type,No_type);Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(vTaskStartScheduler) == Cst(No_type,No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(vTaskDelayUntil) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskDelay) == Cst(No_type,btype(INTEGER,?,?));Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(vTaskResume) == Cst(No_type,atype(TASK,?,?));Type(vTaskSuspend) == Cst(etype(ERROR_DEFINITION,?,?),atype(TASK,?,?));Type(vTaskDelete) == Cst(No_type,atype(TASK,?,?));Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?));Type(xQueueGenericReceive) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*btype(BOOL,?,?));Type(xQueueGenericSend) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?)*etype(COPY_POSITION,?,?)));
  Observers(Machine(FreeRTOSBasic)) == (Type(xSemaphoreCreateRecursiveMutex) == Cst(atype(QUEUE,?,?),No_type);Type(xQueueCreateMutex) == Cst(atype(QUEUE,?,?),No_type);Type(xSemaphoreCreateCounting) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vSemaphoreCreateBinary) == Cst(atype(QUEUE,?,?),No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)))
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
