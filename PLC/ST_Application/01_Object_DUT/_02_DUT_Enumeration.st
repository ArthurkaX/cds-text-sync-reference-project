{attribute 'qualified_only'}
{attribute 'strict'}
TYPE _02_DUT_Enumeration :
(
	IDLE := 0,      // System waiting
	STARTING,       // Transition to running
	RUNNING,        // Active operation
	STOPPING,       // Controlled shutdown
	ERROR := 99     // Fault state
) INT;
END_TYPE