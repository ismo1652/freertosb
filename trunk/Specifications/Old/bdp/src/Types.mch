/*
Maquina que especifica os tipos especiais utilizados pelo FreeRTOS assim 
como suas definições de projeto presentes no arquivo "projdefs.h"
*/

MACHINE
 Types

SETS

/*Conjunto universo dos possíveis ponteiros*/
 POINTER

/*Conjunto universo dos possíveis nomes */
; NAME



CONCRETE_CONSTANTS


 BIT
, ERROR_DEFINITION

, pdTRUE
, pdFALSE

, pdPASS
, pdFAIL

, errQUEUE_EMPTY
, errQUEUE_FULL

/* Definições de Erro */
, errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY
, errNO_TASK_TO_RUN
, errQUEUE_BLOCKED
, errQUEUE_YIELD



, pointer

PROPERTIES
  BIT = { 0 , 1 }
& ERROR_DEFINITION = { - 5 , - 4 , - 2 , - 1 }

& pdTRUE : BIT
& pdTRUE = 0

& pdFALSE : BIT
& pdFALSE = 1

& pdPASS : BIT
& pdPASS = 1

& pdFAIL : BIT
& pdFAIL = 0

& errQUEUE_EMPTY : BIT
& errQUEUE_EMPTY = 0

& errQUEUE_FULL : BIT
& errQUEUE_FULL        =  0

& errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY : ERROR_DEFINITION
& errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = - 1

& errNO_TASK_TO_RUN : ERROR_DEFINITION
& errNO_TASK_TO_RUN = - 2

& errQUEUE_BLOCKED : ERROR_DEFINITION
& errQUEUE_BLOCKED = - 4

& errQUEUE_YIELD : ERROR_DEFINITION
& errQUEUE_YIELD =  - 5

& pointer : POINTER

ASSERTIONS
  ERROR_DEFINITION <: INTEGER
& BIT <: NATURAL

END
