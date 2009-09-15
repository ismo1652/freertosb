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
  Abstract_List_Variables(Refinement(Task_r))==(idle,running,suspended,ready,blocked,tasks,active);
  Local_List_Variables(Refinement(Task_r))==(t_priority,idle,suspended,ready,running,blocked,tasks,active);
  List_Variables(Refinement(Task_r))==(t_priority,idle,suspended,ready,running,blocked,tasks,active);
  External_List_Variables(Refinement(Task_r))==(t_priority,idle,suspended,ready,running,blocked,tasks,active)
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
  Abstract_List_Invariant(Refinement(Task_r))==(active: BOOL & tasks: FIN(TASK) & idle: TASK & blocked: FIN(TASK) & blocked <: tasks & ready: FIN(TASK) & ready <: tasks & suspended: FIN(TASK) & suspended <: tasks & running: TASK & (active = TRUE => running = idle or idle: ready & running: tasks & running/:ready & running/:blocked & running/:suspended & tasks = {running}\/suspended\/blocked\/ready) & (active = FALSE => tasks = ready) & ready/\blocked = {} & blocked/\suspended = {} & suspended/\ready = {});
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
  Abstract_List_Assertions(Refinement(Task_r))==(active = TRUE => idle: tasks;active = TRUE => tasks/={};active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => (ready = {} => running = idle));
  Context_List_Assertions(Refinement(Task_r))==(configMAX_PRIORITIES: NATURAL & BIT <: NATURAL);
  List_Assertions(Refinement(Task_r))==(PRIORITY <: NATURAL;active = TRUE => running: dom(t_priority);!(tasks,t_priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) => schedule_p(tasks,t_priority) <: tasks);!(tasks,t_priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) => !task.(task: tasks & task: schedule_p(tasks,t_priority) => t_priority(task) = max(t_priority[tasks]))))
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(Task_r))==(active,tasks:=FALSE,{} || @(running$0).(running$0: TASK ==> running:=running$0) || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || t_priority:={} || blocked,ready,suspended:={},{},{});
  Context_List_Initialisation(Refinement(Task_r))==(skip);
  List_Initialisation(Refinement(Task_r))==(active:=FALSE || tasks:={} || running:: TASK || idle:: TASK || t_priority:={} || blocked,ready,suspended:={},{},{})
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(Task_r))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_incrementTick,t_unblock,t_setPriority);
  List_Operations(Refinement(Task_r))==(t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_incrementTick,t_unblock,t_setPriority)
END
&
THEORY ListInputX IS
  List_Input(Refinement(Task_r),t_create)==(priority);
  List_Input(Refinement(Task_r),t_delete)==(atask);
  List_Input(Refinement(Task_r),t_suspend)==(atask);
  List_Input(Refinement(Task_r),t_resume)==(atask);
  List_Input(Refinement(Task_r),t_getPriority)==(atask);
  List_Input(Refinement(Task_r),t_getCurrent)==(?);
  List_Input(Refinement(Task_r),t_getNumberOfTasks)==(?);
  List_Input(Refinement(Task_r),t_delayTask)==(ticks);
  List_Input(Refinement(Task_r),t_startScheduler)==(?);
  List_Input(Refinement(Task_r),t_endScheduler)==(?);
  List_Input(Refinement(Task_r),t_resumeAll)==(tick);
  List_Input(Refinement(Task_r),t_incrementTick)==(tick);
  List_Input(Refinement(Task_r),t_unblock)==(task);
  List_Input(Refinement(Task_r),t_setPriority)==(task,priority)
END
&
THEORY ListOutputX IS
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
  List_Output(Refinement(Task_r),t_incrementTick)==(?);
  List_Output(Refinement(Task_r),t_unblock)==(?);
  List_Output(Refinement(Task_r),t_setPriority)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(Task_r),t_create)==(result <-- t_create(priority));
  List_Header(Refinement(Task_r),t_delete)==(t_delete(atask));
  List_Header(Refinement(Task_r),t_suspend)==(t_suspend(atask));
  List_Header(Refinement(Task_r),t_resume)==(t_resume(atask));
  List_Header(Refinement(Task_r),t_getPriority)==(priority <-- t_getPriority(atask));
  List_Header(Refinement(Task_r),t_getCurrent)==(result <-- t_getCurrent);
  List_Header(Refinement(Task_r),t_getNumberOfTasks)==(result <-- t_getNumberOfTasks);
  List_Header(Refinement(Task_r),t_delayTask)==(t_delayTask(ticks));
  List_Header(Refinement(Task_r),t_startScheduler)==(t_startScheduler);
  List_Header(Refinement(Task_r),t_endScheduler)==(t_endScheduler);
  List_Header(Refinement(Task_r),t_resumeAll)==(t_resumeAll(tick));
  List_Header(Refinement(Task_r),t_incrementTick)==(t_incrementTick(tick));
  List_Header(Refinement(Task_r),t_unblock)==(t_unblock(task));
  List_Header(Refinement(Task_r),t_setPriority)==(t_setPriority(task,priority))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(Task_r),t_create)==(btrue);
  List_Precondition(Refinement(Task_r),t_create)==(active = FALSE & priority: PRIORITY);
  Own_Precondition(Refinement(Task_r),t_delete)==(atask: TASK & atask: tasks & atask/=idle);
  List_Precondition(Refinement(Task_r),t_delete)==(atask: TASK & atask: tasks & atask/=idle & active = TRUE & atask: TASK & atask: tasks & atask/=idle);
  Own_Precondition(Refinement(Task_r),t_suspend)==(atask: TASK & atask: tasks & atask/=idle);
  List_Precondition(Refinement(Task_r),t_suspend)==(atask: TASK & atask: tasks & atask/=idle & active = TRUE & atask: TASK & atask: tasks & atask/=idle);
  Own_Precondition(Refinement(Task_r),t_resume)==(btrue);
  List_Precondition(Refinement(Task_r),t_resume)==(active = TRUE & atask: TASK & atask: suspended);
  Own_Precondition(Refinement(Task_r),t_getPriority)==(btrue);
  List_Precondition(Refinement(Task_r),t_getPriority)==(atask: TASK & atask: tasks);
  Own_Precondition(Refinement(Task_r),t_getCurrent)==(btrue);
  List_Precondition(Refinement(Task_r),t_getCurrent)==(active = TRUE);
  Own_Precondition(Refinement(Task_r),t_getNumberOfTasks)==(btrue);
  List_Precondition(Refinement(Task_r),t_getNumberOfTasks)==(btrue);
  Own_Precondition(Refinement(Task_r),t_delayTask)==(btrue);
  List_Precondition(Refinement(Task_r),t_delayTask)==(active = TRUE & running/=idle & ticks: TICK & not(ticks = 0));
  Own_Precondition(Refinement(Task_r),t_startScheduler)==(btrue);
  List_Precondition(Refinement(Task_r),t_startScheduler)==(active = FALSE);
  Own_Precondition(Refinement(Task_r),t_endScheduler)==(btrue);
  List_Precondition(Refinement(Task_r),t_endScheduler)==(active = TRUE);
  Own_Precondition(Refinement(Task_r),t_resumeAll)==(active = TRUE & tick: TICK);
  List_Precondition(Refinement(Task_r),t_resumeAll)==(active = TRUE & tick: TICK & active = TRUE & tick: TICK);
  Own_Precondition(Refinement(Task_r),t_incrementTick)==(active = TRUE & tick: TICK);
  List_Precondition(Refinement(Task_r),t_incrementTick)==(active = TRUE & tick: TICK & active = TRUE & tick: TICK);
  Own_Precondition(Refinement(Task_r),t_unblock)==(active = TRUE & blocked/={} & task: TASK & task: blocked);
  List_Precondition(Refinement(Task_r),t_unblock)==(active = TRUE & blocked/={} & task: TASK & task: blocked & active = TRUE & task: TASK & task: blocked);
  Own_Precondition(Refinement(Task_r),t_setPriority)==(btrue);
  List_Precondition(Refinement(Task_r),t_setPriority)==(task: tasks & priority: PRIORITY & active = TRUE & task/=idle)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(Task_r),t_setPriority)==(task: tasks & priority: PRIORITY & active = TRUE & task/=idle | t_priority:=t_priority<+{task|->priority} || (task: ready & t_priority(running)<=priority ==> running,ready:=task,(ready\/{running})-{task} [] not(task: ready & t_priority(running)<=priority) ==> (task = running & priority<max(t_priority[ready]) ==> @atask.(atask: TASK & atask: schedule_p(ready,t_priority) ==> running,ready:=atask,(ready\/{running})-{atask}) [] not(task = running & priority<max(t_priority[ready])) ==> skip)));
  Expanded_List_Substitution(Refinement(Task_r),t_unblock)==(active = TRUE & blocked/={} & task: TASK & task: blocked & active = TRUE & task: TASK & task: blocked | blocked:=blocked-{task} || (t_priority(task)>=t_priority(running) ==> running,ready:=task,ready\/{running} [] not(t_priority(task)>=t_priority(running)) ==> ready:=ready\/{task}));
  Expanded_List_Substitution(Refinement(Task_r),t_incrementTick)==(active = TRUE & tick: TICK & active = TRUE & tick: TICK | @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked/={} ==> (t_priority(running)<=max(t_priority[unblocked]) ==> @task.(task: TASK & task: schedule_p(unblocked,t_priority) ==> running,ready:=task,ready\/{running}\/unblocked-{task}) [] not(t_priority(running)<=max(t_priority[unblocked])) ==> (ready/={} ==> (max(t_priority[ready]) = t_priority(running) ==> @task.(task: TASK & task: schedule_p(ready,t_priority) & task/=idle & task/=running ==> running,ready:=task,ready-{task}\/{running}\/unblocked) [] not(max(t_priority[ready]) = t_priority(running)) ==> ready:=ready\/unblocked) [] not(ready/={}) ==> ready:=ready\/unblocked) || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> (ready/={} ==> (max(t_priority[ready]) = t_priority(running) ==> @task.(task: TASK & task: schedule_p(ready,t_priority) & task/=idle & task/=running ==> running,ready:=task,ready-{task}\/{running}) [] not(max(t_priority[ready]) = t_priority(running)) ==> skip) [] not(ready/={}) ==> skip))));
  Expanded_List_Substitution(Refinement(Task_r),t_resumeAll)==(active = TRUE & tick: TICK & active = TRUE & tick: TICK | @unblocked.(unblocked: FIN(TASK) & unblocked <: blocked ==> (unblocked/={} ==> (t_priority(running)<=max(t_priority[unblocked]) ==> @task.(task: TASK & task: schedule_p(unblocked,t_priority) ==> running,ready:=task,ready\/{running}\/unblocked-{task}) [] not(t_priority(running)<=max(t_priority[unblocked])) ==> ready:=ready\/unblocked || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip)));
  Expanded_List_Substitution(Refinement(Task_r),t_endScheduler)==(active = TRUE | active,tasks,t_priority,blocked,ready,suspended:=FALSE,{},{},{},{},{});
  Expanded_List_Substitution(Refinement(Task_r),t_startScheduler)==(active = FALSE | active,blocked,suspended:=TRUE,{},{} || @idle_task.(idle_task: TASK & idle_task/:tasks ==> (tasks,t_priority,idle:=tasks\/{idle_task},t_priority\/{idle_task|->IDLE_PRIORITY},idle_task || @task.(task: TASK & (ready = {} => task = idle_task) & (ready/={} => task: ready & t_priority(task) = max(t_priority[ready])) ==> running,ready:=task,(ready\/{idle_task})-{task}))));
  Expanded_List_Substitution(Refinement(Task_r),t_delayTask)==(active = TRUE & running/=idle & ticks: TICK & not(ticks = 0) | blocked:=blocked\/{running} || @task.(task: TASK & task: ready & t_priority(task) = max(t_priority[ready]) ==> running,ready:=task,ready-{task}));
  Expanded_List_Substitution(Refinement(Task_r),t_getNumberOfTasks)==(btrue | result:=card(tasks));
  Expanded_List_Substitution(Refinement(Task_r),t_getCurrent)==(active = TRUE | result:=running);
  Expanded_List_Substitution(Refinement(Task_r),t_getPriority)==(atask: TASK & atask: tasks | priority:=t_priority(atask));
  Expanded_List_Substitution(Refinement(Task_r),t_resume)==(active = TRUE & atask: TASK & atask: suspended | t_priority(atask)>t_priority(running) ==> ready,running:=ready\/{running},atask [] not(t_priority(atask)>t_priority(running)) ==> (t_priority(atask) = t_priority(running) ==> (ready,running:=ready\/{running},atask [] ready:=ready\/{atask}) [] not(t_priority(atask) = t_priority(running)) ==> ready:=ready\/{atask}) || suspended:=suspended-{atask});
  Expanded_List_Substitution(Refinement(Task_r),t_suspend)==(atask: TASK & atask: tasks & atask/=idle & active = TRUE & atask: TASK & atask: tasks & atask/=idle | atask = running ==> @task.(task: TASK & task: ready & t_priority(task) = max(t_priority[ready]) ==> running,ready:=task,ready-{task}) [] not(atask = running) ==> (atask: ready ==> ready:=ready-{atask} [] not(atask: ready) ==> (atask: blocked ==> blocked:=blocked-{atask} [] not(atask: blocked) ==> skip)) || suspended:=suspended\/{atask});
  Expanded_List_Substitution(Refinement(Task_r),t_delete)==(atask: TASK & atask: tasks & atask/=idle & active = TRUE & atask: TASK & atask: tasks & atask/=idle | tasks,t_priority:=tasks-{atask},{atask}<<|t_priority || (atask = running ==> @task.(task: TASK & task: schedule_p(ready,t_priority) ==> running,ready:=task,ready-{task}) [] not(atask = running) ==> (atask: ready ==> ready:=ready-{atask} [] not(atask: ready) ==> (atask: blocked ==> blocked:=blocked-{atask} [] not(atask: blocked) ==> (atask: suspended ==> suspended:=suspended-{atask} [] not(atask: suspended) ==> skip)))));
  Expanded_List_Substitution(Refinement(Task_r),t_create)==(active = FALSE & priority: PRIORITY | @task.(task: TASK & task/:tasks ==> tasks,t_priority,ready,result:={task}\/tasks,t_priority\/{task|->priority},{task}\/ready,task));
  List_Substitution(Refinement(Task_r),t_create)==(ANY task WHERE task: TASK & task/:tasks THEN tasks:={task}\/tasks || t_priority:=t_priority\/{task|->priority} || ready:={task}\/ready || result:=task END);
  List_Substitution(Refinement(Task_r),t_delete)==(tasks:=tasks-{atask} || t_priority:={atask}<<|t_priority || IF atask = running THEN ANY task WHERE task: TASK & task: schedule_p(ready,t_priority) THEN running:=task || ready:=ready-{task} END ELSIF atask: ready THEN ready:=ready-{atask} ELSIF atask: blocked THEN blocked:=blocked-{atask} ELSIF atask: suspended THEN suspended:=suspended-{atask} END);
  List_Substitution(Refinement(Task_r),t_suspend)==(IF atask = running THEN ANY task WHERE task: TASK & task: ready & t_priority(task) = max(t_priority[ready]) THEN running:=task || ready:=ready-{task} END ELSIF atask: ready THEN ready:=ready-{atask} ELSIF atask: blocked THEN blocked:=blocked-{atask} END || suspended:=suspended\/{atask});
  List_Substitution(Refinement(Task_r),t_resume)==(IF t_priority(atask)>t_priority(running) THEN ready:=ready\/{running} || running:=atask ELSIF t_priority(atask) = t_priority(running) THEN CHOICE ready:=ready\/{running} || running:=atask OR ready:=ready\/{atask} END ELSE ready:=ready\/{atask} END || suspended:=suspended-{atask});
  List_Substitution(Refinement(Task_r),t_getPriority)==(priority:=t_priority(atask));
  List_Substitution(Refinement(Task_r),t_getCurrent)==(result:=running);
  List_Substitution(Refinement(Task_r),t_getNumberOfTasks)==(result:=card(tasks));
  List_Substitution(Refinement(Task_r),t_delayTask)==(blocked:=blocked\/{running} || ANY task WHERE task: TASK & task: ready & t_priority(task) = max(t_priority[ready]) THEN running:=task || ready:=ready-{task} END);
  List_Substitution(Refinement(Task_r),t_startScheduler)==(active:=TRUE || blocked,suspended:={},{} || ANY idle_task WHERE idle_task: TASK & idle_task/:tasks THEN tasks:=tasks\/{idle_task} || t_priority:=t_priority\/{idle_task|->IDLE_PRIORITY} || idle:=idle_task || ANY task WHERE task: TASK & (ready = {} => task = idle_task) & (ready/={} => task: ready & t_priority(task) = max(t_priority[ready])) THEN running:=task || ready:=(ready\/{idle_task})-{task} END END);
  List_Substitution(Refinement(Task_r),t_endScheduler)==(active:=FALSE || tasks:={} || t_priority:={} || blocked,ready,suspended:={},{},{});
  List_Substitution(Refinement(Task_r),t_resumeAll)==(ANY unblocked WHERE unblocked: FIN(TASK) & unblocked <: blocked THEN IF unblocked/={} THEN IF t_priority(running)<=max(t_priority[unblocked]) THEN ANY task WHERE task: TASK & task: schedule_p(unblocked,t_priority) THEN running:=task || ready:=ready\/{running}\/unblocked-{task} END ELSE ready:=ready\/unblocked END || blocked:=blocked-unblocked END END);
  List_Substitution(Refinement(Task_r),t_incrementTick)==(ANY unblocked WHERE unblocked: FIN(TASK) & unblocked <: blocked THEN IF unblocked/={} THEN IF t_priority(running)<=max(t_priority[unblocked]) THEN ANY task WHERE task: TASK & task: schedule_p(unblocked,t_priority) THEN running:=task || ready:=ready\/{running}\/unblocked-{task} END ELSIF ready/={} THEN IF max(t_priority[ready]) = t_priority(running) THEN ANY task WHERE task: TASK & task: schedule_p(ready,t_priority) & task/=idle & task/=running THEN running:=task || ready:=ready-{task}\/{running}\/unblocked END ELSE ready:=ready\/unblocked END ELSE ready:=ready\/unblocked END || blocked:=blocked-unblocked ELSIF ready/={} THEN IF max(t_priority[ready]) = t_priority(running) THEN ANY task WHERE task: TASK & task: schedule_p(ready,t_priority) & task/=idle & task/=running THEN running:=task || ready:=ready-{task}\/{running} END ELSE skip END ELSE skip END END);
  List_Substitution(Refinement(Task_r),t_unblock)==(blocked:=blocked-{task} || IF t_priority(task)>=t_priority(running) THEN running:=task || ready:=ready\/{running} ELSE ready:=ready\/{task} END);
  List_Substitution(Refinement(Task_r),t_setPriority)==(t_priority(task):=priority || IF task: ready & t_priority(running)<=priority THEN running:=task || ready:=(ready\/{running})-{task} ELSIF task = running & priority<max(t_priority[ready]) THEN ANY atask WHERE atask: TASK & atask: schedule_p(ready,t_priority) THEN running:=atask || ready:=(ready\/{running})-{atask} END END)
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
  List_Valuable_Constants(Refinement(Task_r))==(max_prt,IDLE_PRIORITY,schedule_p);
  Inherited_List_Constants(Refinement(Task_r))==(?);
  List_Constants(Refinement(Task_r))==(max_prt,IDLE_PRIORITY,schedule_p)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(Task_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Refinement(Task_r))==(SCHEDULER_STATE,COPY_POSITION,ERROR_DEFINITION);
  Context_List_Defered(Refinement(Task_r))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Refinement(Task_r))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,ERROR_DEFINITION);
  List_Valuable_Sets(Refinement(Task_r))==(?);
  Inherited_List_Enumerated(Refinement(Task_r))==(?);
  Inherited_List_Defered(Refinement(Task_r))==(?);
  Inherited_List_Sets(Refinement(Task_r))==(?);
  List_Enumerated(Refinement(Task_r))==(?);
  List_Defered(Refinement(Task_r))==(?);
  List_Sets(Refinement(Task_r))==(?);
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
  Context_List_Properties(Refinement(Task_r))==(configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Refinement(Task_r))==(btrue);
  List_Properties(Refinement(Task_r))==(PRIORITY = 0..configMAX_PRIORITIES-1 & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & max_prt: PRIORITY*PRIORITY --> PRIORITY & max_prt = %(tmp_mprt_ready,t_prt).(tmp_mprt_ready: PRIORITY & t_prt: PRIORITY | max({tmp_mprt_ready,t_prt})) & schedule_p: FIN(TASK)*(TASK +-> PRIORITY) +-> FIN(TASK) & schedule_p = %(tasks,t_priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) | tasks/\dom(t_priority|>{max(t_priority[tasks])})))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(Task_r),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Refinement(Task_r))==(SCHEDULER_STATE,COPY_POSITION,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Refinement(Task_r))==(btrue);
  Seen_Context_List_Assertions(Refinement(Task_r))==(BIT <: NATURAL);
  Seen_Context_List_Properties(Refinement(Task_r))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Refinement(Task_r))==(btrue);
  Seen_List_Operations(Refinement(Task_r),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Refinement(Task_r),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Refinement(Task_r),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Refinement(Task_r),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Refinement(Task_r),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Refinement(Task_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Refinement(Task_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Task_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(Task_r),t_create)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_r),t_delete)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_r),t_suspend)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_r),t_resume)==(?);
  List_ANY_Var(Refinement(Task_r),t_getPriority)==(?);
  List_ANY_Var(Refinement(Task_r),t_getCurrent)==(?);
  List_ANY_Var(Refinement(Task_r),t_getNumberOfTasks)==(?);
  List_ANY_Var(Refinement(Task_r),t_delayTask)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_r),t_startScheduler)==((Var(idle_task) == atype(TASK,?,?)),(Var(task) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_endScheduler)==(?);
  List_ANY_Var(Refinement(Task_r),t_resumeAll)==((Var(unblocked) == SetOf(atype(TASK,?,?))),(Var(task) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_incrementTick)==((Var(unblocked) == SetOf(atype(TASK,?,?))),(Var(task) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_unblock)==(?);
  List_ANY_Var(Refinement(Task_r),t_setPriority)==(Var(atask) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_r),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(Task_r)) == (max_prt,IDLE_PRIORITY,schedule_p | ? | t_priority,idle,suspended,ready,running,blocked,tasks,active | ? | t_create,t_delete,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_incrementTick,t_unblock,t_setPriority | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task_r);
  List_Of_HiddenCst_Ids(Refinement(Task_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(Task_r)) == (max_prt,IDLE_PRIORITY,schedule_p);
  List_Of_VisibleVar_Ids(Refinement(Task_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(Task_r)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER);
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
  Constants(Refinement(Task_r)) == (Type(max_prt) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")*btype(INTEGER,"[PRIORITY","]PRIORITY")*btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(IDLE_PRIORITY) == Cst(btype(INTEGER,?,?));Type(schedule_p) == Cst(SetOf(SetOf(atype(TASK,?,?))*SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))*SetOf(atype(TASK,?,?)))))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(Task_r)) == (Type(t_priority) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(idle) == Mvl(atype(TASK,?,?));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(running) == Mvl(atype(TASK,?,?));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(Task_r)) == (Type(t_setPriority) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_unblock) == Cst(No_type,atype(TASK,?,?));Type(t_incrementTick) == Cst(No_type,btype(INTEGER,?,?));Type(t_resumeAll) == Cst(No_type,btype(INTEGER,?,?));Type(t_endScheduler) == Cst(No_type,No_type);Type(t_startScheduler) == Cst(No_type,No_type);Type(t_delayTask) == Cst(No_type,btype(INTEGER,?,?));Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(t_resume) == Cst(No_type,atype(TASK,?,?));Type(t_suspend) == Cst(No_type,atype(TASK,?,?));Type(t_delete) == Cst(No_type,atype(TASK,?,?));Type(t_create) == Cst(atype(TASK,?,?),btype(INTEGER,?,?)))
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
