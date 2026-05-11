FUNCTION fnBEETWEEN : BOOL
VAR_INPUT
	iValue : INT;
	iMin : INT;
	iMax : INT;
END_VAR
VAR
END_VAR

// --- implementation ---

fnBEETWEEN := iValue >= iMin AND iValue <= iMax;
