/* Queue_Basic

 \brief Queue API of FreeRTOS
 
 This machine implement the methods of Queue API in FreeRTOS

 Queues are modelled as sets, instead as true queues.
 
 Author: Stephenson Galvao, David Deharbe
 Creation date: Fri Dec 6 2008
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
 */ 
MACHINE
    Queue
SEES
    Types    
INCLUDES
    Queue_Basic

PROMOTES
	xQueueCreate
    
OPERATIONS
    
	/**
		/brief Queue Send
	
		/do	
			Send one item for indicate queue. If the queue is full and the task can waiting for until for one space in queue
			the current task is block and insert in the set of tasks that waiting to send a item, other wise the item is insert in
			the queue
		
		/paramenters
			pxQueue - Queue that will send the item
			pvItemToQueue - Item that will be send to the queue
			xTicksToWait - Time that the task can waiting for one space in queue, wich the queue is full
	
	**/    
	return <-- xQueueSend(pxQueue, pvItemToQueue, xTicksToWait)=
	PRE
    	pxQueue:queues  &  
    	pvItemToQueue:ITEM  &  
    	xTicksToWait:TICK
	THEN
	    ANY copy_position
	    WHERE
	        copy_position : COPY_POSITION
	    THEN
	        return <-- xQueueGenericSend(pxQueue, pvItemToQueue, xTicksToWait,copy_position)
	    END   	 	    		
	END
	;
	
	/**
		/brief Queue Send To Back
	
		/do	
			Send one item to back of the indicate queue. If the queue is full and the task can waintig for until for one space in queue
			the current task is block and insert in the set of tasks that waiting to send a item, other wise the item is insert in
			the queue
		
		/paramenters
			pxQueue - Queue that will send the item
			pvItemToQueue - Item that will be send to the queue
			xTicksToWait - Time that the task can waiting for one space in queue, wich the queue is full
	
	**/    
	return <-- xQueueSendToBack(pxQueue, pvItemToQueue, xTicksToWait)=
	PRE
    	pxQueue:queues  &  
    	pvItemToQueue:ITEM  &  
    	xTicksToWait:TICK
	THEN
	    ANY copy_position
	    WHERE
	        copy_position : COPY_POSITION
	    THEN
	        return <-- xQueueGenericSend(pxQueue, pvItemToQueue, xTicksToWait,copy_position)
	    END   	 	    		
	END
	;


	/**
		/brief Queue Send To Back
	
		/do	
			Send one item to front of the indicate queue. If the queue is full and the task can waintig for until for one space in queue
			the current task is block and insert in the set of tasks that waiting to send a item, other wise the item is insert in
			the queue
		
		/paramenters
			pxQueue - Queue that will send the item
			pvItemToQueue - Item that will be send to the queue
			xTicksToWait - Time that the task can waiting for one space in queue, wich the queue is full
	
	**/ 
	return <-- xQueueSendToFront(pxQueue,pvItemToQueue,xTicksToWait)=
	PRE
    	pxQueue:queues  &  
    	pvItemToQueue:ITEM  &  
    	xTicksToWait:TICK
	THEN
	    ANY copy_position
	    WHERE
	        copy_position : COPY_POSITION
	    THEN
	        return <-- xQueueGenericSend(pxQueue, pvItemToQueue, xTicksToWait,copy_position)
	    END   	 	    		
	END
	;


	/**
		/brief Queue Recived Item
	
		/do	
			Remove and return one item of queue. If the queue is empty and the task can wainting for one item arrive in the queue
			the current task is block and insert in the set reciving, set of tasks waiting to recive one item of queue. 
		
		/paramenters
			pxQueue - Queue that will send the item
			xTicksToWait - Time that the task can waiting for one item arrive in queue, wich the queue is empty
			
		/note
			In the original implementation pvBuffer is passed as reference and if the queue is empty, nothing is change 
			in the pvBuffer. Here it's implement as return of function and if the queue is empty, the ITEM_NULL is return
	
	**/ 
	return,pvBuffer<--xQueueReceive(xQueue,xTicksToWait)=
	PRE
    	xQueue:queues & xTicksToWait:TICK
	THEN
    	return,pvBuffer<--xQueueGenericReceive(xQueue,xTicksToWait,pdFALSE)
	END
	;
	
	/**
		/brief Queue Recived Item
	
		/do	
			Return one item of queue whitout remove then.
		
		/paramenters
			pxQueue - Queue that will send the item
			xTicksToWait - Time that the task can waiting for one item arrive in queue, wich the queue is empty
			
		/note
			In the original implementation pvBuffer is passed as reference and if the queue is empty, nothing is change 
			in the pvBuffer. Here it's implement as return of function and if the queue is empty, the ITEM_NULL is return
	
	**/ 
	return,pvBuffer<--xQueuePeek(xQueue,xTicksToWait)=
	PRE
    	xQueue:queues & xTicksToWait:TICK
	THEN
    	return,pvBuffer<--xQueueGenericReceive(xQueue,xTicksToWait,pdTRUE)
	END
	
    	


END