FUNCTION_BLOCK ST_FB
VAR_INPUT
	xEnable : BOOL; // Enable counting
END_VAR
VAR_OUTPUT
	iCounter : INT; // Current counter value
	xLimitReached : BOOL; // Flag when limit is reached
END_VAR
VAR
	_iLimit : INT := 100; // Internal limit
END_VAR

// === IMPLEMENTATION ===
IF xEnable THEN
	IF iCounter < _iLimit THEN
		iCounter := iCounter + 1;
		xLimitReached := FALSE;
	ELSE
		xLimitReached := TRUE;
	END_IF
ELSE
	xLimitReached := FALSE;
END_IF