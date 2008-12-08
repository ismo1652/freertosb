/* Queue_Basic

 \brief Basic layer of definitions for queue support in FreeRTOS.
 
 This machine defines the concept of a queue in FreeRTOS.

 Queues are modelled as sets, instead as true queues.
 
 Author: Stephenson Galvao, David Deharbe
 Creation date: Fri Dec 5 2008
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
 */ 

MACHINE

    Queue_Basic

SEES

    Types,Task_Basic

SETS
    ITEM;			/** queue items */
    COPY_POSITION;	/** position of insertions in queues = {queueSEND_TO_BACK,queueSEND_TO_FRONT}*/
    QUEUE 			/** queues */

CONSTANTS
    
	QUEUE_NULL,
	ITEM_NULL,
	QUEUE_ISFULL,
	QUEUE_ISEMPTY,
	QUEUES_WITH_TASK,	/** functions mapping task to queues where such task is present */
    REMOVE_EVENT

PROPERTIES

    QUEUE_NULL:QUEUE &
    ITEM_NULL:ITEM &
	
	/** do we need to have this level of precision? */
	QUEUE_ISFULL : QUEUE * (QUEUE+->POW(ITEM)) * (QUEUE+->NAT) --> BOOL & 
	QUEUE_ISFULL =
		%(queue, contents, capacity).
			(queue : QUEUE & contents  : QUEUE +-> POW(ITEM) & capacity : QUEUE+->NAT & 
			 queue : dom(capacity) & queue:dom(contents) |
	    				bool(card(contents(queue)) = capacity(queue))) &

	/** do we need to have this level of precision? */
    QUEUE_ISEMPTY : QUEUE * (QUEUE+->POW(ITEM)) --> BOOL &
    QUEUE_ISEMPTY =
    	%(queue, contents).
    		(queue : QUEUE & contents: QUEUE+->POW(ITEM) & queue : dom(contents) |
    		    		bool(contents(queue) = {})) &

	QUEUES_WITH_TASK : TASK * POW(QUEUE) * (QUEUE+-> POW(TASK)) * (QUEUE+-> POW(TASK)) --> POW(QUEUE) &
	QUEUES_WITH_TASK =
		%(task, queues, receiving, sending).
			(task : TASK & queues: POW(QUEUE) & 
			 receiving : QUEUE+-> POW(TASK) & sending : QUEUE+-> POW(TASK)	&
			    queues = dom(receiving) & queues = dom(sending) |
			    		{queue | queue : queues & (task : receiving(queue) \/ sending(queue)) }) &
    
	    				
	
    REMOVE_EVENT : TASK * POW(QUEUE) * (QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) &
    REMOVE_EVENT = 
    	%(task, queues, pending).
    		(task : TASK & queues : POW(QUEUE) & pending : QUEUE +-> POW(TASK) |
    				%(queue).(queue : queues | pending(queue) - {task}))
                            /*
    REMOVE_EVENT = 
    	%(task, queues, pending).
    		(task : TASK & queues : POW(QUEUE) & pending : QUEUE +-> POW(TASK) |
    				UNION(queue).(queue : queues | 
    				    			{mm | mm: (QUEUE * POW(TASK)) & mm = queue |-> (pending(queue) - {task})})) */

ASSERTIONS
    
    !(task, queues, pending).
    	(task : TASK & queues : POW(QUEUE) & pending : QUEUE +-> POW(TASK) => 
    	    dom(REMOVE_EVENT(task, queues, pending)) = queues)
    	    
VARIABLES

    /** Different queues in FreeRTOS */
    queues,
    	
    /** miscellaneous queue properties */
    queue_items, /**Set of items of a queue **/
    queue_receiving, /**Set of tasks waiting to recive one item of queue **/
    queue_sending,	/**Set of tasks waiting to send one item to queue **/
    queue_capacity /**Capacity of Queue **/
    
INVARIANT
    queues : POW(QUEUE) & 
    queue_items : QUEUE +-> POW(ITEM) &
    queue_receiving : QUEUE+-> POW(TASK) & 
    queue_sending : QUEUE+-> POW(TASK) &
    queue_capacity : QUEUE+->NAT &
	
	/**All queue must have a set of item, a set of tasks waiting to recive, set of task waiting to send and a capacity **/
	queues = dom(queue_items) &
	queues = dom(queue_receiving) &
	queues = dom(queue_sending) &
	queues = dom(queue_capacity) &
	
	/**The numbers of items in set of item must be less equals than the capacity of queue **/
	!(queue).(queue:queues => card(queue_items(queue))<= queue_capacity(queue)) 
	
	
    
    
INITIALISATION
    queues := {QUEUE_NULL}||
    queue_items := {QUEUE_NULL |-> {}}||
    queue_receiving := {QUEUE_NULL |-> {}}||
    queue_sending := {QUEUE_NULL |-> {}}||
    queue_capacity := {QUEUE_NULL |-> 0}
    
OPERATIONS
	/**
		/brief Create Queue
		/do
			Create a new queue that will be manage by FreeRTOS
			
		/parameters
			uxQueueLength - Queue length 
			uxItemSize - the size of one item of queue
 	
	**/
	xQueueHandle <-- xQueueCreate(uxQueueLength, uxItemSize) =
	PRE
    	uxQueueLength: NAT & uxItemSize:NAT
	THEN    
    	CHOICE
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
		    	queue_capacity := queue_capacity \/ {queue|->uxQueueLength}||
		    	xQueueHandle := queue
			END		    
     	OR
        	xQueueHandle:=QUEUE_NULL
     	END
   	END;

	/**
		/brief Send Item
		
		/do
			Inserts one item in the queue and remove the task from the set of tasks that are waiting
			to receive one item. The given task shall be waiting on the given queue.
			
		/parameters
			pxQueue - Queue that will send the item
			pxItem - Queue that will send to queue
			task - Task in reciving set that will unblock
			copy_position - Position that the item will insert in the queue, this can be queueSEND_TO_BACK,queueSEND_TO_FRONT, to insert 
							a item in front and black respective
			
	**/
	sendItem(pxQueue, pxItem, task, copy_position) =
	PRE
    	pxQueue : queues & pxItem:ITEM & task:TASK & copy_position : COPY_POSITION &
	    QUEUE_ISFULL(pxQueue, queue_items, queue_capacity) = FALSE &
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
	insertTaskWaitingToSend(pxQueue, pxTask) =
	PRE
		pxQueue : queues & pxTask : TASK
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
	insertTaskWaitingToRecived(pxQueue, pxTask) =
	PRE
    	pxQueue : queues & pxTask : TASK
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
	xItem <-- receivedItem(pxQueue, justPeeking, task) =
	PRE
    	pxQueue : queues & justPeeking : BIT & task : TASK & 
    	QUEUE_ISEMPTY(pxQueue,queue_items) = FALSE & task : queue_sending(pxQueue)
	THEN
	    ANY
	        item
	    WHERE
	        item : ITEM & item : queue_items(pxQueue)
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
	removeFromEventListQueue(task) =
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