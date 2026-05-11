TYPE _04_DUT_UNION :
UNION
	wValue : WORD;  // Overlaps iValue
	iValue : INT;   // Overlaps wValue
END_UNION
END_TYPE