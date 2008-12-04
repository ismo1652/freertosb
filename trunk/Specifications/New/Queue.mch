/* Queue
 * Author: stepgalvao
 * Creation date: Wed Dec 3 2008
 */
MACHINE
    Queue
SEES
    Types    
INCLUDES
    Queue_Basic,Task_Basic
    
PROMOTES
xQueueCreate
    
OPERATIONS
    
    
return <-- xQueueSend(pxQueue, pvItemToQueue, xTicksToWait)=
PRE
    pxQueue:queues &  pvItemToQueue:ITEM  & xTicksToWait:TICK
THEN
    SELECT (xTicksToWait>0 & (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=TRUE)) 
    THEN 
        insertTaskWaitingToSend(pxQueue,current_task)||
        vTaskDelay(xTicksToWait)||
        return:=pdTRUE
        	
    WHEN (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=FALSE) 
        THEN
    		ANY task,copy_position WHERE task:tasks & task_state(task)=blocked & task:queue_tkRecived(pxQueue) & copy_position:COPY_POSITION
        	THEN
           		sendItem(pxQueue,pvItemToQueue,task,copy_position)||
        		removeFromBlockedList(task)||
        		return:=pdPASS
        	END        
    WHEN (xTicksToWait=0 & (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=TRUE))
        THEN
    		return:=errQUEUE_FULL		
    END	
END
;

return <-- xQueueSendToBack(pxQueue, pvItemToQueue, xTicksToWait)=
PRE
    pxQueue:queues &  pvItemToQueue:ITEM  & xTicksToWait:TICK
THEN
    SELECT (xTicksToWait>0 & (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=TRUE)) 
    THEN 
        insertTaskWaitingToSend(pxQueue,current_task)||
        vTaskDelay(xTicksToWait)||
        return:=pdTRUE
        	
    WHEN (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=FALSE) 
        THEN
    		ANY task,copy_position WHERE task:tasks & task_state(task)=blocked & task:queue_tkRecived(pxQueue) & copy_position:COPY_POSITION
        	THEN
           		sendItem(pxQueue,pvItemToQueue,task,copy_position)||
        		removeFromBlockedList(task)||
        		return:=pdPASS
        	END        
    WHEN (xTicksToWait=0 & (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=TRUE))
        THEN
    		return:=errQUEUE_FULL		
    END	
END
;

return <-- xQueueSendToFront(pxQueue,pvItemToQueue,xTicksToWait)=
PRE
    pxQueue:queues &  pvItemToQueue:ITEM  & xTicksToWait:TICK
THEN
    SELECT (xTicksToWait>0 & (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=TRUE)) 
    THEN 
        insertTaskWaitingToSend(pxQueue,current_task)||
        vTaskDelay(xTicksToWait)||
        return:=pdTRUE
        	
    WHEN (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=FALSE) 
        THEN
    		ANY task,copy_position WHERE task:tasks & task_state(task)=blocked & task:queue_tkRecived(pxQueue) & copy_position:COPY_POSITION
        	THEN
           		sendItem(pxQueue,pvItemToQueue,task,copy_position)||
        		removeFromBlockedList(task)||
        		return:=pdPASS
        	END        
    WHEN (xTicksToWait=0 & (QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=TRUE))
        THEN
    		return:=errQUEUE_FULL		
    END	
END
;

/***
Warning:
	This function return ITEM_NULL if the queue is empty, but in the original function the pvBuffer is passed as parameters and
	when the queue is empty it do nothink with then xTicksToWait
**/
return,pvBuffer<--xQueueReceive(xQueue,xTicksToWait)=
PRE
    xQueue:queues & xTicksToWait:TICK
THEN
    SELECT QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait>0
    THEN
        insertTaskWaitingToRecived(xQueue,current_task)||
        vTaskDelay(xTicksToWait)||
        return,pvBuffer:=pdTRUE,ITEM_NULL
                            
    WHEN QUEUE_ISEMPTY(xQueue,queue_itens)=TRUE & xTicksToWait=0
    THEN
        return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL
        
    WHEN QUEUE_ISEMPTY(xQueue,queue_itens)=FALSE
    THEN
        ANY task WHERE task:TASK & task:tasks & task: queue_tkRecived(xQueue) & task_state(task)=blocked
        THEN         
        	pvBuffer<--recivedItem(xQueue,pdFALSE,task)||
        	removeFromBlockedList(task)
        END|| return:=pdPASS
        		
        
    END
    
        
END
;
return,pvBuffer<--xQueuePeek(xQueue,xTicksToWait)=
PRE
    xQueue:queues & xTicksToWait:TICK
THEN
    SELECT QUEUE_ISEMPTY(xQueue,queue_itens) = TRUE & xTicksToWait>0
    THEN
        insertTaskWaitingToRecived(xQueue,current_task)||
        vTaskDelay(xTicksToWait)||
        return,pvBuffer:=pdTRUE,ITEM_NULL
                            
    WHEN QUEUE_ISEMPTY(xQueue,queue_itens)=TRUE & xTicksToWait=0
    THEN
        return,pvBuffer:=errQUEUE_EMPTY,ITEM_NULL
        
    WHEN QUEUE_ISEMPTY(xQueue,queue_itens)=FALSE
    THEN
        ANY task WHERE task:TASK & task:tasks & task: queue_tkRecived(xQueue) & task_state(task)=blocked
        THEN         
        	pvBuffer<--recivedItem(xQueue,pdTRUE,task)       	
        END|| return:=pdPASS
        		
        
    END
    
        
END

END
