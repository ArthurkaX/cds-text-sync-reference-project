FUNCTION_BLOCK FB_Deadband
VAR_INPUT
	rValue : REAL;
	rBand : REAL;
	xExecute : BOOL;
END_VAR
VAR_OUTPUT
	rResult : REAL;
	xDone : BOOL;
END_VAR
VAR
	xPrev : BOOL;
END_VAR

// --- implementation ---

IF xExecute AND NOT xPrev THEN
	IF rValue >= -rBand AND rValue <= rBand THEN
		rResult := 0.0;
	ELSE
		rResult := rValue;
	END_IF
	xDone := TRUE;
END_IF

IF NOT xExecute THEN
	xDone := FALSE;
END_IF

xPrev := xExecute;
