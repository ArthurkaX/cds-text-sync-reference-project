METHOD ST_FB_Method : BOOL
VAR_INPUT
	iValueToAdd : INT;
END_VAR

// === IMPLEMENTATION ===
IF (iCounter + iValueToAdd) <= _iLimit THEN
	iCounter := iCounter + iValueToAdd;
	ST_FB_Method := TRUE;
ELSE
	ST_FB_Method := FALSE;
END_IF