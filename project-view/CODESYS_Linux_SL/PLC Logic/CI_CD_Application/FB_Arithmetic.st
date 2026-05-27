FUNCTION_BLOCK FB_Arithmetic
VAR_INPUT
	rA : REAL;
	rB : REAL;
	eOp : USINT; // 0=Add, 1=Sub, 2=Mul, 3=Div
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
	CASE eOp OF
		0: rResult := rA + rB;
		1: rResult := rA - rB;
		2: rResult := rA * rB;
		3: 
			IF rB <> 0.0 THEN
				rResult := rA / rB;
			ELSE
				rResult := 0.0;
			END_IF
		ELSE
			rResult := 0.0;
	END_CASE
	xDone := TRUE;
END_IF

IF NOT xExecute THEN
	xDone := FALSE;
END_IF

xPrev := xExecute;
