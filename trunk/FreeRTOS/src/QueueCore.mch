/* QueueCore

 \brief Basic layer of definitions for queue support in FreeRTOS.
 
 This machine defines the concept of a queue in FreeRTOS without the features of length queue and size queue itens.
 Queues are modelled as sets, instead as true queues.
 
 Author: Stephenson Galvao, David Deharbe
 Creation date: Tue Jan 27 2009
 Universidade Federal do Rio Grande do Norte
 Departamento de Informática e Matemática Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Research Laboratory
*/ 

MACHINE
    QueueCore

SEES
    Types,
    QueueContext
                            
 	    
VARIABLES

    /** Different queues in FreeRTOS */
    queues,
    	
    /** miscellaneous queue properties */
    queue_items, /**Set of items of a queue **/
    queue_receiving, /**Set of tasks waiting to recive one item of queue **/
    queue_sending	/**Set of tasks waiting to send one item to queue **/
     
    
INVARIANT
    queues : POW(QUEUE) & 
    queue_items : QUEUE +-> POW(ITEM) &
    queue_receiving : QUEUE+-> POW(TASK) & 
    queue_sending : QUEUE+-> POW(TASK) &
    	
	/**All queue must have a set of item, a set of tasks waiting to recive, set of task waiting to send and a capacity **/
	queues = dom(queue_items) &
	queues = dom(queue_receiving) &
	queues = dom(queue_sending) 
    
INITIALISATION
    
    queues := {}||
    queue_items := {}||
    queue_receiving := {}||
    queue_sending := {}
    
    
OPERATIONS
	/**
		/brief Create Queue
		/do
			Create a new queue that will be manage by FreeRTOS. The length queue and size itens of queue features aren't used in this level
			of abstraction and the decision of when the queue can or not be create will be implemente in future refinement.
			
		/parameters
			uxQueueLength - Queue length - No used in this abstraction level
			uxItemSize - the size of one item of queue - No used in this abstraction level
 	
	**/
	r_queue <-- q_queueCreate(uxQueueLength, uxItemSize) =
	PRE
    	uxQueueLength: NAT & 
    	uxItemSize:NAT
	THEN    
    	
		ANY
			queue 
		WHERE
			queue : QUEUE & 
			queue /: queues
		THEN	
		    queues := queues \/ {queue}||
		    queue_items := queue_items \/ {queue |-> {}} ||
		    queue_receiving := queue_receiving \/ {queue |-> {}} ||
		    queue_sending := queue_sending \/ {queue |-> {}}||
		    r_queue := queue
		END		    
     	
   	END;
   	
   	
   	/**
		/brief Delete Queue
		
		/do
			Delete a queue
			
		/parameters
			queue - Queue that will be delete

	**/
	q_queueDelete(queue) =
	PRE
		queue : queues
	THEN    
    	queues := queues - {queue}||
		queue_items := {queue} <<| queue_items  ||
		queue_receiving := {queue} <<| queue_receiving ||
		queue_sending := {queue} <<| queue_sending 
		
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
    	pxItem:ITEM & 
    	task:TASK & 
    	copy_position : COPY_POSITION &	    
	    task : queue_receiving(pxQueue)
	THEN
    	queue_items(pxQueue) := queue_items(pxQueue) \/ {pxItem}||
    	queue_receiving(pxQueue) := queue_receiving(pxQueue) - {task}
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
		pxTask : TASK
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
	q_insertTaskWaitingToRecived(pxQueue, pxTask) =
	PRE
    	pxQueue : queues &
    	pxTask : TASK
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
	xItem <-- q_receivedItem(pxQueue, justPeeking, task) =
	PRE
    	pxQueue : queues & 
    	justPeeking : BIT & 
    	task : TASK & 
    	task : queue_sending(pxQueue)
	THEN
	    ANY
	        item
	    WHERE
	        item : ITEM & 
	        item : queue_items(pxQueue)
    	THEN
	        IF justPeeking = pdFALSE
    	    THEN 
        	    queue_items(pxQueue) := queue_items(pxQueue) - {item}||
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
	        receiving, sending  
    	WHERE
        	receiving = REMOVE_EVENT(task, queues, queue_receiving) &
        	sending = REMOVE_EVENT(task, queues, queue_sending)
		THEN
       		queue_receiving := queue_receiving <+ receiving ||
       		queue_sending := queue_sending <+ sending
    	END
	END
END