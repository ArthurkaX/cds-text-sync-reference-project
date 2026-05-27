FUNCTION_BLOCK FB_PulseTrain
VAR_INPUT
	xStart : BOOL := FALSE;
	xStop : BOOL := FALSE;
	uiPulseCount : UINT := 10;
	tPeriod : TIME := T#500ms;
END_VAR
VAR_OUTPUT
	xPulse : BOOL := FALSE;
	xBusy : BOOL := FALSE;
	xDone : BOOL := FALSE;
END_VAR
VAR
	_timer : TP;
	_pulseCount : UINT := 0;
	_xStartPrev : BOOL := FALSE;
	_running : BOOL := FALSE;
END_VAR

// --- implementation ---

// Stop
IF xStop THEN
	_running := FALSE;
	_pulseCount := 0;
	xPulse := FALSE;
	xBusy := FALSE;
	xDone := FALSE;
	RETURN;
END_IF

// Start on rising edge
IF xStart AND NOT _xStartPrev THEN
	_running := TRUE;
	_pulseCount := 0;
	xDone := FALSE;
END_IF
_xStartPrev := xStart;

IF _running THEN
	_timer(IN := TRUE, PT := tPeriod);
	xPulse := _timer.Q;
	
	IF _timer.Q THEN
		_pulseCount := _pulseCount + 1;
		IF _pulseCount >= uiPulseCount THEN
			_running := FALSE;
			xDone := TRUE;
		END_IF
	END_IF
	
	xBusy := TRUE;
ELSE
	_timer(IN := FALSE);
	xPulse := FALSE;
	xBusy := FALSE;
END_IF
