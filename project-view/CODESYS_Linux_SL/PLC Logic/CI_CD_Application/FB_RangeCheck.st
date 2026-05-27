FUNCTION_BLOCK FB_RangeCheck
VAR_INPUT
	rValue : REAL;
	rMin : REAL;
	rMax : REAL;
	xExecute : BOOL;
END_VAR
VAR_OUTPUT
	xInRange : BOOL;
	xDone : BOOL;
END_VAR
VAR
	xPrev : BOOL;
END_VAR

// --- implementation ---

IF xExecute AND NOT xPrev THEN
	xInRange := rValue >= rMin AND rValue <= rMax;
	xDone := TRUE;
END_IF

IF NOT xExecute THEN
	xDone := FALSE;
END_IF

xPrev := xExecute;
