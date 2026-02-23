{attribute 'qualified_only'}
VAR_GLOBAL
	xSysRestart : BOOL;         // Global system restart command
	rMainPressure : _03_DUT_Alias; // Using Alias type (renamed to match object)
	stActivePump : _01_DUT_STRUCTURE; // Using Structure type (renamed to match object)
	eCurrentState : _02_DUT_Enumeration; // Using Enum type (renamed to match object)
	uStatus : _04_DUT_UNION; // Using Union type (renamed to match object)
END_VAR

VAR_GLOBAL CONSTANT
	MAX_PUMPS : INT := 4;
	PI : REAL := 3.141592;
END_VAR

VAR_GLOBAL RETAIN
	diTotalCycleCounter : DINT; // Non-volatile counter
END_VAR