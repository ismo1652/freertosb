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
  List_Variables(Machine(FreeRTOSBasic))==(tickMissed,tickCount,queue_sending,queue_receiving,queue_items,queues,idle,running,suspended,ready,blocked,tasks,active,scheduler);
  External_List_Variables(Machine(FreeRTOSBasic))==(tickMissed,tickCount,queue_sending,queue_receiving,queue_items,queues,idle,running,suspended,ready,blocked,tasks,active,scheduler)
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
  Expanded_List_Invariant(Machine(FreeRTOSBasic))==(queues: POW(QUEUE) & queue_items: QUEUE +-> POW(ITEM) & queue_receiving: QUEUE +-> POW(TASK) & queue_sending: QUEUE +-> POW(TASK) & queues = dom(queue_items) & queues = dom(queue_receiving) & queues = dom(queue_sending) & active: BOOL & tasks: FIN(TASK) & idle: TASK & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & running: TASK & (active = TRUE => running = idle or idle: ready & running: tasks & running/:ready & running/:blocked & running/:suspended & tasks = {running}\/suspended\/blocked\/ready) & (active = FALSE => tasks = ready) & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {} & scheduler: SCHEDULER_STATE);
  Context_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  List_Invariant(Machine(FreeRTOSBasic))==(tickCount: TICK & tickMissed: TICK & scheduler: SCHEDULER_STATE & scheduler = taskSCHEDULER_NOT_STARTED <=> (active = FALSE) & (scheduler = taskSCHEDULER_RUNNING or scheduler = taskSCHEDULER_SUSPENDED) <=> (active = TRUE))
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(FreeRTOSBasic))==(btrue);
  Expanded_List_Assertions(Machine(FreeRTOSBasic))==(active = TRUE => idle: tasks;active = TRUE => tasks/={};active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => (ready = {} => running = idle));
  Context_List_Assertions(Machine(FreeRTOSBasic))==(BIT <: NATURAL & configMAX_PRIORITIES: NATURAL);
  List_Assertions(Machine(FreeRTOSBasic))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(FreeRTOSBasic))==(queues,queue_items,queue_receiving,queue_sending:={},{},{},{};(active,tasks:=FALSE,{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0) || blocked,ready,suspended:={},{},{});scheduler:=taskSCHEDULER_NOT_STARTED;tickCount,tickMissed:=0,0);
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
  Internal_List_Operations(Machine(FreeRTOSBasic))==(xQueueGenericSend,xQueueGenericReceive,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,xTaskGetSchedulerState,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,vQueueDelete,vTaskPrioritySet,xQueueCreate);
  List_Operations(Machine(FreeRTOSBasic))==(xQueueGenericSend,xQueueGenericReceive,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,xTaskGetSchedulerState,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,vQueueDelete,vTaskPrioritySet,xQueueCreate)
END
&
THEORY ListInputX IS
  List_Input(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(FreeRTOSBasic),xQueueGenericSend)==(pxQueue,pvItemToQueue,xTicksToWait,copy_position);
  List_Input(Machine(FreeRTOSBasic),xQueueGenericReceive)==(xQueue,xTicksToWait,justPeeking);
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
  List_Input(Machine(FreeRTOSBasic),xTaskGetSchedulerState)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_Input(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_Input(Machine(FreeRTOSBasic),xTaskResumeAll)==(?);
  List_Input(Machine(FreeRTOSBasic),incrementTick)==(?);
  List_Input(Machine(FreeRTOSBasic),vQueueDelete)==(pxQueue);
  List_Input(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask,uxNewPriority)
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
  List_Output(Machine(FreeRTOSBasic),xTaskGetSchedulerState)==(schedulerState);
  List_Output(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_Output(Machine(FreeRTOSBasic),xTaskResumeAll)==(?);
  List_Output(Machine(FreeRTOSBasic),incrementTick)==(?);
  List_Output(Machine(FreeRTOSBasic),vQueueDelete)==(?);
  List_Output(Machine(FreeRTOSBasic),vTaskPrioritySet)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(FreeRTOSBasic),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(FreeRTOSBasic),xQueueGenericSend)==(return <-- xQueueGenericSend(pxQueue,pvItemToQueue,xTicksToWait,copy_position));
  List_Header(Machine(FreeRTOSBasic),xQueueGenericReceive)==(return,pvBuffer <-- xQueueGenericReceive(xQueue,xTicksToWait,justPeeking));
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
  List_Header(Machine(FreeRTOSBasic),xTaskGetSchedulerState)==(schedulerState <-- xTaskGetSchedulerState);
  List_Header(Machine(FreeRTOSBasic),vTaskStartScheduler)==(vTaskStartScheduler);
  List_Header(Machine(FreeRTOSBasic),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(FreeRTOSBasic),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(FreeRTOSBasic),xTaskResumeAll)==(xTaskResumeAll);
  List_Header(Machine(FreeRTOSBasic),incrementTick)==(incrementTick);
  List_Header(Machine(FreeRTOSBasic),vQueueDelete)==(vQueueDelete(pxQueue));
  List_Header(Machine(FreeRTOSBasic),vTaskPrioritySet)==(vTaskPrioritySet(pxTask,uxNewPriority))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(FreeRTOSBasic),xQueueGenericSend)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & active = TRUE & running/=idle);
  List_Precondition(Machine(FreeRTOSBasic),xQueueGenericReceive)==(active = TRUE & running/=idle & xQueue: QUEUE & xQueue: queues & xTicksToWait: TICK & justPeeking: BOOL);
  List_Precondition(Machine(FreeRTOSBasic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY & scheduler = taskSCHEDULER_NOT_STARTED);
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(FreeRTOSBasic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle & scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(FreeRTOSBasic),vTaskResume)==(scheduler = taskSCHEDULER_RUNNING & INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended);
  List_Precondition(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(scheduler = taskSCHEDULER_RUNNING & INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelay)==(scheduler = taskSCHEDULER_RUNNING & xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0));
  List_Precondition(Machine(FreeRTOSBasic),vTaskDelayUntil)==(scheduler = taskSCHEDULER_RUNNING & pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1);
  List_Precondition(Machine(FreeRTOSBasic),xTaskGetTickCount)==(scheduler = taskSCHEDULER_RUNNING & INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(FreeRTOSBasic),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1);
  List_Precondition(Machine(FreeRTOSBasic),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED & blocked = {} & suspended = {} & ready = {});
  List_Precondition(Machine(FreeRTOSBasic),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(FreeRTOSBasic),vTaskSuspendAll)==(scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(FreeRTOSBasic),xTaskResumeAll)==(scheduler = taskSCHEDULER_SUSPENDED);
  List_Precondition(Machine(FreeRTOSBasic),incrementTick)==(scheduler/=taskSCHEDULER_NOT_STARTED);
  List_Precondition(Machine(FreeRTOSBasic),vQueueDelete)==(pxQueue: queues);
  List_Precondition(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskPrioritySet)==(pxTask: tasks & uxNewPriority: PRIORITY & active = TRUE & pxTask/=idle | pxTask: ready ==> (skip [] running,ready:=pxTask,(ready\/{running})-{pxTask}) [] not(pxTask: ready) ==> (pxTask = running ==> (skip [] @task.(task: TASK & task: tasks & task: ready ==> running,ready:=task,(ready\/{running})-{task})) [] not(pxTask = running) ==> skip));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vQueueDelete)==(pxQueue: queues | queues,queue_items,queue_receiving,queue_sending:=queues-{pxQueue},{pxQueue}<<|queue_items,{pxQueue}<<|queue_receiving,{pxQueue}<<|queue_sending);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),incrementTick)==(scheduler/=taskSCHEDULER_NOT_STARTED | scheduler = taskSCHEDULER_RUNNING ==> (active = TRUE & TICK_INCREMENT(tickCount,1): TICK | tickCount:=TICK_INCREMENT(tickCount,1) || @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked/={} ==> (@task.(task: TASK & task: tasks & task: unblocked ==> running,ready:=task,ready\/{running}\/unblocked-{task}) [] ready:=ready\/unblocked [] @task.(task: ready & task/=running & task/=idle ==> ready,running:=ready-{task}\/{running}\/unblocked,task) || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> (@task.(task: ready & task/=running & task/=idle ==> ready,running:=ready-{task}\/{running},task) [] skip)))) [] not(scheduler = taskSCHEDULER_RUNNING) ==> tickMissed:=TICK_INCREMENT(tickCount,1));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskResumeAll)==(scheduler = taskSCHEDULER_SUSPENDED & scheduler = taskSCHEDULER_SUSPENDED & active = TRUE & TICK_INCREMENT(tickCount,tickMissed): TICK | scheduler:=taskSCHEDULER_RUNNING || @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked/={} ==> (@task.(task: TASK & task: tasks & task: unblocked ==> running,ready:=task,ready\/{running}\/unblocked-{task}) [] ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip)) || tickCount:=TICK_INCREMENT(tickCount,tickMissed) [] skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskSuspendAll)==(scheduler = taskSCHEDULER_RUNNING | scheduler:=taskSCHEDULER_SUSPENDED);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING & scheduler = taskSCHEDULER_RUNNING & active = TRUE | scheduler:=taskSCHEDULER_NOT_STARTED || active,tasks,blocked,suspended,ready:=FALSE,{},{},{},{});
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED & blocked = {} & suspended = {} & ready = {} & active = FALSE & scheduler = taskSCHEDULER_NOT_STARTED | active,blocked,suspended:=TRUE,{},{} || @idle_task.(idle_task: TASK & idle_task/:tasks ==> (tasks,idle:=tasks\/{idle_task},idle_task || @task.(task: ready\/{idle_task} ==> running,ready:=task,(ready\/{idle_task})-{task}))) || scheduler:=taskSCHEDULER_RUNNING [] skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1 & btrue | schedulerState:=scheduler);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskGetTickCount)==(scheduler = taskSCHEDULER_RUNNING & INCLUDE_xTaskGetCurrentTaskHandle = 1 | numberOfTicks:=tickCount);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelayUntil)==(scheduler = taskSCHEDULER_RUNNING & pxPreviousWakeTime: TICK & xTimeIncrement: TICK & running/=idle & INCLUDE_vTaskDelayUntil = 1 | TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0 ==> (active = TRUE & running/=idle & TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement): TICK & not(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement) = 0) | blocked:=blocked\/{running} || @task.(task: TASK & task: ready ==> ready,running:=ready-{task},task)) [] not(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0) ==> skip);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelay)==(scheduler = taskSCHEDULER_RUNNING & xTicksToDelay: TICK & INCLUDE_vTaskDelay = 1 & running/=idle & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) & active = TRUE & running/=idle & TICK_INCREMENT(tickCount,xTicksToDelay): TICK & not(TICK_INCREMENT(tickCount,xTicksToDelay) = 0) | blocked:=blocked\/{running} || @task.(task: TASK & task: ready ==> ready,running:=ready-{task},task));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(scheduler = taskSCHEDULER_RUNNING & INCLUDE_xTaskGetCurrentTaskHandle = 1 & active = TRUE | cTask:=running);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 & pxTask: TASK & pxTask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskResume)==(scheduler = taskSCHEDULER_RUNNING & INCLUDE_vTaskSuspend = 1 & suspended/={} & pxTaskToResume: TASK & pxTaskToResume: suspended & active = TRUE & pxTaskToResume: TASK & pxTaskToResume: suspended | ready,running:=ready\/{running},pxTaskToResume [] ready:=ready\/{pxTaskToResume} || suspended:=suspended-{pxTaskToResume});
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle & scheduler = taskSCHEDULER_RUNNING | pxTaskToSuspend/:suspended ==> (active = TRUE & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks & pxTaskToSuspend/=idle | suspended:=suspended\/{pxTaskToSuspend} || (pxTaskToSuspend = running ==> @task.(task: TASK & task: ready ==> running,ready:=task,ready-{task}) [] not(pxTaskToSuspend = running) ==> (pxTaskToSuspend: ready ==> ready:=ready-{pxTaskToSuspend} [] not(pxTaskToSuspend: ready) ==> (pxTaskToSuspend: blocked ==> blocked:=blocked-{pxTaskToSuspend} [] not(pxTaskToSuspend: blocked) ==> skip))) || rr:=pdTRUE) [] not(pxTaskToSuspend/:suspended) ==> rr:=pdFALSE);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & scheduler = taskSCHEDULER_RUNNING & active = TRUE & pxTaskToDelete: TASK & pxTaskToDelete: tasks & pxTaskToDelete/=idle & pxTaskToDelete: TASK | tasks:=tasks-{pxTaskToDelete} || (pxTaskToDelete = running ==> @task.(task: TASK & task: ready ==> running,ready:=task,ready-{task}) [] not(pxTaskToDelete = running) ==> (pxTaskToDelete: ready ==> ready:=ready-{pxTaskToDelete} [] not(pxTaskToDelete: ready) ==> (pxTaskToDelete: blocked ==> blocked:=blocked-{pxTaskToDelete} [] not(pxTaskToDelete: blocked) ==> (pxTaskToDelete: suspended ==> suspended:=suspended-{pxTaskToDelete} [] not(pxTaskToDelete: suspended) ==> skip)))) || @(receiving,sending).(receiving = REMOVE_EVENT(pxTaskToDelete,queues,queue_receiving) & sending = REMOVE_EVENT(pxTaskToDelete,queues,queue_sending) ==> queue_receiving,queue_sending:=queue_receiving<+receiving,queue_sending<+sending));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NAT & pvParameters: POW(PARAMETER) & uxPriority: PRIORITY & scheduler = taskSCHEDULER_NOT_STARTED & active = FALSE & uxPriority: PRIORITY | @task.(task: TASK & task/:tasks ==> tasks,ready,handle:={task}\/tasks,{task}\/ready,task) || result:=pdPASS [] (result:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || @(handle$0).(handle$0: TASK ==> handle:=handle$0)));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueGenericReceive)==(active = TRUE & running/=idle & xQueue: QUEUE & xQueue: queues & xTicksToWait: TICK & justPeeking: BOOL | xTicksToWait>0 ==> (xQueue: queues & running: TASK & active = TRUE & running/=idle & xTicksToWait: TICK & not(xTicksToWait = 0) | queue_receiving:=queue_receiving<+{xQueue|->(queue_receiving(xQueue)\/{running})} || (blocked:=blocked\/{running} || @task.(task: TASK & task: ready ==> ready,running:=ready-{task},task)) || return,pvBuffer:=pdTRUE,ITEM_NULL [] (@task.(task: TASK & task: queue_sending(xQueue) & task: blocked ==> (xQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(xQueue) | @item.(item: ITEM & item: queue_items(xQueue) ==> (justPeeking = FALSE ==> queue_items,queue_sending:=queue_items<+{xQueue|->queue_items(xQueue)-{item}},queue_sending<+{xQueue|->queue_sending(xQueue)-{task}} [] not(justPeeking = FALSE) ==> skip || pvBuffer:=item)) || (justPeeking = FALSE ==> (active = TRUE & task: TASK & task: blocked | running = idle ==> running,ready:=task,ready\/{idle} [] not(running = idle) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task}) [] not(justPeeking = FALSE) ==> skip))) || return:=pdPASS)) [] not(xTicksToWait>0) ==> (@task.(task: TASK & task: queue_sending(xQueue) & task: blocked ==> (xQueue: queues & justPeeking: BOOL & task: TASK & task: queue_sending(xQueue) | @item.(item: ITEM & item: queue_items(xQueue) ==> (justPeeking = FALSE ==> queue_items,queue_sending:=queue_items<+{xQueue|->queue_items(xQueue)-{item}},queue_sending<+{xQueue|->queue_sending(xQueue)-{task}} [] not(justPeeking = FALSE) ==> skip || pvBuffer:=item)) || (justPeeking = FALSE ==> (active = TRUE & task: TASK & task: blocked | running = idle ==> running,ready:=task,ready\/{idle} [] not(running = idle) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task}) [] not(justPeeking = FALSE) ==> skip))) || return:=pdPASS [] return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL));
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueGenericSend)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK & copy_position: COPY_POSITION & active = TRUE & running/=idle | xTicksToWait>0 ==> (pxQueue: queues & running: TASK & active = TRUE & running/=idle & xTicksToWait: TICK & not(xTicksToWait = 0) | queue_sending:=queue_sending<+{pxQueue|->(queue_sending(pxQueue)\/{running})} || (blocked:=blocked\/{running} || @task.(task: TASK & task: ready ==> ready,running:=ready-{task},task)) || return:=pdTRUE [] @task.(task: TASK & task: blocked & task: queue_receiving(pxQueue) ==> (pxQueue: queues & pvItemToQueue: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & active = TRUE & task: TASK & task: blocked | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pvItemToQueue})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}} || (running = idle ==> running,ready:=task,ready\/{idle} [] not(running = idle) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task}) || return:=pdPASS))) [] not(xTicksToWait>0) ==> (@task.(task: TASK & task: blocked & task: queue_receiving(pxQueue) ==> (pxQueue: queues & pvItemToQueue: ITEM & task: TASK & copy_position: COPY_POSITION & task: queue_receiving(pxQueue) & active = TRUE & task: TASK & task: blocked | queue_items,queue_receiving:=queue_items<+{pxQueue|->(queue_items(pxQueue)\/{pvItemToQueue})},queue_receiving<+{pxQueue|->queue_receiving(pxQueue)-{task}} || (running = idle ==> running,ready:=task,ready\/{idle} [] not(running = idle) ==> (running,ready:=task,ready\/{running} [] ready:=ready\/{task}) || blocked:=blocked-{task}) || return:=pdPASS)) [] return:=errQUEUE_FULL));
  List_Substitution(Machine(FreeRTOSBasic),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_items:=queue_items\/{queue|->{}} || queue_receiving:=queue_receiving\/{queue|->{}} || queue_sending:=queue_sending\/{queue|->{}} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  Expanded_List_Substitution(Machine(FreeRTOSBasic),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @queue.(queue: QUEUE & queue/:queues ==> queues,queue_items,queue_receiving,queue_sending,xQueueHandle:=queues\/{queue},queue_items\/{queue|->{}},queue_receiving\/{queue|->{}},queue_sending\/{queue|->{}},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(FreeRTOSBasic),xQueueGenericSend)==(IF xTicksToWait>0 THEN CHOICE insertTaskWaitingToSend(pxQueue,running) || t_delayTask(xTicksToWait) || return:=pdTRUE OR ANY task WHERE task: TASK & task: blocked & task: queue_receiving(pxQueue) THEN sendItem(pxQueue,pvItemToQueue,task,copy_position) || t_unblock(task) || return:=pdPASS END END ELSE CHOICE ANY task WHERE task: TASK & task: blocked & task: queue_receiving(pxQueue) THEN sendItem(pxQueue,pvItemToQueue,task,copy_position) || t_unblock(task) || return:=pdPASS END OR return:=errQUEUE_FULL END END);
  List_Substitution(Machine(FreeRTOSBasic),xQueueGenericReceive)==(IF xTicksToWait>0 THEN CHOICE insertTaskWaitingToRecived(xQueue,running) || t_delayTask(xTicksToWait) || return,pvBuffer:=pdTRUE,ITEM_NULL OR ANY task WHERE task: TASK & task: queue_sending(xQueue) & task: blocked THEN pvBuffer <-- receivedItem(xQueue,justPeeking,task) || IF justPeeking = FALSE THEN t_unblock(task) END END || return:=pdPASS END ELSE CHOICE ANY task WHERE task: TASK & task: queue_sending(xQueue) & task: blocked THEN pvBuffer <-- receivedItem(xQueue,justPeeking,task) || IF justPeeking = FALSE THEN t_unblock(task) END END || return:=pdPASS OR return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL END END);
  List_Substitution(Machine(FreeRTOSBasic),xTaskCreate)==(CHOICE handle <-- t_create(uxPriority) || result:=pdPASS OR result:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || handle:: TASK END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelete)==(t_delete(pxTaskToDelete) || removeFromEventListQueue(pxTaskToDelete));
  List_Substitution(Machine(FreeRTOSBasic),vTaskSuspend)==(IF pxTaskToSuspend/:suspended THEN t_suspend(pxTaskToSuspend) || rr:=pdTRUE ELSE rr:=pdFALSE END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskResume)==(t_resume(pxTaskToResume));
  List_Substitution(Machine(FreeRTOSBasic),uxTaskPriorityGet)==(priority <-- t_getPriority(pxTask));
  List_Substitution(Machine(FreeRTOSBasic),xTaskGetCurrentTaskHandle)==(cTask <-- t_getCurrent);
  List_Substitution(Machine(FreeRTOSBasic),uxTaskGetNumberOfTasks)==(numberOfTasks <-- t_getNumberOfTasks);
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelay)==(t_delayTask(TICK_INCREMENT(tickCount,xTicksToDelay)));
  List_Substitution(Machine(FreeRTOSBasic),vTaskDelayUntil)==(SELECT TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)/=0 THEN t_delayTask(TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)) ELSE skip END);
  List_Substitution(Machine(FreeRTOSBasic),xTaskGetTickCount)==(numberOfTicks:=tickCount);
  List_Substitution(Machine(FreeRTOSBasic),xTaskGetSchedulerState)==(schedulerState <-- stateScheduler);
  List_Substitution(Machine(FreeRTOSBasic),vTaskStartScheduler)==(CHOICE t_startScheduler || startScheduler OR skip END);
  List_Substitution(Machine(FreeRTOSBasic),vTaskEndScheduler)==(stopScheduler || t_endScheduler);
  List_Substitution(Machine(FreeRTOSBasic),vTaskSuspendAll)==(suspendScheduler);
  List_Substitution(Machine(FreeRTOSBasic),xTaskResumeAll)==(CHOICE resumeScheduler || t_resumeAll(TICK_INCREMENT(tickCount,tickMissed)) || tickCount:=TICK_INCREMENT(tickCount,tickMissed) OR skip END);
  List_Substitution(Machine(FreeRTOSBasic),incrementTick)==(IF scheduler = taskSCHEDULER_RUNNING THEN tickCount:=TICK_INCREMENT(tickCount,1) || t_incrementTick(TICK_INCREMENT(tickCount,1)) ELSE tickMissed:=TICK_INCREMENT(tickCount,1) END);
  List_Substitution(Machine(FreeRTOSBasic),vQueueDelete)==(queueDelete(pxQueue));
  List_Substitution(Machine(FreeRTOSBasic),vTaskPrioritySet)==(t_setPriority(pxTask,uxNewPriority))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(FreeRTOSBasic))==(?);
  Inherited_List_Constants(Machine(FreeRTOSBasic))==(?);
  List_Constants(Machine(FreeRTOSBasic))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(FreeRTOSBasic),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Machine(FreeRTOSBasic))==(SCHEDULER_STATE,COPY_POSITION,ERROR_DEFINITION);
  Context_List_Defered(Machine(FreeRTOSBasic))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Machine(FreeRTOSBasic))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,ERROR_DEFINITION);
  List_Valuable_Sets(Machine(FreeRTOSBasic))==(?);
  Inherited_List_Enumerated(Machine(FreeRTOSBasic))==(?);
  Inherited_List_Defered(Machine(FreeRTOSBasic))==(?);
  Inherited_List_Sets(Machine(FreeRTOSBasic))==(?);
  List_Enumerated(Machine(FreeRTOSBasic))==(?);
  List_Defered(Machine(FreeRTOSBasic))==(?);
  List_Sets(Machine(FreeRTOSBasic))==(?);
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
  Context_List_Properties(Machine(FreeRTOSBasic))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}) & configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT);
  Inherited_List_Properties(Machine(FreeRTOSBasic))==(btrue);
  List_Properties(Machine(FreeRTOSBasic))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(?);
  Seen_Context_List_Enumerated(Machine(FreeRTOSBasic))==(SCHEDULER_STATE,COPY_POSITION,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Machine(FreeRTOSBasic))==(btrue);
  Seen_Context_List_Assertions(Machine(FreeRTOSBasic))==(BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(FreeRTOSBasic))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Machine(FreeRTOSBasic))==(btrue);
  Seen_List_Operations(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(FreeRTOSBasic),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Machine(FreeRTOSBasic),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
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
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskGetSchedulerState)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskStartScheduler)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskEndScheduler)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskSuspendAll)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),xTaskResumeAll)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),incrementTick)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vQueueDelete)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),vTaskPrioritySet)==(?);
  List_ANY_Var(Machine(FreeRTOSBasic),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(FreeRTOSBasic)) == (? | ? | tickMissed,tickCount | V,scheduler,idle,running,suspended,ready,blocked,tasks,active,queue_sending,queue_receiving,queue_items,queues | xQueueGenericSend,xQueueGenericReceive,xTaskCreate,vTaskDelete,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,xTaskGetSchedulerState,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,vQueueDelete,vTaskPrioritySet | xQueueCreate | seen(Machine(Types)),seen(Machine(FreeRTOSConfig)),included(Machine(Queue)),included(Machine(Task)),included(Machine(Scheduler)) | ? | FreeRTOSBasic);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSBasic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSBasic)) == (?);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSBasic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSBasic)) == (seen(Machine(Types)): (BIT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Scheduler)) == (? | ? | scheduler | ? | stateScheduler,startScheduler,stopScheduler,suspendScheduler,resumeScheduler | ? | seen(Machine(Types)) | ? | Scheduler);
  List_Of_HiddenCst_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Scheduler)) == (?);
  List_Of_VisibleVar_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Scheduler)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(Task)) == (? | ? | idle,running,suspended,ready,blocked,tasks,active | ? | t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_incrementTick,t_setPriority | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task);
  List_Of_HiddenCst_Ids(Machine(Task)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task)) == (?);
  List_Of_VisibleVar_Ids(Machine(Task)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?);
  List_Of_Ids(Machine(Queue)) == (? | ? | queue_sending,queue_receiving,queue_items,queues | ? | xQueueCreate,queueDelete,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,receivedItem,removeFromEventListQueue | ? | seen(Machine(Types)) | ? | Queue);
  List_Of_HiddenCst_Ids(Machine(Queue)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue)) == (?);
  List_Of_VisibleVar_Ids(Machine(Queue)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(FreeRTOSBasic)) == (Type(queues) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queue_items) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queue_receiving) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_sending) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(active) == Mvl(btype(BOOL,?,?));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(idle) == Mvl(atype(TASK,?,?));Type(scheduler) == Mvl(etype(SCHEDULER_STATE,?,?));Type(tickMissed) == Mvl(btype(INTEGER,?,?));Type(tickCount) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(FreeRTOSBasic)) == (Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskPrioritySet) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(vQueueDelete) == Cst(No_type,atype(QUEUE,?,?));Type(incrementTick) == Cst(No_type,No_type);Type(xTaskResumeAll) == Cst(No_type,No_type);Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(vTaskStartScheduler) == Cst(No_type,No_type);Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULER_STATE,?,?),No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(vTaskDelayUntil) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskDelay) == Cst(No_type,btype(INTEGER,?,?));Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(vTaskResume) == Cst(No_type,atype(TASK,?,?));Type(vTaskSuspend) == Cst(etype(ERROR_DEFINITION,?,?),atype(TASK,?,?));Type(vTaskDelete) == Cst(No_type,atype(TASK,?,?));Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?));Type(xQueueGenericReceive) == Cst(etype(ERROR_DEFINITION,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?)*btype(BOOL,?,?));Type(xQueueGenericSend) == Cst(etype(ERROR_DEFINITION,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?)*etype(COPY_POSITION,?,?)));
  Observers(Machine(FreeRTOSBasic)) == (Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULER_STATE,?,?),No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(xTaskCreate) == Cst(etype(ERROR_DEFINITION,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)))
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
