TYPE _01_DUT_STRUCTURE :
STRUCT
	sName : STRING(31);        // Pump designation
	rMaxFlow : REAL := 100.0;  // Capacity limit
	xIsVFD : BOOL;            // Has Variable Frequency Drive
	diWorkingHours : DINT;    // Total service time
END_STRUCT
END_TYPE