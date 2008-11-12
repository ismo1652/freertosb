/*
Suggestion and Ideas:

*/
MACHINE
FreeRTOSConfig

SEES
Types

CONCRETE_CONSTANTS

/*************************** USED ***************************************************/

/* 
Used to defini the ranger of available value to the priority's set
*/
configMAX_PRIORITIES ,

/*
 Parameter that say the memory length
*/
configTOTAL_HEAP_SIZE ,

/******************************************************
Control of use of the FreeRTOS' APIs functions
*******************************************************/

/* 
Flag that control the use of TaskPrioritySet function
*/
INCLUDE_vTaskPrioritySet ,

/*
Flag that control the use of vTaskSuspend and vTaskResume functions
*/
INCLUDE_vTaskSuspend ,

/* 
Flag that control the use of uxTaskPriorityGet function
*/
INCLUDE_uxTaskPriorityGet ,

/* 
Flag that control the use of vTaskDelete function
*/
INCLUDE_vTaskDelete ,

/* 
Flag that control the use of xTaskGetSchedulerState function
*/
INCLUDE_xTaskGetSchedulerState ,

/* 
Flag that control the use of xTaskGetCurrentTaskHandle function
*/
INCLUDE_xTaskGetCurrentTaskHandle ,


/*************************** NO USED ************************************************/
configMINIMAL_STACK_SIZE ,
configUSE_PREEMPTION ,
configUSE_IDLE_HOOK ,
configUSE_TICK_HOOK ,
configCPU_CLOCK_HZ ,
configTICK_RATE_HZ ,
configMAX_TASK_NAME_LEN ,
configUSE_TRACE_FACILITY ,
configUSE_16_BIT_TICKS ,
configIDLE_SHOULD_YIELD ,
configUSE_USE_MUTEXES ,
configUSE_RECURSIVE_MUTEXES ,
configUSE_COUNTING_SEMAPHORES ,
configUSE_ALTERNATIVE_API ,
configCHECK_FOR_STACK_OVERFLOW ,
configQUEUE_REGISTRY_SIZE ,
configUSE_CO_ROUTINES ,
configMAX_CO_ROUTINE_PRIORITIES ,
configKERNEL_INTERRUPT_PRIORITY ,
configMAX_SYSCALL_INTERRUPT_PRIORITY ,



INCLUDE_vTaskCleanUpResources ,
INCLUDE_vTaskDelayUntil ,
INCLUDE_vTaskDelay



PROPERTIES


  configMAX_PRIORITIES : NATURAL

& configTOTAL_HEAP_SIZE : NATURAL


& configMINIMAL_STACK_SIZE : NATURAL

& INCLUDE_uxTaskPriorityGet : BIT

& INCLUDE_vTaskDelete : BIT

& INCLUDE_vTaskSuspend : BIT

& INCLUDE_xTaskGetSchedulerState : BIT

& INCLUDE_vTaskPrioritySet : BIT

& INCLUDE_xTaskGetCurrentTaskHandle : BIT







& configUSE_PREEMPTION : BIT
& configUSE_IDLE_HOOK : BIT
& configUSE_TICK_HOOK : BIT
& configCPU_CLOCK_HZ : NATURAL
& configTICK_RATE_HZ : NATURAL
& configMAX_TASK_NAME_LEN : NATURAL
& configUSE_TRACE_FACILITY : BIT
& configUSE_16_BIT_TICKS : BIT
& configIDLE_SHOULD_YIELD : BIT
& configUSE_USE_MUTEXES  : BIT
& configUSE_RECURSIVE_MUTEXES : BIT
& configUSE_COUNTING_SEMAPHORES : BIT
& configUSE_ALTERNATIVE_API : BIT
& configCHECK_FOR_STACK_OVERFLOW : BIT
& configQUEUE_REGISTRY_SIZE : BIT
& configUSE_CO_ROUTINES : BIT
& configMAX_CO_ROUTINE_PRIORITIES : NATURAL
& configKERNEL_INTERRUPT_PRIORITY : NATURAL
& configMAX_SYSCALL_INTERRUPT_PRIORITY : NATURAL
& INCLUDE_vTaskCleanUpResources : BIT
& INCLUDE_vTaskDelayUntil : BIT
& INCLUDE_vTaskDelay : BIT



END
