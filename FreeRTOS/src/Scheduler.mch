/* Scheduler
 * Author: david
 * Creation date: Wed Apr 8 2009
 */
MACHINE
    Scheduler
    
SEES
    Types
    
VARIABLES
    active
   
INVARIANT
    active: BOOL 

INITIALISATION
    active := FALSE
    
OPERATIONS
	

	/**
		\brief	Start Scheduler
		
		\do	
			Start the scheduler and create the idle task.
	**/
	startScheduler = 
	PRE
    	active = FALSE  	
	THEN
        active:=TRUE
 	END;
	
	/**
		\brief	End Scheduler
		
		\do	
			End the task of schuler
	**/
	stopScheduler =
	PRE
    	active = TRUE
	THEN
    	active := FALSE
	END;
	
	/**
		\brief	Suspend All
		
		\do	
			Suspend the scheduler activities changing its state to suspended
	**/
	suspendScheduler =
	PRE
	    active=TRUE
	    
	THEN
   		active := TRUE
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
	    active =TRUE
	THEN
      active := TRUE
	END
	
END
