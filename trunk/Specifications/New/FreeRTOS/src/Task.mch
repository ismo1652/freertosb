/* Queue

 \brief Specification for Task support in FreeRTOS.
 
 Author: Stephenson Galvao, David Deharbe
 Creation date: Fri Dec 5 2008
 Universidade Federal do Rio Grande do Norte
 Departamento de Informatica e Matematica Aplicada
 Programa de Pos-Graduacao em Sistemas e Computacao
 Formal Methods and Languages Laboratory
 */
MACHINE

    Task

INCLUDES

    Task_Basic, Queue_Basic   

SEES

    Types,FreeRTOSConfig

PROMOTES

    xTaskCreate,
    vTaskSuspend,
	vTaskResume,
	uxTaskPriorityGet,
	xTaskGetCurrentTaskHandle,
	uxTaskGetNumberOfTasks,
	xTaskGetSchedulerState,
    vTaskDelay,
    vTaskDelayUntil,
    xTaskGetTickCount,
    vTaskStartScheduler,
    vTaskEndScheduler,
    vTaskSuspendAll,
    xTaskResumeAll

OPERATIONS

	vTaskDelete(pxTaskToDelete)=
	PRE
   		INCLUDE_vTaskDelete = 1 & pxTaskToDelete : tasks & 
   		task_state(pxTaskToDelete) /= deleted
	THEN
		deleteTask(pxTaskToDelete)||
		removeFromEventListQueue(pxTaskToDelete)
	END
END