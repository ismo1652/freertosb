Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Task_Concern))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Task_Concern))==(Machine(Task_Concern));
  Level(Machine(Task_Concern))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Task_Concern)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Task_Concern))==(Types,FreeRTOSConfig)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Task_Concern))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Task_Concern))==(Memory);
  List_Includes(Machine(Task_Concern))==(Memory)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Task_Concern))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Task_Concern))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Task_Concern))==(?);
  Context_List_Variables(Machine(Task_Concern))==(?);
  Abstract_List_Variables(Machine(Task_Concern))==(?);
  Local_List_Variables(Machine(Task_Concern))==(uxSchedulerSuspended,xSchedulerRunning,uxTasksDeleted,uxTopUsedPriority,uxCurrentNumberOfTasks,pxDelayedTaskList,xSuspendedTaskList,xTasksWaitingTermination,pxReadyTasksLists,pxCurrentTCB,readyTasks,tasks);
  List_Variables(Machine(Task_Concern))==(uxSchedulerSuspended,xSchedulerRunning,uxTasksDeleted,uxTopUsedPriority,uxCurrentNumberOfTasks,pxDelayedTaskList,xSuspendedTaskList,xTasksWaitingTermination,pxReadyTasksLists,pxCurrentTCB,readyTasks,tasks,heap);
  External_List_Variables(Machine(Task_Concern))==(uxSchedulerSuspended,xSchedulerRunning,uxTasksDeleted,uxTopUsedPriority,uxCurrentNumberOfTasks,pxDelayedTaskList,xSuspendedTaskList,xTasksWaitingTermination,pxReadyTasksLists,pxCurrentTCB,readyTasks,tasks,heap)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Task_Concern))==(?);
  Abstract_List_VisibleVariables(Machine(Task_Concern))==(?);
  External_List_VisibleVariables(Machine(Task_Concern))==(?);
  Expanded_List_VisibleVariables(Machine(Task_Concern))==(?);
  List_VisibleVariables(Machine(Task_Concern))==(?);
  Internal_List_VisibleVariables(Machine(Task_Concern))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Task_Concern))==(btrue);
  Gluing_List_Invariant(Machine(Task_Concern))==(btrue);
  Abstract_List_Invariant(Machine(Task_Concern))==(btrue);
  Expanded_List_Invariant(Machine(Task_Concern))==(heap: HEAP_SIZE);
  Context_List_Invariant(Machine(Task_Concern))==(btrue);
  List_Invariant(Machine(Task_Concern))==(tasks <: TASK & pxCurrentTCB: TASK & pxReadyTasksLists: PRIORITIES >+> POW(TASK) & !(pr,tk).(pr: PRIORITIES & tk: TASK & tk: pxReadyTasksLists(pr) => getPriority(tk) = pr) & readyTasks <: TASK & xTasksWaitingTermination <: TASK & xSuspendedTaskList <: TASK & pxDelayedTaskList <: TASK & readyTasks = UNION(pr).(pr: PRIORITIES | {tk | tk: TASK & tk: pxReadyTasksLists(pr)}) & xSuspendedTaskList/\xTasksWaitingTermination = {} & pxDelayedTaskList/\xTasksWaitingTermination = {} & pxDelayedTaskList/\xSuspendedTaskList = {} & readyTasks/\xTasksWaitingTermination = {} & xSuspendedTaskList/\readyTasks = {} & pxDelayedTaskList/\readyTasks = {} & !(p1,p2).(p1: PRIORITIES & p2: PRIORITIES & p1/=p2 => pxReadyTasksLists(p1)/\pxReadyTasksLists(p2) = {}) & !tk.(tk: readyTasks => getPriority(tk)<=getPriority(pxCurrentTCB)) & tasks = xSuspendedTaskList\/xTasksWaitingTermination\/pxDelayedTaskList\/readyTasks\/{pxCurrentTCB} & uxCurrentNumberOfTasks: NATURAL & uxCurrentNumberOfTasks = card(tasks) & uxTopUsedPriority: PRIORITIES & uxTasksDeleted: NATURAL & xSchedulerRunning: BIT & uxSchedulerSuspended: NATURAL)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Task_Concern))==(btrue);
  Expanded_List_Assertions(Machine(Task_Concern))==(btrue);
  Context_List_Assertions(Machine(Task_Concern))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(Task_Concern))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Task_Concern))==(heap:=configTOTAL_HEAP_SIZE;(tasks,pxReadyTasksLists,readyTasks,xTasksWaitingTermination,uxCurrentNumberOfTasks,uxTopUsedPriority:={},PRIORITIES*{},{},{},0,0 || @(pxCurrentTCB$0).(pxCurrentTCB$0: {} ==> pxCurrentTCB:=pxCurrentTCB$0) || xSuspendedTaskList:={} || pxDelayedTaskList:={} || uxTasksDeleted:=0 || xSchedulerRunning:=pdFALSE || uxSchedulerSuspended:=0));
  Context_List_Initialisation(Machine(Task_Concern))==(skip);
  List_Initialisation(Machine(Task_Concern))==(tasks:={} || pxReadyTasksLists:=PRIORITIES*{} || readyTasks:={} || xTasksWaitingTermination:={} || uxCurrentNumberOfTasks:=0 || uxTopUsedPriority:=0 || pxCurrentTCB:: {} || xSuspendedTaskList:={} || pxDelayedTaskList:={} || uxTasksDeleted:=0 || xSchedulerRunning:=pdFALSE || uxSchedulerSuspended:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Task_Concern))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Task_Concern),Machine(Memory))==(?);
  List_Instanciated_Parameters(Machine(Task_Concern),Machine(Types))==(?);
  List_Instanciated_Parameters(Machine(Task_Concern),Machine(FreeRTOSConfig))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Task_Concern),Machine(Memory))==(btrue);
  List_Context_Constraints(Machine(Task_Concern))==(btrue);
  List_Constraints(Machine(Task_Concern))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Task_Concern))==(xTaskCreate,vTaskDelete,prvIdleTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,vTaskPrioritySet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,taskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll);
  List_Operations(Machine(Task_Concern))==(xTaskCreate,vTaskDelete,prvIdleTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,vTaskPrioritySet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,taskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll)
END
&
THEORY ListInputX IS
  List_Input(Machine(Task_Concern),xTaskCreate)==(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority);
  List_Input(Machine(Task_Concern),vTaskDelete)==(pxTaskToDelete);
  List_Input(Machine(Task_Concern),prvIdleTask)==(pvParameters);
  List_Input(Machine(Task_Concern),vTaskSuspend)==(pxTaskToSuspend);
  List_Input(Machine(Task_Concern),vTaskResume)==(pxTaskToResume);
  List_Input(Machine(Task_Concern),uxTaskPriorityGet)==(pxTask);
  List_Input(Machine(Task_Concern),vTaskPrioritySet)==(pxTask,uxNewPriority);
  List_Input(Machine(Task_Concern),xTaskGetCurrentTaskHandle)==(?);
  List_Input(Machine(Task_Concern),uxTaskGetNumberOfTasks)==(?);
  List_Input(Machine(Task_Concern),xTaskGetSchedulerState)==(?);
  List_Input(Machine(Task_Concern),taskStartScheduler)==(?);
  List_Input(Machine(Task_Concern),vTaskEndScheduler)==(?);
  List_Input(Machine(Task_Concern),vTaskSuspendAll)==(?);
  List_Input(Machine(Task_Concern),xTaskResumeAll)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Task_Concern),xTaskCreate)==(zz,handle);
  List_Output(Machine(Task_Concern),vTaskDelete)==(?);
  List_Output(Machine(Task_Concern),prvIdleTask)==(?);
  List_Output(Machine(Task_Concern),vTaskSuspend)==(rr);
  List_Output(Machine(Task_Concern),vTaskResume)==(?);
  List_Output(Machine(Task_Concern),uxTaskPriorityGet)==(priority);
  List_Output(Machine(Task_Concern),vTaskPrioritySet)==(?);
  List_Output(Machine(Task_Concern),xTaskGetCurrentTaskHandle)==(rr);
  List_Output(Machine(Task_Concern),uxTaskGetNumberOfTasks)==(numberOfTasks);
  List_Output(Machine(Task_Concern),xTaskGetSchedulerState)==(xReturn);
  List_Output(Machine(Task_Concern),taskStartScheduler)==(?);
  List_Output(Machine(Task_Concern),vTaskEndScheduler)==(?);
  List_Output(Machine(Task_Concern),vTaskSuspendAll)==(?);
  List_Output(Machine(Task_Concern),xTaskResumeAll)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Task_Concern),xTaskCreate)==(zz,handle <-- xTaskCreate(pvTaskCode,pcName,usStackDepth,pvParameters,uxPriority));
  List_Header(Machine(Task_Concern),vTaskDelete)==(vTaskDelete(pxTaskToDelete));
  List_Header(Machine(Task_Concern),prvIdleTask)==(prvIdleTask(pvParameters));
  List_Header(Machine(Task_Concern),vTaskSuspend)==(rr <-- vTaskSuspend(pxTaskToSuspend));
  List_Header(Machine(Task_Concern),vTaskResume)==(vTaskResume(pxTaskToResume));
  List_Header(Machine(Task_Concern),uxTaskPriorityGet)==(priority <-- uxTaskPriorityGet(pxTask));
  List_Header(Machine(Task_Concern),vTaskPrioritySet)==(vTaskPrioritySet(pxTask,uxNewPriority));
  List_Header(Machine(Task_Concern),xTaskGetCurrentTaskHandle)==(rr <-- xTaskGetCurrentTaskHandle);
  List_Header(Machine(Task_Concern),uxTaskGetNumberOfTasks)==(numberOfTasks <-- uxTaskGetNumberOfTasks);
  List_Header(Machine(Task_Concern),xTaskGetSchedulerState)==(xReturn <-- xTaskGetSchedulerState);
  List_Header(Machine(Task_Concern),taskStartScheduler)==(taskStartScheduler);
  List_Header(Machine(Task_Concern),vTaskEndScheduler)==(vTaskEndScheduler);
  List_Header(Machine(Task_Concern),vTaskSuspendAll)==(vTaskSuspendAll);
  List_Header(Machine(Task_Concern),xTaskResumeAll)==(xTaskResumeAll)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Task_Concern),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters: POW(PARAMETER) & uxPriority: PRIORITIES);
  List_Precondition(Machine(Task_Concern),vTaskDelete)==(pxTaskToDelete: TASK & INCLUDE_vTaskDelete = 1 & pxTaskToDelete/:xTasksWaitingTermination & pxTaskToDelete: tasks);
  List_Precondition(Machine(Task_Concern),prvIdleTask)==(pvParameters: PARAMETER);
  List_Precondition(Machine(Task_Concern),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks);
  List_Precondition(Machine(Task_Concern),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: xSuspendedTaskList);
  List_Precondition(Machine(Task_Concern),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1);
  List_Precondition(Machine(Task_Concern),vTaskPrioritySet)==(pxTask: TASK & uxNewPriority: PRIORITIES & INCLUDE_vTaskPrioritySet = 1);
  List_Precondition(Machine(Task_Concern),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1);
  List_Precondition(Machine(Task_Concern),uxTaskGetNumberOfTasks)==(btrue);
  List_Precondition(Machine(Task_Concern),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1);
  List_Precondition(Machine(Task_Concern),taskStartScheduler)==(xSchedulerRunning = pdFALSE);
  List_Precondition(Machine(Task_Concern),vTaskEndScheduler)==(xSchedulerRunning = pdTRUE);
  List_Precondition(Machine(Task_Concern),vTaskSuspendAll)==(btrue);
  List_Precondition(Machine(Task_Concern),xTaskResumeAll)==(uxSchedulerSuspended>0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Task_Concern),xTaskResumeAll)==(uxSchedulerSuspended>0 | uxSchedulerSuspended:=uxSchedulerSuspended-1);
  Expanded_List_Substitution(Machine(Task_Concern),vTaskSuspendAll)==(btrue | uxSchedulerSuspended:=uxSchedulerSuspended+1);
  Expanded_List_Substitution(Machine(Task_Concern),vTaskEndScheduler)==(xSchedulerRunning = pdTRUE | xSchedulerRunning:=pdFALSE);
  Expanded_List_Substitution(Machine(Task_Concern),taskStartScheduler)==(xSchedulerRunning = pdFALSE | xSchedulerRunning:=pdTRUE);
  Expanded_List_Substitution(Machine(Task_Concern),xTaskGetSchedulerState)==(INCLUDE_xTaskGetSchedulerState = 1 | xSchedulerRunning = pdFALSE ==> xReturn:=taskSCHEDULER_NOT_STARTED [] not(xSchedulerRunning = pdFALSE) ==> (uxSchedulerSuspended = pdFALSE ==> xReturn:=taskSCHEDULER_RUNNING [] not(uxSchedulerSuspended = pdFALSE) ==> xReturn:=taskSCHEDULER_SUSPENDED));
  Expanded_List_Substitution(Machine(Task_Concern),uxTaskGetNumberOfTasks)==(btrue | numberOfTasks:=uxCurrentNumberOfTasks);
  Expanded_List_Substitution(Machine(Task_Concern),xTaskGetCurrentTaskHandle)==(INCLUDE_xTaskGetCurrentTaskHandle = 1 | rr:=pxCurrentTCB);
  Expanded_List_Substitution(Machine(Task_Concern),vTaskPrioritySet)==(pxTask: TASK & uxNewPriority: PRIORITIES & INCLUDE_vTaskPrioritySet = 1 | @any(name,priority,task_code,stack,new_task).(name,priority,task_code,stack: NAME*PRIORITIES*TASK_CODE*STACK & name,priority,task_code,stack = pxTask & new_task: TASK & new_task/:tasks & new_task = name,uxNewPriority,task_code,stack ==> (uxNewPriority/=priority ==> (pxTask: readyTasks ==> (uxNewPriority<priority ==> pxReadyTasksLists,readyTasks:=pxReadyTasksLists<+{priority|->pxReadyTasksLists(priority)-{pxTask},uxNewPriority|->(pxReadyTasksLists(uxNewPriority)\/{new_task})},readyTasks-{pxTask}\/{new_task} [] not(uxNewPriority<priority) ==> pxReadyTasksLists,pxCurrentTCB,readyTasks:=pxReadyTasksLists<+{getPriority(pxCurrentTCB)|->(pxReadyTasksLists(getPriority(pxCurrentTCB))\/{pxCurrentTCB,new_task})},TASK_NULL,readyTasks-{pxTask}\/{new_task,pxCurrentTCB} || (pxTask: xSuspendedTaskList ==> xSuspendedTaskList:=xSuspendedTaskList-{pxTask}\/{new_task} [] not(pxTask: xSuspendedTaskList) ==> pxDelayedTaskList:=pxDelayedTaskList-{pxTask}\/{new_task})) [] not(pxTask: readyTasks) ==> skip || (uxNewPriority>uxTopUsedPriority ==> uxTopUsedPriority:=uxNewPriority [] not(uxNewPriority>uxTopUsedPriority) ==> skip)) [] not(uxNewPriority/=priority) ==> skip)));
  Expanded_List_Substitution(Machine(Task_Concern),uxTaskPriorityGet)==(pxTask: TASK & pxTask: tasks & INCLUDE_uxTaskPriorityGet = 1 | priority:=getPriority(pxTask));
  Expanded_List_Substitution(Machine(Task_Concern),vTaskResume)==(INCLUDE_vTaskSuspend = 1 & pxTaskToResume: xSuspendedTaskList | @any(pr).(pr: PRIORITIES & pr = getPriority(pxTaskToResume) ==> (xSuspendedTaskList,pxReadyTasksLists:=xSuspendedTaskList-{pxTaskToResume},pxReadyTasksLists<+{pr|->(pxReadyTasksLists(pr)\/{pxTaskToResume})} || (pr>=getPriority(pxCurrentTCB) ==> pxCurrentTCB:=TASK_NULL [] not(pr>=getPriority(pxCurrentTCB)) ==> skip))));
  Expanded_List_Substitution(Machine(Task_Concern),vTaskSuspend)==(INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend: TASK & pxTaskToSuspend: tasks | pxTaskToSuspend/:xSuspendedTaskList ==> (pxReadyTasksLists,pxDelayedTaskList,xSuspendedTaskList:=pxReadyTasksLists<+{getPriority(pxTaskToSuspend)|->pxReadyTasksLists(getPriority(pxTaskToSuspend))-{pxTaskToSuspend}},pxDelayedTaskList-{pxTaskToSuspend},xSuspendedTaskList\/{pxTaskToSuspend} || (pxCurrentTCB = pxTaskToSuspend ==> pxCurrentTCB:=TASK_NULL [] not(pxCurrentTCB = pxTaskToSuspend) ==> skip) || rr:=pdTRUE) [] not(pxTaskToSuspend/:xSuspendedTaskList) ==> rr:=pdFALSE);
  Expanded_List_Substitution(Machine(Task_Concern),prvIdleTask)==(pvParameters: PARAMETER | @any(task,new_heap,pt,sz,tam).(task: TASK & task: xTasksWaitingTermination & pt: POINTER & tam: NATURAL & tam = card(xTasksWaitingTermination) & sz: NATURAL & pt,sz = getStack(task) & new_heap: HEAP_SIZE & new_heap = portFree(heap,pt,sz) ==> (new_heap: NATURAL & new_heap<=configTOTAL_HEAP_SIZE | uxTasksDeleted>0 & tam>0 ==> xTasksWaitingTermination,tasks,uxTasksDeleted,uxCurrentNumberOfTasks:=xTasksWaitingTermination-{task},tasks-{task},uxTasksDeleted-1,uxCurrentNumberOfTasks-1 [] not(uxTasksDeleted>0 & tam>0) ==> skip || heap:=new_heap)));
  Expanded_List_Substitution(Machine(Task_Concern),vTaskDelete)==(pxTaskToDelete: TASK & INCLUDE_vTaskDelete = 1 & pxTaskToDelete/:xTasksWaitingTermination & pxTaskToDelete: tasks | @any(priority).(priority: PRIORITIES & priority = getPriority(pxTaskToDelete) ==> (pxReadyTasksLists,readyTasks,xSuspendedTaskList,pxDelayedTaskList,xTasksWaitingTermination,uxTasksDeleted:=pxReadyTasksLists<+{priority|->pxReadyTasksLists(priority)-{pxTaskToDelete}},readyTasks-{pxTaskToDelete},xSuspendedTaskList-{pxTaskToDelete},pxDelayedTaskList-{pxTaskToDelete},xTasksWaitingTermination\/{pxTaskToDelete},uxTasksDeleted-1 || (pxCurrentTCB = pxTaskToDelete ==> pxCurrentTCB:=TASK_NULL [] not(pxCurrentTCB = pxTaskToDelete) ==> skip))));
  Expanded_List_Substitution(Machine(Task_Concern),xTaskCreate)==(pvTaskCode: TASK_CODE & pcName: NAME & usStackDepth: NATURAL & pvParameters: POW(PARAMETER) & uxPriority: PRIORITIES | @any(task,stack,new_heap).(task: TASK & task/:tasks & stack: STACK & new_heap: HEAP_SIZE & new_heap,stack = portMalloc(heap,usStackDepth) & task = pcName,uxPriority,pvTaskCode,stack ==> (new_heap: NATURAL & new_heap<=configTOTAL_HEAP_SIZE | stack/=STACK_NULL ==> (tasks:=tasks\/{task} || (uxCurrentNumberOfTasks = 0 ==> pxCurrentTCB:=task [] not(uxCurrentNumberOfTasks = 0) ==> (uxTopUsedPriority<=uxPriority & xSchedulerRunning = pdFALSE ==> pxCurrentTCB:=task [] not(uxTopUsedPriority<=uxPriority & xSchedulerRunning = pdFALSE) ==> skip)) || (uxTopUsedPriority<=uxPriority ==> uxTopUsedPriority:=uxPriority [] not(uxTopUsedPriority<=uxPriority) ==> skip) || pxReadyTasksLists:=pxReadyTasksLists<+{uxPriority|->(pxReadyTasksLists(uxPriority)\/{task})} || readyTasks:=readyTasks\/{task} || uxCurrentNumberOfTasks:=uxCurrentNumberOfTasks+1 || zz:=pdPASS) [] not(stack/=STACK_NULL) ==> zz:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY || handle:=task || heap:=new_heap)));
  List_Substitution(Machine(Task_Concern),xTaskCreate)==(ANY task,stack,new_heap WHERE task: TASK & task/:tasks & stack: STACK & new_heap: HEAP_SIZE & new_heap,stack = portMalloc(heap,usStackDepth) & task = pcName,uxPriority,pvTaskCode,stack THEN IF stack/=STACK_NULL THEN tasks:=tasks\/{task} || IF uxCurrentNumberOfTasks = 0 THEN pxCurrentTCB:=task ELSE IF uxTopUsedPriority<=uxPriority & xSchedulerRunning = pdFALSE THEN pxCurrentTCB:=task END END || IF uxTopUsedPriority<=uxPriority THEN uxTopUsedPriority:=uxPriority END || pxReadyTasksLists(uxPriority):=pxReadyTasksLists(uxPriority)\/{task} || readyTasks:=readyTasks\/{task} || uxCurrentNumberOfTasks:=uxCurrentNumberOfTasks+1 || zz:=pdPASS ELSE zz:=errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY END || handle:=task || setHeap(new_heap) END);
  List_Substitution(Machine(Task_Concern),vTaskDelete)==(ANY priority WHERE priority: PRIORITIES & priority = getPriority(pxTaskToDelete) THEN pxReadyTasksLists(priority):=pxReadyTasksLists(priority)-{pxTaskToDelete} || readyTasks:=readyTasks-{pxTaskToDelete} || xSuspendedTaskList:=xSuspendedTaskList-{pxTaskToDelete} || pxDelayedTaskList:=pxDelayedTaskList-{pxTaskToDelete} || xTasksWaitingTermination:=xTasksWaitingTermination\/{pxTaskToDelete} || uxTasksDeleted:=uxTasksDeleted-1 || IF pxCurrentTCB = pxTaskToDelete THEN pxCurrentTCB:=TASK_NULL END END);
  List_Substitution(Machine(Task_Concern),prvIdleTask)==(ANY task,new_heap,pt,sz,tam WHERE task: TASK & task: xTasksWaitingTermination & pt: POINTER & tam: NATURAL & tam = card(xTasksWaitingTermination) & sz: NATURAL & pt,sz = getStack(task) & new_heap: HEAP_SIZE & new_heap = portFree(heap,pt,sz) THEN IF uxTasksDeleted>0 & tam>0 THEN xTasksWaitingTermination:=xTasksWaitingTermination-{task} || tasks:=tasks-{task} || uxTasksDeleted:=uxTasksDeleted-1 || uxCurrentNumberOfTasks:=uxCurrentNumberOfTasks-1 END || setHeap(new_heap) END);
  List_Substitution(Machine(Task_Concern),vTaskSuspend)==(IF pxTaskToSuspend/:xSuspendedTaskList THEN pxReadyTasksLists(getPriority(pxTaskToSuspend)):=pxReadyTasksLists(getPriority(pxTaskToSuspend))-{pxTaskToSuspend} || pxDelayedTaskList:=pxDelayedTaskList-{pxTaskToSuspend} || xSuspendedTaskList:=xSuspendedTaskList\/{pxTaskToSuspend} || IF pxCurrentTCB = pxTaskToSuspend THEN pxCurrentTCB:=TASK_NULL END || rr:=pdTRUE ELSE rr:=pdFALSE END);
  List_Substitution(Machine(Task_Concern),vTaskResume)==(ANY pr WHERE pr: PRIORITIES & pr = getPriority(pxTaskToResume) THEN xSuspendedTaskList:=xSuspendedTaskList-{pxTaskToResume} || pxReadyTasksLists(pr):=pxReadyTasksLists(pr)\/{pxTaskToResume} || IF pr>=getPriority(pxCurrentTCB) THEN pxCurrentTCB:=TASK_NULL END END);
  List_Substitution(Machine(Task_Concern),uxTaskPriorityGet)==(priority:=getPriority(pxTask));
  List_Substitution(Machine(Task_Concern),vTaskPrioritySet)==(ANY name,priority,task_code,stack,new_task WHERE name,priority,task_code,stack: NAME*PRIORITIES*TASK_CODE*STACK & name,priority,task_code,stack = pxTask & new_task: TASK & new_task/:tasks & new_task = name,uxNewPriority,task_code,stack THEN IF uxNewPriority/=priority THEN IF pxTask: readyTasks THEN IF uxNewPriority<priority THEN pxReadyTasksLists:=pxReadyTasksLists<+{priority|->pxReadyTasksLists(priority)-{pxTask},uxNewPriority|->(pxReadyTasksLists(uxNewPriority)\/{new_task})} || readyTasks:=readyTasks-{pxTask}\/{new_task} ELSE pxReadyTasksLists(getPriority(pxCurrentTCB)):=pxReadyTasksLists(getPriority(pxCurrentTCB))\/{pxCurrentTCB,new_task} || pxCurrentTCB:=TASK_NULL || readyTasks:=readyTasks-{pxTask}\/{new_task,pxCurrentTCB} END || IF pxTask: xSuspendedTaskList THEN xSuspendedTaskList:=xSuspendedTaskList-{pxTask}\/{new_task} ELSE pxDelayedTaskList:=pxDelayedTaskList-{pxTask}\/{new_task} END END || IF uxNewPriority>uxTopUsedPriority THEN uxTopUsedPriority:=uxNewPriority END END END);
  List_Substitution(Machine(Task_Concern),xTaskGetCurrentTaskHandle)==(rr:=pxCurrentTCB);
  List_Substitution(Machine(Task_Concern),uxTaskGetNumberOfTasks)==(numberOfTasks:=uxCurrentNumberOfTasks);
  List_Substitution(Machine(Task_Concern),xTaskGetSchedulerState)==(IF xSchedulerRunning = pdFALSE THEN xReturn:=taskSCHEDULER_NOT_STARTED ELSE IF uxSchedulerSuspended = pdFALSE THEN xReturn:=taskSCHEDULER_RUNNING ELSE xReturn:=taskSCHEDULER_SUSPENDED END END);
  List_Substitution(Machine(Task_Concern),taskStartScheduler)==(xSchedulerRunning:=pdTRUE);
  List_Substitution(Machine(Task_Concern),vTaskEndScheduler)==(xSchedulerRunning:=pdFALSE);
  List_Substitution(Machine(Task_Concern),vTaskSuspendAll)==(uxSchedulerSuspended:=uxSchedulerSuspended+1);
  List_Substitution(Machine(Task_Concern),xTaskResumeAll)==(uxSchedulerSuspended:=uxSchedulerSuspended-1)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Task_Concern))==(STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree,PRIORITIES,TASK,tskIDLE_PRIORITY,tskIDLE_STACK_SIZE,TASK_NULL,PARAMETER_NULL,getName,getPriority,getCode,getStack,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED);
  Inherited_List_Constants(Machine(Task_Concern))==(STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree);
  List_Constants(Machine(Task_Concern))==(PRIORITIES,TASK,tskIDLE_PRIORITY,tskIDLE_STACK_SIZE,TASK_NULL,PARAMETER_NULL,getName,getPriority,getCode,getStack,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Task_Concern),TASK_CODE)==(?);
  Context_List_Enumerated(Machine(Task_Concern))==(?);
  Context_List_Defered(Machine(Task_Concern))==(POINTER,NAME);
  Context_List_Sets(Machine(Task_Concern))==(POINTER,NAME);
  List_Valuable_Sets(Machine(Task_Concern))==(TASK_CODE,PARAMETER);
  Inherited_List_Enumerated(Machine(Task_Concern))==(?);
  Inherited_List_Defered(Machine(Task_Concern))==(?);
  Inherited_List_Sets(Machine(Task_Concern))==(?);
  List_Enumerated(Machine(Task_Concern))==(?);
  List_Defered(Machine(Task_Concern))==(TASK_CODE,PARAMETER);
  List_Sets(Machine(Task_Concern))==(TASK_CODE,PARAMETER);
  Set_Definition(Machine(Task_Concern),PARAMETER)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Task_Concern))==(?);
  Expanded_List_HiddenConstants(Machine(Task_Concern))==(?);
  List_HiddenConstants(Machine(Task_Concern))==(?);
  External_List_HiddenConstants(Machine(Task_Concern))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Task_Concern))==(btrue);
  Context_List_Properties(Machine(Task_Concern))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & pointer: POINTER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & configMAX_PRIORITIES: NATURAL & configTOTAL_HEAP_SIZE: NATURAL & configMINIMAL_STACK_SIZE: NATURAL & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & configUSE_PREEMPTION: BIT & configUSE_IDLE_HOOK: BIT & configUSE_TICK_HOOK: BIT & configCPU_CLOCK_HZ: NATURAL & configTICK_RATE_HZ: NATURAL & configMAX_TASK_NAME_LEN: NATURAL & configUSE_TRACE_FACILITY: BIT & configUSE_16_BIT_TICKS: BIT & configIDLE_SHOULD_YIELD: BIT & configUSE_USE_MUTEXES: BIT & configUSE_RECURSIVE_MUTEXES: BIT & configUSE_COUNTING_SEMAPHORES: BIT & configUSE_ALTERNATIVE_API: BIT & configCHECK_FOR_STACK_OVERFLOW: BIT & configQUEUE_REGISTRY_SIZE: BIT & configUSE_CO_ROUTINES: BIT & configMAX_CO_ROUTINE_PRIORITIES: NATURAL & configKERNEL_INTERRUPT_PRIORITY: NATURAL & configMAX_SYSCALL_INTERRUPT_PRIORITY: NATURAL & INCLUDE_vTaskCleanUpResources: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT);
  Inherited_List_Properties(Machine(Task_Concern))==(STACK = POINTER*NATURAL & STACK_NULL: STACK & HEAP_SIZE = 0..configTOTAL_HEAP_SIZE & portMalloc: HEAP_SIZE*HEAP_SIZE --> HEAP_SIZE*STACK & portMalloc = %(heap,sz).(heap: HEAP_SIZE & sz: HEAP_SIZE & heap-sz+1>0 | heap-sz,(pointer,sz)) & portMalloc = %(heap,sz).(heap: HEAP_SIZE & sz: HEAP_SIZE & heap-sz<0 | 0,STACK_NULL) & portFree: HEAP_SIZE*POINTER*HEAP_SIZE --> HEAP_SIZE & portFree = %(heap,pt,sz).(heap: HEAP_SIZE & pt: POINTER & sz: HEAP_SIZE & heap+sz<=configTOTAL_HEAP_SIZE | heap+sz) & portFree = %(heap,pt,sz).(heap: HEAP_SIZE & pt: POINTER & sz: HEAP_SIZE & heap+sz>configTOTAL_HEAP_SIZE | heap));
  List_Properties(Machine(Task_Concern))==(PRIORITIES = 0..configMAX_PRIORITIES-1 & TASK = NAME*PRIORITIES*TASK_CODE*STACK & tskIDLE_PRIORITY: PRIORITIES & tskIDLE_PRIORITY = 0 & tskIDLE_STACK_SIZE: NATURAL & tskIDLE_STACK_SIZE = configMINIMAL_STACK_SIZE & getName: TASK --> NAME & getName = %(nm,pr,tc,stk).(nm,pr,tc,stk: TASK | nm) & getPriority: TASK --> PRIORITIES & getPriority = %(nm,pr,tc,stk).(nm,pr,tc,stk: TASK | pr) & getCode: TASK --> TASK_CODE & getCode = %(nm,pr,tc,stk).(nm,pr,tc,stk: TASK | tc) & getStack: TASK --> STACK & getStack = %(nm,pr,tc,stk).(nm,pr,tc,stk: TASK | stk) & TASK_NULL: TASK & PARAMETER_NULL: PARAMETER & taskSCHEDULER_NOT_STARTED: NATURAL & taskSCHEDULER_RUNNING: NATURAL & taskSCHEDULER_SUSPENDED: NATURAL & taskSCHEDULER_NOT_STARTED = 0 & taskSCHEDULER_RUNNING = 1 & taskSCHEDULER_SUSPENDED = 2 & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Task_Concern),Machine(FreeRTOSConfig))==(?);
  Seen_Context_List_Enumerated(Machine(Task_Concern))==(?);
  Seen_Context_List_Invariant(Machine(Task_Concern))==(btrue);
  Seen_Context_List_Assertions(Machine(Task_Concern))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  Seen_Context_List_Properties(Machine(Task_Concern))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & pointer: POINTER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}));
  Seen_List_Constraints(Machine(Task_Concern))==(btrue);
  Seen_List_Operations(Machine(Task_Concern),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Machine(Task_Concern),Machine(FreeRTOSConfig))==(btrue);
  Seen_Internal_List_Operations(Machine(Task_Concern),Machine(Types))==(?);
  Seen_List_Operations(Machine(Task_Concern),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Task_Concern),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Task_Concern),xTaskCreate)==((Var(task) == atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))),(Var(stack) == atype(POINTER,?,?)*btype(INTEGER,?,?)),(Var(new_heap) == btype(INTEGER,?,?)));
  List_ANY_Var(Machine(Task_Concern),vTaskDelete)==(Var(priority) == btype(INTEGER,?,?));
  List_ANY_Var(Machine(Task_Concern),prvIdleTask)==((Var(task) == atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))),(Var(new_heap) == btype(INTEGER,?,?)),(Var(pt) == atype(POINTER,?,?)),(Var(sz) == btype(INTEGER,?,?)),(Var(tam) == btype(INTEGER,?,?)));
  List_ANY_Var(Machine(Task_Concern),vTaskSuspend)==(?);
  List_ANY_Var(Machine(Task_Concern),vTaskResume)==(Var(pr) == btype(INTEGER,?,?));
  List_ANY_Var(Machine(Task_Concern),uxTaskPriorityGet)==(?);
  List_ANY_Var(Machine(Task_Concern),vTaskPrioritySet)==((Var(name) == atype(NAME,?,?)),(Var(priority) == btype(INTEGER,?,?)),(Var(task_code) == atype(TASK_CODE,?,?)),(Var(stack) == atype(POINTER,?,?)*btype(INTEGER,?,?)),(Var(new_task) == atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Machine(Task_Concern),xTaskGetCurrentTaskHandle)==(?);
  List_ANY_Var(Machine(Task_Concern),uxTaskGetNumberOfTasks)==(?);
  List_ANY_Var(Machine(Task_Concern),xTaskGetSchedulerState)==(?);
  List_ANY_Var(Machine(Task_Concern),taskStartScheduler)==(?);
  List_ANY_Var(Machine(Task_Concern),vTaskEndScheduler)==(?);
  List_ANY_Var(Machine(Task_Concern),vTaskSuspendAll)==(?);
  List_ANY_Var(Machine(Task_Concern),xTaskResumeAll)==(?);
  List_ANY_Var(Machine(Task_Concern),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Task_Concern)) == (PRIORITIES,TASK,tskIDLE_PRIORITY,tskIDLE_STACK_SIZE,TASK_NULL,PARAMETER_NULL,getName,getPriority,getCode,getStack,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,TASK_CODE,PARAMETER | STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree | uxSchedulerSuspended,xSchedulerRunning,uxTasksDeleted,uxTopUsedPriority,uxCurrentNumberOfTasks,pxDelayedTaskList,xSuspendedTaskList,xTasksWaitingTermination,pxReadyTasksLists,pxCurrentTCB,readyTasks,tasks | heap | xTaskCreate,vTaskDelete,prvIdleTask,vTaskSuspend,vTaskResume,uxTaskPriorityGet,vTaskPrioritySet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,taskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll | ? | seen(Machine(Types)),seen(Machine(FreeRTOSConfig)),included(Machine(Memory)) | ? | Task_Concern);
  List_Of_HiddenCst_Ids(Machine(Task_Concern)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Task_Concern)) == (PRIORITIES,TASK,tskIDLE_PRIORITY,tskIDLE_STACK_SIZE,TASK_NULL,PARAMETER_NULL,getName,getPriority,getCode,getStack,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree);
  List_Of_VisibleVar_Ids(Machine(Task_Concern)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Task_Concern)) == (seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(Types)): (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,pointer,POINTER,NAME | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Memory)) == (STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree | ? | heap | ? | setHeap | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Memory);
  List_Of_HiddenCst_Ids(Machine(Memory)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Memory)) == (STACK,STACK_NULL,HEAP_SIZE,portMalloc,portFree);
  List_Of_VisibleVar_Ids(Machine(Memory)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Memory)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,pointer,POINTER,NAME | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,pointer);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Task_Concern)) == (Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(PARAMETER) == Cst(SetOf(atype(PARAMETER,"[PARAMETER","]PARAMETER"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Task_Concern)) == (Type(portFree) == Cst(SetOf(btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*atype(POINTER,"[POINTER","]POINTER")*btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")));Type(portMalloc) == Cst(SetOf(btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*(btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")*(atype(POINTER,?,?)*btype(INTEGER,?,?)))));Type(HEAP_SIZE) == Cst(SetOf(btype(INTEGER,"[HEAP_SIZE","]HEAP_SIZE")));Type(STACK_NULL) == Cst(atype(POINTER,?,?)*btype(INTEGER,?,?));Type(STACK) == Cst(SetOf(atype(POINTER,?,?)*btype(INTEGER,?,?)));Type(PRIORITIES) == Cst(SetOf(btype(INTEGER,"[PRIORITIES","]PRIORITIES")));Type(TASK) == Cst(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))));Type(tskIDLE_PRIORITY) == Cst(btype(INTEGER,?,?));Type(tskIDLE_STACK_SIZE) == Cst(btype(INTEGER,?,?));Type(TASK_NULL) == Cst(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)));Type(PARAMETER_NULL) == Cst(atype(PARAMETER,?,?));Type(getName) == Cst(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))*atype(NAME,"[NAME","]NAME")));Type(getPriority) == Cst(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))*btype(INTEGER,"[PRIORITIES","]PRIORITIES")));Type(getCode) == Cst(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))*atype(TASK_CODE,"[TASK_CODE","]TASK_CODE")));Type(getStack) == Cst(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))*(atype(POINTER,?,?)*btype(INTEGER,?,?))));Type(taskSCHEDULER_NOT_STARTED) == Cst(btype(INTEGER,?,?));Type(taskSCHEDULER_RUNNING) == Cst(btype(INTEGER,?,?));Type(taskSCHEDULER_SUSPENDED) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Task_Concern)) == (Type(heap) == Mvl(btype(INTEGER,?,?));Type(uxSchedulerSuspended) == Mvl(btype(INTEGER,?,?));Type(xSchedulerRunning) == Mvl(btype(INTEGER,?,?));Type(uxTasksDeleted) == Mvl(btype(INTEGER,?,?));Type(uxTopUsedPriority) == Mvl(btype(INTEGER,?,?));Type(uxCurrentNumberOfTasks) == Mvl(btype(INTEGER,?,?));Type(pxDelayedTaskList) == Mvl(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))));Type(xSuspendedTaskList) == Mvl(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))));Type(xTasksWaitingTermination) == Mvl(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))));Type(pxReadyTasksLists) == Mvl(SetOf(btype(INTEGER,?,?)*SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)))));Type(pxCurrentTCB) == Mvl(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)));Type(readyTasks) == Mvl(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))));Type(tasks) == Mvl(SetOf(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Task_Concern)) == (Type(xTaskResumeAll) == Cst(No_type,No_type);Type(vTaskSuspendAll) == Cst(No_type,No_type);Type(vTaskEndScheduler) == Cst(No_type,No_type);Type(taskStartScheduler) == Cst(No_type,No_type);Type(xTaskGetSchedulerState) == Cst(btype(INTEGER,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)),No_type);Type(vTaskPrioritySet) == Cst(No_type,atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))*btype(INTEGER,?,?));Type(uxTaskPriorityGet) == Cst(btype(INTEGER,?,?),atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)));Type(vTaskResume) == Cst(No_type,atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)));Type(vTaskSuspend) == Cst(btype(INTEGER,?,?),atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)));Type(prvIdleTask) == Cst(No_type,atype(PARAMETER,?,?));Type(vTaskDelete) == Cst(No_type,atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)));Type(xTaskCreate) == Cst(btype(INTEGER,?,?)*(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))),atype(TASK_CODE,?,?)*atype(NAME,?,?)*btype(INTEGER,?,?)*SetOf(atype(PARAMETER,?,?))*btype(INTEGER,?,?)));
  Observers(Machine(Task_Concern)) == (Type(xTaskGetSchedulerState) == Cst(btype(INTEGER,?,?),No_type);Type(uxTaskGetNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(xTaskGetCurrentTaskHandle) == Cst(atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?)),No_type);Type(uxTaskPriorityGet) == Cst(btype(INTEGER,?,?),atype(NAME,?,?)*btype(INTEGER,?,?)*atype(TASK_CODE,?,?)*(atype(POINTER,?,?)*btype(INTEGER,?,?))))
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
