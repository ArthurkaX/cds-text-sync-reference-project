FUNCTION_BLOCK FB_Scale
VAR_INPUT
	rRaw : REAL;
	rRawMin : REAL;
	rRawMax : REAL;
	rScaledMin : REAL;
	rScaledMax : REAL;
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
	IF rRawMax <> rRawMin THEN
		rResult := rScaledMin + (rRaw - rRawMin) / (rRawMax - rRawMin) * (rScaledMax - rScaledMin);
	ELSE
		rResult := rScaledMin;
	END_IF
	// Clamp
	IF rResult < rScaledMin THEN rResult := rScaledMin; END_IF
	IF rResult > rScaledMax THEN rResult := rScaledMax; END_IF
	xDone := TRUE;
END_IF

IF NOT xExecute THEN
	xDone := FALSE;
END_IF

xPrev := xExecute;
