FUNCTION_BLOCK FB_Counter_UD
VAR_INPUT
	xUp : BOOL := FALSE;
	xDown : BOOL := FALSE;
	xReset : BOOL := FALSE;
	uiLimit : UINT := 100;
END_VAR
VAR_OUTPUT
	uiValue : UINT := 0;
	xLimitReached : BOOL := FALSE;
END_VAR
VAR
	_xUpPrev : BOOL := FALSE;
	_xDownPrev : BOOL := FALSE;
END_VAR

// --- implementation ---

// Reset
IF xReset THEN
	uiValue := 0;
	xLimitReached := FALSE;
	_xUpPrev := FALSE;
	_xDownPrev := FALSE;
	RETURN;
END_IF

// Rising edge up
IF xUp AND NOT _xUpPrev THEN
	IF uiValue < uiLimit THEN
		uiValue := uiValue + 1;
	END_IF
END_IF
_xUpPrev := xUp;

// Rising edge down
IF xDown AND NOT _xDownPrev THEN
	IF uiValue > 0 THEN
		uiValue := uiValue - 1;
	END_IF
END_IF
_xDownPrev := xDown;

// Limit detection
xLimitReached := uiValue >= uiLimit;
