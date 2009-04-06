/* Queue_Basic

 \brief Queue API of FreeRTOS
 
 This machine implement the methods of Queue API in FreeRTOS

 Queues are modelled as sets, instead as true queues.
 
 Author: Stephenson Galvao, David Deharbe
 Creation date: Tue Jan 27 2009
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
 */ 
MACHINE
    Queue_Basic
SEES
    Types    
INCLUDES
    Queue_Core,
    Task_Core,
    FreeRTOSConfig

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
	return <-- xQueueGenericSend(pxQueue, pvItemToQueue, xTicksToWait,copy_position)=
	PRE
    	pxQueue:queues  &  
    	pvItemToQueue:ITEM  &  
    	xTicksToWait:TICK &
    	copy_position:COPY_POSITION
	THEN
	    IF (xTicksToWait>0) 
	    THEN 
	    	CHOICE
        		insertTaskWaitingToSend(pxQueue,running)|| 
        		DelayTask(xTicksToWait)||
        		return:=pdTRUE        	
    		OR
    			ANY 
    		   		task
    			WHERE 
    		   		task:TASK & 
    				task:blocked & 
		   			task:queue_receiving(pxQueue)
        		THEN
       				sendItem(pxQueue,pvItemToQueue,task,copy_position)||
       				Unblock(task)||
       				return:=pdPASS
        		END        
   	 		END
   	 	ELSE
   	 	    CHOICE
   	 	    	ANY 
   		   			task
   				WHERE 
   		   			task:TASK & 
   					task:blocked & 
	   				task:queue_receiving(pxQueue) 
		   			
       			THEN
   					sendItem(pxQueue,pvItemToQueue,task,copy_position)||
   					Unblock(task)||
   					return:=pdPASS
       			END
       		OR
       		    return:=errQUEUE_FULL	
       		END 		
       		
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
	return,pvBuffer<--xQueueGenericReceive(xQueue,xTicksToWait,justPeeking)=
	PRE
    	xQueue:queues & 
    	xTicksToWait:TICK &
    	justPeeking : BIT
	THEN
	    IF xTicksToWait > 0
	    THEN
	        
    		CHOICE
        		insertTaskWaitingToRecived(xQueue,running)||
        		DelayTask(xTicksToWait)||
        		return,pvBuffer:=pdTRUE,ITEM_NULL
    		OR
        		ANY 
        	    	task 
        		WHERE 
        	    	task:TASK & 
        	    	task: queue_sending(xQueue) & 
        	    	task:blocked
        		THEN         
        			pvBuffer<--receivedItem(xQueue,justPeeking,task)||
        			IF justPeeking=pdFALSE THEN Unblock(task) END
        		END|| 
        		return:=pdPASS
        	END
        		
       	ELSE
       	    CHOICE
        	    ANY 
        	    	task 
        		WHERE 
        	    	task:TASK & 
        	    	task: queue_sending(xQueue) & 
        	    	task:blocked
        		THEN         
        			pvBuffer<--receivedItem(xQueue,justPeeking,task)||
        			IF justPeeking=pdFALSE THEN Unblock(task) END
        		END|| 
        		return:=pdPASS
        	OR
        	    return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL
        	END
        	
        		    
    	END
	END
	
		


END