Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Queue))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Queue))==(Machine(Queue));
  Level(Machine(Queue))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Queue)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Queue))==(Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Queue))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Queue))==(Task_Basic,Queue_Basic);
  List_Includes(Machine(Queue))==(Queue_Basic,Task_Basic)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Queue))==(xQueueCreate)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Queue))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Queue))==(?);
  Context_List_Variables(Machine(Queue))==(?);
  Abstract_List_Variables(Machine(Queue))==(?);
  Local_List_Variables(Machine(Queue))==(?);
  List_Variables(Machine(Queue))==(queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues,tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks);
  External_List_Variables(Machine(Queue))==(queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues,tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Queue))==(?);
  Abstract_List_VisibleVariables(Machine(Queue))==(?);
  External_List_VisibleVariables(Machine(Queue))==(?);
  Expanded_List_VisibleVariables(Machine(Queue))==(?);
  List_VisibleVariables(Machine(Queue))==(?);
  Internal_List_VisibleVariables(Machine(Queue))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Queue))==(btrue);
  Gluing_List_Invariant(Machine(Queue))==(btrue);
  Abstract_List_Invariant(Machine(Queue))==(btrue);
  Expanded_List_Invariant(Machine(Queue))==(queues: POW(QUEUE) & queue_itens: QUEUE +-> POW(ITEM) & queue_tkRecived: QUEUE +-> POW(TASK) & queue_tkSend: QUEUE +-> POW(TASK) & queue_length: QUEUE +-> NAT & queues = dom(queue_itens) & queues = dom(queue_tkRecived) & queues = dom(queue_tkSend) & queues = dom(queue_length) & !queue.(queue: queues => card(queue_itens(queue))<=queue_length(queue)) & tasks: POW(TASK) & task_name: TASK +-> NAME & task_state: TASK +-> TASK_STATE & task_priority: TASK +-> PRIORITY & task_value: TASK +-> TICK & tasks = dom(task_priority) & tasks = dom(task_state) & tasks = dom(task_value) & tasks = dom(task_name) & current_task: TASK & current_task: tasks & task_state(current_task) = running & max_priority: PRIORITY & max_priority = task_priority(current_task) & max_priority>=max(READY_PRIORITIES(task_state,task_priority)) & card(task_state|>{running})<=1 & scheduler: SCHEDULER_STATE & tickCount: TICK & tickMissed: TICK);
  Context_List_Invariant(Machine(Queue))==(btrue);
  List_Invariant(Machine(Queue))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Queue))==(btrue);
  Expanded_List_Assertions(Machine(Queue))==(!(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY => (not(ran(dom(tk_st|>{ready})<|tk_prt) = {}) => READY_PRIORITIES(tk_st,tk_prt) = ran(dom(tk_st|>{ready})<|tk_prt) & ran(dom(tk_st|>{ready})<|tk_prt) = {} => READY_PRIORITIES(tk_st,tk_prt) = {0})) & !(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY => READY_PRIORITIES(tk_st,tk_prt)/={}) & !(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY => max(READY_PRIORITIES(tk_st,tk_prt))>=0));
  Context_List_Assertions(Machine(Queue))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(Queue))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Queue))==(queues,queue_itens,queue_tkRecived,queue_tkSend,queue_length:={QUEUE_NULL},{QUEUE_NULL|->{}},{QUEUE_NULL|->{}},{QUEUE_NULL|->{}},{QUEUE_NULL|->card({})};tasks,task_name,task_state,task_priority,task_value,current_task,max_priority,scheduler,tickCount,tickMissed:={TASK_NULL},{TASK_NULL|->NAME_NULL},{TASK_NULL|->running},{TASK_NULL|->0},{TASK_NULL|->0},TASK_NULL,0,taskSCHEDULER_NOT_STARTED,0,0);
  Context_List_Initialisation(Machine(Queue))==(skip);
  List_Initialisation(Machine(Queue))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Queue))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Queue),Machine(Queue_Basic))==(?);
  List_Instanciated_Parameters(Machine(Queue),Machine(Task_Basic))==(?);
  List_Instanciated_Parameters(Machine(Queue),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Queue),Machine(Task_Basic))==(btrue);
  List_Context_Constraints(Machine(Queue))==(btrue);
  List_Constraints(Machine(Queue))==(btrue);
  List_Constraints(Machine(Queue),Machine(Queue_Basic))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Queue))==(xQueueSend,xQueueSendToBack,xQueueSendToFront,xQueueReceive,xQueuePeek,xQueueCreate);
  List_Operations(Machine(Queue))==(xQueueSend,xQueueSendToBack,xQueueSendToFront,xQueueReceive,xQueuePeek,xQueueCreate)
END
&
THEORY ListInputX IS
  List_Input(Machine(Queue),xQueueCreate)==(uxQueueLength,uxItemSize);
  List_Input(Machine(Queue),xQueueSend)==(pxQueue,pvItemToQueue,xTicksToWait);
  List_Input(Machine(Queue),xQueueSendToBack)==(pxQueue,pvItemToQueue,xTicksToWait);
  List_Input(Machine(Queue),xQueueSendToFront)==(pxQueue,pvItemToQueue,xTicksToWait);
  List_Input(Machine(Queue),xQueueReceive)==(xQueue,xTicksToWait);
  List_Input(Machine(Queue),xQueuePeek)==(xQueue,xTicksToWait)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Queue),xQueueCreate)==(xQueueHandle);
  List_Output(Machine(Queue),xQueueSend)==(return);
  List_Output(Machine(Queue),xQueueSendToBack)==(return);
  List_Output(Machine(Queue),xQueueSendToFront)==(return);
  List_Output(Machine(Queue),xQueueReceive)==(return,pvBuffer);
  List_Output(Machine(Queue),xQueuePeek)==(return,pvBuffer)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Queue),xQueueCreate)==(xQueueHandle <-- xQueueCreate(uxQueueLength,uxItemSize));
  List_Header(Machine(Queue),xQueueSend)==(return <-- xQueueSend(pxQueue,pvItemToQueue,xTicksToWait));
  List_Header(Machine(Queue),xQueueSendToBack)==(return <-- xQueueSendToBack(pxQueue,pvItemToQueue,xTicksToWait));
  List_Header(Machine(Queue),xQueueSendToFront)==(return <-- xQueueSendToFront(pxQueue,pvItemToQueue,xTicksToWait));
  List_Header(Machine(Queue),xQueueReceive)==(return,pvBuffer <-- xQueueReceive(xQueue,xTicksToWait));
  List_Header(Machine(Queue),xQueuePeek)==(return,pvBuffer <-- xQueuePeek(xQueue,xTicksToWait))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(Queue),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(Queue),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT);
  List_Precondition(Machine(Queue),xQueueSend)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK);
  List_Precondition(Machine(Queue),xQueueSendToBack)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK);
  List_Precondition(Machine(Queue),xQueueSendToFront)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK);
  List_Precondition(Machine(Queue),xQueueReceive)==(xQueue: queues & xTicksToWait: TICK);
  List_Precondition(Machine(Queue),xQueuePeek)==(xQueue: queues & xTicksToWait: TICK)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Queue),xQueuePeek)==(xQueue: queues & xTicksToWait: TICK | QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait>0 ==> (xQueue: queues & current_task: TASK & xTicksToWait: TICK & not(xTicksToWait = 0) & INCLUDE_vTaskDelay = 1 | queue_tkRecived:=queue_tkRecived<+{xQueue|->(queue_tkRecived(xQueue)\/{current_task})} || @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToWait)},ctk,mprt) || return,pvBuffer:=pdTRUE,ITEM_NULL) [] QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait = 0 ==> return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL [] QUEUE_ISEMPTY(xQueue,queue_itens) = FALSE ==> (@any(task).(task: TASK & task: tasks & task: queue_tkRecived(xQueue) & task_state(task) = blocked ==> (xQueue: queues & QUEUE_ISEMPTY(xQueue,queue_itens) = FALSE & pdTRUE: BIT & task: TASK & task: queue_tkSend(xQueue) | @any(item).(item: ITEM & item: queue_itens(xQueue) ==> (pdTRUE = pdFALSE ==> queue_itens,queue_tkSend:=queue_itens<+{xQueue|->queue_itens(xQueue)-{item}},queue_tkSend<+{xQueue|->queue_tkSend(xQueue)-{task}} [] not(pdTRUE = pdFALSE) ==> skip || pvBuffer:=item)))) || return:=pdPASS));
  Expanded_List_Substitution(Machine(Queue),xQueueReceive)==(xQueue: queues & xTicksToWait: TICK | QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait>0 ==> (xQueue: queues & current_task: TASK & xTicksToWait: TICK & not(xTicksToWait = 0) & INCLUDE_vTaskDelay = 1 | queue_tkRecived:=queue_tkRecived<+{xQueue|->(queue_tkRecived(xQueue)\/{current_task})} || @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToWait)},ctk,mprt) || return,pvBuffer:=pdTRUE,ITEM_NULL) [] QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait = 0 ==> return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL [] QUEUE_ISEMPTY(xQueue,queue_itens) = FALSE ==> (@any(task).(task: TASK & task: tasks & task: queue_tkRecived(xQueue) & task_state(task) = blocked ==> (xQueue: queues & QUEUE_ISEMPTY(xQueue,queue_itens) = FALSE & pdFALSE: BIT & task: TASK & task: queue_tkSend(xQueue) & task: tasks & task_state(task) = blocked & task/=current_task | @any(item).(item: ITEM & item: queue_itens(xQueue) ==> (pdFALSE = pdFALSE ==> queue_itens,queue_tkSend:=queue_itens<+{xQueue|->queue_itens(xQueue)-{item}},queue_tkSend<+{xQueue|->queue_tkSend(xQueue)-{task}} [] not(pdFALSE = pdFALSE) ==> skip || pvBuffer:=item)) || (task_priority(task)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready,task|->running},task,task_priority(task) [] not(task_priority(task)>max_priority) ==> task_state:=task_state<+{task|->ready}))) || return:=pdPASS));
  Expanded_List_Substitution(Machine(Queue),xQueueSendToFront)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK | xTicksToWait>0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE ==> (pxQueue: queues & current_task: TASK & xTicksToWait: TICK & not(xTicksToWait = 0) & INCLUDE_vTaskDelay = 1 | queue_tkSend:=queue_tkSend<+{pxQueue|->(queue_tkSend(pxQueue)\/{current_task})} || @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToWait)},ctk,mprt) || return:=pdTRUE) [] QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE ==> @any(task,copy_position).(task: tasks & task_state(task) = blocked & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION ==> (pxQueue: queues & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE & pvItemToQueue: ITEM & task: TASK & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION & task: tasks & task_state(task) = blocked & task/=current_task | queue_itens,queue_tkRecived:=queue_itens<+{pxQueue|->(queue_itens(pxQueue)\/{pvItemToQueue})},queue_tkRecived<+{pxQueue|->queue_tkRecived(pxQueue)-{task}} || (task_priority(task)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready,task|->running},task,task_priority(task) [] not(task_priority(task)>max_priority) ==> task_state:=task_state<+{task|->ready}) || return:=pdPASS)) [] xTicksToWait = 0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE ==> return:=errQUEUE_FULL);
  Expanded_List_Substitution(Machine(Queue),xQueueSendToBack)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK | xTicksToWait>0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE ==> (pxQueue: queues & current_task: TASK & xTicksToWait: TICK & not(xTicksToWait = 0) & INCLUDE_vTaskDelay = 1 | queue_tkSend:=queue_tkSend<+{pxQueue|->(queue_tkSend(pxQueue)\/{current_task})} || @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToWait)},ctk,mprt) || return:=pdTRUE) [] QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE ==> @any(task,copy_position).(task: tasks & task_state(task) = blocked & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION ==> (pxQueue: queues & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE & pvItemToQueue: ITEM & task: TASK & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION & task: tasks & task_state(task) = blocked & task/=current_task | queue_itens,queue_tkRecived:=queue_itens<+{pxQueue|->(queue_itens(pxQueue)\/{pvItemToQueue})},queue_tkRecived<+{pxQueue|->queue_tkRecived(pxQueue)-{task}} || (task_priority(task)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready,task|->running},task,task_priority(task) [] not(task_priority(task)>max_priority) ==> task_state:=task_state<+{task|->ready}) || return:=pdPASS)) [] xTicksToWait = 0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE ==> return:=errQUEUE_FULL);
  Expanded_List_Substitution(Machine(Queue),xQueueSend)==(pxQueue: queues & pvItemToQueue: ITEM & xTicksToWait: TICK | xTicksToWait>0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE ==> (pxQueue: queues & current_task: TASK & xTicksToWait: TICK & not(xTicksToWait = 0) & INCLUDE_vTaskDelay = 1 | queue_tkSend:=queue_tkSend<+{pxQueue|->(queue_tkSend(pxQueue)\/{current_task})} || @any(mprt,ctk).(mprt: PRIORITY & mprt = max(READY_PRIORITIES(task_state,task_priority)) & ctk: dom({current_task}<<|task_priority) & task_priority(ctk) = mprt & task_state(ctk) = ready ==> task_state,task_value,current_task,max_priority:=task_state<+{current_task|->blocked}<+{ctk|->running},task_value<+{current_task|->TICK_INCREMENT(tickCount,xTicksToWait)},ctk,mprt) || return:=pdTRUE) [] QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE ==> @any(task,copy_position).(task: tasks & task_state(task) = blocked & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION ==> (pxQueue: queues & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE & pvItemToQueue: ITEM & task: TASK & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION & task: tasks & task_state(task) = blocked & task/=current_task | queue_itens,queue_tkRecived:=queue_itens<+{pxQueue|->(queue_itens(pxQueue)\/{pvItemToQueue})},queue_tkRecived<+{pxQueue|->queue_tkRecived(pxQueue)-{task}} || (task_priority(task)>max_priority ==> task_state,current_task,max_priority:=task_state<+{current_task|->ready,task|->running},task,task_priority(task) [] not(task_priority(task)>max_priority) ==> task_state:=task_state<+{task|->ready}) || return:=pdPASS)) [] xTicksToWait = 0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE ==> return:=errQUEUE_FULL);
  List_Substitution(Machine(Queue),xQueueCreate)==(CHOICE ANY queue WHERE queue: QUEUE & queue/:queues THEN queues:=queues\/{queue} || queue_itens:=queue_itens\/{queue|->{}} || queue_tkRecived:=queue_tkRecived\/{queue|->{}} || queue_tkSend:=queue_tkSend\/{queue|->{}} || queue_length:=queue_length\/{queue|->uxQueueLength} || xQueueHandle:=queue END OR xQueueHandle:=QUEUE_NULL END);
  Expanded_List_Substitution(Machine(Queue),xQueueCreate)==(uxQueueLength: NAT & uxItemSize: NAT | @any(queue).(queue: QUEUE & queue/:queues ==> queues,queue_itens,queue_tkRecived,queue_tkSend,queue_length,xQueueHandle:=queues\/{queue},queue_itens\/{queue|->{}},queue_tkRecived\/{queue|->{}},queue_tkSend\/{queue|->{}},queue_length\/{queue|->uxQueueLength},queue) [] xQueueHandle:=QUEUE_NULL);
  List_Substitution(Machine(Queue),xQueueSend)==(SELECT xTicksToWait>0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE THEN insertTaskWaitingToSend(pxQueue,current_task) || vTaskDelay(xTicksToWait) || return:=pdTRUE WHEN QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE THEN ANY task,copy_position WHERE task: tasks & task_state(task) = blocked & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION THEN sendItem(pxQueue,pvItemToQueue,task,copy_position) || removeFromBlockedList(task) || return:=pdPASS END WHEN xTicksToWait = 0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE THEN return:=errQUEUE_FULL END);
  List_Substitution(Machine(Queue),xQueueSendToBack)==(SELECT xTicksToWait>0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE THEN insertTaskWaitingToSend(pxQueue,current_task) || vTaskDelay(xTicksToWait) || return:=pdTRUE WHEN QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE THEN ANY task,copy_position WHERE task: tasks & task_state(task) = blocked & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION THEN sendItem(pxQueue,pvItemToQueue,task,copy_position) || removeFromBlockedList(task) || return:=pdPASS END WHEN xTicksToWait = 0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE THEN return:=errQUEUE_FULL END);
  List_Substitution(Machine(Queue),xQueueSendToFront)==(SELECT xTicksToWait>0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE THEN insertTaskWaitingToSend(pxQueue,current_task) || vTaskDelay(xTicksToWait) || return:=pdTRUE WHEN QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = FALSE THEN ANY task,copy_position WHERE task: tasks & task_state(task) = blocked & task: queue_tkRecived(pxQueue) & copy_position: COPY_POSITION THEN sendItem(pxQueue,pvItemToQueue,task,copy_position) || removeFromBlockedList(task) || return:=pdPASS END WHEN xTicksToWait = 0 & QUEUE_ISFULL(pxQueue,queue_itens,queue_length) = TRUE THEN return:=errQUEUE_FULL END);
  List_Substitution(Machine(Queue),xQueueReceive)==(SELECT QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait>0 THEN insertTaskWaitingToRecived(xQueue,current_task) || vTaskDelay(xTicksToWait) || return,pvBuffer:=pdTRUE,ITEM_NULL WHEN QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait = 0 THEN return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL WHEN QUEUE_ISEMPTY(xQueue,queue_itens) = FALSE THEN ANY task WHERE task: TASK & task: tasks & task: queue_tkRecived(xQueue) & task_state(task) = blocked THEN pvBuffer <-- recivedItem(xQueue,pdFALSE,task) || removeFromBlockedList(task) END || return:=pdPASS END);
  List_Substitution(Machine(Queue),xQueuePeek)==(SELECT QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait>0 THEN insertTaskWaitingToRecived(xQueue,current_task) || vTaskDelay(xTicksToWait) || return,pvBuffer:=pdTRUE,ITEM_NULL WHEN QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait = 0 THEN return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL WHEN QUEUE_ISEMPTY(xQueue,queue_itens) = FALSE THEN ANY task WHERE task: TASK & task: tasks & task: queue_tkRecived(xQueue) & task_state(task) = blocked THEN pvBuffer <-- recivedItem(xQueue,pdTRUE,task) END || return:=pdPASS END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Queue))==(QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT,PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS);
  Inherited_List_Constants(Machine(Queue))==(QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT,PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS);
  List_Constants(Machine(Queue))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Queue),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Context_List_Enumerated(Machine(Queue))==(?);
  Context_List_Defered(Machine(Queue))==(POINTER,NAME,PARAMETER);
  Context_List_Sets(Machine(Queue))==(POINTER,NAME,PARAMETER);
  List_Valuable_Sets(Machine(Queue))==(ITEM,COPY_POSITION,QUEUE,TASK_CODE,STACK,TASK);
  Inherited_List_Enumerated(Machine(Queue))==(TASK_STATE,SCHEDULER_STATE);
  Inherited_List_Defered(Machine(Queue))==(ITEM,COPY_POSITION,QUEUE,TASK_CODE,STACK,TASK);
  Inherited_List_Sets(Machine(Queue))==(ITEM,COPY_POSITION,QUEUE,TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK);
  List_Enumerated(Machine(Queue))==(?);
  List_Defered(Machine(Queue))==(?);
  List_Sets(Machine(Queue))==(?);
  Set_Definition(Machine(Queue),TASK_STATE)==({running,blocked,ready,suspended,deleted});
  Set_Definition(Machine(Queue),TASK)==(?);
  Set_Definition(Machine(Queue),STACK)==(?);
  Set_Definition(Machine(Queue),TASK_CODE)==(?);
  Set_Definition(Machine(Queue),QUEUE)==(?);
  Set_Definition(Machine(Queue),COPY_POSITION)==(?);
  Set_Definition(Machine(Queue),ITEM)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Queue))==(?);
  Expanded_List_HiddenConstants(Machine(Queue))==(?);
  List_HiddenConstants(Machine(Queue))==(?);
  External_List_HiddenConstants(Machine(Queue))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Queue))==(btrue);
  Context_List_Properties(Machine(Queue))==(BIT = {0,1} & ERROR_DEFINITION = { -5, -4, -2, -1} & pdTRUE: BIT & pdTRUE = 0 & pdFALSE: BIT & pdFALSE = 1 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: NATURAL & NULL_PARAMETER: PARAMETER & POINTER: FIN(INTEGER) & not(POINTER = {}) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}));
  Inherited_List_Properties(Machine(Queue))==(QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & QUEUE_ISFULL: QUEUE*(QUEUE +-> POW(ITEM))*(QUEUE +-> NAT) --> BOOL & QUEUE_ISFULL = %(queue,q_it,q_vl).(queue: QUEUE & q_it: QUEUE +-> POW(ITEM) & q_vl: QUEUE +-> NAT & queue: dom(q_vl) & queue: dom(q_it) | bool(card(q_it(queue))>=q_vl(queue))) & QUEUE_ISEMPTY: QUEUE*(QUEUE +-> POW(ITEM)) --> BOOL & QUEUE_ISEMPTY = %(queue,q_it).(queue: QUEUE & q_it: QUEUE +-> POW(ITEM) & queue: dom(q_it) | bool(q_it(queue) = {})) & QUEUES_WITH_TASK: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) --> POW(QUEUE) & QUEUES_WITH_TASK = %(tk,ques,q_tkR,q_tkS).(tk: TASK & ques: POW(QUEUE) & q_tkR: QUEUE +-> POW(TASK) & q_tkS: QUEUE +-> POW(TASK) & ques = dom(q_tkR) & ques = dom(q_tkS) | {que | que: ques & (tk: q_tkR(que) or tk: q_tkS(que))}) & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) --> (QUEUE +-> POW(TASK))*(QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(tk,ques,q_tkR,q_tkS).(tk: TASK & ques: POW(QUEUE) & q_tkR: QUEUE +-> POW(TASK) & q_tkS: QUEUE +-> POW(TASK) | UNION(que).(que: ques | {et | et = que|->q_tkS(que)-{tk}}),UNION(que).(que: ques | {et | et = que|->q_tkR(que)-{tk}})) & ITEM: FIN(INTEGER) & not(ITEM = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & PRIORITY = 0..configMAX_PRIORITIES-1 & TICK = 0..MAX_DELAY & TASK_NULL: TASK & NAME_NULL: NAME & READY_PRIORITIES: (TASK +-> TASK_STATE)*(TASK +-> PRIORITY) --> POW(PRIORITY) & READY_PRIORITIES = %(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY & dom(tk_st) = dom(tk_prt) & not(ran(dom(tk_st|>{ready})<|tk_prt) = {}) | ran(dom(tk_st|>{ready})<|tk_prt))\/%(tk_st,tk_prt).(tk_st: TASK +-> TASK_STATE & tk_prt: TASK +-> PRIORITY & dom(tk_st) = dom(tk_prt) & ran(dom(tk_st|>{ready})<|tk_prt) = {} | {0}) & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & tskIDLE_PRIORITY: PRIORITY & tskIDLE_PRIORITY = 1 & UNBLOCK_TASKS: POW(TASK) --> (TASK +-> TASK_STATE) & UNBLOCK_TASKS = %bTasks.(bTasks: POW(TASK) | UNION(tk).(tk: bTasks | {rTask | rTask = tk|->ready})) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & TASK_STATE: FIN(INTEGER) & not(TASK_STATE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}));
  List_Properties(Machine(Queue))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Queue),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(Queue))==(?);
  Seen_Context_List_Invariant(Machine(Queue))==(btrue);
  Seen_Context_List_Assertions(Machine(Queue))==(btrue);
  Seen_Context_List_Properties(Machine(Queue))==(btrue);
  Seen_List_Constraints(Machine(Queue))==(btrue);
  Seen_List_Operations(Machine(Queue),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Queue),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Queue),xQueueSend)==((Var(task) == atype(TASK,?,?)),(Var(copy_position) == atype(COPY_POSITION,?,?)));
  List_ANY_Var(Machine(Queue),xQueueSendToBack)==((Var(task) == atype(TASK,?,?)),(Var(copy_position) == atype(COPY_POSITION,?,?)));
  List_ANY_Var(Machine(Queue),xQueueSendToFront)==((Var(task) == atype(TASK,?,?)),(Var(copy_position) == atype(COPY_POSITION,?,?)));
  List_ANY_Var(Machine(Queue),xQueueReceive)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(Queue),xQueuePeek)==(Var(task) == atype(TASK,?,?));
  List_ANY_Var(Machine(Queue),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Queue)) == (? | PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS,TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK,running,blocked,ready,suspended,deleted,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | ? | V,tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks,queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues | xQueueSend,xQueueSendToBack,xQueueSendToFront,xQueueReceive,xQueuePeek | xQueueCreate | seen(Machine(Types)),included(Machine(Queue_Basic)),included(Machine(Task_Basic)) | ? | Queue);
  List_Of_HiddenCst_Ids(Machine(Queue)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue)) == (PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS,QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(Queue)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue)) == (seen(Machine(FreeRTOSConfig)): (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,configMINIMAL_STACK_SIZE,configUSE_PREEMPTION,configUSE_IDLE_HOOK,configUSE_TICK_HOOK,configCPU_CLOCK_HZ,configTICK_RATE_HZ,configMAX_TASK_NAME_LEN,configUSE_TRACE_FACILITY,configUSE_16_BIT_TICKS,configIDLE_SHOULD_YIELD,configUSE_USE_MUTEXES,configUSE_RECURSIVE_MUTEXES,configUSE_COUNTING_SEMAPHORES,configUSE_ALTERNATIVE_API,configCHECK_FOR_STACK_OVERFLOW,configQUEUE_REGISTRY_SIZE,configUSE_CO_ROUTINES,configMAX_CO_ROUTINE_PRIORITIES,configKERNEL_INTERRUPT_PRIORITY,configMAX_SYSCALL_INTERRUPT_PRIORITY,INCLUDE_vTaskCleanUpResources,INCLUDE_vTaskDelayUntil,INCLUDE_vTaskDelay | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(Types)): (BIT,ERROR_DEFINITION,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,POINTER,NAME,PARAMETER | ? | ? | ? | ? | ? | ? | ? | ?) | seen(Machine(Task_Basic)): (PRIORITY,TICK,TASK_NULL,NAME_NULL,READY_PRIORITIES,TICK_INCREMENT,tskIDLE_PRIORITY,UNBLOCK_TASKS,TASK_CODE,TASK_STATE,SCHEDULER_STATE,STACK,TASK,running,blocked,ready,suspended,deleted,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | tickMissed,tickCount,scheduler,current_task,max_priority,task_value,task_state,task_name,task_priority,tasks | ? | ? | ? | ? | ? | ?));
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
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?);
  List_Of_Ids(Machine(Queue_Basic)) == (QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT,ITEM,COPY_POSITION,QUEUE | ? | queue_length,queue_tkSend,queue_tkRecived,queue_itens,queues | ? | xQueueCreate,sendItem,insertTaskWaitingToSend,insertTaskWaitingToRecived,recivedItem,removeFromEventListQueue | ? | seen(Machine(Types)),seen(Machine(Task_Basic)) | ? | Queue_Basic);
  List_Of_HiddenCst_Ids(Machine(Queue_Basic)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Queue_Basic)) == (QUEUE_NULL,ITEM_NULL,QUEUE_ISFULL,QUEUE_ISEMPTY,QUEUES_WITH_TASK,REMOVE_EVENT);
  List_Of_VisibleVar_Ids(Machine(Queue_Basic)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Queue_Basic)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Queue)) == (Type(QUEUE) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")));Type(COPY_POSITION) == Cst(SetOf(atype(COPY_POSITION,"[COPY_POSITION","]COPY_POSITION")));Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM")));Type(TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK")));Type(STACK) == Cst(SetOf(atype(STACK,"[STACK","]STACK")));Type(SCHEDULER_STATE) == Cst(SetOf(etype(SCHEDULER_STATE,0,2)));Type(TASK_STATE) == Cst(SetOf(etype(TASK_STATE,0,4)));Type(TASK_CODE) == Cst(SetOf(atype(TASK_CODE,"[TASK_CODE","]TASK_CODE"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Queue)) == (Type(REMOVE_EVENT) == Cst(SetOf(atype(TASK,"[TASK","]TASK")*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))))));Type(QUEUES_WITH_TASK) == Cst(SetOf(atype(TASK,"[TASK","]TASK")*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?)))*SetOf(atype(QUEUE,"[QUEUE","]QUEUE"))));Type(QUEUE_ISEMPTY) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")*SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?)))*btype(BOOL,0,1)));Type(QUEUE_ISFULL) == Cst(SetOf(atype(QUEUE,"[QUEUE","]QUEUE")*SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?)))*SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?))*btype(BOOL,0,1)));Type(ITEM_NULL) == Cst(atype(ITEM,?,?));Type(QUEUE_NULL) == Cst(atype(QUEUE,?,?));Type(UNBLOCK_TASKS) == Cst(SetOf(SetOf(atype(TASK,"[TASK","]TASK"))*SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?))));Type(tskIDLE_PRIORITY) == Cst(btype(INTEGER,?,?));Type(TICK_INCREMENT) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")*btype(INTEGER,"[TICK","]TICK")));Type(READY_PRIORITIES) == Cst(SetOf(SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?))*SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))*SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY"))));Type(NAME_NULL) == Cst(atype(NAME,?,?));Type(TASK_NULL) == Cst(atype(TASK,?,?));Type(TICK) == Cst(SetOf(btype(INTEGER,"[TICK","]TICK")));Type(PRIORITY) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(taskSCHEDULER_SUSPENDED) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_RUNNING) == Cst(etype(SCHEDULER_STATE,0,2));Type(taskSCHEDULER_NOT_STARTED) == Cst(etype(SCHEDULER_STATE,0,2));Type(deleted) == Cst(etype(TASK_STATE,0,4));Type(suspended) == Cst(etype(TASK_STATE,0,4));Type(ready) == Cst(etype(TASK_STATE,0,4));Type(blocked) == Cst(etype(TASK_STATE,0,4));Type(running) == Cst(etype(TASK_STATE,0,4)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Queue)) == (Type(queues) == Mvl(SetOf(atype(QUEUE,?,?)));Type(queue_itens) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(ITEM,?,?))));Type(queue_tkRecived) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_tkSend) == Mvl(SetOf(atype(QUEUE,?,?)*SetOf(atype(TASK,?,?))));Type(queue_length) == Mvl(SetOf(atype(QUEUE,?,?)*btype(INTEGER,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(task_priority) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(task_name) == Mvl(SetOf(atype(TASK,?,?)*atype(NAME,?,?)));Type(task_state) == Mvl(SetOf(atype(TASK,?,?)*etype(TASK_STATE,?,?)));Type(task_value) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(max_priority) == Mvl(btype(INTEGER,?,?));Type(current_task) == Mvl(atype(TASK,?,?));Type(scheduler) == Mvl(etype(SCHEDULER_STATE,?,?));Type(tickCount) == Mvl(btype(INTEGER,?,?));Type(tickMissed) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Queue)) == (Type(xQueueCreate) == Cst(atype(QUEUE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(xQueuePeek) == Cst(btype(INTEGER,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xQueueReceive) == Cst(btype(INTEGER,?,?)*atype(ITEM,?,?),atype(QUEUE,?,?)*btype(INTEGER,?,?));Type(xQueueSendToFront) == Cst(btype(INTEGER,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?));Type(xQueueSendToBack) == Cst(btype(INTEGER,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?));Type(xQueueSend) == Cst(btype(INTEGER,?,?),atype(QUEUE,?,?)*atype(ITEM,?,?)*btype(INTEGER,?,?)))
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
