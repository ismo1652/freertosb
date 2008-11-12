/* Task
 * Author: Stephenson Galvão
 * Creation date: Sat Nov 8 2008
 *
 * This machine implement the concepts of tasks and our operations.
 * Here we don't concerns with memory allocation and yield tasks
 */
MACHINE
    Task
SEES
    FreeRTOSConfig ,
    Types
SETS
    /* Set of all available pointers to operation's task */
    TASK_CODE ;

    /* Set of states of a tasks*/
    TASK_STATE = { running , blocked , ready , suspended , deleted } ;

    /* Set of schedule's states*/

    SCHEDULE_STATE = { taskSCHEDULER_NOT_STARTED , taskSCHEDULER_RUNNING , taskSCHEDULER_SUSPENDED } ;

    /* Set of all available stacks for a task*/
        STACK

CONCRETE_CONSTANTS
    /*Set of priorities available*/
        PRIORITY ,

        /*Set of all tasks available*/
        TASK ,

        /*Null Task*/
        TASK_NULL ,

        /*Idle task priority*/
        tskIDLE_PRIORITY


PROPERTIES

    PRIORITY = 0 .. ( configMAX_PRIORITIES - 1 )

&        TASK = struct (
                                    Name : NAME ,
                                    Priority : PRIORITY ,
                                    Task_Code : TASK_CODE ,
                                    Stack : STACK ,
                                    State : TASK_STATE

                            )

&         TASK_NULL : TASK

&        tskIDLE_PRIORITY : PRIORITY & tskIDLE_PRIORITY = 1

ASSERTIONS

/*
(?How is "Axioma" in english?)
Law necessary to prove some proof obligation. It say when two task are equals or not. 
*/
! ( tk1 , tk2 ) . ( tk1 : TASK & tk2 : TASK =>
        ( tk1 = tk2 ) <=> (
        ( tk1 ' Name = tk2 ' Name ) &
        ( tk1 ' Priority = tk2 ' Priority ) &
        ( tk1 ' Task_Code = tk2 ' Task_Code ) &
        ( tk1 ' Stack = tk2 ' Stack ) &
        ( tk1 ' State = tk2 ' State )
                )


        & not ( tk1 = tk2 ) <=> (
                 not ( tk1 ' Name /= tk2 ' Name ) or
                 not ( tk1 ' Priority /= tk2 ' Priority ) or
                 not ( tk1 ' Task_Code /= tk2 ' Task_Code ) or
                 not ( tk1 ' Stack /= tk2 ' Stack ) or
                 not ( tk1 ' State /= tk2 ' State )
                )

)

ABSTRACT_VARIABLES
    /*Set of all system's tasks*/
    tasks ,

    /*Variable that hold the currenty schedule's state*/
    schedule



INVARIANT
    tasks : POW ( TASK )

    /* 
    	Have most one tasks if current state running
    */
&          ! ( tk1 , tk2 ) . ( tk1 : tasks & tk2 : tasks & tk1 ' State = running & tk2 ' State = running => tk1 = tk2 )

&        schedule : SCHEDULE_STATE

INITIALISATION
    tasks := {} ||
    schedule := taskSCHEDULER_NOT_STARTED


OPERATIONS

/*
	The original method have the handle is passed as reference. Here we put the handle as operation's return 

*/
    zz , handle <-- xTaskCreate ( pvTaskCode , pcName , usStackDepth , pvParameters , uxPriority ) =
    PRE
        pvTaskCode : TASK_CODE & pcName : NAME & usStackDepth : NATURAL & pvParameters <: PARAMETER & uxPriority : PRIORITY
    THEN
        CHOICE
            ANY stack , task_code , task
            WHERE stack : STACK & task_code : TASK_CODE & task : TASK
                & task = rec ( Name : pcName , Priority : uxPriority , Task_Code : task_code , Stack : stack , State : ready )
            THEN
                    tasks := tasks \/ { task }
                    || zz , handle := pdPASS , task
            END
        OR
            zz , handle := errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY , TASK_NULL
        END

    END
;

/*
	This operation set the state of the tasks passed as parameter for deleted. It can be used when INCLUDE_vTaskDelete is one
*/
    vTaskDelete ( pxTaskToDelete ) =
    PRE
              INCLUDE_vTaskDelete = 1
            & pxTaskToDelete : tasks
                   & pxTaskToDelete ' State /= deleted
          THEN
                tasks := ( tasks - { pxTaskToDelete } ) \/ { rec (
                                                                                                        Name : pxTaskToDelete ' Name ,
                                                                                                        Priority : pxTaskToDelete ' Priority ,
                                                                                                        Task_Code : pxTaskToDelete ' Task_Code ,
                                                                                                        Stack : pxTaskToDelete ' Stack ,
                                                                                                        State : deleted
                                                                                                )
                                                                                        }
  END
;

/*
???? I implement the idle task or no ?????
*/
prvIdleTask ( pvParameters ) =
PRE
  pvParameters <: PARAMETER
THEN
  ANY task
  WHERE task : tasks & task ' State = deleted
    THEN
      IF ( not ( task : {} ) )
        THEN
             tasks := tasks - { task }
        END
     END
  END
;


/************************
TASK CONTROL
*************************/

/*
	Put the task passed in suspended state. This operation only can be used when the INCLUDE_vTaskSuspend is one
*/
rr <-- vTaskSuspend ( pxTaskToSuspend ) =
PRE
    INCLUDE_vTaskSuspend = 1 & pxTaskToSuspend : tasks
THEN
    IF not ( pxTaskToSuspend ' State = suspended )
        THEN
            tasks := ( tasks - { pxTaskToSuspend } ) \/ { rec (
                                                                                                        Name : pxTaskToSuspend ' Name ,
                                                                                                        Priority : pxTaskToSuspend ' Priority ,
                                                                                                        Task_Code : pxTaskToSuspend ' Task_Code ,
                                                                                                        Stack : pxTaskToSuspend ' Stack ,
                                                                                                        State : suspended
                                                                                                )
                                                                                        }
                || rr := pdTRUE
   ELSE rr := pdFALSE
 END
END
;

/*
	Resume a task that was suspended. This operation only can be used when the INCLUDE_vTaskSuspend is one
*/
vTaskResume ( pxTaskToResume ) =
PRE
    INCLUDE_vTaskSuspend = 1 & pxTaskToResume : tasks & pxTaskToResume ' State = suspended
THEN
    tasks := ( tasks - { pxTaskToResume } ) \/ { rec (
                                                                                                Name : pxTaskToResume ' Name ,
                                                                                                Priority : pxTaskToResume ' Priority ,
                                                                                                Task_Code : pxTaskToResume ' Task_Code ,
                                                                                                Stack : pxTaskToResume ' Stack ,
                                                                                                State : ready
                                                                                        )
                                                                                }

END
;

/*
	Return the priority of the task passed. This operation only can be used when the INCLUDE_uxTaskPriorityGet is one
*/
priority <-- uxTaskPriorityGet ( pxTask ) =
PRE
  pxTask : tasks & INCLUDE_uxTaskPriorityGet = 1
THEN
  priority := pxTask ' Priority
END
;


/***************
TASK UTIL
****************/

rr <-- xTaskGetCurrentTaskHandle =
PRE
  INCLUDE_xTaskGetCurrentTaskHandle = 1
THEN
  ANY
      currentTask
  WHERE
      currentTask : tasks & currentTask ' State = running
  THEN
      rr := currentTask
  END

END
;

numberOfTasks <-- uxTaskGetNumberOfTasks =
BEGIN
  numberOfTasks := card ( tasks )
END
;


xReturn <-- xTaskGetSchedulerState =
PRE
  INCLUDE_xTaskGetSchedulerState = 1
THEN
  xReturn := schedule
END
;


/******************
Scheduler Control
********************/

/*
Create the idle task and start the schedule
*/
taskStartScheduler =
PRE
 schedule = taskSCHEDULER_NOT_STARTED
THEN
 ANY
     idleTask
 WHERE
     idleTask : TASK & idleTask /: tasks & idleTask ' State = ready & idleTask ' Priority = tskIDLE_PRIORITY
 THEN
     tasks := tasks \/ { idleTask }
 END ||

 schedule := taskSCHEDULER_RUNNING
END
;

vTaskEndScheduler =
PRE
    schedule = taskSCHEDULER_RUNNING
THEN
    schedule := taskSCHEDULER_NOT_STARTED
END
;

vTaskSuspendAll =
BEGIN
    schedule := taskSCHEDULER_SUSPENDED
END
;

xTaskResumeAll =
CHOICE
    schedule := taskSCHEDULER_RUNNING
OR
    schedule := schedule
END


END
