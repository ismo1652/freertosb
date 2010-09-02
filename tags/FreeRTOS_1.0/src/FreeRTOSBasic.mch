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
  FreeRTOSBasic
  
SEES
  Types,
  FreeRTOSConfig
  
INCLUDES
  Task,
  Queue
  
  
  /*
  CONSTANTS
  getTask
  
  PROPERTIES
  getTask: TASK *TASK --> TASK
  getTask = %(tk,ctk).(tk:TASK & ctk:TASK =
  */  
  
VARIABLES
  tickCount,		/** total tick count */
  tickMissed
  
INVARIANT
  tickCount: TICK &
  tickMissed:TICK &
  
  ran(mutex_holder) <: tasks \/ {TASK_NULL} &
  (active=TRUE => idle/:ran(mutex_holder)&
  								!mt.(mt:mutexes_busy  => mutex_holder(mt):tasks) &
  								!mt.(mt:mutexes & mt/:mutexes_busy  => mutex_holder(mt)/:tasks)) &
  !mt.(mt:mutexes => queue_sending(mt)={}) & /* Só quem pode liberar o mutex é o task holder não devendo 
  existir uma lista para liberação do mutex*/
  !que.(que:queues  => queue_sending(que)<:(blocked\/suspended)) &
  !que.(que:queues  => queue_receiving(que)<:(blocked\/suspended)) 
  
ASSERTIONS
  !mt.(mt:mutexes_busy & active=TRUE => mutex_holder(mt)/=idle) &
  !(que,task).(que:queues & task:TASK & task/:blocked & task/:suspended=> task/:queue_sending(que))&
  !(que,task).(que:queues & task:TASK & task/:blocked & task/:suspended => task/:queue_receiving(que))&
  
  !(que,task).(que:queues & task:tasks & task:queue_sending(que) => task:blocked\/suspended) &
  !(que,task).(que:queues & task:tasks & task:queue_receiving(que) => task:blocked \/ suspended)
  
INITIALISATION
  tickCount := 0 ||
  tickMissed := 0 
  
OPERATIONS
  
  /***********************************************************************************************************************
  Task Functions
  ***********************************************************************************************************************/
  result, handle <-- xTaskCreate (pvTaskCode, pcName, usStackDepth, pvParameters, uxPriority) =
  PRE
    pvTaskCode : TASK_CODE & 
    pcName : NAME & 
    usStackDepth : NAT &  
    pvParameters : POW(PARAMETER) & 
    uxPriority : PRIORITY 
  THEN 
    CHOICE /*Erro para tratar a memória*/
      handle <-- t_create (uxPriority) ||
      result := pdPASS
    OR
      result := errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ||
      handle := TASK_NULL
    END	                     
  END;
  
  vTaskDelay(xTicksToDelay)=
  PRE
    xTicksToDelay : TICK & 
    INCLUDE_vTaskDelay = 1 &
    running /= idle &
    running:runable
  THEN
    IF
      xTicksToDelay>0 
    THEN
      ANY
        tickWakeup
      WHERE
        tickWakeup:TICK
      THEN
        t_delayTask(tickWakeup,running)
      END
    ELSE
      IF 
        active=TRUE 
      THEN 
        t_yield 
      END
    END
  END;
  
  
  vTaskDelayUntil(pxPreviousWakeTime, xTimeIncrement) =
  PRE
    pxPreviousWakeTime : TICK & 
    xTimeIncrement : TICK & 
    running /= idle &
    INCLUDE_vTaskDelayUntil = 1 &
    running:runable
  THEN
    IF xTimeIncrement > 0 THEN
      t_delayTask (TICK_INCREMENT (pxPreviousWakeTime, xTimeIncrement),running)
    ELSE
      IF 
        active = TRUE 
      THEN
        t_yield
      END
    END
    
  END;
  
  vTaskDelete(pxTaskToDelete)=
  PRE
    INCLUDE_vTaskDelete = 1 & 
    pxTaskToDelete : TASK &
    pxTaskToDelete : tasks &
    pxTaskToDelete /= idle &
    pxTaskToDelete /:ran(mutex_holder) /*Essa proteção não existe no freertos, verificar o que ocorre quando 
    é uma excluida uma tarefa mantida pelo mutex */
  THEN			        
    t_delete (pxTaskToDelete) ||
    q_removeFromEventListQueue(pxTaskToDelete)
  END;
  
  vTaskEndScheduler =
  PRE
    active = TRUE
  THEN	
    t_endScheduler ||
    q_endScheduler
  END;
  
  cTask <-- xTaskGetCurrentTaskHandle=
  PRE
    INCLUDE_xTaskGetCurrentTaskHandle = 1
  THEN
    cTask <-- t_getCurrent
  END;
  
  numberOfTasks <-- uxTaskGetNumberOfTasks =
  BEGIN
    numberOfTasks <-- t_getNumberOfTasks
  END;
  
  priority <-- uxTaskPriorityGet(pxTask)=
  PRE
    pxTask : TASK &
    pxTask : tasks & 
    INCLUDE_uxTaskPriorityGet = 1 
  THEN 
    priority <-- t_getPriority(pxTask)
  END;
  
  vTaskPrioritySet(pxTask,uxNewPriority)=
  PRE
    pxTask:tasks &
    uxNewPriority:PRIORITY&
    active=TRUE &
    pxTask/=idle
  THEN
    t_setPriority(pxTask,uxNewPriority)
  END;
  
  /**************************************************************************************************************************
  Se a tarefa foi suspensa quando estava no estado bloqueada e, após isso ela foi retornada do estado suspenso para o pronto,
  no momento que a tarefa entrar em execução deve ser verificado o seu timeout para saber se a tarefa irá retornar para o
  estado bloqueado.
  ***************************************************************************************************************************/
  vTaskResume(pxTaskToResume) =
  PRE 
    INCLUDE_vTaskSuspend = 1 &
    suspended /= {} & 
    pxTaskToResume : TASK & 
    pxTaskToResume : suspended 
  THEN    
    t_resume (pxTaskToResume)||
    q_removeFromEventListQueue(pxTaskToResume)
  END;
  
  xTaskResumeAll = 
  PRE
    active=FALSE
  THEN
    ANY
      unblocked
    WHERE
      unblocked : FIN(TASK) &
      unblocked <: blocked
    THEN
      t_resumeAll(unblocked) ||
      q_resumeAll(unblocked)||
      tickCount := TICK_INCREMENT(tickCount, tickMissed)
    END
  END;
  
  vTaskStartScheduler = 
  PRE
    active=FALSE
  THEN
    CHOICE
      t_startScheduler
    OR
      skip
    END
  END;
  
  vTaskSuspend(pxTaskToSuspend)=
  PRE
    INCLUDE_vTaskSuspend = 1 & 
    pxTaskToSuspend : TASK &
    pxTaskToSuspend : tasks &
    pxTaskToSuspend /= idle
  THEN
    IF pxTaskToSuspend /: suspended	THEN
      t_suspend(pxTaskToSuspend) ||
      q_removeFromEventListQueue(pxTaskToSuspend)
    END
  END;
  
  vTaskSuspendAll=
  PRE
    active=TRUE
  THEN
    t_suspendAll
  END;
  
  /***********************************************************************************************************************
  Queue Functions
  ************************************************************************************************************************/
  xQueueHandle <--xQueueCreate(uxQueueLength,uxItemSize)=
  PRE
    uxQueueLength: NAT & 
    uxItemSize:NAT
  THEN
    CHOICE
      xQueueHandle<--q_queueCreate(uxQueueLength, uxItemSize)
    OR
      xQueueHandle:=QUEUE_NULL
    END
  END;
  
  queueDelete(pxQueue)=
  PRE
    pxQueue:queues_msg &
    queue_receiving(pxQueue)={} &
    queue_sending(pxQueue)={}
  THEN
    q_queueDelete(pxQueue)
  END;
  
  return <-- sendItem(pxQueue, pvItemToQueue, xTicksToWait,copy_position)=
  PRE
    pxQueue:queues_msg &  
    pvItemToQueue:ITEM  &  
    xTicksToWait:TICK &
    copy_position:COPY_POSITION &
    running /= idle &
    running:runable &
    pvItemToQueue/: queue_items(pxQueue)
  THEN
    CHOICE
      t_delayTask(xTicksToWait,running) ||
      q_insertTaskWaitingToSend(pxQueue,running) || 
      return := pdPASS   	
    OR
      t_suspend(running) ||
      q_insertTaskWaitingToSend(pxQueue,running) ||
      return := pdPASS
    OR
      ANY 
        task
      WHERE 
        task:TASK & 
        task:blocked\/suspended & 
        task:queue_receiving(pxQueue)
      THEN
        q_sendItem(pxQueue,pvItemToQueue,task,copy_position)||
        t_removeFromEventList(task)
      END||
      return := pdPASS  
    OR
      return := pdFAIL	
    END
  END;
  
  return,pvBuffer<--receiveItem(pxQueue,xTicksToWait,justPeeking)=
  PRE
    active = TRUE &
    running /= idle &
    pxQueue : QUEUE &
    pxQueue : queues_msg & 
    xTicksToWait:TICK &
    justPeeking : BOOL &
    running:runable & 
    running/=TASK_NULL
  THEN
    IF queue_items(pxQueue) ={} THEN
      CHOICE
        t_delayTask(xTicksToWait,running)||
        q_insertTaskWaitingToReceive(pxQueue,running)||
        return,pvBuffer:=pdPASS,ITEM_NULL
      OR
        t_suspend(running)||
        q_insertTaskWaitingToReceive(pxQueue,running)||
        return,pvBuffer:=pdPASS,ITEM_NULL
      OR
        return,pvBuffer:=pdFAIL,ITEM_NULL
      END
    ELSE
      ANY 
        task 
      WHERE 
        task:TASK & 
        task:queue_sending(pxQueue) & 
        task:blocked \/suspended
      THEN         
        pvBuffer<--q_receivedItem(pxQueue,justPeeking,task)||
        return:=pdPASS||
        IF 
          justPeeking = FALSE 
        THEN 
          t_removeFromEventList(task)
        END
      END
    END
  END;
  
  /***************************************************************************************************************************
  Semaphore Functions
  ***************************************************************************************************************************/
  semaphore<--createSemaphore(maxCount,initialCount)=
  PRE
    maxCount:INT&
    initialCount:INT&
    initialCount<=maxCount
  THEN
    CHOICE
      semaphore<--q_createSemaphore(maxCount,initialCount)
    OR
      semaphore:=QUEUE_NULL
    END
  END;
  
  deleteSemaphore(semaphore)= 
  PRE
    semaphore:semaphores & 
    queue_sending(semaphore)/={} &
    queue_receiving(semaphore)/={}
  THEN
    q_deleteSemaphore(semaphore)
  END;
  
  return<--takeSemaphore(semaphore,xTicksToWait)=
  PRE
    semaphore:semaphores &
    xTicksToWait:TICK&
    running /= idle &
    running:runable & 
    running/=TASK_NULL
  THEN
    IF
      semaphore/:semaphores_busy
    THEN 
      ANY 
        task
      WHERE
        task:TASK&
        task:blocked \/suspended&
        task:queue_sending(semaphore)
      THEN
        q_takeSemaphore(semaphore,task)||
        t_removeFromEventList(task)||
        return:=pdPASS
      END
    ELSE
      CHOICE
        t_delayTask(xTicksToWait,running)||
        q_insertTaskWaitingToReceive(semaphore,running)||
        return:=pdPASS
      OR
        t_suspend(running)||
        q_insertTaskWaitingToReceive(semaphore,running)||
        return:=pdPASS
      OR
        return := pdFAIL
      END
    END
  END;
  
  
  return<--giveSemaphore(semaphore,xTicksToWait)=
  PRE
    semaphore:semaphores &
    xTicksToWait:TICK & 
    running /= idle &
    running:runable & 
    running/=TASK_NULL
  THEN
    CHOICE
      ANY 
        task
      WHERE
        task:blocked\/suspended &
        task:queue_receiving(semaphore)
      THEN
        q_giveSemaphore(semaphore,task)||
        t_removeFromEventList(task)||
        return:=pdPASS
      END
    OR
      t_delayTask(xTicksToWait,running)||
      q_insertTaskWaitingToSend(semaphore,running)||
      return:=pdPASS
    OR
      t_suspend(running)||
      q_insertTaskWaitingToSend(semaphore,running)||
      return:=pdPASS
    OR
      return := pdFAIL
    END  
  END;
  
  /*********************************************************************************************************************
  Mutex Functions
  ************************************************************************************************************************/
  mutex<--createMutex =
  BEGIN
    CHOICE
      mutex <--q_createMutex
    OR
      mutex := QUEUE_NULL
    END
  END;
  
  takeMutex(mutex,xTicksToWait)=
  PRE
    mutex:mutexes &
    xTicksToWait:TICK &
    active=TRUE &
    running/=idle
  THEN
    IF 
      mutex:mutexes_busy 
    THEN
      t_priorityInherit(mutex_holder(mutex),xTicksToWait)||
      q_insertTaskWaitingToReceive(mutex,running)
    ELSE
      q_takeMutex(mutex,running)
    END 
  END;
  /*
  The task never will block to give the mutex, because the mutex can only gived by a holder mutex task
  */
  giveMutex(mutex,xTicksToWait)=
  PRE
    mutex:mutexes &
    mutex:mutexes_busy &
    mutex_holder(mutex)=running &
    xTicksToWait:TICK
  THEN
    ANY 
      task
    WHERE
      task:blocked\/suspended &
      task:queue_sending(mutex)
    THEN
      q_giveMutex(mutex,task)||
      t_returnPriority(task)
    END  
  END;
  
  
  
  /*********************************************************************************************************************
  Other Functions
  **********************************************************************************************************************/
  numberOfTicks <-- getTickCount=
  PRE 
    INCLUDE_xTaskGetCurrentTaskHandle = 1
  THEN
    numberOfTicks := tickCount
  END;
  
  incrementTick =
  PRE
    active =TRUE
  THEN
    tickCount := TICK_INCREMENT(tickCount, 1)||
    ANY
      unblocked
    WHERE
      unblocked:FIN(TASK) &
      unblocked <: blocked  
    THEN
      t_resumeAll(unblocked)||
      q_resumeAll(unblocked)
    END
  END;
  
  xQueueHandle<--xQueueCreateMutex=
  BEGIN
    xQueueHandle<--q_createMutex
  END;
  
  xQueueHandle<-- xSemaphoreCreateRecursiveMutex=
  BEGIN
    xQueueHandle<--q_createMutex
  END
  
END
