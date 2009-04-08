Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(TaskBasic))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(TaskBasic))==(Machine(TaskBasic));
  Level(Machine(TaskBasic))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(TaskBasic)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(TaskBasic))==(FreeRTOSConfig,Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(TaskBasic))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(TaskBasic))==(TaskCore,QueueCore);
  List_Includes(Machine(TaskBasic))==(TaskCore,QueueCore)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(TaskBasic))==(xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(TaskBasic))==(QueueCore)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(TaskBasic))==(?);
  Context_List_Variables(Machine(TaskBasic))==(?);
  Abstract_List_Variables(Machine(TaskBasic))==(?);
  Local_List_Variables(Machine(TaskBasic))==(scheduler,tickMissed,tickCount);
  List_Variables(Machine(TaskBasic))==(scheduler,tickMissed,tickCount,suspended,ready,running,blocked,tasks,queue_sending,queue_receiving,queue_items,queues);
  External_List_Variables(Machine(TaskBasic))==(scheduler,tickMissed,tickCount,suspended,ready,running,blocked,tasks,queue_sending,queue_receiving,queue_items,queues)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(TaskBasic))==(?);
  Abstract_List_VisibleVariables(Machine(TaskBasic))==(?);
  External_List_VisibleVariables(Machine(TaskBasic))==(?);
  Expanded_List_VisibleVariables(Machine(TaskBasic))==(?);
  List_VisibleVariables(Machine(TaskBasic))==(?);
  Internal_List_VisibleVariables(Machine(TaskBasic))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(TaskBasic))==(btrue);
  Gluing_List_Invariant(Machine(TaskBasic))==(btrue);
  Abstract_List_Invariant(Machine(TaskBasic))==(btrue);
  Expanded_List_Invariant(Machine(TaskBasic))==(tasks: FIN(TASK) & {TASK_NULL} <: tasks & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & running: TASK & running: tasks & running/:ready & running/:blocked & running/:suspended & TASK_NULL/:suspended & TASK_NULL/:ready & TASK_NULL/:blocked & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {} & tasks = {running}\/suspended\/blocked\/ready\/{TASK_NULL} & queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending));
  Context_List_Invariant(Machine(TaskBasic))==(btrue);
  List_Invariant(Machine(TaskBasic))==(tickCount: TICK & tickMissed: TICK & scheduler: SCHEDULER_STATE)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(TaskBasic))==(btrue);
  Expanded_List_Assertions(Machine(TaskBasic))==(btrue);
  Context_List_Assertions(Machine(TaskBasic))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(TaskBasic))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(TaskBasic))==(tasks,running,blocked,ready,suspended:={TASK_NULL},TASK_NULL,{},{},{};queues,queue_items,queue_receiving,queue_sending:={},{},{},{};tickCount,tickMissed,scheduler:=0,0,taskSCHEDULER_NOT_STARTED);
  Context_List_Initialisation(Machine(TaskBasic))==(skip);
  List_Initialisation(Machine(TaskBasic))==(tickCount:=0 || tickMissed:=0 || scheduler:=taskSCHEDULER_NOT_STARTED)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(TaskBasic))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(TaskBasic),Machine(QueueCore))==(?);
  List_Instanciated_Parameters(Machine(TaskBasic),Machine(TaskCore))==(?);
  List_Instanciated_Parameters(Machine(TaskBasic),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Machine(TaskBasic),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(TaskBasic),Machine(QueueCore))==(btrue);
  List_Context_Constraints(Machine(TaskBasic))==(btrue);
  List_Constraints(Machine(TaskBasic))==(btrue);
  List_Constraints(Machine(TaskBasic),Machine(TaskCore))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(TaskBasic))==(xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue);
  List_Operations(Machine(TaskBasic))==(xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue)
END
&
THEORY ListInputX IS
  List_Input(Machine(TaskBasic),removeFromEventListQueue)==(task);
  List_Input(Machine(TaskBasic),receivedItem)==(pxQueue,justPeeking,task);
  List_Input(Machine(TaskBasic),insertTaskWaitingToRecived)==(pxQueue,pxTask);
  List_Input(Machine(TaskBasic),insertTaskWaitingToSend)==(pxQueue,pxTask);
  List_Input(Machine(TaskBasic),sendItem)==(pxQueue,pxItem,task,copy_position);
  List_Input(Machine(TaskBasic),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(TaskBasic),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Machine(TaskBasic),vTaskDelete)==(pxTaskToDelete);
  List_Input(Machine(TaskBasic),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Machine(TaskBasic),vTaskResume)==(pxTaskToResume);
  List_Input(Machine(TaskBasic),uxTaskPriorityGet)==(pxTask);
  List_Input(Machine(TaskBasic),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Machine(TaskBasic),uxTaskGetNumberOfTasks)==(?);
  List_Input(Machine(TaskBasic),xTaskGetSchedulerState)==(?);
  List_Input(Machine(TaskBasic),vTaskDelay)==(xTicksToDelay);
  List_Input(Machine(TaskBasic),vTaskDelayUntil)==(pxPreviousWakeTime,xTimeIncrement);
  List_Input(Machine(TaskBasic),xTaskGetTickCount)==(?);
  List_Input(Machine(TaskBasic),vTaskStartScheduler)==(?);
  List_Input(Machine(TaskBasic),vTaskEndScheduler)==(?);
  List_Input(Machine(TaskBasic),vTaskSuspendAll)==(?);
  List_Input(Machine(TaskBasic),xTaskResumeAll)==(?);
  List_Input(Machine(TaskBasic),incrementTick)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(TaskBasic),removeFromEventListQueue)==(?);
  List_Output(Machine(TaskBasic),receivedItem)==(xItem);
  List_Output(Machine(TaskBasic),insertTaskWaitingToRecived)==(?);
  List_Output(Machine(TaskBasic),insertTaskWaitingToSend)==(?);
  List_Output(Machine(TaskBasic),sendItem)==(?);
  List_Output(Machine(TaskBasic),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(TaskBasic),xTaskCreate)==(result,handle);
  List_Output(Machine(TaskBasic),vTaskDelete)==(?);
  List_Output(Machine(TaskBasic),vTaskSuspend)==(rr);
  List_Output(Machine(TaskBasic),vTaskResume)==(?);
  List_Output(Machine(TaskBasic),uxTaskPriorityGet)==(priority);
  List_Output(Machine(TaskBasic),xTaskGetCurrentTaskHandle)==(cTask);
  List_Output(Machine(TaskBasic),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Machine(TaskBasic),xTaskGetSchedulerState)==(schedulerState);
  List_Output(Machine(TaskBasic),vTaskDelay)==(?);
  List_Output(Machine(TaskBasic),vTaskDelayUntil)==(?);
  List_Output(Machine(TaskBasic),xTaskGetTickCount)==(numberOfTicks);
  List_Output(Machine(TaskBasic),vTaskStartScheduler)==(?);
  List_Output(Machine(TaskBasic),vTaskEndScheduler)==(?);
  List_Output(Machine(TaskBasic),vTaskSuspendAll)==(?);
  List_Output(Machine(TaskBasic),xTaskResumeAll)==(?);
  List_Output(Machine(TaskBasic),incrementTick)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(TaskBasic),removeFromEventListQueue)==(removeFromEventListQueue(task));
  List_Header(Machine(TaskBasic),receivedItem)==(xItem <-- receivedItem(pxQueue,justPeeking,task));
  List_Header(Machine(TaskBasic),insertTaskWaitingToRecived)==(insertTaskWaitingToRecived(pxQueue,pxTask));
  List_Header(Machine(TaskBasic),insertTaskWaitingToSend)==(insertTaskWaitingToSend(pxQueue,pxTask));
  List_Header(Machine(TaskBasic),sendItem)==(sendItem(pxQueue,pxItem,task,copy_position));
  List_Header(Machine(TaskBasic),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(TaskBasic),xTaskCreate)==(result,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Machine(TaskBasic),vTaskDelete)==(vTaskDelete(pxTaskToDelete));
  List_Header(Machine(TaskBasic),vTaskSuspend)==(rr <-- vTaskSuspend(pxTaskToSuspend));
  List_Header(Machine(TaskBasic),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Machine(TaskBasic),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Machine(TaskBasic),xTaskGetCurrentTaskHandle)==(cTask <-- xTaskGetCurrentTaskHandle);
  List_Header(Machine(TaskBasic),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Machine(TaskBasic),xTaskGetSchedulerState)==(schedulerState <-- xTaskGetSchedulerState);
  List_Header(Machine(TaskBasic),vTaskDelay)==(vTaskDelay(xTicksToDelay));
  List_Header(Machine(TaskBasic),vTaskDelayUntil)==(vTaskDelayUntil(pxPreviousWakeTime,xTimeIncrement));
  List_Header(Machine(TaskBasic),xTaskGetTickCount)==(numberOfTicks <-- xTaskGetTickCount);
  List_Header(Machine(TaskBasic),vTaskStartScheduler)==(vTaskStartScheduler);
  List_Header(Machine(TaskBasic),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(TaskBasic),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(TaskBasic),xTaskResumeAll)==(xTaskResumeAll);
  List_Header(Machine(TaskBasic),incrementTick)==(incrementTick)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(TaskBasic),removeFromEventListQueue)==(task: TASK);
  List_Precondition(Machine(TaskBasic),removeFromEventListQueue)==(task: TASK);
  Own_Precondition(Machine(TaskBasic),receivedItem)==(pxQueue: queues & justPeeking: BIT & task: TASK & task: queue_sending(pxQueue));
  List_Precondition(Machine(TaskBasic),receivedItem)==(pxQueue: queues & justPeeking: BIT & task: TASK & task: queue_sending(pxQueue));
  Own_Precondition(Machine(TaskBasic),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK);
  List_Precondition(Machine(TaskBasic),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK);
  Own_Precondition(Machine(TaskBasic),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK);
  List_Precondition(Machine(TaskBasic),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK);
  Own_Precondition(Machine(TaskBasic),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue));
  List_Precondition(Machine(TaskBasic),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue));
  Own_Precondition(Machine(TaskBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(TaskBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(TaskBasic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY & running = TASK_NULL);
  List_Precondition(Machine(TaskBasic),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & pxTaskToDelete/=TASK_NULL & not(tasks = {pxTaskToDelete}));
  List_Precondition(Machine(TaskBasic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks & pxTaskToSuspend/=TASK_NULL);
  List_Precondition(Machine(TaskBasic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & running/=TASK_NULL);
  List_Precondition(Machine(TaskBasic),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(TaskBasic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(TaskBasic),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(TaskBasic),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1);
  List_Precondition(Machine(TaskBasic),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=TASK_NULL & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0));
  List_Precondition(Machine(TaskBasic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=TASK_NULL & INCLUDE_vTaskDelayUntil = 1);
  List_Precondition(Machine(TaskBasic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(TaskBasic),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED & running = TASK_NULL & blocked = {} & suspended = {} & ready = {});
  List_Precondition(Machine(TaskBasic),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(TaskBasic),vTaskSuspendAll)==(btrue);
  List_Precondition(Machine(TaskBasic),xTaskResumeAll)==(scheduler = taskSCHEDULER_SUSPENDED & running/=TASK_NULL);
  List_Precondition(Machine(TaskBasic),incrementTick)==(running/=TASK_NULL)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(TaskBasic),incrementTick)==(running/=TASK_NULL & TICK_INCREMENT(tickCount,1): TICK & running/=TASK_NULL | scheduler = taskSCHEDULER_RUNNING ==> tickCount:=TICK_INCREMENT(tickCount,1) [] not(scheduler = taskSCHEDULER_RUNNING) ==> tickMissed:=TICK_INCREMENT(tickCount,1) || @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked/={} ==> (@task.(task: TASK & task: tasks & task: unblocked ==> running,ready:=task,ready\/{running}\/unblocked-{task}) [] ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip)));
  Expanded_List_Substitution(Machine(TaskBasic),xTaskResumeAll)==(scheduler = taskSCHEDULER_SUSPENDED & running/=TASK_NULL & TICK_INCREMENT(tickCount,tickMissed): TICK & running/=TASK_NULL | scheduler:=taskSCHEDULER_RUNNING || @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked/={} ==> (@task.(task: TASK & task: tasks & task: unblocked ==> running,ready:=task,ready\/{running}\/unblocked-{task}) [] ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip)) || tickCount:=TICK_INCREMENT(tickCount,tickMissed) [] skip);
  Expanded_List_Substitution(Machine(TaskBasic),vTaskSuspendAll)==(btrue | scheduler:=taskSCHEDULER_SUSPENDED);
  Expanded_List_Substitution(Machine(TaskBasic),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING & btrue | tasks,running,blocked,suspended,ready:={TASK_NULL},TASK_NULL,{},{},{} || scheduler:=taskSCHEDULER_NOT_STARTED);
  Expanded_List_Substitution(Machine(TaskBasic),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED & running = TASK_NULL & blocked = {} & suspended = {} & ready = {} & running = TASK_NULL | @(idle_name,idle_task).(idle_name: NAME & idle_task: TASK & idle_task/:tasks ==> (tasks:=tasks\/{idle_task} || (ready = {} ==> running:=idle_task [] not(ready = {}) ==> @task.(task: ready ==> running,ready:=task,(ready\/{idle_task})-{task})))) || scheduler:=taskSCHEDULER_RUNNING [] skip);
  Expanded_List_Substitution(Machine(TaskBasic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | numberOfTicks:=tickCount);
  Expanded_List_Substitution(Machine(TaskBasic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=TASK_NULL & INCLUDE_vTaskDelayUntil = 1 | TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0 ==> (TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement): TICK & not(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement) = 0) & running/=TASK_NULL | ready = {} ==> blocked,running:=blocked\/{running},TASK_NULL [] not(ready = {}) ==> @task.(task: TASK & task: ready ==> blocked,ready,running:=blocked\/{running},ready-{task},task)) [] not(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0) ==> skip);
  Expanded_List_Substitution(Machine(TaskBasic),vTaskDelay)==(xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=TASK_NULL & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) & TICK_INCREMENT(tickCount,xTicksToDelay): TICK & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) & running/=TASK_NULL | ready = {} ==> blocked,running:=blocked\/{running},TASK_NULL [] not(ready = {}) ==> @task.(task: TASK & task: ready ==> blocked,ready,running:=blocked\/{running},ready-{task},task));
  Expanded_List_Substitution(Machine(TaskBasic),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1 | schedulerState:=scheduler);
  Expanded_List_Substitution(Machine(TaskBasic),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  Expanded_List_Substitution(Machine(TaskBasic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 & btrue | cTask:=running);
  Expanded_List_Substitution(Machine(TaskBasic),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 & pxTask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Machine(TaskBasic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & running/=TASK_NULL & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & running/=TASK_NULL | ready,running:=ready\/{running},pxTaskToResume [] ready:=ready\/{pxTaskToResume} || suspended:=suspended-{pxTaskToResume});
  Expanded_List_Substitution(Machine(TaskBasic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks & pxTaskToSuspend/=TASK_NULL | pxTaskToSuspend/:suspended ==> (pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/:suspended & pxTaskToSuspend/=TASK_NULL | pxTaskToSuspend = running ==> (ready = {} ==> @task.(task: TASK & task: ready ==> running,ready:=task,ready-{task}) [] not(ready = {}) ==> running:=TASK_NULL) [] not(pxTaskToSuspend = running) ==> (pxTaskToSuspend: ready ==> ready:=ready-{pxTaskToSuspend} [] not(pxTaskToSuspend: ready) ==> (pxTaskToSuspend: blocked ==> blocked:=blocked-{pxTaskToSuspend} [] not(pxTaskToSuspend: blocked) ==> skip)) || suspended:=suspended\/{pxTaskToSuspend} || rr:=pdTRUE) [] not(pxTaskToSuspend/:suspended) ==> rr:=pdFALSE);
  Expanded_List_Substitution(Machine(TaskBasic),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & pxTaskToDelete/=TASK_NULL & not(tasks = {pxTaskToDelete}) & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=TASK_NULL & tasks/={pxTaskToDelete} & pxTaskToDelete: TASK | tasks:=tasks-{pxTaskToDelete} || (pxTaskToDelete = running ==> (@task.(task: TASK & task: ready ==> running,ready:=task,ready-{task}) [] running:=TASK_NULL) [] not(pxTaskToDelete = running) ==> (pxTaskToDelete: ready ==> ready:=ready-{pxTaskToDelete} [] not(pxTaskToDelete: ready) ==> (pxTaskToDelete: blocked ==> blocked:=blocked-{pxTaskToDelete} [] not(pxTaskToDelete: blocked) ==> (pxTaskToDelete: suspended ==> suspended:=suspended-{pxTaskToDelete} [] not(pxTaskToDelete: suspended) ==> skip)))) || @(receiving,sending).(receiving = REMOVE_EVENT(pxTaskToDelete,queues,queue_receiving) & sending = REMOVE_EVENT(pxTaskToDelete,queues,queue_sending) ==> queue_receiving,queue_sending:=queue_receiving<+receiving,queue_sending<+sending));
  Expanded_List_Substitution(Machine(TaskBasic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY & running = TASK_NULL & uxPriority: PRIORITY & running = TASK_NULL | @task.(task: TASK & task/:tasks ==> tasks,ready,handle:={task}\/tasks,{task}\/ready,task) || result:=pdPASS [] result,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL);
  List_Substitution(Machine(TaskBasic),removeFromEventListQueue)==(ANY receiving,sending WHERE receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) THEN queue_receiving:=queue_receiving<+receiving || queue_sending:=queue_sending<+sending END);
  Expanded_List_Substitution(Machine(TaskBasic),removeFromEventListQueue)==(task: TASK | @(receiving,sending).(receiving = REMOVE_EVENT(task,queues,queue_receiving) & sending = REMOVE_EVENT(task,queues,queue_sending) ==> queue_receiving,queue_sending:=queue_receiving<+receiving,queue_sending<+sending));
  List_Substitution(Machine(TaskBasic),receivedItem)==(ANY item WHERE item: ITEM & item: queue_items(pxQueue) THEN IF justPeeking = pdFALSE THEN queue_items(pxQueue):=queue_items(pxQueue)-{item} || queue_sending(pxQueue):=queue_sending(pxQueue)-{task} END || xItem:=item END);
  Expanded_List_Substitution(Machine(TaskBasic),receivedItem)==(pxQueue: queues & justPeeking: BIT & task: TASK & task: queue_sending(pxQueue) | @item.(item: ITEM & item: queue_items(pxQueue) ==> (justPeeking = pdFALSE ==> queue_items,queue_sending:=queue_items<+{pxQueue|->queue_items(pxQueue)-{item}},queue_sending<+{pxQueue|->queue_sending(pxQueue)-{task}} [] not(justPeeking = pdFALSE) ==> skip || xItem:=item)));
  List_Substitution(Machine(TaskBasic),insertTaskWaitingToRecived)==(queue_receiving(pxQueue):=queue_receiving(pxQueue)\/{pxTask});
  Expanded_List_Substitution(Machine(TaskBasic),insertTaskWaitingToRecived)==(pxQueue: queues & pxTask: TASK | queue_receiving:=queue_receiving<+{pxQueue|->(queue_receiving(pxQueue)\/{pxTask})});
  List_Substitution(Machine(TaskBasic),insertTaskWaitingToSend)==(queue_sending(pxQueue):=queue_sending(pxQueue)\/{pxTask});
  Expanded_List_Substitution(Machine(TaskBasic),insertTaskWaitingToSend)==(pxQueue: queues & pxTask: TASK | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{pxTask})});
  List_Substitution(Machine(TaskBasic),sendItem)==(queue_items(pxQueue):=queue_items(pxQueue)\/{pxItem} || queue_receiving(pxQueue):=queue_receiving(pxQueue)-{task});
  Expanded_List_Substitution(Machine(TaskBasic),sendItem)==(pxQueue: queues & pxItem: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pxItem})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}});
  List_Substitution(Machine(TaskBasic),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_items:=queue_items\/{queue|->{}} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  Expanded_List_Substitution(Machine(TaskBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @queue.(queue: QUEUE & queue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{queue},queue_items\/{queue|->{}},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(TaskBasic),xTaskCreate)==(CHOICE handle <-- t_create(uxPriority) || result:=pdPASS OR result,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL END);
  List_Substitution(Machine(TaskBasic),vTaskDelete)==(t_delete(pxTaskToDelete) || removeFromEventListQueue(pxTaskToDelete));
  List_Substitution(Machine(TaskBasic),vTaskSuspend)==(IF pxTaskToSuspend/:suspended THEN t_suspend(pxTaskToSuspend) || rr:=pdTRUE ELSE rr:=pdFALSE END);
  List_Substitution(Machine(TaskBasic),vTaskResume)==(t_resume(pxTaskToResume));
  List_Substitution(Machine(TaskBasic),uxTaskPriorityGet)==(priority <-- t_getPriority(pxTask));
  List_Substitution(Machine(TaskBasic),xTaskGetCurrentTaskHandle)==(cTask <-- t_getCurrent);
  List_Substitution(Machine(TaskBasic),uxTaskGetNumberOfTasks)==(numberOfTasks <-- t_getNumberOfTasks);
  List_Substitution(Machine(TaskBasic),xTaskGetSchedulerState)==(schedulerState:=scheduler);
  List_Substitution(Machine(TaskBasic),vTaskDelay)==(t_delayTask(TICK_INCREMENT(tickCount,xTicksToDelay)));
  List_Substitution(Machine(TaskBasic),vTaskDelayUntil)==(SELECT TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0 THEN t_delayTask(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)) ELSE skip END);
  List_Substitution(Machine(TaskBasic),xTaskGetTickCount)==(numberOfTicks:=tickCount);
  List_Substitution(Machine(TaskBasic),vTaskStartScheduler)==(CHOICE t_startScheduler || scheduler:=taskSCHEDULER_RUNNING OR skip END);
  List_Substitution(Machine(TaskBasic),vTaskEndScheduler)==(t_endScheduler || scheduler:=taskSCHEDULER_NOT_STARTED);
  List_Substitution(Machine(TaskBasic),vTaskSuspendAll)==(scheduler:=taskSCHEDULER_SUSPENDED);
  List_Substitution(Machine(TaskBasic),xTaskResumeAll)==(CHOICE scheduler:=taskSCHEDULER_RUNNING || t_resumeAll(TICK_INCREMENT(tickCount,tickMissed)) || tickCount:=TICK_INCREMENT(tickCount,tickMissed) OR skip END);
  List_Substitution(Machine(TaskBasic),incrementTick)==(IF scheduler = taskSCHEDULER_RUNNING THEN tickCount:=TICK_INCREMENT(tickCount,1) ELSE tickMissed:=TICK_INCREMENT(tickCount,1) END || t_resumeAll(TICK_INCREMENT(tickCount,1)))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(TaskBasic))==(PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  Inherited_List_Constants(Machine(TaskBasic))==(PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  List_Constants(Machine(TaskBasic))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(TaskBasic),QUEUE)==(?);
  Context_List_Enumerated(Machine(TaskBasic))==(?);
  Context_List_Defered(Machine(TaskBasic))==(NAME,PARAMETER);
  Context_List_Sets(Machine(TaskBasic))==(NAME,PARAMETER);
  List_Valuable_Sets(Machine(TaskBasic))==(TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE);
  Inherited_List_Enumerated(Machine(TaskBasic))==(?);
  Inherited_List_Defered(Machine(TaskBasic))==(TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE);
  Inherited_List_Sets(Machine(TaskBasic))==(TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE);
  List_Enumerated(Machine(TaskBasic))==(SCHEDULER_STATE);
  List_Defered(Machine(TaskBasic))==(?);
  List_Sets(Machine(TaskBasic))==(SCHEDULER_STATE);
  Set_Definition(Machine(TaskBasic),COPY_POSITION)==(?);
  Set_Definition(Machine(TaskBasic),ITEM)==(?);
  Set_Definition(Machine(TaskBasic),TASK_CODE)==(?);
  Set_Definition(Machine(TaskBasic),STACK)==(?);
  Set_Definition(Machine(TaskBasic),TASK)==(?);
  Set_Definition(Machine(TaskBasic),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(TaskBasic))==(?);
  Expanded_List_HiddenConstants(Machine(TaskBasic))==(?);
  List_HiddenConstants(Machine(TaskBasic))==(?);
  External_List_HiddenConstants(Machine(TaskBasic))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(TaskBasic))==(btrue);
  Context_List_Properties(Machine(TaskBasic))==(configMAX_PRIORITIES: INT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: INT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: INT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Inherited_List_Properties(Machine(TaskBasic))==(PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TASK_NULL: TASK & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & ITEM: FIN(INTEGER) & not(ITEM = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}));
  List_Properties(Machine(TaskBasic))==(SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(TaskBasic),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(TaskBasic))==(?);
  Seen_Context_List_Invariant(Machine(TaskBasic))==(btrue);
  Seen_Context_List_Assertions(Machine(TaskBasic))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(TaskBasic))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Seen_List_Constraints(Machine(TaskBasic))==(btrue);
  Seen_List_Operations(Machine(TaskBasic),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(TaskBasic),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Machine(TaskBasic),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Machine(TaskBasic),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(TaskBasic),Machine(FreeRTOSConfig))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(TaskBasic),xTaskCreate)==(?);
  List_ANY_Var(Machine(TaskBasic),vTaskDelete)==(?);
  List_ANY_Var(Machine(TaskBasic),vTaskSuspend)==(?);
  List_ANY_Var(Machine(TaskBasic),vTaskResume)==(?);
  List_ANY_Var(Machine(TaskBasic),uxTaskPriorityGet)==(?);
  List_ANY_Var(Machine(TaskBasic),xTaskGetCurrentTaskHandle)==(?);
  List_ANY_Var(Machine(TaskBasic),uxTaskGetNumberOfTasks)==(?);
  List_ANY_Var(Machine(TaskBasic),xTaskGetSchedulerState)==(?);
  List_ANY_Var(Machine(TaskBasic),vTaskDelay)==(?);
  List_ANY_Var(Machine(TaskBasic),vTaskDelayUntil)==(?);
  List_ANY_Var(Machine(TaskBasic),xTaskGetTickCount)==(?);
  List_ANY_Var(Machine(TaskBasic),vTaskStartScheduler)==(?);
  List_ANY_Var(Machine(TaskBasic),vTaskEndScheduler)==(?);
  List_ANY_Var(Machine(TaskBasic),vTaskSuspendAll)==(?);
  List_ANY_Var(Machine(TaskBasic),xTaskResumeAll)==(?);
  List_ANY_Var(Machine(TaskBasic),incrementTick)==(?);
  List_ANY_Var(Machine(TaskBasic),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(TaskBasic)) == (SCHEDULER_STATE,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,TASK,STACK,TASK_CODE,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | scheduler,tickMissed,tickCount | V,suspended,ready,running,blocked,tasks,queue_sending,queue_receiving,queue_items,queues | xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick | xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)),included(Machine(QueueCore)),included(Machine(TaskCore)) | ? | TaskBasic);
  List_Of_HiddenCst_Ids(Machine(TaskBasic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(TaskBasic)) == (PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(TaskBasic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(TaskBasic)) == (seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(Types)): (BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(TaskCore)): (PRIORITY,TASK_NULL,TICK,TICK_INCREMENT,TASK,STACK,TASK_CODE | ? | suspended,ready,running,blocked,tasks | ? | ? | ? | ? | ? | ?));
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
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?);
  List_Of_Ids(Machine(QueueCore)) == (QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | ? | queue_sending,queue_receiving,queue_items,queues | ? | xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue | ? | seen(Machine(Types)),seen(Machine(TaskCore)) | ? | QueueCore);
  List_Of_HiddenCst_Ids(Machine(QueueCore)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(QueueCore)) == (QUEUE_NULL,ITEM_NULL,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(QueueCore)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(QueueCore)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(TaskBasic)) == (Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(STACK) == Cst(SetOf(atype(STACK,"[STACK","]STACK")));Type(TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK")));Type(QUEUE) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")));Type(COPY_POSITION) == Cst(SetOf(atype(COPY_POSITION,"[COPY_POSITION","]COPY_POSITION")));Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM")));Type(SCHEDULER_STATE) == Cst(SetOf(etype(SCHEDULER_STATE,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(TaskBasic)) == (Type(TICK_INCREMENT) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")));Type(TICK) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")));Type(TASK_NULL) == Cst(atype(TASK,?,?));Type(PRIORITY) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(REMOVE_EVENT) == Cst(SetOf(atype(TASK,?,?)*SetOf(atype(QUEUE,?,?))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))));Type(ITEM_NULL) == Cst(atype(ITEM,?,?));Type(QUEUE_NULL) == Cst(atype(QUEUE,?,?));Type(taskSCHEDULER_NOT_STARTED) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_RUNNING) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_SUSPENDED) == Cst(etype(SCHEDULER_STATE,0,2)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(TaskBasic)) == (Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(scheduler) == Mvl(etype(SCHEDULER_STATE,?,?));Type(tickMissed) == Mvl(btype(INTEGER,?,?));Type(tickCount) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(TaskBasic)) == (Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(sendItem) == Cst(No_type,atype(QUEUE,?,?)*atype(ITEM,?,?)*atype(TASK,?,?)*atype(COPY_POSITION,?,?));Type(insertTaskWaitingToSend) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(insertTaskWaitingToRecived) == Cst(No_type,atype(QUEUE,?,?)*atype(TASK,?,?));Type(receivedItem) == Cst(atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*atype(TASK,?,?));Type(removeFromEventListQueue) == Cst(No_type,atype(TASK,?,?));Type(incrementTick) == Cst(No_type,No_type);Type(xTaskResumeAll) == Cst(No_type,No_type);Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(vTaskStartScheduler) == Cst(No_type,No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(vTaskDelayUntil) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskDelay) == Cst(No_type,btype(INTEGER,?,?));Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULER_STATE,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(vTaskResume) == Cst(No_type,atype(TASK,?,?));Type(vTaskSuspend) == Cst(btype(INTEGER,?,?),atype(TASK,?,?));Type(vTaskDelete) == Cst(No_type,atype(TASK,?,?));Type(xTaskCreate) == Cst(btype(INTEGER,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)));
  Observers(Machine(TaskBasic)) == (Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULER_STATE,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(xTaskCreate) == Cst(btype(INTEGER,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)))
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
