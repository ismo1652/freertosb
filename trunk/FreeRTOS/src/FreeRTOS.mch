/* 
FreeRTOS
Author: David Deharbe and Stephenson Galvao

This machine specefic the FreeRTOS's API.

Creation date: Wed Apr 8 2009
Universidade Federal do Rio Grande do Norte
Departamento de Informática e Matemática Aplicada
Programa de Pos-Graduacao em Sistemas e Computacao
Formal Methods and Languages Research Laboratory
*/
MACHINE
    FreeRTOS
    
SEES
    Types,
    FreeRTOSConfig
    
INCLUDES
    FreeRTOSBasic
    
PROMOTES
    xQueueCreate,
    xTaskCreate,
    vTaskDelete,
    vTaskSuspend,
    vTaskResume,
    uxTaskPriorityGet,
    xTaskGetCurrentTaskHandle,
    uxTaskGetNumberOfTasks,
    vTaskDelay,
    vTaskDelayUntil,
    xTaskGetTickCount,
    xTaskGetSchedulerState,
    vTaskStartScheduler,
    vTaskEndScheduler,
    vTaskSuspendAll,
    xTaskResumeAll,
	vQueueDelete,
	vTaskPrioritySet
	
OPERATIONS
    return <-- xQueueSendToBack(queue, item, ticks)=
    PRE
        queue : queues  &  
        item : ITEM  &  
        ticks : TICK &
        active = TRUE &
        running /= idle
    THEN
        return <-- xQueueGenericSend(queue, item, ticks, queueSEND_TO_BACK)
    END;
    return <-- xQueueSend(queue, item, ticks)=
    PRE
        queue : queues  &  
        item : ITEM  &  
        ticks:TICK &
        active = TRUE &
        running /= idle
    THEN
        return <-- xQueueGenericSend(queue, item, ticks, queueSEND_TO_BACK)
    END;
    return <-- xQueueSendToFront(queue, item, ticks)=
    PRE
        queue : queues  &  
        item : ITEM  &  
        ticks : TICK &
        active = TRUE &
        running /= idle
    THEN
        return <-- xQueueGenericSend(queue, item, ticks, queueSEND_TO_FRONT)
    END;
    return, item <-- xQueueReceive(queue, ticks) =
    PRE
        queue : queues  &  
        ticks : TICK &
        active = TRUE &
        running /= idle
    THEN
        return, item <-- xQueueGenericReceive(queue, ticks, FALSE)
    END;
    return, item <-- xQueuePeek(queue, ticks) =
    PRE
        queue : queues  &  
        ticks : TICK &
        active = TRUE &
        running /= idle
    THEN
        return, item <-- xQueueGenericReceive(queue, ticks, TRUE)
    END
    
 
/*
OPERATIONS
# xQueueSend
# xQueueSendToBack
# xQueueSendToFront
# xQueueReceive
# xQueuePeek 

SemaphoreCreateBinary
SemaphoreCreateCounting
SemaphoreCreateMutex
SemaphoreTake
SemaphoreGive
*/
END