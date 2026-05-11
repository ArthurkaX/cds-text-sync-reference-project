TYPE DUT_CONV_FRAME :
STRUCT
	conv_idx : INT := 1;      // Index in ZONE_MFL.g_aConfigs (1..4)
	sName : STRING(16);       // Safe name copy
	state : STRING(15);       // String representation of state
	//config : DUT_MFL_Config;  // Config copy for visualization
	dimension : INT := 50;    // [mm] segment size for ASCII
	pec_idx : USINT := 1;     // Which PEC to show slip for (1..10)
	iInstantSlip : INT;       // Current/Last measured slip [mm]
	
	// Compatibility fields for older Visu
	conv_number : INT; 
	pec_choice : INT;
	pecAverageSlip : INT;

	asciiString : STRING(255); // The visual representation
END_STRUCT
END_TYPE