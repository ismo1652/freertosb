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
    Types
    

    
/*ASSERTIONS
    
    !(task, queues, pending).
    	(task : TASK & queues : POW(QUEUE) & pending : QUEUE +-> POW(TASK) => 
    	    dom(REMOVE_EVENT(task, queues, pending)) = (queues /\ dom(pending)))
*/    	    
VARIABLES

    /** Different queues in FreeRTOS */
    queues,
    semaphores,
    mutexes,
    	
    /** miscellaneous queue properties */
    queue_items, /**Set of items of a queue **/
    queue_receiving, /**Set of tasks waiting to recive one item of queue **/
    queue_sending,/**Set of tasks waiting to send one item to queue **/
  	mutex_holder
   
    
     
    
INVARIANT
    queues : POW(QUEUE) & 
    queue_items : QUEUE +-> POW(ITEM) &
    queue_receiving : QUEUE +-> POW(TASK) & 
    queue_sending : QUEUE+-> POW(TASK) &
    
    /*Set for keep the queue of semaphore type*/
    semaphores: POW(QUEUE) &
    semaphores<:queues &
    
    mutexes: POW(QUEUE)& 
    mutexes<:queues&
    	
	/**All queue must have a set of item, a set of tasks waiting to recive, set of task waiting to send and a capacity **/
	queues = dom(queue_items) &
	queues = dom(queue_receiving) &
	queues = dom(queue_sending) &
	!(q1,q2,tk).(q1:queues & q2:queues & tk:TASK & tk:queue_receiving(q1)=> tk/:queue_sending(q2))&
	!(q1,q2,tk).(q1:queues & q2:queues & tk:TASK & tk:queue_sending(q2)=> tk/:queue_receiving(q1))&
	!(q1,q2,tk).(q1:queues & q2:queues & q1/=q2 & tk:TASK & tk:queue_receiving(q1) => tk/:queue_receiving(q2))&
	!(q1,q2,tk).(q1:queues & q2:queues & q1/=q2 & tk:TASK & tk:queue_sending(q1) => tk/:queue_sending(q2))&
	
	mutex_holder: QUEUE +-> TASK &
	
	mutexes=dom(mutex_holder) &
	
	
	!mt.(mt:mutexes & queue_items(mt)={} => mutex_holder(mt)/=TASK_NULL) &
	!mt.(mt:mutexes & queue_items(mt)/={} => mutex_holder(mt)=TASK_NULL) &
	!mt.(mt:mutexes => queue_items(mt)={} or queue_items(mt)={ITEM_EMPTY}) 
	
CONSTANTS 
    remove_task
    
PROPERTIES 
    remove_task : ((QUEUE+->POW(TASK)) * POW(TASK))--> (QUEUE+->POW(TASK)) &
    remove_task = %(q_task,unblocked).(q_task:QUEUE+->POW(TASK) & unblocked:POW(TASK)|
        										%(q1).(q1:QUEUE & q1:dom(q_task) | q_task(q1)-unblocked))
    
    
ASSERTIONS
    !(que).(que:QUEUE & que/:queues=> que/:mutexes) &
    !(mt).(mt:mutexes & queue_items(mt)/={} => queue_items(mt)={ITEM_EMPTY})&
    !(mt).(mt:mutexes & queue_items(mt)/={ITEM_EMPTY} => queue_items(mt)={})

    
INITIALISATION
    
    queues := {}||
    queue_items := {}||
    queue_receiving := {}||
    queue_sending := {}||
    semaphores:={}||
    mutexes:={}||
    mutex_holder:={}
    
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
	xQueueHandle <-- xQueueCreate(uxQueueLength, uxItemSize) =
	PRE
    	uxQueueLength: NAT & 
    	uxItemSize:NAT
	THEN    
    	CHOICE
			ANY
			    pxQueue 
			WHERE
			    pxQueue : QUEUE & 
			    pxQueue /: queues
			THEN	
		    	queues := queues \/ {pxQueue}||
		    	queue_items := queue_items \/ {pxQueue |-> {}} ||
		    	queue_receiving := queue_receiving \/ {pxQueue |-> {}} ||
		    	queue_sending := queue_sending \/ {pxQueue |-> {}}||
		    	xQueueHandle:=pxQueue
			END		    
     	OR
        	xQueueHandle:=QUEUE_NULL
     	END
   	END;
   	
   	
   	/**
		/brief Delete Queue
		
		/do
			Delete a queue
			
		/parameters
			queue - Queue that will be delete

	**/
	q_queueDelete(pxQueue) =
	PRE
		pxQueue : queues
	THEN    
    	queues := queues - {pxQueue}||
		queue_items := {pxQueue} <<| queue_items  ||
		queue_receiving := {pxQueue} <<| queue_receiving ||
		queue_sending := {pxQueue} <<| queue_sending ||
		IF pxQueue:semaphores THEN
		    semaphores:=semaphores-{pxQueue}
		END||
		IF pxQueue:mutexes THEN
		    mutexes:=mutexes-{pxQueue}||
		    mutex_holder:= {pxQueue} <<| mutex_holder
		END
   	END;
   	
	/**
		/brief Send Item
		
		/do
			Inserts one item in the queue and remove the task from the set of tasks that are waiting to receive one item. The given task shall be
			waiting on the given queue.
			
		/parameters
			pxQueue - Queue that will send the item
			pxItem - Queue that will send to queue
			task - Task in reciving set that will unblock
			copy_position - Position that the item will insert in the queue, this can be queueSEND_TO_BACK,queueSEND_TO_FRONT, to insert 
							a item in front and black respective
			
	**/
	q_sendItem(pxQueue, pxItem, task, copy_position) =
	PRE
	    pxQueue : queues & 
	    pxQueue/:mutexes &
    	pxItem:ITEM & 
    	task:TASK & 
    	copy_position : COPY_POSITION &	    
	    task : queue_receiving(pxQueue)
	THEN
    	queue_items(pxQueue) := queue_items(pxQueue) \/ {pxItem}||
    	queue_receiving(pxQueue) := queue_receiving(pxQueue) - {task}
 	END;
 
	q_sendItemMutex(mutex,task) =
	PRE
    	mutex : mutexes & 
    	task:TASK &     
    	task:queue_receiving(mutex) &
    	queue_items(mutex)={}  
    	 
 	THEN     
    	queue_items(mutex) := queue_items(mutex) \/ {ITEM_EMPTY}||
    	queue_receiving(mutex) := queue_receiving(mutex) - {task}||
    	mutex_holder(mutex):=TASK_NULL 
	END;
	
	/**
		/brief Insert Task in Waiting to Recive
		
		/do
			Insert a task in the set of tasks waiting to recive a item of passed queue
			
		/parameters
			pxQueue - Queue that the task will be insert in the reciving
			pxTask - Task that will insert in the set of task waiting to recive (reciving)
	**/
	q_insertTaskWaitingToSend(pxQueue, pxTask) =
	PRE
		pxQueue : queues & 
		pxTask : TASK &
		!q1.(q1:queues => pxTask/: queue_sending(q1) & pxTask/:queue_receiving(q1))
		
	THEN
    	queue_sending(pxQueue) := queue_sending(pxQueue) \/ {pxTask}
	END;

	/**
		/brief Insert Task in Waiting to Send
		
		/do
			Insert a task in the set of tasks waiting to send one item to passed queue
			
		/parameters
			pxQueue - Queue that the task will be insert in the sending
			pxTask - Task that will insert in the set sending
	**/
    q_insertTaskWaitingToReceive(pxQueue, pxTask) =
    PRE
        pxQueue : queues &
        pxTask : TASK &
        !q1.(q1:queues => pxTask/: queue_sending(q1) & pxTask/:queue_receiving(q1))
    THEN
        
        queue_receiving(pxQueue) := queue_receiving(pxQueue) \/ {pxTask}
    END	;
	
	/**
		/brief Received Item Recive
		
		/do
			Remove or not one item of indicated queue and remove the passed task from the set of tasks waiting to send. For remove 
			the intem the parameter justPeeking shall be false, for only read the item in the queue without remove then, the paramenter
			justPeeking shall be true. 
									
		/parameters
			pxQueue - Queue that the task will be insert in the sending
			justPeeking - Flag that indicate if the item will reade and remove or only read
			pxTask - Task that have the item that will be read
	**/
	xItem <-- q_receivedItem(pxQueue, justPeeking,task,rTask) =
	PRE
    	pxQueue : queues & 
    	justPeeking : BOOL & 
    	task : TASK & 
    	task : queue_sending(pxQueue) &
    	queue_items(pxQueue)/={} &
    	rTask:TASK &
    	rTask/=TASK_NULL
	THEN
	    ANY
	        item
	    WHERE
	        item : ITEM & 
	        item : queue_items(pxQueue)
    	THEN
	        IF justPeeking = FALSE
    	    THEN        	    
        	    IF pxQueue:mutexes THEN 
        	        IF (queue_items(pxQueue) = {ITEM_EMPTY} )THEN
        	            mutex_holder(pxQueue):= rTask||
        	            queue_items(pxQueue) := queue_items(pxQueue) - {ITEM_EMPTY}
	        	    ELSE
	        	        mutex_holder(pxQueue):= TASK_NULL
	        	    END
	        	ELSE
	        	    queue_items(pxQueue) := queue_items(pxQueue) - {item}
	        	END||
	        	
	        	queue_sending(pxQueue) := queue_sending(pxQueue) - {task}
	        END ||
	        
        	xItem:=item
	    END
	END;
	
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
            queue_receiving(pxQueue) := queue_receiving(pxQueue) -{task} 
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
    
    q_endScheduler=
    BEGIN
        queues := {}||
        queue_items := {}||
        queue_receiving := {}||
        queue_sending := {}||
        semaphores:={}||
        mutexes:={}||
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
    END;
    
    
    semaph<--q_createSemaphore(length,initialCount)=
    PRE
        length:NAT&
        length>0 &
        initialCount:NAT &
        initialCount<=length
    THEN
        ANY 
            semaphore,s_items
        WHERE
            semaphore : QUEUE &
            semaphore /: queues &
            semaphore/: mutexes&
            s_items: POW(ITEM)&
            card(s_items)=initialCount
            
        THEN
            queues:=queues\/{semaphore}||
            semaphores:=semaphores\/{semaphore}||
            queue_items:=queue_items\/{ semaphore |->s_items}||
            queue_receiving := queue_receiving \/ {semaphore |-> {}} ||
            queue_sending := queue_sending \/ {semaphore|-> {}}||
            semaph:=semaphore
            
        END
        	
     END;
     
    mt<--q_createMutex=
    BEGIN
        ANY 
            mutex
        WHERE
            mutex : QUEUE &
            mutex /: queues 
        THEN
            queues:=queues\/{mutex}||
            mutexes:=mutexes\/{mutex}||
            queue_items:=queue_items\/{mutex |->{ITEM_EMPTY}}||
            queue_receiving := queue_receiving \/ {mutex |-> {}} ||
            queue_sending := queue_sending \/ {mutex|-> {}}||
            mutex_holder := mutex_holder\/ {mutex|-> TASK_NULL}||
            mt:=mutex
        END
        	
    END
    
 
END