/* Scheduler
 * Author: david
 * Creation date: Wed Apr 8 2009
 */
MACHINE
    Scheduler
    
SEES
    Types
    
VARIABLES
    schedulerRunning,
    schedulerSuspended
   
INVARIANT
    schedulerRunning: BOOL &
    schedulerSuspended:NATURAL

INITIALISATION
    schedulerRunning := FALSE||
    schedulerSuspended:=0
    
OPERATIONS
	

	/**
		\brief	Start Scheduler
		
		\do	
			Start the scheduler and create the idle task.
	**/
	startScheduler = 
	PRE
    	schedulerRunning = FALSE  	
	THEN
        schedulerRunning:=TRUE
 	END;
	
	/**
		\brief	End Scheduler
		
		\do	
			End the task of schuler
	**/
	stopScheduler =
	PRE
    	schedulerRunning = TRUE
	THEN
    	schedulerRunning := FALSE
	END;
	
	/**
		\brief	Suspend All
		
		\do	
			Suspend the scheduler activities changing its state to suspended
	**/
	suspendScheduler =
	PRE
	    schedulerSuspended< MAXINT
	    
	THEN
   		schedulerSuspended := schedulerSuspended + 1
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
	    schedulerSuspended > 0
	THEN
        schedulerSuspended := schedulerSuspended - 1
	END
	
END
