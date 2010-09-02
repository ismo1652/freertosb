Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(Task_r))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(Task_r))==(Machine(Task));
  Level(Refinement(Task_r))==(1);
  Upper_Level(Refinement(Task_r))==(Machine(Task))
END
&
THEORY LoadedStructureX IS
  Refinement(Task_r)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(Task_r))==(FreeRTOSConfig,Types)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(Task_r))==(?);
  List_Includes(Refinement(Task_r))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(Task_r))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(Task_r))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(Task_r))==(?);
  Context_List_Variables(Refinement(Task_r))==(?);
  Abstract_List_Variables(Refinement(Task_r))==(idle,pending,running,suspended,ready,blocked,tasks,active);
  Local_List_Variables(Refinement(Task_r))==(t_priority,pending,idle,suspended,ready,running,blocked,tasks,active);
  List_Variables(Refinement(Task_r))==(t_priority,pending,idle,suspended,ready,running,blocked,tasks,active);
  External_List_Variables(Refinement(Task_r))==(t_priority,pending,idle,suspended,ready,running,blocked,tasks,active)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(Task_r))==(?);
  Abstract_List_VisibleVariables(Refinement(Task_r))==(?);
  External_List_VisibleVariables(Refinement(Task_r))==(?);
  Expanded_List_VisibleVariables(Refinement(Task_r))==(?);
  List_VisibleVariables(Refinement(Task_r))==(?);
  Internal_List_VisibleVariables(Refinement(Task_r))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(Task_r))==(t_priority)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(Task_r))==(btrue);
  Expanded_List_Invariant(Refinement(Task_r))==(btrue);
  Abstract_List_Invariant(Refinement(Task_r))==(active: BOOL & tasks: FIN(TASK) & idle: TASK & TASK_NULL/:tasks & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & pending: FIN(TASK) & pending <: suspended\/blocked & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {} & tasks = suspended\/blocked\/ready & running: TASK & (active = TRUE => ready/={} & running: ready & idle: ready));
  Context_List_Invariant(Refinement(Task_r))==(btrue);
  List_Invariant(Refinement(Task_r))==(active: BOOL & t_priority: TASK +-> PRIORITY & dom(t_priority) = tasks & (active = TRUE => t_priority(idle) = IDLE_PRIORITY & !tt.(tt: ready => t_priority(tt)<=t_priority(running)) & !tt.(tt: tasks => IDLE_PRIORITY<=t_priority(tt))))
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(Task_r))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(Task_r))==(btrue);
  Abstract_List_Assertions(Refinement(Task_r))==(active = TRUE => tasks/={};active = TRUE => idle: tasks;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => running: tasks;active = TRUE => running/:blocked;active = TRUE => running/:suspended);
  Context_List_Assertions(Refinement(Task_r))==(configMAX_PRIORITIES: NATURAL & BIT <: NATURAL);
  List_Assertions(Refinement(Task_r))==(PRIORITY <: NATURAL;active = TRUE => running: dom(t_priority);active = TRUE => !tt.(tt: ready => t_priority(tt)<=t_priority(running));!(tasks,t_priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) => schedule_p(tasks,t_priority) <: tasks);!(tasks,t_priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) => !task.(task: tasks & task: schedule_p(tasks,t_priority) => t_priority(task) = max(t_priority[tasks]))))
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(Task_r))==(active,tasks:=FALSE,{} || @(running$0).(running$0: TASK ==> running:=running$0) || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || t_priority:={} || blocked,ready,suspended,pending:={},{},{},{});
  Context_List_Initialisation(Refinement(Task_r))==(skip);
  List_Initialisation(Refinement(Task_r))==(active:=FALSE || tasks:={} || running:: TASK || idle:: TASK || t_priority:={} || blocked,ready,suspended,pending:={},{},{},{})
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(Task_r))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_setPriority,t_PriorityInherit,t_resumeIncrement,t_unblockMutex,t_addPending);
  List_Operations(Refinement(Task_r))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_setPriority,t_PriorityInherit,t_resumeIncrement,t_unblockMutex,t_addPending)
END
&
THEORY ListInputX IS
  List_Input(Refinement(Task_r),t_addPending)==(ptask);
  List_Input(Refinement(Task_r),t_unblockMutex)==(task);
  List_Input(Refinement(Task_r),t_resumeIncrement)==(unblocked);
  List_Input(Refinement(Task_r),t_create)==(priority);
  List_Input(Refinement(Task_r),t_delete)==(atask);
  List_Input(Refinement(Task_r),t_suspend)==(stask);
  List_Input(Refinement(Task_r),t_resume)==(rtask);
  List_Input(Refinement(Task_r),t_getPriority)==(atask);
  List_Input(Refinement(Task_r),t_getCurrent)==(?);
  List_Input(Refinement(Task_r),t_getNumberOfTasks)==(?);
  List_Input(Refinement(Task_r),t_delayTask)==(ticks,task);
  List_Input(Refinement(Task_r),t_startScheduler)==(?);
  List_Input(Refinement(Task_r),t_endScheduler)==(?);
  List_Input(Refinement(Task_r),t_resumeAll)==(unblocked);
  List_Input(Refinement(Task_r),t_unblock)==(task);
  List_Input(Refinement(Task_r),t_setPriority)==(task,priority);
  List_Input(Refinement(Task_r),t_PriorityInherit)==(xTicksToWait,holderTask)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(Task_r),t_addPending)==(?);
  List_Output(Refinement(Task_r),t_unblockMutex)==(?);
  List_Output(Refinement(Task_r),t_resumeIncrement)==(?);
  List_Output(Refinement(Task_r),t_create)==(result);
  List_Output(Refinement(Task_r),t_delete)==(?);
  List_Output(Refinement(Task_r),t_suspend)==(?);
  List_Output(Refinement(Task_r),t_resume)==(?);
  List_Output(Refinement(Task_r),t_getPriority)==(priority);
  List_Output(Refinement(Task_r),t_getCurrent)==(result);
  List_Output(Refinement(Task_r),t_getNumberOfTasks)==(result);
  List_Output(Refinement(Task_r),t_delayTask)==(?);
  List_Output(Refinement(Task_r),t_startScheduler)==(?);
  List_Output(Refinement(Task_r),t_endScheduler)==(?);
  List_Output(Refinement(Task_r),t_resumeAll)==(?);
  List_Output(Refinement(Task_r),t_unblock)==(?);
  List_Output(Refinement(Task_r),t_setPriority)==(?);
  List_Output(Refinement(Task_r),t_PriorityInherit)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(Task_r),t_addPending)==(t_addPending(ptask));
  List_Header(Refinement(Task_r),t_unblockMutex)==(t_unblockMutex(task));
  List_Header(Refinement(Task_r),t_resumeIncrement)==(t_resumeIncrement(unblocked));
  List_Header(Refinement(Task_r),t_create)==(result <-- t_create(priority));
  List_Header(Refinement(Task_r),t_delete)==(t_delete(atask));
  List_Header(Refinement(Task_r),t_suspend)==(t_suspend(stask));
  List_Header(Refinement(Task_r),t_resume)==(t_resume(rtask));
  List_Header(Refinement(Task_r),t_getPriority)==(priority <-- t_getPriority(atask));
  List_Header(Refinement(Task_r),t_getCurrent)==(result <-- t_getCurrent);
  List_Header(Refinement(Task_r),t_getNumberOfTasks)==(result <-- t_getNumberOfTasks);
  List_Header(Refinement(Task_r),t_delayTask)==(t_delayTask(ticks,task));
  List_Header(Refinement(Task_r),t_startScheduler)==(t_startScheduler);
  List_Header(Refinement(Task_r),t_endScheduler)==(t_endScheduler);
  List_Header(Refinement(Task_r),t_resumeAll)==(t_resumeAll(unblocked));
  List_Header(Refinement(Task_r),t_unblock)==(t_unblock(task));
  List_Header(Refinement(Task_r),t_setPriority)==(t_setPriority(task,priority));
  List_Header(Refinement(Task_r),t_PriorityInherit)==(t_PriorityInherit(xTicksToWait,holderTask))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(Task_r),t_addPending)==(ptask: TASK & ptask/:pending & ptask: blocked\/suspended);
  List_Precondition(Refinement(Task_r),t_addPending)==(ptask: TASK & ptask/:pending & ptask: blocked\/suspended);
  Own_Precondition(Refinement(Task_r),t_unblockMutex)==(task: TASK & task: blocked & task/:pending);
  List_Precondition(Refinement(Task_r),t_unblockMutex)==(task: TASK & task: blocked & task/:pending);
  Own_Precondition(Refinement(Task_r),t_resumeIncrement)==(unblocked: FIN(TASK) & unblocked <: blocked & unblocked/\pending = {});
  List_Precondition(Refinement(Task_r),t_resumeIncrement)==(unblocked: FIN(TASK) & unblocked <: blocked & unblocked/\pending = {});
  Own_Precondition(Refinement(Task_r),t_create)==(btrue);
  List_Precondition(Refinement(Task_r),t_create)==(priority: PRIORITY);
  Own_Precondition(Refinement(Task_r),t_delete)==(btrue);
  List_Precondition(Refinement(Task_r),t_delete)==(atask: TASK & atask: tasks & atask/=idle);
  Own_Precondition(Refinement(Task_r),t_suspend)==(btrue);
  List_Precondition(Refinement(Task_r),t_suspend)==(stask: TASK & stask: tasks & stask/=idle);
  Own_Precondition(Refinement(Task_r),t_resume)==(btrue);
  List_Precondition(Refinement(Task_r),t_resume)==(rtask: TASK & rtask: suspended & rtask/:pending);
  Own_Precondition(Refinement(Task_r),t_getPriority)==(btrue);
  List_Precondition(Refinement(Task_r),t_getPriority)==(atask: TASK & atask: tasks);
  Own_Precondition(Refinement(Task_r),t_getCurrent)==(btrue);
  List_Precondition(Refinement(Task_r),t_getCurrent)==(btrue);
  Own_Precondition(Refinement(Task_r),t_getNumberOfTasks)==(btrue);
  List_Precondition(Refinement(Task_r),t_getNumberOfTasks)==(btrue);
  Own_Precondition(Refinement(Task_r),t_delayTask)==(btrue);
  List_Precondition(Refinement(Task_r),t_delayTask)==(task: TASK & task = running & running: ready & running/=idle & ticks: TICK);
  Own_Precondition(Refinement(Task_r),t_startScheduler)==(btrue);
  List_Precondition(Refinement(Task_r),t_startScheduler)==(active = FALSE);
  Own_Precondition(Refinement(Task_r),t_endScheduler)==(btrue);
  List_Precondition(Refinement(Task_r),t_endScheduler)==(active = TRUE);
  Own_Precondition(Refinement(Task_r),t_resumeAll)==(btrue);
  List_Precondition(Refinement(Task_r),t_resumeAll)==(unblocked: FIN(TASK) & unblocked <: blocked);
  Own_Precondition(Refinement(Task_r),t_unblock)==(btrue);
  List_Precondition(Refinement(Task_r),t_unblock)==(task: TASK & task: blocked & task/:pending);
  Own_Precondition(Refinement(Task_r),t_setPriority)==(btrue);
  List_Precondition(Refinement(Task_r),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle);
  Own_Precondition(Refinement(Task_r),t_PriorityInherit)==(btrue);
  List_Precondition(Refinement(Task_r),t_PriorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: ready)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(Task_r),t_addPending)==(ptask: TASK & ptask/:pending & ptask: blocked\/suspended | pending:=pending\/{ptask});
  List_Substitution(Refinement(Task_r),t_addPending)==(pending:=pending\/{ptask});
  Expanded_List_Substitution(Refinement(Task_r),t_unblockMutex)==(task: TASK & task: blocked & task/:pending | blocked,ready:=blocked-{task},ready\/{task} || (running:=task [] skip));
  List_Substitution(Refinement(Task_r),t_unblockMutex)==(blocked:=blocked-{task} || ready:=ready\/{task} || CHOICE running:=task OR skip END);
  Expanded_List_Substitution(Refinement(Task_r),t_resumeIncrement)==(unblocked: FIN(TASK) & unblocked <: blocked & unblocked/\pending = {} | unblocked/={} ==> (@(running$0).(running$0: unblocked ==> running:=running$0) [] skip || ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip);
  List_Substitution(Refinement(Task_r),t_resumeIncrement)==(IF unblocked/={} THEN CHOICE running:: unblocked OR skip END || ready:=ready\/unblocked || blocked:=blocked-unblocked END);
  Expanded_List_Substitution(Refinement(Task_r),t_PriorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: ready | t_priority(running)>t_priority(holderTask) ==> t_priority:=t_priority<+{holderTask|->t_priority(running)} [] not(t_priority(running)>t_priority(holderTask)) ==> skip);
  Expanded_List_Substitution(Refinement(Task_r),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle | t_priority:=t_priority<+{task|->priority} || (task: ready & t_priority(running)<=priority ==> running,ready:=task,(ready\/{running})-{task} [] not(task: ready & t_priority(running)<=priority) ==> (task = running & priority<max(t_priority[ready]) ==> @atask.(atask: TASK & atask: schedule_p(ready,t_priority) ==> running,ready:=atask,(ready\/{running})-{atask}) [] not(task = running & priority<max(t_priority[ready])) ==> skip)));
  Expanded_List_Substitution(Refinement(Task_r),t_unblock)==(task: TASK & task: blocked & task/:pending | blocked:=blocked-{task} || @n_ready.(n_ready <: tasks & n_ready = ready\/{task} ==> (t_priority(task)>=t_priority(running) ==> @(running$0).(running$0: schedule_p(n_ready,t_priority) ==> running:=running$0) [] not(t_priority(task)>=t_priority(running)) ==> skip || ready:=n_ready)));
  Expanded_List_Substitution(Refinement(Task_r),t_resumeAll)==(unblocked: FIN(TASK) & unblocked <: blocked | unblocked/={} or pending/={} ==> @n_ready.(n_ready <: tasks & n_ready = ready\/unblocked\/pending ==> (blocked,suspended,ready:=blocked-unblocked-pending,suspended-pending,n_ready || (t_priority(running)<=max(t_priority[schedule_p(n_ready,t_priority)]) ==> @(running$0).(running$0: schedule_p(n_ready,t_priority) ==> running:=running$0) [] not(t_priority(running)<=max(t_priority[schedule_p(n_ready,t_priority)])) ==> skip))) [] not(unblocked/={} or pending/={}) ==> skip);
  Expanded_List_Substitution(Refinement(Task_r),t_endScheduler)==(active = TRUE | active,tasks,t_priority,blocked,ready,suspended:=FALSE,{},{},{},{},{});
  Expanded_List_Substitution(Refinement(Task_r),t_startScheduler)==(active = FALSE | active,blocked,suspended:=TRUE,{},{} || @idle_task.(idle_task: TASK & idle_task/:tasks ==> (tasks,t_priority,idle:=tasks\/{idle_task},t_priority\/{idle_task|->IDLE_PRIORITY},idle_task || @n_ready.(n_ready <: tasks & n_ready = ready\/{idle_task} ==> (ready:=n_ready || @(running$0).(running$0: schedule_p(n_ready,t_priority) ==> running:=running$0))))));
  Expanded_List_Substitution(Refinement(Task_r),t_delayTask)==(task: TASK & task = running & running: ready & running/=idle & ticks: TICK | @n_ready.(n_ready <: tasks & n_ready = ready-{running} ==> @(running$0).(running$0: schedule_p(n_ready,t_priority) ==> running:=running$0)) || blocked:=blocked\/{running});
  Expanded_List_Substitution(Refinement(Task_r),t_getNumberOfTasks)==(btrue | result:=card(tasks));
  Expanded_List_Substitution(Refinement(Task_r),t_getCurrent)==(btrue | result:=running);
  Expanded_List_Substitution(Refinement(Task_r),t_getPriority)==(atask: TASK & atask: tasks | priority:=t_priority(atask));
  Expanded_List_Substitution(Refinement(Task_r),t_resume)==(rtask: TASK & rtask: suspended & rtask/:pending | @n_ready.(n_ready <: tasks & n_ready = ready\/{rtask} ==> (suspended,ready:=suspended-{rtask},n_ready || (t_priority(rtask)>=t_priority(running) ==> @(running$0).(running$0: schedule_p(n_ready,t_priority) ==> running:=running$0) [] not(t_priority(rtask)>=t_priority(running)) ==> skip))));
  Expanded_List_Substitution(Refinement(Task_r),t_suspend)==(stask: TASK & stask: tasks & stask/=idle | stask: ready ==> @n_ready.(n_ready <: tasks & n_ready = ready-{stask} ==> (ready:=n_ready || (running = running ==> @(running$0).(running$0: schedule_p(n_ready,t_priority) ==> running:=running$0) [] not(running = running) ==> skip))) [] not(stask: ready) ==> (stask: blocked ==> blocked:=blocked-{stask} [] not(stask: blocked) ==> skip) || suspended:=suspended\/{stask});
  Expanded_List_Substitution(Refinement(Task_r),t_delete)==(atask: TASK & atask: tasks & atask/=idle | @n_priority.(n_priority: TASK +-> PRIORITY & n_priority = {atask}<<|t_priority ==> (tasks,t_priority:=tasks-{atask},n_priority || (atask: ready ==> @n_ready.(n_ready <: tasks & n_ready = ready-{atask} ==> (ready:=n_ready || (atask = running ==> (active = TRUE ==> @(running$0).(running$0: schedule_p(n_ready,n_priority) ==> running:=running$0) [] not(active = TRUE) ==> skip) [] not(atask = running) ==> skip))) [] not(atask: ready) ==> (atask: blocked ==> blocked,pending:=blocked-{atask},pending-{atask} [] not(atask: blocked) ==> (atask: suspended ==> suspended,pending:=suspended-{atask},pending-{atask} [] not(atask: suspended) ==> skip))))));
  Expanded_List_Substitution(Refinement(Task_r),t_create)==(priority: PRIORITY | @(task,n_ready,n_priority,n_tasks).(task: TASK & task/:tasks & task/=TASK_NULL & n_tasks: FIN(TASK) & n_tasks = {task}\/tasks & n_ready <: tasks & n_ready = {task}\/ready & n_priority: TASK +-> PRIORITY & n_priority = t_priority\/{task|->priority} ==> (tasks,t_priority,ready:=n_tasks,n_priority,n_ready || (active = TRUE ==> (t_priority(running)>=priority ==> @(running$0).(running$0: schedule_p(n_ready,n_priority) ==> running:=running$0) [] not(t_priority(running)>=priority) ==> skip) [] not(active = TRUE) ==> (ready = {} ==> running:=task [] not(ready = {}) ==> (t_priority(running)>=priority ==> @(running$0).(running$0: schedule_p(n_ready,n_priority) ==> running:=running$0) [] not(t_priority(running)>=priority) ==> skip))) || result:=task)));
  List_Substitution(Refinement(Task_r),t_create)==(ANY task,n_ready,n_priority,n_tasks WHERE task: TASK & task/:tasks & task/=TASK_NULL & n_tasks: FIN(TASK) & n_tasks = {task}\/tasks & n_ready <: tasks & n_ready = {task}\/ready & n_priority: TASK +-> PRIORITY & n_priority = t_priority\/{task|->priority} THEN tasks:=n_tasks || t_priority:=n_priority || ready:=n_ready || IF active = TRUE THEN IF t_priority(running)>=priority THEN running:: schedule_p(n_ready,n_priority) END ELSE IF ready = {} THEN running:=task ELSE IF t_priority(running)>=priority THEN running:: schedule_p(n_ready,n_priority) END END END || result:=task END);
  List_Substitution(Refinement(Task_r),t_delete)==(ANY n_priority WHERE n_priority: TASK +-> PRIORITY & n_priority = {atask}<<|t_priority THEN tasks:=tasks-{atask} || t_priority:=n_priority || IF atask: ready THEN ANY n_ready WHERE n_ready <: tasks & n_ready = ready-{atask} THEN ready:=n_ready || IF atask = running THEN IF active = TRUE THEN running:: schedule_p(n_ready,n_priority) END END END ELSIF atask: blocked THEN blocked:=blocked-{atask} || pending:=pending-{atask} ELSIF atask: suspended THEN suspended:=suspended-{atask} || pending:=pending-{atask} END END);
  List_Substitution(Refinement(Task_r),t_suspend)==(IF stask: ready THEN ANY n_ready WHERE n_ready <: tasks & n_ready = ready-{stask} THEN ready:=n_ready || IF running = running THEN running:: schedule_p(n_ready,t_priority) END END ELSIF stask: blocked THEN blocked:=blocked-{stask} END || suspended:=suspended\/{stask});
  List_Substitution(Refinement(Task_r),t_resume)==(ANY n_ready WHERE n_ready <: tasks & n_ready = ready\/{rtask} THEN suspended:=suspended-{rtask} || ready:=n_ready || IF t_priority(rtask)>=t_priority(running) THEN running:: schedule_p(n_ready,t_priority) END END);
  List_Substitution(Refinement(Task_r),t_getPriority)==(priority:=t_priority(atask));
  List_Substitution(Refinement(Task_r),t_getCurrent)==(result:=running);
  List_Substitution(Refinement(Task_r),t_getNumberOfTasks)==(result:=card(tasks));
  List_Substitution(Refinement(Task_r),t_delayTask)==(ANY n_ready WHERE n_ready <: tasks & n_ready = ready-{running} THEN running:: schedule_p(n_ready,t_priority) END || blocked:=blocked\/{running});
  List_Substitution(Refinement(Task_r),t_startScheduler)==(active:=TRUE || blocked,suspended:={},{} || ANY idle_task WHERE idle_task: TASK & idle_task/:tasks THEN tasks:=tasks\/{idle_task} || t_priority:=t_priority\/{idle_task|->IDLE_PRIORITY} || idle:=idle_task || ANY n_ready WHERE n_ready <: tasks & n_ready = ready\/{idle_task} THEN ready:=n_ready || running:: schedule_p(n_ready,t_priority) END END);
  List_Substitution(Refinement(Task_r),t_endScheduler)==(active:=FALSE || tasks:={} || t_priority:={} || blocked,ready,suspended:={},{},{});
  List_Substitution(Refinement(Task_r),t_resumeAll)==(IF unblocked/={} or pending/={} THEN ANY n_ready WHERE n_ready <: tasks & n_ready = ready\/unblocked\/pending THEN blocked:=blocked-unblocked-pending || suspended:=suspended-pending || ready:=n_ready || IF t_priority(running)<=max(t_priority[schedule_p(n_ready,t_priority)]) THEN running:: schedule_p(n_ready,t_priority) END END END);
  List_Substitution(Refinement(Task_r),t_unblock)==(blocked:=blocked-{task} || ANY n_ready WHERE n_ready <: tasks & n_ready = ready\/{task} THEN IF t_priority(task)>=t_priority(running) THEN running:: schedule_p(n_ready,t_priority) END || ready:=n_ready END);
  List_Substitution(Refinement(Task_r),t_setPriority)==(t_priority(task):=priority || IF task: ready & t_priority(running)<=priority THEN running:=task || ready:=(ready\/{running})-{task} ELSIF task = running & priority<max(t_priority[ready]) THEN ANY atask WHERE atask: TASK & atask: schedule_p(ready,t_priority) THEN running:=atask || ready:=(ready\/{running})-{atask} END END);
  List_Substitution(Refinement(Task_r),t_PriorityInherit)==(IF t_priority(running)>t_priority(holderTask) THEN t_priority(holderTask):=t_priority(running) END)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(Task_r))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(Task_r),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Refinement(Task_r),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(Task_r))==(btrue);
  List_Context_Constraints(Refinement(Task_r))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(Task_r))==(max_prt,schedule_p);
  Inherited_List_Constants(Refinement(Task_r))==(?);
  List_Constants(Refinement(Task_r))==(max_prt,schedule_p)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(Task_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Refinement(Task_r))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Refinement(Task_r))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Refinement(Task_r))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Refinement(Task_r))==(?);
  Inherited_List_Enumerated(Refinement(Task_r))==(?);
  Inherited_List_Defered(Refinement(Task_r))==(?);
  Inherited_List_Sets(Refinement(Task_r))==(?);
  List_Enumerated(Refinement(Task_r))==(?);
  List_Defered(Refinement(Task_r))==(?);
  List_Sets(Refinement(Task_r))==(?);
  Set_Definition(Refinement(Task_r),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(Task_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Task_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(Task_r))==(?);
  Expanded_List_HiddenConstants(Refinement(Task_r))==(?);
  List_HiddenConstants(Refinement(Task_r))==(?);
  External_List_HiddenConstants(Refinement(Task_r))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(Task_r))==(btrue);
  Context_List_Properties(Refinement(Task_r))==(configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & PRIORITY = 0..configMAX_PRIORITIES-1 & BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Refinement(Task_r))==(btrue);
  List_Properties(Refinement(Task_r))==(max_prt: PRIORITY*PRIORITY --> PRIORITY & max_prt = %(tmp_mprt_ready,t_prt).(tmp_mprt_ready: PRIORITY & t_prt: PRIORITY | max({tmp_mprt_ready,t_prt})) & schedule_p: FIN(TASK)*(TASK +-> PRIORITY) +-> FIN(TASK) & schedule_p = %(tasks,t_priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) | tasks/\dom(t_priority|>{max(t_priority[tasks])})))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(Task_r),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Refinement(Task_r))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Refinement(Task_r))==(btrue);
  Seen_Context_List_Assertions(Refinement(Task_r))==(BIT <: NATURAL);
  Seen_Context_List_Properties(Refinement(Task_r))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Refinement(Task_r))==(btrue);
  Seen_List_Operations(Refinement(Task_r),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Refinement(Task_r),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Refinement(Task_r),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Refinement(Task_r),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Refinement(Task_r),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Refinement(Task_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Refinement(Task_r),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(Task_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Task_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(Task_r),t_addPending)==(?);
  List_ANY_Var(Refinement(Task_r),t_unblockMutex)==(?);
  List_ANY_Var(Refinement(Task_r),t_resumeIncrement)==(?);
  List_ANY_Var(Refinement(Task_r),t_create)==((Var(task) == atype(TASK,?,?)),(Var(n_ready) == SetOf(atype(TASK,?,?))),(Var(n_priority) == SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))),(Var(n_tasks) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Refinement(Task_r),t_delete)==((Var(n_priority) == SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))),(Var(n_ready) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Refinement(Task_r),t_suspend)==(Var(n_ready) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_resume)==(Var(n_ready) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_getPriority)==(?);
  List_ANY_Var(Refinement(Task_r),t_getCurrent)==(?);
  List_ANY_Var(Refinement(Task_r),t_getNumberOfTasks)==(?);
  List_ANY_Var(Refinement(Task_r),t_delayTask)==(Var(n_ready) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_startScheduler)==((Var(idle_task) == atype(TASK,?,?)),(Var(n_ready) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Refinement(Task_r),t_endScheduler)==(?);
  List_ANY_Var(Refinement(Task_r),t_resumeAll)==(Var(n_ready) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_unblock)==(Var(n_ready) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_setPriority)==(Var(atask) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_r),t_PriorityInherit)==(?);
  List_ANY_Var(Refinement(Task_r),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(Task_r)) == (max_prt,schedule_p | ? | t_priority,pending,idle,suspended,ready,running,blocked,tasks,active | ? | t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_setPriority,t_PriorityInherit | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task_r);
  List_Of_HiddenCst_Ids(Refinement(Task_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(Task_r)) == (max_prt,schedule_p);
  List_Of_VisibleVar_Ids(Refinement(Task_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(Task_r)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Refinement(Task_r)) == (Type(max_prt) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")*btype(INTEGER,"[PRIORITY","]PRIORITY")*btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(schedule_p) == Cst(SetOf(SetOf(atype(TASK,?,?))*SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))*SetOf(atype(TASK,?,?)))))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(Task_r)) == (Type(t_priority) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(pending) == Mvl(SetOf(atype(TASK,?,?)));Type(idle) == Mvl(atype(TASK,?,?));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(Task_r)) == (Type(t_addPending) == Cst(No_type,atype(TASK,?,?));Type(t_unblockMutex) == Cst(No_type,atype(TASK,?,?));Type(t_resumeIncrement) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(t_PriorityInherit) == Cst(No_type,btype(INTEGER,?,?)*atype(TASK,?,?));Type(t_setPriority) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_unblock) == Cst(No_type,atype(TASK,?,?));Type(t_resumeAll) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(t_endScheduler) == Cst(No_type,No_type);Type(t_startScheduler) == Cst(No_type,No_type);Type(t_delayTask) == Cst(No_type,btype(INTEGER,?,?)*atype(TASK,?,?));Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(t_resume) == Cst(No_type,atype(TASK,?,?));Type(t_suspend) == Cst(No_type,atype(TASK,?,?));Type(t_delete) == Cst(No_type,atype(TASK,?,?));Type(t_create) == Cst(atype(TASK,?,?),btype(INTEGER,?,?)))
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
