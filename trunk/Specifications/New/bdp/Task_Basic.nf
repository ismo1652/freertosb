Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Task_Basic))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Task_Basic))==(Machine(Task_Basic));
  Level(Machine(Task_Basic))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Task_Basic)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Task_Basic))==(FreeRTOSConfig,Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Task_Basic))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Task_Basic))==(?);
  List_Includes(Machine(Task_Basic))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Task_Basic))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Task_Basic))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Task_Basic))==(?);
  Context_List_Variables(Machine(Task_Basic))==(?);
  Abstract_List_Variables(Machine(Task_Basic))==(?);
  Local_List_Variables(Machine(Task_Basic))==(tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks);
  List_Variables(Machine(Task_Basic))==(tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks);
  External_List_Variables(Machine(Task_Basic))==(tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Task_Basic))==(?);
  Abstract_List_VisibleVariables(Machine(Task_Basic))==(?);
  External_List_VisibleVariables(Machine(Task_Basic))==(?);
  Expanded_List_VisibleVariables(Machine(Task_Basic))==(?);
  List_VisibleVariables(Machine(Task_Basic))==(?);
  Internal_List_VisibleVariables(Machine(Task_Basic))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Task_Basic))==(btrue);
  Gluing_List_Invariant(Machine(Task_Basic))==(btrue);
  Expanded_List_Invariant(Machine(Task_Basic))==(btrue);
  Abstract_List_Invariant(Machine(Task_Basic))==(btrue);
  Context_List_Invariant(Machine(Task_Basic))==(btrue);
  List_Invariant(Machine(Task_Basic))==(tasks: POW(TASK) & task_name: TASK +-> NAME & task_state: TASK +-> TASK_STATE & task_priority: TASK +-> PRIORITY & task_value: TASK +-> TICK & tasks = dom(task_priority) & tasks = dom(task_state) & tasks = dom(task_value) & tasks = dom(task_name) & current_task: TASK & current_task: tasks & task_state(current_task) = running & max_priority: PRIORITY & max_priority = task_priority(current_task) & max_priority>=max(READY_PRIORITIES(task_state,task_priority)) & card(task_state|>{running})<=1 & scheduler: SCHEDULER_STATE & tickCount: TICK & tickMissed: TICK)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Task_Basic))==(btrue);
  Abstract_List_Assertions(Machine(Task_Basic))==(btrue);
  Context_List_Assertions(Machine(Task_Basic))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(Task_Basic))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Task_Basic))==(tasks,task_name,task_state,task_priority,task_value,current_task,max_priority,scheduler,tickCount,tickMissed:={TASK_NULL},{TASK_NULL|->NAME_NULL},{TASK_NULL|->running},{TASK_NULL|->0},{TASK_NULL|->0},TASK_NULL,0,taskSCHEDULER_NOT_STARTED,0,0);
  Context_List_Initialisation(Machine(Task_Basic))==(skip);
  List_Initialisation(Machine(Task_Basic))==(tasks:={TASK_NULL} || task_name:={TASK_NULL|->NAME_NULL} || task_state:={TASK_NULL|->running} || task_priority:={TASK_NULL|->0} || task_value:={TASK_NULL|->0} || current_task:=TASK_NULL || max_priority:=0 || scheduler:=taskSCHEDULER_NOT_STARTED || tickCount:=0 || tickMissed:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Task_Basic))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Task_Basic),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Machine(Task_Basic),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Task_Basic))==(btrue);
  List_Constraints(Machine(Task_Basic))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Task_Basic))==(xTaskCreate,deleteTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,removeFromBlockedList);
  List_Operations(Machine(Task_Basic))==(xTaskCreate,deleteTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll,incrementTick,removeFromBlockedList)
END
&
THEORY ListInputX IS
  List_Input(Machine(Task_Basic),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Machine(Task_Basic),deleteTask)==(pxTaskToDelete);
  List_Input(Machine(Task_Basic),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Machine(Task_Basic),vTaskResume)==(pxTaskToResume);
  List_Input(Machine(Task_Basic),uxTaskPriorityGet)==(pxTask);
  List_Input(Machine(Task_Basic),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Machine(Task_Basic),uxTaskGetNumberOfTasks)==(?);
  List_Input(Machine(Task_Basic),xTaskGetSchedulerState)==(?);
  List_Input(Machine(Task_Basic),vTaskDelay)==(xTicksToDelay);
  List_Input(Machine(Task_Basic),vTaskDelayUntil)==(pxPreviousWakeTime,xTimeIncrement);
  List_Input(Machine(Task_Basic),xTaskGetTickCount)==(?);
  List_Input(Machine(Task_Basic),vTaskStartScheduler)==(?);
  List_Input(Machine(Task_Basic),vTaskEndScheduler)==(?);
  List_Input(Machine(Task_Basic),vTaskSuspendAll)==(?);
  List_Input(Machine(Task_Basic),xTaskResumeAll)==(?);
  List_Input(Machine(Task_Basic),incrementTick)==(?);
  List_Input(Machine(Task_Basic),removeFromBlockedList)==(task)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Task_Basic),xTaskCreate)==(zz,handle);
  List_Output(Machine(Task_Basic),deleteTask)==(?);
  List_Output(Machine(Task_Basic),vTaskSuspend)==(rr);
  List_Output(Machine(Task_Basic),vTaskResume)==(?);
  List_Output(Machine(Task_Basic),uxTaskPriorityGet)==(priority);
  List_Output(Machine(Task_Basic),xTaskGetCurrentTaskHandle)==(rr);
  List_Output(Machine(Task_Basic),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Machine(Task_Basic),xTaskGetSchedulerState)==(xReturn);
  List_Output(Machine(Task_Basic),vTaskDelay)==(?);
  List_Output(Machine(Task_Basic),vTaskDelayUntil)==(?);
  List_Output(Machine(Task_Basic),xTaskGetTickCount)==(zz);
  List_Output(Machine(Task_Basic),vTaskStartScheduler)==(?);
  List_Output(Machine(Task_Basic),vTaskEndScheduler)==(?);
  List_Output(Machine(Task_Basic),vTaskSuspendAll)==(?);
  List_Output(Machine(Task_Basic),xTaskResumeAll)==(?);
  List_Output(Machine(Task_Basic),incrementTick)==(?);
  List_Output(Machine(Task_Basic),removeFromBlockedList)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Task_Basic),xTaskCreate)==(zz,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Machine(Task_Basic),deleteTask)==(deleteTask(pxTaskToDelete));
  List_Header(Machine(Task_Basic),vTaskSuspend)==(rr <-- vTaskSuspend(pxTaskToSuspend));
  List_Header(Machine(Task_Basic),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Machine(Task_Basic),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Machine(Task_Basic),xTaskGetCurrentTaskHandle)==(rr <-- xTaskGetCurrentTaskHandle);
  List_Header(Machine(Task_Basic),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Machine(Task_Basic),xTaskGetSchedulerState)==(xReturn <-- xTaskGetSchedulerState);
  List_Header(Machine(Task_Basic),vTaskDelay)==(vTaskDelay(xTicksToDelay));
  List_Header(Machine(Task_Basic),vTaskDelayUntil)==(vTaskDelayUntil(pxPreviousWakeTime,xTimeIncrement));
  List_Header(Machine(Task_Basic),xTaskGetTickCount)==(zz <-- xTaskGetTickCount);
  List_Header(Machine(Task_Basic),vTaskStartScheduler)==(vTaskStartScheduler);
  List_Header(Machine(Task_Basic),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(Task_Basic),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(Task_Basic),xTaskResumeAll)==(xTaskResumeAll);
  List_Header(Machine(Task_Basic),incrementTick)==(incrementTick);
  List_Header(Machine(Task_Basic),removeFromBlockedList)==(removeFromBlockedList(task))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Task_Basic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters <: PARAMETER & uxPriority: PRIORITY);
  List_Precondition(Machine(Task_Basic),deleteTask)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & task_state(pxTaskToDelete)/=deleted);
  List_Precondition(Machine(Task_Basic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks);
  List_Precondition(Machine(Task_Basic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: tasks & task_state(pxTaskToResume) = suspended);
  List_Precondition(Machine(Task_Basic),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(Task_Basic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(Task_Basic),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(Task_Basic),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1);
  List_Precondition(Machine(Task_Basic),vTaskDelay)==(xTicksToDelay: TICK & not(xTicksToDelay = 0) & INCLUDE_vTaskDelay = 1);
  List_Precondition(Machine(Task_Basic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & INCLUDE_vTaskDelayUntil = 1);
  List_Precondition(Machine(Task_Basic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(Task_Basic),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED);
  List_Precondition(Machine(Task_Basic),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(Task_Basic),vTaskSuspendAll)==(btrue);
  List_Precondition(Machine(Task_Basic),xTaskResumeAll)==(btrue);
  List_Precondition(Machine(Task_Basic),incrementTick)==(btrue);
  List_Precondition(Machine(Task_Basic),removeFromBlockedList)==(task: tasks & task_state(task) = blocked & task/=current_task)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Task_Basic),removeFromBlockedList)==(task: tasks & task_state(task) = blocked & task/=current_task | task_priority(task)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready,task|->running},task,task_priority(task) [] not(task_priority(task)>max_priority) ==> task_state:=task_state<+{task|->ready});
  Expanded_List_Substitution(Machine(Task_Basic),incrementTick)==(btrue | scheduler = taskSCHEDULER_RUNNING ==> tickCount:=TICK_INCREMENT(tickCount,1) [] not(scheduler = taskSCHEDULER_RUNNING) ==> tickMissed:=TICK_INCREMENT(tickCount,1) || @any(blockedTasks,mprt,task).(blockedTasks = {bTask | bTask: tasks & task_state(bTask) = blocked & task_value(bTask) = TICK_INCREMENT(tickCount,1)} & mprt: PRIORITY & mprt = max(ran(dom(UNBLOCK_TASKS(blockedTasks))<|task_priority)) & task: dom(UNBLOCK_TASKS(blockedTasks)) & task: dom(task_priority) & task_priority(task) = mprt ==> (mprt>max_priority ==> task_state,current_task,max_priority:=task_state<+UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running},task,mprt [] not(mprt>max_priority) ==> task_state:=task_state<+UNBLOCK_TASKS(blockedTasks))));
  Expanded_List_Substitution(Machine(Task_Basic),xTaskResumeAll)==(btrue | scheduler = taskSCHEDULER_SUSPENDED ==> (scheduler,tickCount:=taskSCHEDULER_RUNNING,TICK_INCREMENT(tickCount,tickMissed) || @any(blockedTasks,mprt,task).(blockedTasks = {bTask | bTask: tasks & task_state(bTask) = blocked & tickCount<=task_value(bTask) & task_value(bTask)<=TICK_INCREMENT(tickCount,tickMissed)} & mprt: PRIORITY & mprt = max(ran(dom(UNBLOCK_TASKS(blockedTasks))<|task_priority)) & task: dom(UNBLOCK_TASKS(blockedTasks)) & task: dom(task_priority) & task_priority(task) = mprt ==> (mprt>max_priority ==> task_state,current_task,max_priority:=task_state<+UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running},task,mprt [] not(mprt>max_priority) ==> task_state:=task_state<+UNBLOCK_TASKS(blockedTasks)))) [] not(scheduler = taskSCHEDULER_SUSPENDED) ==> skip);
  Expanded_List_Substitution(Machine(Task_Basic),vTaskSuspendAll)==(btrue | scheduler:=taskSCHEDULER_SUSPENDED);
  Expanded_List_Substitution(Machine(Task_Basic),vTaskEndScheduler)==(scheduler = taskSCHEDULER_RUNNING | tasks,task_name,task_state,task_priority,task_value,current_task,max_priority,scheduler:={TASK_NULL},{TASK_NULL|->NAME_NULL},{TASK_NULL|->running},{TASK_NULL|->0},{TASK_NULL|->0},TASK_NULL,0,taskSCHEDULER_NOT_STARTED);
  Expanded_List_Substitution(Machine(Task_Basic),vTaskStartScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED | @any(idle_name,idle_task).(idle_name: NAME & idle_task: TASK & idle_task/:tasks ==> (tasks,task_name,task_priority,task_value:=tasks\/{idle_task},task_name\/{idle_task|->idle_name},task_priority\/{idle_task|->tskIDLE_PRIORITY},task_value\/{idle_task|->0} || (tasks = {TASK_NULL} ==> task_state:=task_state<+{idle_task|->running} [] not(tasks = {TASK_NULL}) ==> task_state:=task_state<+{idle_task|->ready}))) || tickCount:=0 || tickMissed:=0 [] skip);
  Expanded_List_Substitution(Machine(Task_Basic),xTaskGetTickCount)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | zz:=tickCount);
  Expanded_List_Substitution(Machine(Task_Basic),vTaskDelayUntil)==(pxPreviousWakeTime: TICK & xTimeIncrement: TICK & INCLUDE_vTaskDelayUntil = 1 | @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)},ctk,mprt) [] skip);
  Expanded_List_Substitution(Machine(Task_Basic),vTaskDelay)==(xTicksToDelay: TICK & not(xTicksToDelay = 0) & INCLUDE_vTaskDelay = 1 | @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToDelay)},ctk,mprt));
  Expanded_List_Substitution(Machine(Task_Basic),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1 | xReturn:=scheduler);
  Expanded_List_Substitution(Machine(Task_Basic),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=card(tasks));
  Expanded_List_Substitution(Machine(Task_Basic),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | rr:=current_task);
  Expanded_List_Substitution(Machine(Task_Basic),uxTaskPriorityGet)==(pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 | priority:=task_priority(pxTask));
  Expanded_List_Substitution(Machine(Task_Basic),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: tasks & task_state(pxTaskToResume) = suspended | task_priority(pxTaskToResume)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready}<+{pxTaskToResume|->running},pxTaskToResume,task_priority(pxTaskToResume) [] not(task_priority(pxTaskToResume)>max_priority) ==> task_state:=task_state<+{pxTaskToResume|->ready});
  Expanded_List_Substitution(Machine(Task_Basic),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: tasks | not(task_state(pxTaskToSuspend) = suspended) ==> (pxTaskToSuspend = current_task ==> @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToSuspend}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,current_task,max_priority:=task_state<+{pxTaskToSuspend|->suspended}<+{ctk|->running},ctk,mprt) [] not(pxTaskToSuspend = current_task) ==> task_state:=task_state<+{pxTaskToSuspend|->suspended} || rr:=pdTRUE) [] not(not(task_state(pxTaskToSuspend) = suspended)) ==> rr:=pdFALSE);
  Expanded_List_Substitution(Machine(Task_Basic),deleteTask)==(INCLUDE_vTaskDelete = 1 & pxTaskToDelete: tasks & task_state(pxTaskToDelete)/=deleted | tasks,task_name:=tasks-{pxTaskToDelete},{pxTaskToDelete}<<|task_name || (pxTaskToDelete = current_task ==> @any(mpriority,ctk).(mpriority: PRIORITY & mpriority = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToDelete}<<|task_priority) & task_priority(ctk) = mpriority & task_state(ctk) = ready ==> task_state,max_priority,current_task:={current_task}<<|task_state<+{ctk|->running},mpriority,ctk) [] not(pxTaskToDelete = current_task) ==> task_state:={pxTaskToDelete}<<|task_state) || task_priority:={pxTaskToDelete}<<|task_priority || task_value:={pxTaskToDelete}<<|task_value);
  Expanded_List_Substitution(Machine(Task_Basic),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters <: PARAMETER & uxPriority: PRIORITY | @any(task).(task: TASK & task/:tasks ==> (tasks,task_name,task_value:=tasks\/{task},task_name\/{task|->pcName},task_value\/{task|->0} || (uxPriority>max_priority ==> task_state,max_priority,current_task:=task_state<+{current_task|->ready}\/{task|->running},uxPriority,task [] not(uxPriority>max_priority) ==> task_state:=task_state<+{task|->ready}) || task_priority:=task_priority\/{task|->uxPriority} || zz,handle:=pdPASS,task)) [] zz,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL);
  List_Substitution(Machine(Task_Basic),xTaskCreate)==(CHOICE ANY task WHERE task: TASK & task/:tasks THEN tasks:=tasks\/{task} || task_name:=task_name\/{task|->pcName} || task_value:=task_value\/{task|->0} || IF uxPriority>max_priority THEN task_state:=task_state<+{current_task|->ready}\/{task|->running} || max_priority:=uxPriority || current_task:=task ELSE task_state:=task_state<+{task|->ready} END || task_priority:=task_priority\/{task|->uxPriority} || zz,handle:=pdPASS,task END OR zz,handle:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,TASK_NULL END);
  List_Substitution(Machine(Task_Basic),deleteTask)==(tasks:=tasks-{pxTaskToDelete} || task_name:={pxTaskToDelete}<<|task_name || IF pxTaskToDelete = current_task THEN ANY mpriority,ctk WHERE mpriority: PRIORITY & mpriority = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToDelete}<<|task_priority) & task_priority(ctk) = mpriority & task_state(ctk) = ready THEN task_state:={current_task}<<|task_state<+{ctk|->running} || max_priority:=mpriority || current_task:=ctk END ELSE task_state:={pxTaskToDelete}<<|task_state END || task_priority:={pxTaskToDelete}<<|task_priority || task_value:={pxTaskToDelete}<<|task_value);
  List_Substitution(Machine(Task_Basic),vTaskSuspend)==(IF not(task_state(pxTaskToSuspend) = suspended) THEN IF pxTaskToSuspend = current_task THEN ANY mprt,ctk WHERE mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({pxTaskToSuspend}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready THEN task_state:=task_state<+{pxTaskToSuspend|->suspended}<+{ctk|->running} || current_task:=ctk || max_priority:=mprt END ELSE task_state:=task_state<+{pxTaskToSuspend|->suspended} END || rr:=pdTRUE ELSE rr:=pdFALSE END);
  List_Substitution(Machine(Task_Basic),vTaskResume)==(IF task_priority(pxTaskToResume)>max_priority THEN task_state:=task_state<+{current_task|->ready}<+{pxTaskToResume|->running} || current_task:=pxTaskToResume || max_priority:=task_priority(pxTaskToResume) ELSE task_state:=task_state<+{pxTaskToResume|->ready} END);
  List_Substitution(Machine(Task_Basic),uxTaskPriorityGet)==(priority:=task_priority(pxTask));
  List_Substitution(Machine(Task_Basic),xTaskGetCurrentTaskHandle)==(rr:=current_task);
  List_Substitution(Machine(Task_Basic),uxTaskGetNumberOfTasks)==(numberOfTasks:=card(tasks));
  List_Substitution(Machine(Task_Basic),xTaskGetSchedulerState)==(xReturn:=scheduler);
  List_Substitution(Machine(Task_Basic),vTaskDelay)==(ANY mprt,ctk WHERE mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready THEN task_state:=task_state<+{current_task|->blocked}<+{ctk|->running} || task_value:=task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToDelay)} || current_task:=ctk || max_priority:=mprt END);
  List_Substitution(Machine(Task_Basic),vTaskDelayUntil)==(CHOICE ANY mprt,ctk WHERE mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready THEN task_state:=task_state<+{current_task|->blocked}<+{ctk|->running} || task_value:=task_value<+{current_task|->TICK_INCREMENT(pxPreviousWakeTime,xTimeIncrement)} || current_task:=ctk || max_priority:=mprt END OR skip END);
  List_Substitution(Machine(Task_Basic),xTaskGetTickCount)==(zz:=tickCount);
  List_Substitution(Machine(Task_Basic),vTaskStartScheduler)==(CHOICE ANY idle_name,idle_task WHERE idle_name: NAME & idle_task: TASK & idle_task/:tasks THEN tasks:=tasks\/{idle_task} || task_name:=task_name\/{idle_task|->idle_name} || task_priority:=task_priority\/{idle_task|->tskIDLE_PRIORITY} || task_value:=task_value\/{idle_task|->0} || IF tasks = {TASK_NULL} THEN task_state:=task_state<+{idle_task|->running} ELSE task_state:=task_state<+{idle_task|->ready} END END || tickCount:=0 || tickMissed:=0 OR skip END);
  List_Substitution(Machine(Task_Basic),vTaskEndScheduler)==(tasks:={TASK_NULL} || task_name:={TASK_NULL|->NAME_NULL} || task_state:={TASK_NULL|->running} || task_priority:={TASK_NULL|->0} || task_value:={TASK_NULL|->0} || current_task:=TASK_NULL || max_priority:=0 || scheduler:=taskSCHEDULER_NOT_STARTED);
  List_Substitution(Machine(Task_Basic),vTaskSuspendAll)==(scheduler:=taskSCHEDULER_SUSPENDED);
  List_Substitution(Machine(Task_Basic),xTaskResumeAll)==(IF scheduler = taskSCHEDULER_SUSPENDED THEN scheduler:=taskSCHEDULER_RUNNING || tickCount:=TICK_INCREMENT(tickCount,tickMissed) || ANY blockedTasks,mprt,task WHERE blockedTasks = {bTask | bTask: tasks & task_state(bTask) = blocked & tickCount<=task_value(bTask) & task_value(bTask)<=TICK_INCREMENT(tickCount,tickMissed)} & mprt: PRIORITY & mprt = max(ran(dom(UNBLOCK_TASKS(blockedTasks))<|task_priority)) & task: dom(UNBLOCK_TASKS(blockedTasks)) & task: dom(task_priority) & task_priority(task) = mprt THEN IF mprt>max_priority THEN task_state:=task_state<+UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running} || current_task:=task || max_priority:=mprt ELSE task_state:=task_state<+UNBLOCK_TASKS(blockedTasks) END END ELSE skip END);
  List_Substitution(Machine(Task_Basic),incrementTick)==(IF scheduler = taskSCHEDULER_RUNNING THEN tickCount:=TICK_INCREMENT(tickCount,1) ELSE tickMissed:=TICK_INCREMENT(tickCount,1) END || ANY blockedTasks,mprt,task WHERE blockedTasks = {bTask | bTask: tasks & task_state(bTask) = blocked & task_value(bTask) = TICK_INCREMENT(tickCount,1)} & mprt: PRIORITY & mprt = max(ran(dom(UNBLOCK_TASKS(blockedTasks))<|task_priority)) & task: dom(UNBLOCK_TASKS(blockedTasks)) & task: dom(task_priority) & task_priority(task) = mprt THEN IF mprt>max_priority THEN task_state:=task_state<+UNBLOCK_TASKS(blockedTasks)<+{current_task|->ready,task|->running} || current_task:=task || max_priority:=mprt ELSE task_state:=task_state<+UNBLOCK_TASKS(blockedTasks) END END);
  List_Substitution(Machine(Task_Basic),removeFromBlockedList)==(IF task_priority(task)>max_priority THEN task_state:=task_state<+{current_task|->ready,task|->running} || current_task:=task || max_priority:=task_priority(task) ELSE task_state:=task_state<+{task|->ready} END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Task_Basic))==(PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS);
  Inherited_List_Constants(Machine(Task_Basic))==(?);
  List_Constants(Machine(Task_Basic))==(PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Task_Basic),TASK_CODE)==(?);
  Context_List_Enumerated(Machine(Task_Basic))==(?);
  Context_List_Defered(Machine(Task_Basic))==(POINTER,NAME,PARAMETER);
  Context_List_Sets(Machine(Task_Basic))==(POINTER,NAME,PARAMETER);
  List_Valuable_Sets(Machine(Task_Basic))==(TASK_CODE,STACK,TASK);
  Inherited_List_Enumerated(Machine(Task_Basic))==(?);
  Inherited_List_Defered(Machine(Task_Basic))==(?);
  Inherited_List_Sets(Machine(Task_Basic))==(?);
  List_Enumerated(Machine(Task_Basic))==(TASK_STATE,SCHEDULER_STATE);
  List_Defered(Machine(Task_Basic))==(TASK_CODE,STACK,TASK);
  List_Sets(Machine(Task_Basic))==(TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK);
  Set_Definition(Machine(Task_Basic),TASK_STATE)==({running,blocked,ready,suspended,deleted});
  Set_Definition(Machine(Task_Basic),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Set_Definition(Machine(Task_Basic),STACK)==(?);
  Set_Definition(Machine(Task_Basic),TASK)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Task_Basic))==(?);
  Expanded_List_HiddenConstants(Machine(Task_Basic))==(?);
  List_HiddenConstants(Machine(Task_Basic))==(?);
  External_List_HiddenConstants(Machine(Task_Basic))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Task_Basic))==(btrue);
  Context_List_Properties(Machine(Task_Basic))==(configMAX_PRIORITIES: NATURAL & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NATURAL & configMINIMAL_STACK_SIZE: NATURAL & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & configUSE_PREEMPTION: BIT & configUSE_IDLE_HOOK: BIT & configUSE_TICK_HOOK: BIT & configCPU_CLOCK_HZ: NATURAL & configTICK_RATE_HZ: NATURAL & configMAX_TASK_NAME_LEN: NATURAL & configUSE_TRACE_FACILITY: BIT & configUSE_16_BIT_TICKS: BIT & configIDLE_SHOULD_YIELD: BIT & configUSE_USE_MUTEXES: BIT & configUSE_RECURSIVE_MUTEXES: BIT & configUSE_COUNTING_SEMAPHORES: BIT & configUSE_ALTERNATIVE_API: BIT & configCHECK_FOR_STACK_OVERFLOW: BIT & configQUEUE_REGISTRY_SIZE: BIT & configUSE_CO_ROUTINES: BIT & configMAX_CO_ROUTINE_PRIORITIES: NATURAL & configKERNEL_INTERRUPT_PRIORITY: NATURAL & configMAX_SYSCALL_INTERRUPT_PRIORITY: NATURAL & INCLUDE_vTaskCleanUpResources: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Inherited_List_Properties(Machine(Task_Basic))==(btrue);
  List_Properties(Machine(Task_Basic))==(PRIORITY = 0..configMAX_PRIORITIES-1 & TICK = 0..MAX_DELAY & TASK_NULL: TASK & NAME_NULL: NAME & READY_PRIORITIES: (TASK +-> TASK_STATE)*(TASK +-> PRIORITY) --> POW(PRIORITY) & READY_PRIORITIES = %(tk_state,tk_prt).(tk_state: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY | ran(dom(tk_state|>{ready})<|tk_prt)) & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & tskIDLE_PRIORITY: PRIORITY & tskIDLE_PRIORITY = 1 & UNBLOCK_TASKS: POW(TASK) --> (TASK +-> TASK_STATE) & UNBLOCK_TASKS = %bTasks.(bTasks: POW(TASK) | UNION(tk).(tk: bTasks | {rTask | rTask = tk|->ready})) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & TASK_STATE: FIN(INTEGER) & not(TASK_STATE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Task_Basic),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(Task_Basic))==(?);
  Seen_Context_List_Invariant(Machine(Task_Basic))==(btrue);
  Seen_Context_List_Assertions(Machine(Task_Basic))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(Task_Basic))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Seen_List_Constraints(Machine(Task_Basic))==(btrue);
  Seen_List_Operations(Machine(Task_Basic),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Task_Basic),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Machine(Task_Basic),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Machine(Task_Basic),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(Task_Basic),Machine(FreeRTOSConfig))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Task_Basic),xTaskCreate)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(Task_Basic),deleteTask)==((Var(mpriority) == btype(INTEGER,?,?)),(Var(ctk) == atype(TASK,?,?)));
  List_ANY_Var(Machine(Task_Basic),vTaskSuspend)==((Var(mprt) == btype(INTEGER,?,?)),(Var(ctk) == atype(TASK,?,?)));
  List_ANY_Var(Machine(Task_Basic),vTaskResume)==(?);
  List_ANY_Var(Machine(Task_Basic),uxTaskPriorityGet)==(?);
  List_ANY_Var(Machine(Task_Basic),xTaskGetCurrentTaskHandle)==(?);
  List_ANY_Var(Machine(Task_Basic),uxTaskGetNumberOfTasks)==(?);
  List_ANY_Var(Machine(Task_Basic),xTaskGetSchedulerState)==(?);
  List_ANY_Var(Machine(Task_Basic),vTaskDelay)==((Var(mprt) == btype(INTEGER,?,?)),(Var(ctk) == atype(TASK,?,?)));
  List_ANY_Var(Machine(Task_Basic),vTaskDelayUntil)==((Var(mprt) == btype(INTEGER,?,?)),(Var(ctk) == atype(TASK,?,?)));
  List_ANY_Var(Machine(Task_Basic),xTaskGetTickCount)==(?);
  List_ANY_Var(Machine(Task_Basic),vTaskStartScheduler)==((Var(idle_name) == atype(NAME,?,?)),(Var(idle_task) == atype(TASK,?,?)));
  List_ANY_Var(Machine(Task_Basic),vTaskEndScheduler)==(?);
  List_ANY_Var(Machine(Task_Basic),vTaskSuspendAll)==(?);
  List_ANY_Var(Machine(Task_Basic),xTaskResumeAll)==((Var(blockedTasks) == SetOf(atype(TASK,?,?))),(Var(mprt) == btype(INTEGER,?,?)),(Var(task) == atype(TASK,?,?)));
  List_ANY_Var(Machine(Task_Basic),incrementTick)==((Var(blockedTasks) == SetOf(atype(TASK,?,?))),(Var(mprt) == btype(INTEGER,?,?)),(Var(task) == atype(TASK,?,?)));
  List_ANY_Var(Machine(Task_Basic),removeFromBlockedList)==(?);
  List_ANY_Var(Machine(Task_Basic),?)==(?)
END
&
THEORY ListOfIdsX IS
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
  Sets(Machine(Task_Basic)) == (Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(TASK_STATE) == Cst(SetOf(etype(TASK_STATE,0,4)));Type(SCHEDULER_STATE) == Cst(SetOf(etype(SCHEDULER_STATE,0,2)));Type(STACK) == Cst(SetOf(atype(STACK,"[STACK","]STACK")));Type(TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Task_Basic)) == (Type(running) == Cst(etype(TASK_STATE,0,4));Type(blocked) == Cst(etype(TASK_STATE,0,4));Type(ready) == Cst(etype(TASK_STATE,0,4));Type(suspended) == Cst(etype(TASK_STATE,0,4));Type(deleted) == Cst(etype(TASK_STATE,0,4));Type(taskSCHEDULER_NOT_STARTED) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_RUNNING) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_SUSPENDED) == Cst(etype(SCHEDULER_STATE,0,2));Type(PRIORITY) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(TICK) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")));Type(TASK_NULL) == Cst(atype(TASK,?,?));Type(NAME_NULL) == Cst(atype(NAME,?,?));Type(READY_PRIORITIES) == Cst(SetOf(SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?))*SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))*SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY"))));Type(TICK_INCREMENT) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")));Type(tskIDLE_PRIORITY) == Cst(btype(INTEGER,?,?));Type(UNBLOCK_TASKS) == Cst(SetOf(SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?)))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Task_Basic)) == (Type(tickMissed) == Mvl(btype(INTEGER,?,?));Type(tickCount) == Mvl(btype(INTEGER,?,?));Type(scheduler) == Mvl(etype(SCHEDULER_STATE,?,?));Type(current_task) == Mvl(atype(TASK,?,?));Type(max_priority) == Mvl(btype(INTEGER,?,?));Type(task_value) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(task_state) == Mvl(SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?)));Type(task_name) == Mvl(SetOf(atype(TASK,?,?)*atype(NAME,?,?)));Type(task_priority) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Task_Basic)) == (Type(removeFromBlockedList) == Cst(No_type,atype(TASK,?,?));Type(incrementTick) == Cst(No_type,No_type);Type(xTaskResumeAll) == Cst(No_type,No_type);Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(vTaskStartScheduler) == Cst(No_type,No_type);Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(vTaskDelayUntil) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(vTaskDelay) == Cst(No_type,btype(INTEGER,?,?));Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULER_STATE,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,?,?),atype(TASK,?,?));Type(vTaskResume) == Cst(No_type,atype(TASK,?,?));Type(vTaskSuspend) == Cst(btype(INTEGER,?,?),atype(TASK,?,?));Type(deleteTask) == Cst(No_type,atype(TASK,?,?));Type(xTaskCreate) == Cst(btype(INTEGER,?,?)*atype(TASK,?,?),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)));
  Observers(Machine(Task_Basic)) == (Type(xTaskGetTickCount) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetSchedulerState) == Cst(etype(SCHEDULER_STATE,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(TASK,?,?),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,?,?),atype(TASK,?,?)))
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
