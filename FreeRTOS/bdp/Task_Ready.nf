Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(Task_Ready))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(Task_Ready))==(Machine(Task));
  Level(Refinement(Task_Ready))==(1);
  Upper_Level(Refinement(Task_Ready))==(Machine(Task))
END
&
THEORY LoadedStructureX IS
  Refinement(Task_Ready)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(Task_Ready))==(FreeRTOSConfig,Types,Scheduler)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(Task_Ready))==(?);
  List_Includes(Refinement(Task_Ready))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(Task_Ready))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(Task_Ready))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(Task_Ready))==(?);
  Context_List_Variables(Refinement(Task_Ready))==(?);
  Abstract_List_Variables(Refinement(Task_Ready))==(idle,running,suspended,runable,blocked,tasks,active);
  Local_List_Variables(Refinement(Task_Ready))==(ready,idle,running,suspended,runable,blocked,tasks,active);
  List_Variables(Refinement(Task_Ready))==(ready,idle,running,suspended,runable,blocked,tasks,active);
  External_List_Variables(Refinement(Task_Ready))==(ready,idle,running,suspended,runable,blocked,tasks,active)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(Task_Ready))==(?);
  Abstract_List_VisibleVariables(Refinement(Task_Ready))==(?);
  External_List_VisibleVariables(Refinement(Task_Ready))==(?);
  Expanded_List_VisibleVariables(Refinement(Task_Ready))==(?);
  List_VisibleVariables(Refinement(Task_Ready))==(?);
  Internal_List_VisibleVariables(Refinement(Task_Ready))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(Task_Ready))==(ready)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(Task_Ready))==(btrue);
  Expanded_List_Invariant(Refinement(Task_Ready))==(btrue);
  Abstract_List_Invariant(Refinement(Task_Ready))==(active: BOOL & tasks: FIN(TASK) & blocked: FIN(TASK) & blocked <: tasks & runable: FIN(TASK) & runable <: tasks & suspended: FIN(TASK) & suspended <: tasks & runable/\blocked = {} & blocked/\suspended = {} & suspended/\runable = {} & tasks = suspended\/blocked\/runable & running: TASK & idle: TASK & (active = TRUE => runable/={} & running: runable & idle: runable & TASK_NULL/:tasks));
  Context_List_Invariant(Refinement(Task_Ready))==(schedulerRunning: BOOL & schedulerSuspended: NATURAL);
  List_Invariant(Refinement(Task_Ready))==(ready: FIN(TASK) & ready <: runable & ready = runable-{running})
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(Task_Ready))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(Task_Ready))==(btrue);
  Abstract_List_Assertions(Refinement(Task_Ready))==(active = TRUE => runable/={};active = TRUE => tasks/={};active = TRUE => idle: runable;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => idle/=TASK_NULL;active = TRUE => running: runable;active = TRUE => running/:blocked;active = TRUE => running/:suspended);
  Context_List_Assertions(Refinement(Task_Ready))==(configMAX_PRIORITIES: NATURAL & BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  List_Assertions(Refinement(Task_Ready))==(running/:ready)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(Task_Ready))==(active,tasks,blocked,runable,suspended,ready:=FALSE,{},{},{},{},{} || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || @(running$0).(running$0: TASK ==> running:=running$0));
  Context_List_Initialisation(Refinement(Task_Ready))==(skip);
  List_Initialisation(Refinement(Task_Ready))==(active:=FALSE || tasks,blocked,runable,suspended,ready:={},{},{},{},{} || idle:: TASK || running:: TASK)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(Task_Ready))==(t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_suspendAll,t_priorityInherit,t_returnPriority);
  List_Operations(Refinement(Task_Ready))==(t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_suspendAll,t_priorityInherit,t_returnPriority)
END
&
THEORY ListInputX IS
  List_Input(Refinement(Task_Ready),t_create)==(priority);
  List_Input(Refinement(Task_Ready),t_delete)==(atask);
  List_Input(Refinement(Task_Ready),t_yield)==(?);
  List_Input(Refinement(Task_Ready),t_suspend)==(stask);
  List_Input(Refinement(Task_Ready),t_resume)==(rtask);
  List_Input(Refinement(Task_Ready),t_getPriority)==(atask);
  List_Input(Refinement(Task_Ready),t_getCurrent)==(?);
  List_Input(Refinement(Task_Ready),t_getNumberOfTasks)==(?);
  List_Input(Refinement(Task_Ready),t_delayTask)==(ticks,task);
  List_Input(Refinement(Task_Ready),t_startScheduler)==(?);
  List_Input(Refinement(Task_Ready),t_endScheduler)==(?);
  List_Input(Refinement(Task_Ready),t_resumeAll)==(unblocked);
  List_Input(Refinement(Task_Ready),t_unblock)==(task);
  List_Input(Refinement(Task_Ready),t_removeFromEventList)==(task);
  List_Input(Refinement(Task_Ready),t_setPriority)==(task,priority);
  List_Input(Refinement(Task_Ready),t_suspendAll)==(?);
  List_Input(Refinement(Task_Ready),t_priorityInherit)==(holderTask,xTicksToWait);
  List_Input(Refinement(Task_Ready),t_returnPriority)==(btask)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(Task_Ready),t_create)==(result);
  List_Output(Refinement(Task_Ready),t_delete)==(?);
  List_Output(Refinement(Task_Ready),t_yield)==(?);
  List_Output(Refinement(Task_Ready),t_suspend)==(?);
  List_Output(Refinement(Task_Ready),t_resume)==(?);
  List_Output(Refinement(Task_Ready),t_getPriority)==(priority);
  List_Output(Refinement(Task_Ready),t_getCurrent)==(result);
  List_Output(Refinement(Task_Ready),t_getNumberOfTasks)==(result);
  List_Output(Refinement(Task_Ready),t_delayTask)==(?);
  List_Output(Refinement(Task_Ready),t_startScheduler)==(?);
  List_Output(Refinement(Task_Ready),t_endScheduler)==(?);
  List_Output(Refinement(Task_Ready),t_resumeAll)==(?);
  List_Output(Refinement(Task_Ready),t_unblock)==(?);
  List_Output(Refinement(Task_Ready),t_removeFromEventList)==(?);
  List_Output(Refinement(Task_Ready),t_setPriority)==(?);
  List_Output(Refinement(Task_Ready),t_suspendAll)==(?);
  List_Output(Refinement(Task_Ready),t_priorityInherit)==(?);
  List_Output(Refinement(Task_Ready),t_returnPriority)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(Task_Ready),t_create)==(result <-- t_create(priority));
  List_Header(Refinement(Task_Ready),t_delete)==(t_delete(atask));
  List_Header(Refinement(Task_Ready),t_yield)==(t_yield);
  List_Header(Refinement(Task_Ready),t_suspend)==(t_suspend(stask));
  List_Header(Refinement(Task_Ready),t_resume)==(t_resume(rtask));
  List_Header(Refinement(Task_Ready),t_getPriority)==(priority <-- t_getPriority(atask));
  List_Header(Refinement(Task_Ready),t_getCurrent)==(result <-- t_getCurrent);
  List_Header(Refinement(Task_Ready),t_getNumberOfTasks)==(result <-- t_getNumberOfTasks);
  List_Header(Refinement(Task_Ready),t_delayTask)==(t_delayTask(ticks,task));
  List_Header(Refinement(Task_Ready),t_startScheduler)==(t_startScheduler);
  List_Header(Refinement(Task_Ready),t_endScheduler)==(t_endScheduler);
  List_Header(Refinement(Task_Ready),t_resumeAll)==(t_resumeAll(unblocked));
  List_Header(Refinement(Task_Ready),t_unblock)==(t_unblock(task));
  List_Header(Refinement(Task_Ready),t_removeFromEventList)==(t_removeFromEventList(task));
  List_Header(Refinement(Task_Ready),t_setPriority)==(t_setPriority(task,priority));
  List_Header(Refinement(Task_Ready),t_suspendAll)==(t_suspendAll);
  List_Header(Refinement(Task_Ready),t_priorityInherit)==(t_priorityInherit(holderTask,xTicksToWait));
  List_Header(Refinement(Task_Ready),t_returnPriority)==(t_returnPriority(btask))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(Task_Ready),t_create)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_create)==(priority: PRIORITY);
  Own_Precondition(Refinement(Task_Ready),t_delete)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_delete)==(atask: TASK & atask: tasks & atask/=idle);
  Own_Precondition(Refinement(Task_Ready),t_yield)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_yield)==(active = TRUE);
  Own_Precondition(Refinement(Task_Ready),t_suspend)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_suspend)==(stask: TASK & stask: tasks & stask/=idle);
  Own_Precondition(Refinement(Task_Ready),t_resume)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_resume)==(rtask: TASK & rtask: suspended & active = TRUE);
  Own_Precondition(Refinement(Task_Ready),t_getPriority)==(atask: TASK & atask: tasks);
  List_Precondition(Refinement(Task_Ready),t_getPriority)==(atask: TASK & atask: tasks & atask: TASK & atask: tasks);
  Own_Precondition(Refinement(Task_Ready),t_getCurrent)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_getCurrent)==(btrue);
  Own_Precondition(Refinement(Task_Ready),t_getNumberOfTasks)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_getNumberOfTasks)==(btrue);
  Own_Precondition(Refinement(Task_Ready),t_delayTask)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_delayTask)==(task: TASK & task = running & running: runable & running/=idle & ticks: TICK);
  Own_Precondition(Refinement(Task_Ready),t_startScheduler)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_startScheduler)==(active = FALSE);
  Own_Precondition(Refinement(Task_Ready),t_endScheduler)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_endScheduler)==(active = TRUE);
  Own_Precondition(Refinement(Task_Ready),t_resumeAll)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_resumeAll)==(unblocked: FIN(TASK) & unblocked <: blocked & running: runable);
  Own_Precondition(Refinement(Task_Ready),t_unblock)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_unblock)==(task: TASK & task: blocked & active = TRUE);
  Own_Precondition(Refinement(Task_Ready),t_removeFromEventList)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_removeFromEventList)==(task: TASK & task: blocked\/suspended & active = TRUE);
  Own_Precondition(Refinement(Task_Ready),t_setPriority)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle & active = TRUE);
  Own_Precondition(Refinement(Task_Ready),t_suspendAll)==(active = TRUE);
  List_Precondition(Refinement(Task_Ready),t_suspendAll)==(active = TRUE & active = TRUE);
  Own_Precondition(Refinement(Task_Ready),t_priorityInherit)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_priorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: runable & active = TRUE);
  Own_Precondition(Refinement(Task_Ready),t_returnPriority)==(btrue);
  List_Precondition(Refinement(Task_Ready),t_returnPriority)==(btask: TASK & btask: tasks & btask: blocked\/suspended & active = TRUE & running/=idle)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(Task_Ready),t_returnPriority)==(btask: TASK & btask: tasks & btask: blocked\/suspended & active = TRUE & running/=idle | btask: blocked ==> blocked:=blocked-{btask} [] not(btask: blocked) ==> skip || (btask: suspended ==> suspended:=suspended-{btask} [] not(btask: suspended) ==> skip) || @(n_runable,nready,nrunning).(n_runable <: tasks & nready <: tasks & n_runable = runable\/{btask} & nready = ready\/{btask} & nrunning: nready ==> (runable:=n_runable || (running,ready:=nrunning,nready-{nrunning}\/{running} [] ready:=nready))));
  Expanded_List_Substitution(Refinement(Task_Ready),t_priorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: runable & active = TRUE | @(n_runable,nrunning).(n_runable <: tasks & n_runable = runable-{running} & nrunning: ready ==> running,ready,runable:=nrunning,ready-{nrunning},n_runable) || blocked:=blocked\/{running});
  Expanded_List_Substitution(Refinement(Task_Ready),t_suspendAll)==(active = TRUE & active = TRUE | active:=FALSE);
  Expanded_List_Substitution(Refinement(Task_Ready),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle & active = TRUE | @nrunning.(nrunning: ready ==> running,ready:=nrunning,(ready\/{running})-{nrunning}) [] skip);
  Expanded_List_Substitution(Refinement(Task_Ready),t_removeFromEventList)==(task: TASK & task: blocked\/suspended & active = TRUE | task: blocked ==> blocked:=blocked-{task} [] not(task: blocked) ==> skip || (task: suspended ==> suspended:=suspended-{task} [] not(task: suspended) ==> skip) || @(n_runable,nready).(n_runable <: tasks & nready <: tasks & n_runable = runable\/{task} & nready = ready\/{task} ==> (runable:=n_runable || (@nrunning.(nrunning: nready ==> running,ready:=nrunning,nready-{nrunning}\/{running}) [] ready:=nready))));
  Expanded_List_Substitution(Refinement(Task_Ready),t_unblock)==(task: TASK & task: blocked & active = TRUE | blocked:=blocked-{task} || @(n_runable,nready).(n_runable <: tasks & nready <: tasks & n_runable = runable\/{task} & nready = ready\/{task} ==> (runable:=n_runable || (@nrunning.(nrunning: nready ==> running,ready:=nrunning,nready-{nrunning}\/{running}) [] ready:=nready))));
  Expanded_List_Substitution(Refinement(Task_Ready),t_resumeAll)==(unblocked: FIN(TASK) & unblocked <: blocked & running: runable | unblocked/={} ==> (@(n_runable,nready).(n_runable <: tasks & nready <: tasks & n_runable = runable\/unblocked & nready = ready\/unblocked ==> (runable:=n_runable || (@nrunning.(nrunning: nready ==> running,ready:=nrunning,nready-{nrunning}\/{running}) [] ready:=nready))) || blocked:=blocked-unblocked) [] not(unblocked/={}) ==> skip);
  Expanded_List_Substitution(Refinement(Task_Ready),t_endScheduler)==(active = TRUE | active,tasks,blocked,suspended,runable,ready:=FALSE,{},{},{},{},{});
  Expanded_List_Substitution(Refinement(Task_Ready),t_startScheduler)==(active = FALSE | active:=TRUE || @(idle_task,n_runable).(idle_task: TASK & idle_task/:tasks & n_runable <: tasks & n_runable = runable\/{idle_task} ==> (idle,tasks:=idle_task,tasks\/{idle_task} || @(running$0).(running$0: n_runable ==> running:=running$0))));
  Expanded_List_Substitution(Refinement(Task_Ready),t_delayTask)==(task: TASK & task = running & running: runable & running/=idle & ticks: TICK | @n_runable.(n_runable <: tasks & n_runable = runable-{running} ==> (runable:=n_runable || @nrunning.(nrunning: ready ==> running,ready:=nrunning,ready-{nrunning}))) || blocked:=blocked\/{running});
  Expanded_List_Substitution(Refinement(Task_Ready),t_getNumberOfTasks)==(btrue | result:=card(tasks));
  Expanded_List_Substitution(Refinement(Task_Ready),t_getCurrent)==(btrue | result:=running);
  Expanded_List_Substitution(Refinement(Task_Ready),t_getPriority)==(atask: TASK & atask: tasks & atask: TASK & atask: tasks | @(priority$0).(priority$0: PRIORITY ==> priority:=priority$0));
  Expanded_List_Substitution(Refinement(Task_Ready),t_resume)==(rtask: TASK & rtask: suspended & active = TRUE | @n_runable.(n_runable <: tasks & n_runable = runable\/{rtask} ==> (runable:=n_runable || (@(nrunning,nready).(nready <: tasks & nready = ready\/{rtask} & nrunning: nready ==> running,ready:=nrunning,nready-{nrunning}\/{running}) [] ready:=ready\/{rtask}))) || suspended:=suspended-{rtask});
  Expanded_List_Substitution(Refinement(Task_Ready),t_suspend)==(stask: TASK & stask: tasks & stask/=idle | stask: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{stask} ==> (runable:=n_runable || (stask = running ==> @nrunning.(nrunning: ready ==> running,ready:=nrunning,ready-{nrunning}-{stask}) [] not(stask = running) ==> ready:=ready-{stask}))) [] not(stask: runable) ==> (stask: blocked ==> blocked:=blocked-{stask} [] not(stask: blocked) ==> skip) || suspended:=suspended\/{stask});
  Expanded_List_Substitution(Refinement(Task_Ready),t_yield)==(active = TRUE | @nrunning.(nrunning: ready ==> running,ready:=nrunning,ready-{nrunning}\/{running}));
  Expanded_List_Substitution(Refinement(Task_Ready),t_delete)==(atask: TASK & atask: tasks & atask/=idle | tasks:=tasks-{atask} || (atask: runable ==> (runable:=runable-{atask} || (atask = running ==> (active = TRUE ==> @nrunning.(nrunning: ready ==> running,ready:=nrunning,ready-{nrunning}) [] not(active = TRUE) ==> skip) [] not(atask = running) ==> ready:=ready-{atask})) [] not(atask: runable) ==> (atask: blocked ==> blocked:=blocked-{atask} [] not(atask: blocked) ==> (atask: suspended ==> suspended:=suspended-{atask} [] not(atask: suspended) ==> skip))));
  Expanded_List_Substitution(Refinement(Task_Ready),t_create)==(priority: PRIORITY | @(task,n_ready,nrunning).(task: TASK & task/:tasks & n_ready <: tasks & n_ready = runable\/{task} & task/=TASK_NULL & nrunning: n_ready ==> (tasks:=tasks\/{task} || (ready:=n_ready [] running,ready:=nrunning,n_ready-{nrunning}) || result:=task)));
  List_Substitution(Refinement(Task_Ready),t_create)==(ANY task,n_ready,nrunning WHERE task: TASK & task/:tasks & n_ready <: tasks & n_ready = runable\/{task} & task/=TASK_NULL & nrunning: n_ready THEN tasks:=tasks\/{task} || CHOICE ready:=n_ready OR running:=nrunning || ready:=n_ready-{nrunning} END || result:=task END);
  List_Substitution(Refinement(Task_Ready),t_delete)==(tasks:=tasks-{atask} || IF atask: runable THEN runable:=runable-{atask} || IF atask = running THEN IF active = TRUE THEN ANY nrunning WHERE nrunning: ready THEN running:=nrunning || ready:=ready-{nrunning} END END ELSE ready:=ready-{atask} END ELSIF atask: blocked THEN blocked:=blocked-{atask} ELSIF atask: suspended THEN suspended:=suspended-{atask} END);
  List_Substitution(Refinement(Task_Ready),t_yield)==(ANY nrunning WHERE nrunning: ready THEN running:=nrunning || ready:=ready-{nrunning}\/{running} END);
  List_Substitution(Refinement(Task_Ready),t_suspend)==(IF stask: runable THEN ANY n_runable WHERE n_runable <: tasks & n_runable = runable-{stask} THEN runable:=n_runable || IF stask = running THEN ANY nrunning WHERE nrunning: ready THEN running:=nrunning || ready:=ready-{nrunning}-{stask} END ELSE ready:=ready-{stask} END END ELSIF stask: blocked THEN blocked:=blocked-{stask} END || suspended:=suspended\/{stask});
  List_Substitution(Refinement(Task_Ready),t_resume)==(ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/{rtask} THEN runable:=n_runable || CHOICE ANY nrunning,nready WHERE nready <: tasks & nready = ready\/{rtask} & nrunning: nready THEN running:=nrunning || ready:=nready-{nrunning}\/{running} END OR ready:=ready\/{rtask} END END || suspended:=suspended-{rtask});
  List_Substitution(Refinement(Task_Ready),t_getPriority)==(priority:: PRIORITY);
  List_Substitution(Refinement(Task_Ready),t_getCurrent)==(result:=running);
  List_Substitution(Refinement(Task_Ready),t_getNumberOfTasks)==(result:=card(tasks));
  List_Substitution(Refinement(Task_Ready),t_delayTask)==(ANY n_runable WHERE n_runable <: tasks & n_runable = runable-{running} THEN runable:=n_runable || ANY nrunning WHERE nrunning: ready THEN running:=nrunning || ready:=ready-{nrunning} END END || blocked:=blocked\/{running});
  List_Substitution(Refinement(Task_Ready),t_startScheduler)==(active:=TRUE || ANY idle_task,n_runable WHERE idle_task: TASK & idle_task/:tasks & n_runable <: tasks & n_runable = runable\/{idle_task} THEN idle:=idle_task || tasks:=tasks\/{idle_task} || running:: n_runable END);
  List_Substitution(Refinement(Task_Ready),t_endScheduler)==(active:=FALSE || tasks,blocked,suspended,runable,ready:={},{},{},{},{});
  List_Substitution(Refinement(Task_Ready),t_resumeAll)==(IF unblocked/={} THEN ANY n_runable,nready WHERE n_runable <: tasks & nready <: tasks & n_runable = runable\/unblocked & nready = ready\/unblocked THEN runable:=n_runable || CHOICE ANY nrunning WHERE nrunning: nready THEN running:=nrunning || ready:=nready-{nrunning}\/{running} END OR ready:=nready END END || blocked:=blocked-unblocked END);
  List_Substitution(Refinement(Task_Ready),t_unblock)==(blocked:=blocked-{task} || ANY n_runable,nready WHERE n_runable <: tasks & nready <: tasks & n_runable = runable\/{task} & nready = ready\/{task} THEN runable:=n_runable || CHOICE ANY nrunning WHERE nrunning: nready THEN running:=nrunning || ready:=nready-{nrunning}\/{running} END OR ready:=nready END END);
  List_Substitution(Refinement(Task_Ready),t_removeFromEventList)==(IF task: blocked THEN blocked:=blocked-{task} END || IF task: suspended THEN suspended:=suspended-{task} END || ANY n_runable,nready WHERE n_runable <: tasks & nready <: tasks & n_runable = runable\/{task} & nready = ready\/{task} THEN runable:=n_runable || CHOICE ANY nrunning WHERE nrunning: nready THEN running:=nrunning || ready:=nready-{nrunning}\/{running} END OR ready:=nready END END);
  List_Substitution(Refinement(Task_Ready),t_setPriority)==(CHOICE ANY nrunning WHERE nrunning: ready THEN running:=nrunning || ready:=(ready\/{running})-{nrunning} END OR skip END);
  List_Substitution(Refinement(Task_Ready),t_suspendAll)==(active:=FALSE);
  List_Substitution(Refinement(Task_Ready),t_priorityInherit)==(ANY n_runable,nrunning WHERE n_runable <: tasks & n_runable = runable-{running} & nrunning: ready THEN running:=nrunning || ready:=ready-{nrunning} || runable:=n_runable END || blocked:=blocked\/{running});
  List_Substitution(Refinement(Task_Ready),t_returnPriority)==(IF btask: blocked THEN blocked:=blocked-{btask} END || IF btask: suspended THEN suspended:=suspended-{btask} END || ANY n_runable,nready,nrunning WHERE n_runable <: tasks & nready <: tasks & n_runable = runable\/{btask} & nready = ready\/{btask} & nrunning: nready THEN runable:=n_runable || CHOICE running:=nrunning || ready:=nready-{nrunning}\/{running} OR ready:=nready END END)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(Task_Ready))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(Task_Ready),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Refinement(Task_Ready),Machine(Types))==(?);
  List_Instanciated_Parameters(Refinement(Task_Ready),Machine(Scheduler))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(Task_Ready))==(btrue);
  List_Context_Constraints(Refinement(Task_Ready))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(Task_Ready))==(?);
  Inherited_List_Constants(Refinement(Task_Ready))==(?);
  List_Constants(Refinement(Task_Ready))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(Task_Ready),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Refinement(Task_Ready))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Refinement(Task_Ready))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Refinement(Task_Ready))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Refinement(Task_Ready))==(?);
  Inherited_List_Enumerated(Refinement(Task_Ready))==(?);
  Inherited_List_Defered(Refinement(Task_Ready))==(?);
  Inherited_List_Sets(Refinement(Task_Ready))==(?);
  List_Enumerated(Refinement(Task_Ready))==(?);
  List_Defered(Refinement(Task_Ready))==(?);
  List_Sets(Refinement(Task_Ready))==(?);
  Set_Definition(Refinement(Task_Ready),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(Task_Ready),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Task_Ready),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(Task_Ready))==(?);
  Expanded_List_HiddenConstants(Refinement(Task_Ready))==(?);
  List_HiddenConstants(Refinement(Task_Ready))==(?);
  External_List_HiddenConstants(Refinement(Task_Ready))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(Task_Ready))==(btrue);
  Context_List_Properties(Refinement(Task_Ready))==(configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & PRIORITY = 0..configMAX_PRIORITIES-1 & BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Refinement(Task_Ready))==(btrue);
  List_Properties(Refinement(Task_Ready))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(Task_Ready),Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  Seen_Context_List_Enumerated(Refinement(Task_Ready))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Refinement(Task_Ready))==(btrue);
  Seen_Context_List_Assertions(Refinement(Task_Ready))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  Seen_Context_List_Properties(Refinement(Task_Ready))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Refinement(Task_Ready))==(btrue);
  Seen_List_Precondition(Refinement(Task_Ready),resumeScheduler)==(schedulerSuspended>0);
  Seen_Expanded_List_Substitution(Refinement(Task_Ready),resumeScheduler)==(schedulerSuspended:=schedulerSuspended-1);
  Seen_List_Precondition(Refinement(Task_Ready),suspendScheduler)==(schedulerSuspended<MAXINT);
  Seen_Expanded_List_Substitution(Refinement(Task_Ready),suspendScheduler)==(schedulerSuspended:=schedulerSuspended+1);
  Seen_List_Precondition(Refinement(Task_Ready),stopScheduler)==(schedulerRunning = TRUE);
  Seen_Expanded_List_Substitution(Refinement(Task_Ready),stopScheduler)==(schedulerRunning:=FALSE);
  Seen_List_Precondition(Refinement(Task_Ready),startScheduler)==(schedulerRunning = FALSE);
  Seen_Expanded_List_Substitution(Refinement(Task_Ready),startScheduler)==(schedulerRunning:=TRUE);
  Seen_List_Operations(Refinement(Task_Ready),Machine(Scheduler))==(startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  Seen_Expanded_List_Invariant(Refinement(Task_Ready),Machine(Scheduler))==(btrue);
  Seen_Internal_List_Operations(Refinement(Task_Ready),Machine(Types))==(?);
  Seen_List_Operations(Refinement(Task_Ready),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Refinement(Task_Ready),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Refinement(Task_Ready),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Refinement(Task_Ready),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Refinement(Task_Ready),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Refinement(Task_Ready),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Refinement(Task_Ready),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(Task_Ready),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Task_Ready),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(Task_Ready),t_create)==((Var(task) == atype(TASK,?,?)),(Var(n_ready) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_Ready),t_delete)==(Var(nrunning) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_Ready),t_yield)==(Var(nrunning) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_Ready),t_suspend)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_Ready),t_resume)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)),(Var(nready) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Refinement(Task_Ready),t_getPriority)==(?);
  List_ANY_Var(Refinement(Task_Ready),t_getCurrent)==(?);
  List_ANY_Var(Refinement(Task_Ready),t_getNumberOfTasks)==(?);
  List_ANY_Var(Refinement(Task_Ready),t_delayTask)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_Ready),t_startScheduler)==((Var(idle_task) == atype(TASK,?,?)),(Var(n_runable) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Refinement(Task_Ready),t_endScheduler)==(?);
  List_ANY_Var(Refinement(Task_Ready),t_resumeAll)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(nready) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_Ready),t_unblock)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(nready) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_Ready),t_removeFromEventList)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(nready) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_Ready),t_setPriority)==(Var(nrunning) == atype(TASK,?,?));
  List_ANY_Var(Refinement(Task_Ready),t_suspendAll)==(?);
  List_ANY_Var(Refinement(Task_Ready),t_priorityInherit)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_Ready),t_returnPriority)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(nready) == SetOf(atype(TASK,?,?))),(Var(nrunning) == atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_Ready),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(Task_Ready)) == (? | ? | ready,idle,running,suspended,runable,blocked,tasks,active | ? | t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_suspendAll,t_priorityInherit,t_returnPriority | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)),seen(Machine(Scheduler)) | ? | Task_Ready);
  List_Of_HiddenCst_Ids(Refinement(Task_Ready)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(Task_Ready)) == (?);
  List_Of_VisibleVar_Ids(Refinement(Task_Ready)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(Task_Ready)) == (?: ?);
  List_Of_Ids(Machine(Scheduler)) == (? | ? | schedulerSuspended,schedulerRunning | ? | startScheduler,stopScheduler,suspendScheduler,resumeScheduler | ? | seen(Machine(Types)) | ? | Scheduler);
  List_Of_HiddenCst_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Scheduler)) == (?);
  List_Of_VisibleVar_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Scheduler)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(Task_Ready)) == (Type(ready) == Mvl(SetOf(atype(TASK,?,?)));Type(idle) == Mvl(atype(TASK,?,?));Type(running) == Mvl(atype(TASK,?,?));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(runable) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(Task_Ready)) == (Type(t_returnPriority) == Cst(No_type,atype(TASK,?,?));Type(t_priorityInherit) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_suspendAll) == Cst(No_type,No_type);Type(t_setPriority) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_removeFromEventList) == Cst(No_type,atype(TASK,?,?));Type(t_unblock) == Cst(No_type,atype(TASK,?,?));Type(t_resumeAll) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(t_endScheduler) == Cst(No_type,No_type);Type(t_startScheduler) == Cst(No_type,No_type);Type(t_delayTask) == Cst(No_type,btype(INTEGER,?,?)*atype(TASK,?,?));Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(t_resume) == Cst(No_type,atype(TASK,?,?));Type(t_suspend) == Cst(No_type,atype(TASK,?,?));Type(t_yield) == Cst(No_type,No_type);Type(t_delete) == Cst(No_type,atype(TASK,?,?));Type(t_create) == Cst(atype(TASK,?,?),btype(INTEGER,?,?)))
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
