/* QueueContext

Author: David Deharbe and Stephenson Galvao

This machine specefic the FreeRTOS's API.

Creation date: Wed Apr 8 2009
Universidade Federal do Rio Grande do Norte
Departamento de Informática e Matemática Aplicada
Programa de Pos-Graduacao em Sistemas e Computacao
Formal Methods and Languages Research Laboratory
*/
MACHINE
    QueueContext
    
SEES
    Types
    
SETS
    ITEM;			/** queue items */
    COPY_POSITION;	/** position of insertions in queues = {queueSEND_TO_BACK,queueSEND_TO_FRONT}*/
    QUEUE 			/** queues */
    
CONSTANTS
    QUEUE_NULL,
    ITEM_NULL,
    REMOVE_EVENT
    
PROPERTIES
    
    QUEUE_NULL:QUEUE &
    ITEM_NULL:ITEM &
    REMOVE_EVENT : TASK * POW(QUEUE) * (QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) &
    REMOVE_EVENT = 
    %(task, queues, pending).
    (task : TASK & queues : POW(QUEUE) & pending : QUEUE +-> POW(TASK) |
        %(queue).(queue : queues & queue : dom(pending) | pending(queue) - {task}))
    
END
