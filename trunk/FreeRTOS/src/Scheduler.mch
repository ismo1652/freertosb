/* Scheduler
 * Author: david
 * Creation date: Wed Apr 8 2009
 */
MACHINE
    Scheduler
    
SEES
    Types
    
VARIABLES
	scheduler
   
INVARIANT
	scheduler: SCHEDULER_STATE

INITIALISATION
    scheduler := taskSCHEDULER_NOT_STARTED
    
OPERATIONS
	/**
		\brief	Get Scheduler State
		\do	
			Get the currently state of the scheduler
		\returns
			schedulerState - The currently state of the scheduler
			
	**/
	state <-- stateScheduler =
	BEGIN
	    state := scheduler
	END;

	/**
		\brief	Start Scheduler
		
		\do	
			Start the scheduler and create the idle task.
	**/
	startScheduler = 
	PRE
    	scheduler = taskSCHEDULER_NOT_STARTED  	
	THEN
        scheduler:=taskSCHEDULER_RUNNING
 	END;
	
	/**
		\brief	End Scheduler
		
		\do	
			End the task of schuler
	**/
	stopScheduler =
	PRE
    	scheduler = taskSCHEDULER_RUNNING
	THEN
    	scheduler := taskSCHEDULER_NOT_STARTED
	END;
	
	/**
		\brief	Suspend All
		
		\do	
			Suspend the scheduler activities changing its state to suspended
	**/
	suspendScheduler =
	PRE
	    scheduler = taskSCHEDULER_RUNNING
	THEN
   		scheduler := taskSCHEDULER_SUSPENDED   		
	END;

	/**
		\brief	Resume All
		
		\do	
			Resume the scheduler:
			increment the tick with missed ticks; 
			verify the list of blocked tasks to unblock the tasks with expired timers.
			
			
	**/
	resumeScheduler = 
	PRE
	    scheduler = taskSCHEDULER_SUSPENDED
	THEN
        scheduler := taskSCHEDULER_RUNNING
	END
	
END
