
 
/************************************************************************************************************
This machine implement the concepts of queue of the FreeRTOS. In this abstraction level don't concerns with 
length of queue's itens and data structs like as list and its ordem. Here all data structs was represent as
sets, and in next refinements this sets will replaces for its data structs necessary.
*************************************************************************************************************/
MACHINE
    Queue_Basic
SEES
    Types,Task_Basic
SETS
    /*This set represent the universe set of all itens available in the system*/
    ITEM;
    
    /*This set represent the positions of insertion of itens in the queue. It is used in the xQueueGenericSend operation*/
    COPY_POSITION;/*={queueSEND_TO_BACK,queueSEND_TO_FRONT}*/
    
    
    QUEUE
    

CONSTANTS
    
	QUEUE_NULL,
	ITEM_NULL,
	
	QUEUE_ISFULL,
	
	QUEUE_ISEMPTY,
	
	/*Função que retorna todas as filas que possuem a tarefa passada como argumento em uma de suas listas de eventos */
	QUEUES_WITH_TASK,
	
    REMOVE_EVENT
    
   
	
	

PROPERTIES
    QUEUE_NULL:QUEUE &
    ITEM_NULL:ITEM &
	
	QUEUE_ISFULL : QUEUE*(QUEUE+->POW(ITEM))*(QUEUE+->NAT) --> BOOL & 
	QUEUE_ISFULL = %(queue,q_it,q_vl).(queue:QUEUE & q_it:(QUEUE+->POW(ITEM)) & q_vl:(QUEUE+->NAT) & queue:dom(q_vl) & queue:dom(q_it)
	    				| bool(card(q_it(queue))>=q_vl(queue))) &
                    
    QUEUE_ISEMPTY : QUEUE*(QUEUE+->POW(ITEM)) -->BOOL &
    QUEUE_ISEMPTY=%(queue,q_it).(queue:QUEUE & q_it:(QUEUE+->POW(ITEM))  & queue:dom(q_it) |bool(q_it(queue)={})) &

	QUEUES_WITH_TASK: TASK *POW(QUEUE)*(QUEUE+-> POW(TASK))*(QUEUE+-> POW(TASK)) --> POW(QUEUE) &
	QUEUES_WITH_TASK=%(tk,ques,q_tkR,q_tkS).(tk:TASK & ques: POW(QUEUE) & q_tkR:(QUEUE+-> POW(TASK)) & q_tkS:(QUEUE+-> POW(TASK))
	    			& ques= dom(q_tkR) & ques= dom(q_tkS) | {que|que:ques & (tk:q_tkR(que) or tk:q_tkS(que)) }) &
    
	    				
	
    REMOVE_EVENT:TASK * POW(QUEUE) * (QUEUE+-> POW(TASK))*(QUEUE+-> POW(TASK)) --> (QUEUE+-> POW(TASK))*(QUEUE+-> POW(TASK)) &
    REMOVE_EVENT=%(tk,ques,q_tkR,q_tkS).(tk:TASK & ques: POW(QUEUE) & q_tkR:(QUEUE+-> POW(TASK)) & q_tkS:(QUEUE +-> POW(TASK))
    				| UNION(que).(que:ques|{et| et= que|->(q_tkS(que)-{tk})}),UNION(que).(que:ques|{et| et= que|->(q_tkR(que)-{tk})}))
    
    
	                                 
	        
VARIABLES
    /*Armazena todas as filhas manipuladas pelo FreeRTOS*/
    queues,
    queue_itens,
    queue_tkRecived,
    queue_tkSend,
    queue_length
    
    
    
    
    
    
    
INVARIANT
    
    queues:POW(QUEUE) & 
    queue_itens: QUEUE +-> POW(ITEM) &
    queue_tkRecived: QUEUE+-> POW(TASK) &
    queue_tkSend: QUEUE+-> POW(TASK) &
    queue_length:QUEUE+->NAT &

	queues=dom(queue_itens) &
	queues=dom(queue_tkRecived) &
	queues=dom(queue_tkSend) &
	queues=dom(queue_length) &
	
	!(queue).(queue:queues => card(queue_itens(queue))<= queue_length(queue)) 
	
	/*
	!(queue).(queue:queues & queue_itens(queue)={} )<= queue_length(queue)) & 
    
    &
    & !(queue).(queue:queues & not(queue'TaskWaitingToRecived={}) => QUEUE_ISFULL(queue)=TRUE)
    & !(queue).(queue:queues & not(queue'TaskWaitingToSend={}) => QUEUE_ISEMPTY(queue)=TRUE)
	*/    
    
    
INITIALISATION
    queues:={QUEUE_NULL}||
    queue_itens:={QUEUE_NULL|->{}}||
    queue_tkRecived:={QUEUE_NULL|->{}}||
    queue_tkSend:={QUEUE_NULL|->{}}||
    queue_length:={QUEUE_NULL|->card({})}
    
    
    
OPERATIONS
    


xQueueHandle <-- xQueueCreate(uxQueueLength, uxItemSize ) =
PRE
    uxQueueLength: NAT & uxItemSize:NAT
THEN    
    CHOICE
		ANY queue 
		WHERE queue:QUEUE & queue/:queues
		THEN	
		    queues:=queues\/{queue}||
		    queue_itens:=queue_itens\/{queue|->{}}||
		    queue_tkRecived:=queue_tkRecived\/{queue|->{}}||
		    queue_tkSend:=queue_tkSend\/{queue|->{}}||
		    queue_length:=queue_length\/{queue|->uxQueueLength}||
		    xQueueHandle:=queue
		END		    
     OR
        xQueueHandle:=QUEUE_NULL
     END
        
END
;
/*
Insert one intem in the queue and remove the task from the set of task that are waiting to recived one iten. Then task passed need is in the
ser of set of task waiting to revived of queue
*/
sendItem(pxQueue,pxItem,task,copy_position)=
PRE
    pxQueue:queues & QUEUE_ISFULL(pxQueue,queue_itens,queue_length)=FALSE & pxItem:ITEM & task:TASK
    & task:queue_tkRecived(pxQueue) & copy_position:COPY_POSITION
THEN
    queue_itens(pxQueue):=queue_itens(pxQueue)\/{pxItem}||
    queue_tkRecived(pxQueue):=queue_tkRecived(pxQueue)-{task}
END
;

insertTaskWaitingToSend(pxQueue,pxTask)=
PRE
    pxQueue:queues & pxTask:TASK
THEN
    queue_tkSend(pxQueue):=queue_tkSend(pxQueue)\/{pxTask}
END
;

insertTaskWaitingToRecived(pxQueue,pxTask)=
PRE
    pxQueue:queues & pxTask:TASK
THEN
    queue_tkRecived(pxQueue):=queue_tkRecived(pxQueue)\/{pxTask}

END	
;


xItem<--recivedItem(pxQueue,justPeeking,task)=
PRE
    pxQueue:queues & QUEUE_ISEMPTY(pxQueue,queue_itens)=FALSE & justPeeking:BIT & task:TASK & task:queue_tkSend(pxQueue)
THEN
    
    ANY item WHERE item:ITEM & item: queue_itens(pxQueue)
    THEN
        IF	justPeeking=pdFALSE
        THEN 
            queue_itens(pxQueue):=queue_itens(pxQueue) - {item}||
            queue_tkSend(pxQueue):=queue_tkSend(pxQueue)-{task}
        END
        ||xItem:=item
    END
END

;
removeFromEventListQueue(task)=
PRE
    task:TASK  
THEN
   
    ANY queuesTask,q_tkRecived,q_tkSend  
    WHERE
        queuesTask:POW(QUEUE) & queuesTask = QUEUES_WITH_TASK(task,queues,queue_tkRecived,queue_tkSend)&
        q_tkRecived:(QUEUE+->POW(TASK)) & q_tkSend:(QUEUE+->POW(TASK)) &
        q_tkRecived,q_tkSend=REMOVE_EVENT(task,queues,queue_tkRecived,queue_tkSend)
    THEN
       queue_tkRecived:=queue_tkRecived <+ q_tkRecived||
       queue_tkSend:=queue_tkSend<+ q_tkSend
    END
    
        
END


    
END