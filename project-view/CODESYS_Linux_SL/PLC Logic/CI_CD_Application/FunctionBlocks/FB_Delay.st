FUNCTION_BLOCK FB_Delay
VAR_INPUT
	xTrig : BOOL := FALSE;
	tDelay : TIME := T#1s;
END_VAR
VAR_OUTPUT
	xOut : BOOL := FALSE;
	xElapsed : BOOL := FALSE;
END_VAR
VAR
	_timer : TON;
	_xTrigPrev : BOOL := FALSE;
END_VAR

// --- implementation ---

// Detect rising edge
IF xTrig AND NOT _xTrigPrev THEN
	_timer(IN := TRUE, PT := tDelay);
END_IF
_xTrigPrev := xTrig;

// Run timer
_timer();

xOut := _timer.Q;
xElapsed := _timer.Q AND NOT _xTrigPrev;
