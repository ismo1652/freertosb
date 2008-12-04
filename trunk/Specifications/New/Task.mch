/* Task
 * Author: stepgalvao
 * Creation date: Mon Dec 1 2008
 */
MACHINE
    Task
INCLUDES
    Task_Basic,Queue_Basic   
SEES
    Types,FreeRTOSConfig
PROMOTES
    xTaskCreate,vTaskSuspend,vTaskResume,uxTaskPriorityGet,xTaskGetCurrentTaskHandle,uxTaskGetNumberOfTasks,xTaskGetSchedulerState,
    vTaskDelay,vTaskDelayUntil,xTaskGetTickCount,vTaskStartScheduler,vTaskEndScheduler,vTaskSuspendAll,xTaskResumeAll
OPERATIONS

vTaskDelete(pxTaskToDelete)=
PRE
   	INCLUDE_vTaskDelete=1 & pxTaskToDelete:tasks
THEN
	deleteTask(pxTaskToDelete)||
	removeFromEventListQueue(pxTaskToDelete)
	
	
END

END
