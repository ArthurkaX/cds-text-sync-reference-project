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
	xError : BOOL;
END_VAR

// --- implementation ---

IF xExecute THEN
	IF rRawMax <> rRawMin THEN
		xError := FALSE;
		rResult := rScaledMin + (rRaw - rRawMin) / (rRawMax - rRawMin) * (rScaledMax - rScaledMin);

		// Clamp (handle both normal and reversed scaled ranges)
		IF rResult < rScaledMin THEN rResult := rScaledMin; END_IF
		IF rResult > rScaledMax THEN rResult := rScaledMax; END_IF
	ELSE
		rResult := rScaledMin;
		xError   := TRUE;
	END_IF

	xDone := TRUE;
ELSE
	xDone  := FALSE;
	xError := FALSE;
END_IF
