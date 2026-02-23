METHOD ST_METHOD : BOOL
VAR_INPUT
	rValue : REAL;       // Value to check
	rMin : REAL;         // Minimum limit
	rMax : REAL;         // Maximum limit
END_VAR
VAR_OUTPUT
	iStatusCode : INT;   // 0: OK, 1: Too Low, 2: Too High
END_VAR

// === IMPLEMENTATION ===
// This method checks if a value is within specified bounds

IF rValue < rMin THEN
	iStatusCode := 1;
	ST_METHOD := FALSE;
ELSIF rValue > rMax THEN
	iStatusCode := 2;
	ST_METHOD := FALSE;
ELSE
	iStatusCode := 0;
	ST_METHOD := TRUE;
END_IF