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
	NAME; /*Set of all avaliable name, strings */
	PARAMETER /* Universal set of function parameters  */

CONSTANTS
    
	BIT, /* Definition of bit set*/
	

	pdTRUE,  /*Constant that represent the value 1, used as true in FreeRTOS*/
	pdFALSE, /*Constant that represent the value 0, used as false in FreeRTOS*/
	pdPASS,	 /*Constant that represent the value 1, used to say that a function success finished  */
	pdFAIL, /*Constant that represent the value 0, no used  in this initial specification*/
	
	errQUEUE_EMPTY, /* Constant that represent the value 0, used as queue empty erro*/
	errQUEUE_FULL,	/* Constant that represent the value 0, used as queue full erro*/
	
	/*Error definitions in FreeRTOS*/
	ERROR_DEFINITION, /* Set of values used as error in FreeRTOS */
		errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY, /* represent the could not allocate required memomry error and have value -1 */
		errNO_TASK_TO_RUN, /* represent the could not allocate required memomry error and have value -1*/
		errQUEUE_BLOCKED, /* No used in this initial specification*/
		errQUEUE_YIELD,	/* No used in this initial specification*/

	MAX_DELAY,  /** maximal value for TICK */
	NULL_PARAMETER /*represent a NULL parameter*/

PROPERTIES
    BIT = {0, 1} &    
    
	pdTRUE : BIT &
	pdTRUE = 1 &
	
	pdFALSE : BIT &
	pdFALSE = 0 &
	
	pdPASS : BIT &
	pdPASS = 1 &
	
	pdFAIL : BIT &
	pdFAIL = 0 &
	
	errQUEUE_EMPTY : BIT &
	errQUEUE_EMPTY = 0 &
	
	errQUEUE_FULL : BIT &
	errQUEUE_FULL = 0 &
	ERROR_DEFINITION = {-5,-4,-2,-1} &
		errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY : ERROR_DEFINITION &
		errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 &
		errNO_TASK_TO_RUN : ERROR_DEFINITION &
		errNO_TASK_TO_RUN = -2 &
		errQUEUE_BLOCKED : ERROR_DEFINITION &
		errQUEUE_BLOCKED = -4 &
		errQUEUE_YIELD : ERROR_DEFINITION &
		errQUEUE_YIELD =  -5 &
		
	MAX_DELAY : NATURAL &
	
	NULL_PARAMETER : PARAMETER

ASSERTIONS
	ERROR_DEFINITION <: INTEGER &
	BIT <: NATURAL

END