Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Task))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Task))==(Machine(Task));
  Level(Machine(Task))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Task)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Task))==(Types,FreeRTOSConfig)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Task))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Task))==(Queue_Basic,Task_Basic);
  List_Includes(Machine(Task))==(Task_Basic,Queue_Basic)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Task))==(xTaskCreate,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Task))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Task))==(?);
  Context_List_Variables(Machine(Task))==(?);
  Abstract_List_Variables(Machine(Task))==(?);
  Local_List_Variables(Machine(Task))==(?);
  List_Variables(Machine(Task))==(tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks,queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues);
  External_List_Variables(Machine(Task))==(tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks,queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Task))==(?);
  Abstract_List_VisibleVariables(Machine(Task))==(?);
  External_List_VisibleVariables(Machine(Task))==(?);
  Expanded_List_VisibleVariables(Machine(Task))==(?);
  List_VisibleVariables(Machine(Task))==(?);
  Internal_List_VisibleVariables(Machine(Task))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Task))==(btrue);
  Gluing_List_Invariant(Machine(Task))==(btrue);
  Abstract_List_Invariant(Machine(Task))==(btrue);
  Expanded_List_Invariant(Machine(Task))==(tasks: POW(TASK) & task_name: TASK +-> NAME & task_state: TASK +-> TASK_STATE & task_priority: TASK +-> PRIORITY & task_value: TASK +-> TICK & tasks = dom(task_priority) & tasks = dom(task_state) & tasks = dom(task_value) & tasks = dom(task_name) & current_task: TASK & current_task: tasks & task_state(current_task) = running & max_priority: PRIORITY & max_priority = task_priority(current_task) & max_priority>=max(READY_PRIORITIES(task_state,task_priority)) & card(task_state|>{running})<=1 & scheduler: SCHEDULER_STATE & tickCount: TICK & tickMissed: TICK & queues: POW(QUEUE) & queue_itens: QUEUE +-> POW(ITEM) & queue_tkRecived: QUEUE +-> POW(TASK) & queue_tkSend: QUEUE +-> POW(TASK) & queue_length: QUEUE +-> NAT & queues = dom(queue_itens) & queues = dom(queue_tkRecived) & queues = dom(queue_tkSend) & queues = dom(queue_length) & !queue.(queue: queues => card(queue_itens(queue))<=queue_length(queue)));
  Context_List_Invariant(Machine(Task))==(btrue);
  List_Invariant(Machine(Task))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Task))==(btrue);
  Expanded_List_Assertions(Machine(Task))==(!(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY => (not(ran(dom(tk_st|>{ready})<|tk_prt) = {}) => READY_PRIORITIES(tk_st,tk_prt) = ran(dom(tk_st|>{ready})<|tk_prt) & ran(dom(tk_st|>{ready})<|tk_prt) = {} => READY_PRIORITIES(tk_st,tk_prt) = {0})) & !(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY => READY_PRIORITIES(tk_st,tk_prt)/={}) & !(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY => max(READY_PRIORITIES(tk_st,tk_prt))>=0));
  Context_List_Assertions(Machine(Task))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(Task))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Task))==(tasks,task_name,task_state,task_priority,task_value,current_task,max_priority,scheduler,tickCount,tickMissed:={TASK_NULL},{TASK_NULL|->NAME_NULL},{TASK_NULL|->running},{TASK_NULL|->0},{TASK_NULL|->0},TASK_NULL,0,taskSCHEDULER_NOT_STARTED,0,0;queues,queue_itens,queue_tkRecived,queue_tkSend,queue_length:={QUEUE_NULL},{QUEUE_NULL|->{}},{QUEUE_NULL|->{}},{QUEUE_NULL|->{}},{QUEUE_NULL|->card({})});
  Context_List_Initialisation(Machine(Task))==(skip);
  List_Initialisation(Machine(Task))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Task))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Task),Machine(Task_Basic))==(?);
  List_Instanciated_Parameters(Machine(Task),Machine(Queue_Basic))==(?);
  List_Instanciated_Parameters(Machine(Task),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(Task),Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Task),Machine(Queue_Basic))==(btrue);
  List_Context_Constraints(Machine(Task))==(btrue);
  List_Constraints(Machine(Task))==(btrue);
  List_Constraints(Machine(Task),Machine(Task_Basic))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Task))==(vTaskDelete,xTaskCreate,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll);
  List_Operations(Machine(Task))==(vTaskDelete,xTaskCreate,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll)
END
&
THEORY ListInputX IS
  List_Input(Machine(Task),xTaskResumeAll)==(?);
  List_Input(Machine(Task),vTaskSuspendAll)==(?);
  List_Input(Machine(Task),vTaskEndScheduler)==(?);
  List_Input(Machine(Task),vTaskStartScheduler)==(?);
  List_Input(Machine(Task),xTaskGetTickCount)==(?);
  List_Input(Machine(Task),vTaskDelayUntil)==(pxPreviousWakeTime,xTimeIncrement);
  List_Input(Machine(Task),vTaskDelay)==(xTicksToDelay);
  List_Input(Machine(Task),xTaskGetSchedulerState)==(?);
  List_Input(Machine(Task),uxTaskGetNumberOfTasks)==(?);
  List_Input(Machine(Task),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Machine(Task),uxTaskPriorityGet)==(pxTask);
  List_Input(Machine(Task),vTaskResume)==(pxTaskToResume);
  List_Input(Machine(Task),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Machine(Task),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Machine(Task),vTaskDelete)==(pxTaskToDelete)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Task),xTaskResumeAll)==(?);
  List_Output(Machine(Task),vTaskSuspendAll)==(?);
  List_Output(Machine(Task),vTaskEndScheduler)==(?);
  List_Output(Machine(Task),vTaskStartScheduler)==(?);
  List_Output(Machine(Task),xTaskGetTickCount)==(zz);
  List_Output(Machine(Task),vTaskDelayUntil)==(?);
  List_Output(Machine(Task),vTaskDelay)==(?);
  List_Output(Machine(Task),xTaskGetSchedulerState)==(xReturn);
  List_Output(Machine(Task),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Machine(Task),xTaskGetCurrentTaskHandle)==(rr);
  List_Output(Machine(Task),uxTaskPriorityGet)==(priority);
  List_Output(Machine(Task),vTaskResume)==(?);
  List_Output(Machine(Task),vTaskSuspend)==(rr);
  List_Output(Machine(Task),xTaskCreate)==(zz,handle);
  List_Output(Machine(Task),vTaskDelete)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Task),xTaskResumeAll)==(xTaskResumeAll);
  List_Header(Machine(Task),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(Task),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(Task),vTaskStartScheduler)==(vTaskStartScheduler);
  List_Header(Machine(Task),xTaskGetTickCount)==(zz <-- xTaskGetTickCount);
  List_Header(Machine(Task),vTaskDelayUntil)==(vTaskDelayUntil(pxPreviousWakeTime,xTimeIncrement));
  List_Header(Machine(Task),vTaskDelay)==(vTaskDelay(xTicksToDelay));
  List_Header(Machine(Task),xTaskGetSchedulerState)==(xReturn <-- xTaskGetSchedulerState);
  List_Header(Machine(Task),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Machine(Task),xTaskGetCurrentTaskHandle)==(rr <-- xTaskGetCurrentTaskHandle);
  List_Header(Machine(Task),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Machine(Task),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Machine(Task),vTaskSuspend)==(rr <-- vTaskSuspend(pxTaskToSuspend));
  List_Header(Machine(Task),xTaskCreate)==(zz,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Machine(Task),vTaskDelete)==(vTaskDelete(pxTaskToDelete))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(Task),xTaskResumeAll)==(btrue);
  List_Precondition(Machine(Task),xTaskResumeAll)==(btrue);
  Own_Precondition(Machine(Task),vTaskSuspendAll)==(btrue);
  List_Precondition(Machine(Task),vTaskSuspendAll)==(btrue);
  Own_Precondition(Machine(Task),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(Task),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING);
  Own_Precondition(Machine(Task),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED);
  List_Precondition(Machine(Task),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED);
  Own_Precondition(Machine(Task),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(Task),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  Own_Precondition(Machine(Task),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & INCLUDE_vTaskDelayUntil = 1);
  List_Precondition(Machine(Task),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & INCLUDE_vTaskDelayUntil = 1);
  Own_Precondition(Machine(Task),vTaskDelay)==(xTicksToDelay: TICK & not(xTicksToDelay = 0) & INCLUDE_vTaskDelay = 1);
  List_Precondition(Machine(Task),vTaskDelay)==(xTicksToDelay: TICK & not(xTicksToDelay = 0) & INCLUDE_vTaskDelay = 1);
  Own_Precondition(Machine(Task),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1);
  List_Precondition(Machine(Task),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1);
  Own_Precondition(Machine(Task),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(Task),uxTaskGetNumberOfTasks)==(btrue);
  Own_Precondition(Machine(Task),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(Task),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  Own_Precondition(Machine(Task),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(Task),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  Own_Precondition(Machine(Task),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: tasks & task_state(pxTaskToResume) = suspended);
  List_Precondition(Machine(Task),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: tasks & task_state(pxTaskToResume) = suspended);
  Own_Precondition(Machine(Task),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks);
  List_Precondition(Machine(Task),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks);
  Own_Precondition(Machine(Task),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters <: PARAMETER & uxPriority: PRIORITY);
  List_Precondition(Machine(Task),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters <: PARAMETER & uxPriority: PRIORITY);
  List_Precondition(Machine(Task),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Task),vTaskDelete)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & task_state(pxTaskToDelete)/=deleted & pxTaskToDelete: TASK | tasks,task_name:=tasks-{pxTaskToDelete},{pxTaskToDelete}<<|task_name || (pxTaskToDelete = current_task ==> @any(mpriority,ctk).(mpriority: PRIORITY & mpriority = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToDelete}<<|task_priority) & task_priority(ctk) = mpriority & task_state(ctk) = ready ==> task_state,max_priority,current_task:={current_task}<<|task_state<+{ctk|->running},mpriority,ctk) [] not(pxTaskToDelete = current_task) ==> task_state:={pxTaskToDelete}<<|task_state) || task_priority:={pxTaskToDelete}<<|task_priority || task_value:={pxTaskToDelete}<<|task_value || @any(queuesTask,q_tkRecived,q_tkSend).(queuesTask: POW(QUEUE) & queuesTask = QUEUES_WITH_TASK(pxTaskToDelete,queues,queue_tkRecived,queue_tkSend) & q_tkRecived: QUEUE +-> POW(TASK) & q_tkSend: QUEUE +-> POW(TASK) & q_tkRecived,q_tkSend = REMOVE_EVENT(pxTaskToDelete,queues,queue_tkRecived,queue_tkSend) ==> queue_tkRecived,queue_tkSend:=queue_tkRecived<+q_tkRecived,queue_tkSend<+q_tkSend));
  List_Substitution(Machine(Task),xTaskResumeAll)==(IF scheduler = taskSCHEDULER_SUSPENDED THEN scheduler:=taskSCHEDULER_RUNNING || tickCount:=TICK_INCREMENT(tickCount,tickMissed) || ANY blockedTasks,mprt,task WHERE blockedTasks = {bTask | bTask: tasks & task_state(bTask) = blocked & tickCount<=task_value(bTask) & task_value(bTask)<=TICK_INCREMENT(tickCount,tickMissed)} & mprt: PRIORITY & mprt = max(ran(dom(UNBLOCK_TASKS(blockedTasks))<|task_priority)) & task: dom(UNBLOCK_TASKS(blockedTasks)) & task: dom(task_priority) & task_priority(task) = mprt THEN IF mprt>max_priority THEN task_state:=task_state<+UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running} || current_task:=task || max_priority:=mprt ELSE task_state:=task_state<+UNBLOCK_TASKS(blockedTasks) END END ELSE skip END);
  Expanded_List_Substitution(Machine(Task),xTaskResumeAll)==(btrue | scheduler = taskSCHEDULER_SUSPENDED ==> (scheduler,tickCount:=taskSCHEDULER_RUNNING,TICK_INCREMENT(tickCount,tickMissed) || @any(blockedTasks,mprt,task).(blockedTasks = {bTask | bTask: tasks & task_state(bTask) = blocked & tickCount<=task_value(bTask) & task_value(bTask)<=TICK_INCREMENT(tickCount,tickMissed)} & mprt: PRIORITY & mprt = max(ran(dom(UNBLOCK_TASKS(blockedTasks))<|task_priority)) & task: dom(UNBLOCK_TASKS(blockedTasks)) & task: dom(task_priority) & task_priority(task) = mprt ==> (mprt>max_priority ==> task_state,current_task,max_priority:=task_state<+UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running},task,mprt [] not(mprt>max_priority) ==> task_state:=task_state<+UNBLOCK_TASKS(blockedTasks)))) [] not(scheduler = taskSCHEDULER_SUSPENDED) ==> skip);
  List_Substitution(Machine(Task),vTaskSuspendAll)==(scheduler:=taskSCHEDULER_SUSPENDED);
  Expanded_List_Substitution(Machine(Task),vTaskSuspendAll)==(btrue | scheduler:=taskSCHEDULER_SUSPENDED);
  List_Substitution(Machine(Task),vTaskEndScheduler)==(tasks:={TASK_NULL} || task_name:={TASK_NULL|->NAME_NULL} || task_state:={TASK_NULL|->running} || task_priority:={TASK_NULL|->0} || task_value:={TASK_NULL|->0} || current_task:=TASK_NULL || max_priority:=0 || scheduler:=taskSCHEDULER_NOT_STARTED);
  Expanded_List_Substitution(Machine(Task),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING | tasks,task_name,task_state,task_priority,task_value,current_task,max_priority,scheduler:={TASK_NULL},{TASK_NULL|->NAME_NULL},{TASK_NULL|->running},{TASK_NULL|->0},{TASK_NULL|->0},TASK_NULL,0,taskSCHEDULER_NOT_STARTED);
  List_Substitution(Machine(Task),vTaskStartScheduler)==(CHOICE ANY idle_name,idle_task WHERE idle_name: NAME & idle_task: TASK & idle_task/:tasks THEN tasks:=tasks\/{idle_task} || task_name:=task_name\/{idle_task|->idle_name} || task_priority:=task_priority\/{idle_task|->tskIDLE_PRIORITY} || task_value:=task_value\/{idle_task|->0} || IF tasks = {TASK_NULL} THEN task_state:=task_state<+{idle_task|->running} ELSE task_state:=task_state<+{idle_task|->ready} END END || tickCount:=0 || tickMissed:=0 OR skip END);
  Expanded_List_Substitution(Machine(Task),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED | @any(idle_name,idle_task).(idle_name: NAME & idle_task: TASK & idle_task/:tasks ==> (tasks,task_name,task_priority,task_value:=tasks\/{idle_task},task_name\/{idle_task|->idle_name},task_priority\/{idle_task|->tskIDLE_PRIORITY},task_value\/{idle_task|->0} || (tasks = {TASK_NULL} ==> task_state:=task_state<+{idle_task|->running} [] not(tasks = {TASK_NULL}) ==> task_state:=task_state<+{idle_task|->ready}))) || tickCount:=0 || tickMissed:=0 [] skip);
  List_Substitution(Machine(Task),xTaskGetTickCount)==(zz:=tickCount);
  Expanded_List_Substitution(Machine(Task),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | zz:=tickCount);
  List_Substitution(Machine(Task),vTaskDelayUntil)==(CHOICE ANY mprt,ctk WHERE mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready THEN task_state:=task_state<+{current_task|->blocked}<+{ctk|->running} || task_value:=task_value<+{current_task|->TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)} || current_task:=ctk || max_priority:=mprt END OR skip END);
  Expanded_List_Substitution(Machine(Task),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & INCLUDE_vTaskDelayUntil = 1 | @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)},ctk,mprt) [] skip);
  List_Substitution(Machine(Task),vTaskDelay)==(ANY mprt,ctk WHERE mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready THEN task_state:=task_state<+{current_task|->blocked}<+{ctk|->running} || task_value:=task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToDelay)} || current_task:=ctk || max_priority:=mprt END);
  Expanded_List_Substitution(Machine(Task),vTaskDelay)==(xTicksToDelay: TICK & not(xTicksToDelay = 0) & INCLUDE_vTaskDelay = 1 | @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToDelay)},ctk,mprt));
  List_Substitution(Machine(Task),xTaskGetSchedulerState)==(xReturn:=scheduler);
  Expanded_List_Substitution(Machine(Task),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1 | xReturn:=scheduler);
  List_Substitution(Machine(Task),uxTaskGetNumberOfTasks)==(numberOfTasks:=card(tasks));
  Expanded_List_Substitution(Machine(Task),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  List_Substitution(Machine(Task),xTaskGetCurrentTaskHandle)==(rr:=current_task);
  Expanded_List_Substitution(Machine(Task),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | rr:=current_task);
  List_Substitution(Machine(Task),uxTaskPriorityGet)==(priority:=task_priority(pxTask));
  Expanded_List_Substitution(Machine(Task),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 | priority:=task_priority(pxTask));
  List_Substitution(Machine(Task),vTaskResume)==(IF task_priority(pxTaskToResume)>max_priority THEN task_state:=task_state<+{current_task|->ready}<+{pxTaskToResume|->running} || current_task:=pxTaskToResume || max_priority:=task_priority(pxTaskToResume) ELSE task_state:=task_state<+{pxTaskToResume|->ready} END);
  Expanded_List_Substitution(Machine(Task),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: tasks & task_state(pxTaskToResume) = suspended | task_priority(pxTaskToResume)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready}<+{pxTaskToResume|->running},pxTaskToResume,task_priority(pxTaskToResume) [] not(task_priority(pxTaskToResume)>max_priority) ==> task_state:=task_state<+{pxTaskToResume|->ready});
  List_Substitution(Machine(Task),vTaskSuspend)==(IF not(task_state(pxTaskToSuspend) = suspended) THEN IF pxTaskToSuspend = current_task THEN ANY mprt,ctk WHERE mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToSuspend}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready THEN task_state:=task_state<+{pxTaskToSuspend|->suspended}<+{ctk|->running} || current_task:=ctk || max_priority:=mprt END ELSE task_state:=task_state<+{pxTaskToSuspend|->suspended} END || rr:=pdTRUE ELSE rr:=pdFALSE END);
  Expanded_List_Substitution(Machine(Task),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks | not(task_state(pxTaskToSuspend) = suspended) ==> (pxTaskToSuspend = current_task ==> @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToSuspend}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,current_task,max_priority:=task_state<+{pxTaskToSuspend|->suspended}<+{ctk|->running},ctk,mprt) [] not(pxTaskToSuspend = current_task) ==> task_state:=task_state<+{pxTaskToSuspend|->suspended} || rr:=pdTRUE) [] not(not(task_state(pxTaskToSuspend) = suspended)) ==> rr:=pdFALSE);
  List_Substitution(Machine(Task),xTaskCreate)==(CHOICE ANY task WHERE task: TASK & task/:tasks THEN tasks:=tasks\/{task} || task_name:=task_name\/{task|->pcName} || task_value:=task_value\/{task|->0} || IF uxPriority>max_priority THEN task_state:=task_state<+{current_task|->ready}\/{task|->running} || max_priority:=uxPriority || current_task:=task ELSE task_state:=task_state<+{task|->ready} END || task_priority:=task_priority\/{task|->uxPriority} || zz,handle:=pdPASS,task END OR zz,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL END);
  Expanded_List_Substitution(Machine(Task),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters <: PARAMETER & uxPriority: PRIORITY | @any(task).(task: TASK & task/:tasks ==> (tasks,task_name,task_value:=tasks\/{task},task_name\/{task|->pcName},task_value\/{task|->0} || (uxPriority>max_priority ==> task_state,max_priority,current_task:=task_state<+{current_task|->ready}\/{task|->running},uxPriority,task [] not(uxPriority>max_priority) ==> task_state:=task_state<+{task|->ready}) || task_priority:=task_priority\/{task|->uxPriority} || zz,handle:=pdPASS,task)) [] zz,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL);
  List_Substitution(Machine(Task),vTaskDelete)==(deleteTask(pxTaskToDelete) || removeFromEventListQueue(pxTaskToDelete))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Task))==(PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS,QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT);
  Inherited_List_Constants(Machine(Task))==(PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS,QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT);
  List_Constants(Machine(Task))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Task),QUEUE)==(?);
  Context_List_Enumerated(Machine(Task))==(?);
  Context_List_Defered(Machine(Task))==(POINTER,NAME,PARAMETER);
  Context_List_Sets(Machine(Task))==(POINTER,NAME,PARAMETER);
  List_Valuable_Sets(Machine(Task))==(TASK_CODE,STACK,TASK,ITEM,COPY_POSITION,QUEUE);
  Inherited_List_Enumerated(Machine(Task))==(TASK_STATE,SCHEDULER_STATE);
  Inherited_List_Defered(Machine(Task))==(TASK_CODE,STACK,TASK,ITEM,COPY_POSITION,QUEUE);
  Inherited_List_Sets(Machine(Task))==(TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK,ITEM,COPY_POSITION,QUEUE);
  List_Enumerated(Machine(Task))==(?);
  List_Defered(Machine(Task))==(?);
  List_Sets(Machine(Task))==(?);
  Set_Definition(Machine(Task),COPY_POSITION)==(?);
  Set_Definition(Machine(Task),ITEM)==(?);
  Set_Definition(Machine(Task),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Set_Definition(Machine(Task),TASK_STATE)==({running,blocked,ready,suspended,deleted});
  Set_Definition(Machine(Task),TASK)==(?);
  Set_Definition(Machine(Task),STACK)==(?);
  Set_Definition(Machine(Task),TASK_CODE)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Task))==(?);
  Expanded_List_HiddenConstants(Machine(Task))==(?);
  List_HiddenConstants(Machine(Task))==(?);
  External_List_HiddenConstants(Machine(Task))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Task))==(btrue);
  Context_List_Properties(Machine(Task))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & configMAX_PRIORITIES: NATURAL & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NATURAL & configMINIMAL_STACK_SIZE: NATURAL & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & configUSE_PREEMPTION: BIT & configUSE_IDLE_HOOK: BIT & configUSE_TICK_HOOK: BIT & configCPU_CLOCK_HZ: NATURAL & configTICK_RATE_HZ: NATURAL & configMAX_TASK_NAME_LEN: NATURAL & configUSE_TRACE_FACILITY: BIT & configUSE_16_BIT_TICKS: BIT & configIDLE_SHOULD_YIELD: BIT & configUSE_USE_MUTEXES: BIT & configUSE_RECURSIVE_MUTEXES: BIT & configUSE_COUNTING_SEMAPHORES: BIT & configUSE_ALTERNATIVE_API: BIT & configCHECK_FOR_STACK_OVERFLOW: BIT & configQUEUE_REGISTRY_SIZE: BIT & configUSE_CO_ROUTINES: BIT & configMAX_CO_ROUTINE_PRIORITIES: NATURAL & configKERNEL_INTERRUPT_PRIORITY: NATURAL & configMAX_SYSCALL_INTERRUPT_PRIORITY: NATURAL & INCLUDE_vTaskCleanUpResources: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT);
  Inherited_List_Properties(Machine(Task))==(PRIORITY = 0..configMAX_PRIORITIES-1 & TICK = 0..MAX_DELAY & TASK_NULL: TASK & NAME_NULL: NAME & READY_PRIORITIES: (TASK +-> TASK_STATE)*(TASK +-> PRIORITY) --> POW(PRIORITY) & READY_PRIORITIES = %(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY & dom(tk_st) = dom(tk_prt) & not(ran(dom(tk_st|>{ready})<|tk_prt) = {}) | ran(dom(tk_st|>{ready})<|tk_prt))\/%(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY & dom(tk_st) = dom(tk_prt) & ran(dom(tk_st|>{ready})<|tk_prt) = {} | {0}) & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & tskIDLE_PRIORITY: PRIORITY & tskIDLE_PRIORITY = 1 & UNBLOCK_TASKS: POW(TASK) --> (TASK +-> TASK_STATE) & UNBLOCK_TASKS = %bTasks.(bTasks: POW(TASK) | UNION(tk).(tk: bTasks | {rTask | rTask = tk|->ready})) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & TASK_STATE: FIN(INTEGER) & not(TASK_STATE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & QUEUE_ISFULL: QUEUE*(QUEUE +-> POW(ITEM))*(QUEUE +-> NAT) --> BOOL & QUEUE_ISFULL = %(queue,q_it,q_vl).(queue: QUEUE & q_it: QUEUE +-> POW(ITEM) & q_vl: QUEUE +-> NAT & queue: dom(q_vl) & queue: dom(q_it) | bool(card(q_it(queue))>=q_vl(queue))) & QUEUE_ISEMPTY: QUEUE*(QUEUE +-> POW(ITEM)) --> BOOL & QUEUE_ISEMPTY = %(queue,q_it).(queue: QUEUE & q_it: QUEUE +-> POW(ITEM) & queue: dom(q_it) | bool(q_it(queue) = {})) & QUEUES_WITH_TASK: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) --> POW(QUEUE) & QUEUES_WITH_TASK = %(tk,ques,q_tkR,q_tkS).(tk: TASK & ques: POW(QUEUE) & q_tkR: QUEUE +-> POW(TASK) & q_tkS: QUEUE +-> POW(TASK) & ques = dom(q_tkR) & ques = dom(q_tkS) | {que | que: ques & (tk: q_tkR(que) or tk: q_tkS(que))}) & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) --> (QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(tk,ques,q_tkR,q_tkS).(tk: TASK & ques: POW(QUEUE) & q_tkR: QUEUE +-> POW(TASK) & q_tkS: QUEUE +-> POW(TASK) | UNION(que).(que: ques | {et | et = que|->q_tkS(que)-{tk}}),UNION(que).(que: ques | {et | et = que|->q_tkR(que)-{tk}})) & ITEM: FIN(INTEGER) & not(ITEM = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}));
  List_Properties(Machine(Task))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Task),Machine(FreeRTOSConfig))==(?);
  Seen_Context_List_Enumerated(Machine(Task))==(?);
  Seen_Context_List_Invariant(Machine(Task))==(btrue);
  Seen_Context_List_Assertions(Machine(Task))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(Task))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Seen_List_Constraints(Machine(Task))==(btrue);
  Seen_List_Operations(Machine(Task),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(Task),Machine(FreeRTOSConfig))==(btrue);
  Seen_Internal_List_Operations(Machine(Task),Machine(Types))==(?);
  Seen_List_Operations(Machine(Task),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Task),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Task),vTaskDelete)==(?);
  List_ANY_Var(Machine(Task),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Task)) == (? | QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE,PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS,TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK,running,blocked,ready,suspended,deleted,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | V,queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues,tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks | vTaskDelete | xTaskCreate,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll | seen(Machine(Types)),seen(Machine(FreeRTOSConfig)),included(Machine(Task_Basic)),included(Machine(Queue_Basic)) | ? | Task);
  List_Of_HiddenCst_Ids(Machine(Task)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task)) == (QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT,PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS);
  List_Of_VisibleVar_Ids(Machine(Task)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task)) == (seen(Machine(Types)): (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,POINTER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(Task_Basic)): (PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS,TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK,running,blocked,ready,suspended,deleted,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks | ? | ? | ? | ? | ? | ?) | seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay | ? | ? | ? | ? | ? | ? | ? | ?));
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
  Sets(Machine(Task)) == (Type(TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK")));Type(STACK) == Cst(SetOf(atype(STACK,"[STACK","]STACK")));Type(SCHEDULER_STATE) == Cst(SetOf(etype(SCHEDULER_STATE,0,2)));Type(TASK_STATE) == Cst(SetOf(etype(TASK_STATE,0,4)));Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(QUEUE) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")));Type(COPY_POSITION) == Cst(SetOf(atype(COPY_POSITION,"[COPY_POSITION","]COPY_POSITION")));Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Task)) == (Type(UNBLOCK_TASKS) == Cst(SetOf(SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?))));Type(tskIDLE_PRIORITY) == Cst(btype(INTEGER,?,?));Type(TICK_INCREMENT) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")));Type(READY_PRIORITIES) == Cst(SetOf(SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?))*SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))*SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY"))));Type(NAME_NULL) == Cst(atype(NAME,?,?));Type(TASK_NULL) == Cst(atype(TASK,?,?));Type(TICK) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")));Type(PRIORITY) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(taskSCHEDULER_SUSPENDED) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_RUNNING) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_NOT_STARTED) == Cst(etype(SCHEDULER_STATE,0,2));Type(deleted) == Cst(etype(TASK_STATE,0,4));Type(suspended) == Cst(etype(TASK_STATE,0,4));Type(ready) == Cst(etype(TASK_STATE,0,4));Type(blocked) == Cst(etype(TASK_STATE,0,4));Type(running) == Cst(etype(TASK_STATE,0,4));Type(REMOVE_EVENT) == Cst(SetOf(atype(TASK,"[TASK","]TASK")*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))));Type(QUEUES_WITH_TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK")*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))));Type(QUEUE_ISEMPTY) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")*SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?)))*btype(BOOL,0,1)));Type(QUEUE_ISFULL) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")*SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?)))*SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?))*btype(BOOL,0,1)));Type(ITEM_NULL) == Cst(atype(ITEM,?,?));Type(QUEUE_NULL) == Cst(atype(QUEUE,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Task)) == (Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(task_priority) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(task_name) == Mvl(SetOf(atype(TASK,?,?)*atype(NAME,?,?)));Type(task_state) == Mvl(SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?)));Type(task_value) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(max_priority) == Mvl(btype(INTEGER,?,?));Type(current_task) == Mvl(atype(TASK,?,?));Type(scheduler) == Mvl(etype(SCHEDULER_STATE,?,?));Type(tickCount) == Mvl(btype(INTEGER,?,?));Type(tickMissed) == Mvl(btype(INTEGER,?,?));Type(queues) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queue_itens) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queue_tkRecived) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_tkSend) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_length) == Mvl(SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Task)) == (Type(xTaskCreate) == Cst(btype(INTEGER,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?));Type(vTaskSuspend) == Cst(btype(INTEGER,?,?),atype(TASK,?,?));Type(vTaskResume) == Cst(No_type,atype(TASK,?,?));Type(uxTaskPriorityGet) == Cst(btype(INTEGER,?,?),atype(TASK,?,?));Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULER_STATE,?,?),No_type);Type(vTaskDelay) == Cst(No_type,btype(INTEGER,?,?));Type(vTaskDelayUntil) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(vTaskStartScheduler) == Cst(No_type,No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(xTaskResumeAll) == Cst(No_type,No_type);Type(vTaskDelete) == Cst(No_type,atype(TASK,?,?)));
  Observers(Machine(Task)) == (Type(uxTaskPriorityGet) == Cst(btype(INTEGER,?,?),atype(TASK,?,?));Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULER_STATE,?,?),No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type))
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
