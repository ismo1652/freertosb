/**********************************************************************************************************
QueueCore

\brief Basic layer of definitions for queue support in FreeRTOS.

This machine defines the concept of a queue in FreeRTOS without the features of length queue and size queue itens.
Queues are modelled as sets, instead as true queues.

Author: Stephenson Galvao, David Deharbe
Creation date: Tue Jan 27 2009
Universidade Federal do Rio Grande do Norte
Departamento de Informática e Matemática Aplicada
Programa de Pos-Graduacao em Sistemas e Computacao
Formal Methods and Languages Research Laboratory
**********************************************************************************************************/ 

MACHINE
  Queue
  
SEES
  Types,
  Scheduler
  
  
  
  /*ASSERTIONS
  
  !(task, queues, pending).
  (task : TASK & queues : POW(QUEUE) & pending : QUEUE +-> POW(TASK) => 
  dom(REMOVE_EVENT(task, queues, pending)) = (queues /\ dom(pending)))
  */    	    
VARIABLES
  
  /** Different queues in FreeRTOS */
  queues,
  
  queues_msg,
  queues_msg_full,
  queues_msg_empty,
 
  semaphores,
  semaphores_busy,
  
  mutexes,
  mutexes_busy,
  
  
  /** miscellaneous queue properties */
  queue_items, /**Set of items of a queue **/
  queue_receiving, /**Set of tasks waiting to recive one item of queue **/
  queue_sending,/**Set of tasks waiting to send one item to queue **/
  mutex_holder
  
  
INVARIANT
  queues : POW(QUEUE) & 
  
  queue_receiving : QUEUE +-> POW(TASK) & 
  queue_sending : QUEUE+-> POW(TASK) &
  
  queues = dom(queue_receiving) &
  queues = dom(queue_sending) &
  
  queues_msg <: queues &
  queues_msg_full <: queues_msg &
  queues_msg_empty <: queues_msg &
  
  queues_msg_full/\queues_msg_empty = {} &
  
  
  
  queue_items : QUEUE +-> POW(ITEM) &
  
  queues_msg = dom(queue_items) &
  
  
  !(q1,q2,tk).(q1:queues & q2:queues & tk:TASK & tk:queue_receiving(q1)=> tk/:queue_sending(q2))&
  !(q1,q2,tk).(q1:queues & q2:queues & tk:TASK & tk:queue_sending(q2)=> tk/:queue_receiving(q1))&
  !(q1,q2,tk).(q1:queues & q2:queues & q1/=q2 & tk:TASK & tk:queue_receiving(q1) => tk/:queue_receiving(q2))&
  !(q1,q2,tk).(q1:queues & q2:queues & q1/=q2 & tk:TASK & tk:queue_sending(q1) => tk/:queue_sending(q2))&
  
  
  semaphores: POW(QUEUE) &
  semaphores<:queues &
  
  semaphores_busy<:semaphores &
  
  mutexes <: queues &/* mutex is a type of binary semaphore, however some operation will work only 
  with semaphore, for this reason mutex was specific as without relation with semaphore
  */ 
  mutex_holder: QUEUE +-> TASK &
  
  mutexes=dom(mutex_holder)  &
  
  mutexes_busy<:mutexes &
  
  
  !mt.(mt:mutexes_busy => mutex_holder(mt)/=TASK_NULL) &
  !mt.(mt:mutexes & mt/:mutexes_busy => mutex_holder(mt)=TASK_NULL) &
  
  queues_msg/\semaphores={} &
  queues_msg/\mutexes={} &
  mutexes/\semaphores={}
  
  
CONSTANTS 
  remove_task
  
PROPERTIES 
  remove_task : ((QUEUE+->POW(TASK)) * POW(TASK))--> (QUEUE+->POW(TASK)) &
  remove_task = %(q_task,unblocked).(q_task:QUEUE+->POW(TASK) & unblocked:POW(TASK)|
    %(q1).(q1:QUEUE & q1:dom(q_task) | q_task(q1)-unblocked))
  
  
ASSERTIONS
  !(que).(que:QUEUE & que/:queues=> que/:mutexes)&
  !(que).(que:QUEUE & que/:queues=> que/:semaphores)&
  !(que).(que:queues_msg & que:queues_msg_full=>que/:queues_msg_empty)&
  !(que).(que:queues_msg & que:queues_msg_empty=>que/:queues_msg_full)
  
  
  
INITIALISATION
  
  queues := {}||
  queues_msg:={}||
  queue_items := {}||
  queue_receiving := {}||
  queue_sending := {}||
  semaphores:={}||
  semaphores_busy:={}||
  mutexes:={}||
  mutexes_busy:={}||
  mutex_holder:={} ||
  queues_msg_full:={} ||
  queues_msg_empty := {}
  
OPERATIONS
  /**********************************************************************************************************
  /brief Create Queue
  
  /do
  Create a new queue that will be manage by FreeRTOS. The length queue and size itens of queue 
  features aren't used in this level of abstraction and the decision of when the queue can or not be 
  create will be implemente in future refinement.
  
  /parameters
  uxQueueLength - Queue length - No used in this abstraction level
  uxItemSize - the size of one item of queue - No used in this abstraction level
  
  **********************************************************************************************************/
  xQueueHandle <-- q_queueCreate(uxQueueLength, uxItemSize) =
  PRE
    uxQueueLength: QUEUE_LENGTH & 
    uxItemSize:QUEUE_LENGTH &
    uxQueueLength>0
  THEN    
    
    ANY
      pxQueue 
    WHERE
      pxQueue : QUEUE & 
      pxQueue /: queues
    THEN	
      queues := queues \/ {pxQueue}||
      queues_msg:= queues_msg \/ {pxQueue}||
      queue_items := queue_items \/ {pxQueue |-> {}} ||
      queue_receiving := queue_receiving \/ {pxQueue |-> {}} ||
      queue_sending := queue_sending \/ {pxQueue |-> {}}||
      queues_msg_empty:=queues_msg_empty\/{pxQueue}||
      xQueueHandle:=pxQueue
    END		    
    
  END;
  
  /**********************************************************************************************************		
  /brief 
  Delete Queue		
  /do
  Delete a hardware abstraction Queue. This operation will delete only Queue that It aren't mutex or
  semaphore
  /parameters
  queue - Queue that will be delete
  
  **********************************************************************************************************/
  q_queueDelete(pxQueue) =
  PRE
    pxQueue : queues &
    pxQueue /:semaphores &
    pxQueue /: mutexes &
    queue_receiving(pxQueue) = {} &
    queue_sending(pxQueue) = {}
  THEN    
    queues := queues - {pxQueue}||
    queues_msg := queues_msg - {pxQueue} ||
    queue_items := {pxQueue} <<| queue_items  ||
    queue_receiving := {pxQueue} <<| queue_receiving ||
    queue_sending := {pxQueue} <<| queue_sending||
    IF pxQueue:queues_msg_full THEN  queues_msg_full := queues_msg_full-{pxQueue} END||
  	IF pxQueue:queues_msg_empty THEN queues_msg_empty := queues_msg_empty-{pxQueue} END
  END;
  
  /**********************************************************************************************************
  /brief 
  Send Item
  /do
  Inserts one item in the queue and remove the task from the set of tasks that are waiting to receive one item. 
  The given task shall be waiting on the given queue.   
  /parameters
  pxQueue - Queue that will send the item
  pxItem - Queue that will send to queue
  task - Task in reciving set that will unblock
  copy_position - Position that the item will insert in the queue, this can be queueSEND_TO_BACK,queueSEND_TO_FRONT, to insert 
  a item in front and black respective 
  **********************************************************************************************************/
  q_sendItem(pxQueue, pxItem, task, copy_position) =
  PRE
    pxQueue : queues_msg & 
    pxItem:ITEM & 
    pxItem/:queue_items(pxQueue)&
    task:TASK & 
    copy_position:COPY_POSITION &	    
    task:queue_receiving(pxQueue) &
    pxQueue/:queues_msg_full
  THEN
    queue_items(pxQueue) := queue_items(pxQueue) \/ {pxItem}||
    IF copy_position = queueSEND_TO_BACK THEN
      queue_receiving(pxQueue) := queue_receiving(pxQueue) - {task}
    ELSE
      queue_receiving(pxQueue) := queue_receiving(pxQueue) - {task}
    END||
    IF pxQueue:queues_msg_empty THEN
      queues_msg_empty := queues_msg_empty-{pxQueue}
    END||
    CHOICE
      queues_msg_full:= queues_msg_full\/{pxQueue}
    OR
      skip
    END
  END;
  
  /******************************************************************************************************************************
  /brief Received Item Recive
  
  /do
  Remove or not one item of indicated queue and remove the passed task from the set of tasks waiting to send. For remove 
  the intem the parameter justPeeking shall be false, for only read the item in the queue without remove then, the paramenter
  justPeeking shall be true. 
  
  /parameters
  pxQueue - Queue that the task will be insert in the sending
  justPeeking - Flag that indicate if the item will reade and remove or only read
  pxTask - Task that have the item that will be read
  ****************************************************************************************************************************/
  xItem <-- q_receivedItem(pxQueue,justPeeking,task) =
  PRE
    pxQueue : queues_msg & 
    justPeeking : BOOL & 
    task : TASK & 
    task : queue_sending(pxQueue) &
    queue_items(pxQueue)/={} &
    pxQueue/:queues_msg_empty 
  THEN
    ANY
      item
    WHERE
      item : ITEM & 
      item : queue_items(pxQueue)
    THEN
      IF justPeeking = FALSE
      THEN        	    
        queue_items(pxQueue) := queue_items(pxQueue) - {item} ||
        queue_sending(pxQueue) := queue_sending(pxQueue) - {task}||
        IF pxQueue: queues_msg_full THEN
          queues_msg_full:=queues_msg_full-{pxQueue}
        END||
        CHOICE
          queues_msg_empty:=queues_msg_empty\/{pxQueue}
        OR
          skip
        END
      END ||
      xItem:=item
    END
  END;
  
  /**********************************************************************************************************
  /brief
  Insert Task in Wainting To Send
  /do
  Insert a task in task wainting to send list
  **********************************************************************************************************/
  q_insertTaskWaitingToSend(pxQueue, pxTask) =
  PRE
    pxQueue : queues & 
    pxTask : TASK &
    !q1.(q1:queues => pxTask/: queue_sending(q1) & pxTask/:queue_receiving(q1))
  THEN
    queue_sending(pxQueue) := queue_sending(pxQueue) \/ {pxTask}
  END;
  
  
  
  /**********************************************************************************************************
  /brief Insert Task in Waiting to Send
  
  /do
  Insert a task in the set of tasks waiting to send one item to passed queue
  
  /parameters
  pxQueue - Queue that the task will be insert in the sending
  pxTask - Task that will insert in the set sending
  **********************************************************************************************************/
  q_insertTaskWaitingToReceive(pxQueue, pxTask) =
  PRE
    pxQueue : queues &
    pxTask : TASK &
    !q1.(q1:queues => pxTask/: queue_sending(q1) & pxTask/:queue_receiving(q1))
  THEN
    queue_receiving(pxQueue) := queue_receiving(pxQueue) \/ {pxTask}
  END	;
  
  /**
  /brief 
  Remove From Event List Queue
  /do
  Remove a task from all events sets (reciving, sending) in all queues of FreeRTOS
  
  /parameters
  task - Task that will be removing
  
  **/	
  q_removeFromEventListQueue(task) =
  PRE
    task : TASK  
  THEN
    ANY
      pxQueue
    WHERE
      pxQueue:queues &
      task:queue_receiving(pxQueue)
    THEN
      queue_receiving(pxQueue) := queue_receiving(pxQueue)-{task} 
    END ||
    ANY
      pxQueue
    WHERE
      pxQueue:queues &
      task:queue_sending(pxQueue)
    THEN
      queue_sending(pxQueue) := queue_sending(pxQueue) -{task}
    END
  END;
  
  
  rSemaphore<--q_createSemaphore(maxCount,initialCount)=
  PRE
    maxCount:QUEUE_LENGTH &
    initialCount:QUEUE_QUANT &
    initialCount <= maxCount
  THEN
    ANY 
      semaphore
    WHERE
      semaphore:QUEUE &
      semaphore/:queues
    THEN
      queues:= queues \/ {semaphore} ||
      queue_receiving := queue_receiving \/ {semaphore |-> {}} ||
      queue_sending := queue_sending \/ {semaphore |-> {}}||
      semaphores:=semaphores \/ {semaphore} ||
      CHOICE
        semaphores_busy:=semaphores_busy\/{semaphore}
      OR
        skip
      END||
      rSemaphore:=semaphore
    END
  END;
  
  q_deleteSemaphore(semaphore)=
  PRE
    semaphore:semaphores
  THEN
    queues := queues - {semaphore}||
    semaphores := semaphores - {semaphore} ||
    queue_receiving := {semaphore} <<| queue_receiving ||
    queue_sending := {semaphore} <<| queue_sending ||
    IF 
      semaphore:semaphores_busy 
    THEN
      semaphores_busy := semaphores_busy-{semaphore}
    END
  END;
  
  q_takeSemaphore(semaphore,pxTask)=
  PRE 
    semaphore: semaphores &
    semaphore/: semaphores_busy & 
    pxTask:TASK &
    pxTask: queue_sending(semaphore)
  THEN
    CHOICE
      semaphores_busy:= semaphores_busy \/ {semaphore}
    OR
      skip
    END||
    queue_sending(semaphore):=queue_sending(semaphore)-{pxTask} /* When the semaphore is take, other task can give it, put it in 
    unbusy state */
  END;
  
  q_giveSemaphore(semaphore,pxTask)=
  PRE
    semaphore:semaphores &
    pxTask:TASK &
    pxTask: queue_receiving(semaphore)
  THEN
    CHOICE
    	IF semaphore: semaphores_busy 
    	THEN
      	semaphores_busy := semaphores_busy - {semaphore}
    	END||
    		queue_receiving(semaphore):=queue_receiving(semaphore)-{pxTask}
    OR
      skip
    END
  END;
  
  rMutex<--q_createMutex =
  BEGIN
    
    ANY 
      mutex
    WHERE
      mutex : QUEUE &
      mutex /: queues 
    THEN
      queues:=queues\/{mutex}||
      mutexes:=mutexes\/{mutex}||
      queue_receiving := queue_receiving \/ {mutex |-> {}} ||
      queue_sending := queue_sending\/ {mutex|-> {}}||
      mutex_holder := mutex_holder\/ {mutex|-> TASK_NULL}||
      rMutex:=mutex
    END
  END;
  
  q_takeMutex(mutex,task)=
  PRE
    mutex:mutexes&
    mutex/:mutexes_busy &
    task:TASK &
    task/=TASK_NULL
  THEN
    mutexes_busy := mutexes_busy \/ {mutex}||
    mutex_holder(mutex):=task /* The aren't task waiting for give the mutex 'cause the only task that can give the 
    mutex is a task mutex holder */
  END;
  
  q_giveMutex(mutex,pxTask)=
  PRE
    mutex:mutexes &
    mutex:mutexes_busy &
    pxTask:TASK /* only the task that hold the mutex can give it*/
  THEN
    mutexes_busy:=mutexes_busy-{mutex}||
    mutex_holder(mutex):=TASK_NULL||
    queue_receiving(mutex):=queue_receiving(mutex)-{pxTask}
  END;
  
  
  q_endScheduler=
  BEGIN
    queues := {}||
    queues_msg:={}||
    queues_msg_empty:={}||
    queues_msg_full:={}||
    queue_items := {}||
    queue_receiving := {}||
    queue_sending := {}||
    semaphores:={}||
    semaphores_busy:={}||
    mutexes:={}||
    mutexes_busy:={}||
    mutex_holder:={}
  END;
  
  q_resumeAll(unblocked)=
  PRE
    unblocked:POW(TASK)
  THEN
    IF queue_sending/={} 
    THEN
      queue_sending:=remove_task(queue_sending,unblocked)
    END||
    
    IF queue_receiving/={} 
    THEN
      queue_receiving:=remove_task(queue_receiving,unblocked)
    END
  END
  
  
  
  
END
