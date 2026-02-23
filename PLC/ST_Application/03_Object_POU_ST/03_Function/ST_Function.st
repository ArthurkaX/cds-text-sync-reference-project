FUNCTION ST_Function : BOOL
VAR_INPUT
	rValue : REAL;
	rMin : REAL;
	rMax : REAL;
END_VAR
VAR
END_VAR

// === IMPLEMENTATION ===
IF rValue >= rMin AND rValue <= rMax THEN
	ST_Function := TRUE;
ELSE
	ST_Function := FALSE;
END_IF