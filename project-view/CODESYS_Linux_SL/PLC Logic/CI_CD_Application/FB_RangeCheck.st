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

// --- implementation ---

IF xExecute THEN
	xInRange := rValue >= rMin AND rValue <= rMax;
	xDone := TRUE;
ELSE
	xDone := FALSE;
	xInRange := FALSE;
END_IF
