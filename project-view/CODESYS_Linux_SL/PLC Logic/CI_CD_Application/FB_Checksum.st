FUNCTION_BLOCK FB_Checksum
VAR_INPUT
	bA : BYTE;
	bB : BYTE;
	bC : BYTE;
	xExecute : BOOL;
END_VAR
VAR_OUTPUT
	bResult : BYTE;
	xDone : BOOL;
END_VAR
VAR
	xPrev : BOOL;
END_VAR

// --- implementation ---

IF xExecute AND NOT xPrev THEN
	bResult := bA XOR bB XOR bC;
	xDone := TRUE;
END_IF

IF NOT xExecute THEN
	xDone := FALSE;
END_IF

xPrev := xExecute;
