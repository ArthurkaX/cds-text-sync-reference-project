PROGRAM ST_PROGRAMM_AUX
VAR
	diTotalHours : DINT;        // Total operating hours read from main program
	xMaintenanceReq : BOOL;    // Maintenance required flag
	iLogCounter : INT;         // Counter for log entries
END_VAR

VAR CONSTANT
	MAINTENANCE_INTERVAL : DINT := 1000; // Maintenance every 1000 hours
END_VAR

// === IMPLEMENTATION ===
// 1. Accessing property of another program (ST_PROGRAMM)
// This is a GET access to the property in ST_PROGRAMM
diTotalHours := ST_PROGRAMM.ST_PROPERTY;

// 2. Logic to determine if maintenance is needed
IF diTotalHours >= MAINTENANCE_INTERVAL THEN
	xMaintenanceReq := TRUE;
ELSE
	xMaintenanceReq := FALSE;
END_IF

// 3. Example of direct variable access between programs
// Reading a standard variable from ST_PROGRAMM
IF ST_PROGRAMM.xLowLevelAlarm AND iLogCounter < 100 THEN
    iLogCounter := iLogCounter + 1;
    // Here we could call a logging function
END_IF

// 4. Example of writing to another program
// We can reset the hours in the main program via its property
IF xMaintenanceReq AND ST_PROGRAMM.xAutoMode = FALSE THEN
    // Potentially reset hours after maintenance in manual mode
    // ST_PROGRAMM.ST_PROPERTY := 0; // SET access
END_IF