FUNCTION_BLOCK FB_TrafficLight
VAR_INPUT
	xRun : BOOL := FALSE;
	xReset : BOOL := FALSE;
END_VAR
VAR_OUTPUT
	xRed : BOOL := FALSE;
	xYellow : BOOL := FALSE;
	xGreen : BOOL := FALSE;
	eState : USINT := 0; // 0=Red, 1=RedYellow, 2=Green, 3=Yellow
END_VAR
VAR
	_timer : TON;
	_state : USINT := 0;
	_times : ARRAY[0..3] OF TIME := [T#3s, T#1s, T#3s, T#1s];
	_xRunPrev : BOOL := FALSE;
END_VAR

// --- implementation ---

IF xReset THEN
	_state := 0;
	xRed := FALSE; xYellow := FALSE; xGreen := FALSE;
	eState := 0;
	_timer(IN := FALSE);
	RETURN;
END_IF

// Start on rising edge
IF xRun AND NOT _xRunPrev THEN
	_state := 0;
	_timer(IN := TRUE, PT := _times[0]);
END_IF
_xRunPrev := xRun;

IF NOT xRun THEN
	_timer(IN := FALSE);
	xRed := FALSE; xYellow := FALSE; xGreen := FALSE;
	RETURN;
END_IF

// State machine
_timer();

IF _timer.Q THEN
	_state := (_state + 1) MOD 4;
	_timer(IN := TRUE, PT := _times[_state]);
END_IF

// Output mapping
CASE _state OF
	0: xRed := TRUE;  xYellow := FALSE; xGreen := FALSE;
	1: xRed := TRUE;  xYellow := TRUE;  xGreen := FALSE;
	2: xRed := FALSE; xYellow := FALSE; xGreen := TRUE;
	3: xRed := FALSE; xYellow := TRUE;  xGreen := FALSE;
END_CASE

eState := _state;
