/* Types

 \brief Defines the types needed to model FreeRTOS. 
 
 \author Stephenson Galvao, David Deharbe
 Creation date: Fri Dec 5 2008
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
 */
MACHINE
    Types

SETS 
	POINTER;
	NAME;
	PARAMETER

CONSTANTS
	BIT,
	ERROR_DEFINITION,

	pdTRUE,
	pdFALSE,
	pdPASS,
	pdFAIL,
	errQUEUE_EMPTY,
	errQUEUE_FULL,

	errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,
	errNO_TASK_TO_RUN,
	errQUEUE_BLOCKED,
	errQUEUE_YIELD,

	MAX_DELAY,  /** maximal value for TICK */
	NULL_PARAMETER

PROPERTIES
    BIT = {0, 1} &
    ERROR_DEFINITION = {-5,-4,-2,-1} &
	pdTRUE : BIT &
	pdTRUE = 0 &
	pdFALSE : BIT &
	pdFALSE = 1 &
	pdPASS : BIT &
	pdPASS = 1 &
	pdFAIL : BIT &
	pdFAIL = 0 &
	errQUEUE_EMPTY : BIT &
	errQUEUE_EMPTY = 0 &
	errQUEUE_FULL : BIT &
	errQUEUE_FULL = 0 &
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