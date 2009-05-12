/* 
 Types.mch

 \brief 
 	Defines the necesseries types to model FreeRTOS. Some of this definition can see in projdefs.h 
 	in the FreeRTOS source
 
 Author Stephenson Galvao, David Deharbe
 Creation date: Fri Dec 5 2008
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
*/
MACHINE
    Types

SETS 
	NAME;       /*Set of all avaliable name, strings */
	PARAMETER;  /* Universal set of function parameters  */
	
	SCHEDULER_STATE = 
    {taskSCHEDULER_NOT_STARTED, taskSCHEDULER_RUNNING, taskSCHEDULER_SUSPENDED};
    
    TASK;		/** tasks */	    
    STACK;		/** stack of task**/
    TASK_CODE;  /* pointer to code of task*/
    
    ITEM;			/** queue items */
    COPY_POSITION = {queueSEND_TO_BACK,queueSEND_TO_FRONT};
    
    QUEUE; 			/** queues */

	ERROR_DEFINITION = {errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY, errNO_TASK_TO_RUN,
	    errQUEUE_BLOCKED, errQUEUE_YIELD, errQUEUE_EMPTY, errQUEUE_FULL, pdPASS, pdFAIL,
	    pdTRUE, pdFALSE}
	
	
CONSTANTS
    BIT,
    
    QUEUE_NULL,
    ITEM_NULL,
    REMOVE_EVENT,
    
    PRIORITY,	/** task priorities */
    TICK, /*Tick available in freeRTOS*/
    TICK_INCREMENT, /** function used to update the tick counter */	
	MAX_DELAY,  /** maximal value for TICK */
    
	NULL_PARAMETER /*represent a NULL parameter*/

PROPERTIES
    BIT = 0..1 &
    
	MAX_DELAY : 0..MAXINT &
	1 <= MAX_DELAY & 
	
	NULL_PARAMETER : PARAMETER &

    PRIORITY : POW(NAT) & 
        
    TICK : POW (NAT) &
    TICK = 0..MAX_DELAY &
    
    TICK_INCREMENT: TICK * TICK --> TICK &
    TICK_INCREMENT = %(tick, inc).(tick : TICK & inc : TICK | (tick+inc) mod MAX_DELAY) &
    
    QUEUE_NULL:QUEUE &
    ITEM_NULL:ITEM &
    REMOVE_EVENT : TASK * POW(QUEUE) * (QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) &
    REMOVE_EVENT = 
    %(task, queues, pending).
    (task : TASK & queues : POW(QUEUE) & pending : QUEUE +-> POW(TASK) |
        %(queue).(queue : queues & queue : dom(pending) | pending(queue) - {task}))

ASSERTIONS
    BIT <: NATURAL
END
