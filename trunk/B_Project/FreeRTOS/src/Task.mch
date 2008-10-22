/*
Sugestões e Idéias: 
 - Implementar a taskYIELD como um flag que quando for 1, a troca de contexto é realizada e quando for 0 a troca
   de contexto não deve ser realizada. Para isso deve existir um método que coloque uma operação, que simboliza a 
   troca de contexto e coloque o flag para 0 novamente.
 - Implementar a taskYIELD como uma função aux. que realiza a troca de contexto

*/



/*

Maquina que especifica a API Task.h

*/
MACHINE
  Task

INCLUDES
  Task_Concern

SEES
 Types

OPERATIONS

/******************************************************
???????????????????????????????????????????????????????
Está ocorrendo um erro na chamada ao método xTaskCreate
*******************************************************/
vTaskStartScheduler = 
PRE
 xSchedulerRunning=pdFALSE  	
THEN
  ANY idleTask,idleTaskCode, idleTaskName, rt
  WHERE   idleTaskCode:TASK_CODE & idleTaskName:NAME & idleTask:TASK & rt:ERROR_DEFINITION
        & rt,idleTask = xTaskCreate(idleTaskCode,idleTaskName,tskIDLE_STACK_SIZE, PARAMETER_NULL,tskIDLE_PRIORITY ) 
  THEN
    IF rt=pdPASS  THEN  taskStartScheduler END
  END

END






END