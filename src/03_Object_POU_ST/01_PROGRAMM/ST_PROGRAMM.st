PROGRAM ST_PROGRAMM
VAR_INPUT
	xEnable : BOOL;          // System enable
	xAutoMode : BOOL;        // Control mode: Auto (True) / Manual (False)
	rLevelSetpoint : REAL;   // Filling level setpoint
	rActualLevel : REAL;     // Current level (from sensor)
END_VAR

VAR_OUTPUT
	xPumpActive : BOOL;      // Output: Pump is active
	xLowLevelAlarm : BOOL;   // Output: Low level alarm
	rFlowRate : REAL;        // Current flow rate
END_VAR

VAR
	fbStartupDelay : TON;    // Startup delay timer
	xInternalError : BOOL;   // Internal error flag
	iStep : INT;             // Current algorithm step
	diGlobalStatus : DINT;   // System status (Moved from VAR_IN_OUT as PROGRAM doesn't support them when called by Task)
	iStartCounter : INT;     // Start counter (Moved from VAR_STAT as all variables in PROGRAM VAR are static by nature)
	iLevelStatus : INT;      // Level diagnostic status (from Method)
	xLevelOk : BOOL;         // Level validity flag (from Method)
	diOperatingHours : DINT; // Operating time in hours (via Property)
	xResetHours : BOOL;      // Manual command to reset hours (via Property)
END_VAR

VAR_TEMP
	rLevelDiff : REAL;       // Temporary variable: level difference (reset every cycle)
END_VAR

VAR RETAIN
	diOperatingSeconds : DINT; // Retain variable: operating time (not reset on power loss)
END_VAR

VAR CONSTANT
	MAX_CAPACITY : REAL := 500.0; // Constant: maximum tank capacity
	MIN_LIMIT : REAL := 10.0;     // Constant: minimum limit threshold
END_VAR

// === IMPLEMENTATION ===
// 0. Use Method to check if level is within safe range (0 to MAX_CAPACITY)
xLevelOk := ST_METHOD(rValue := rActualLevel, 
                      rMin := 0.0, 
                      rMax := MAX_CAPACITY, 
                      iStatusCode => iLevelStatus);

// 1. Calculate level difference in temporary variable
rLevelDiff := rLevelSetpoint - rActualLevel;

// 2. Control logic
IF xEnable AND NOT xInternalError THEN
	
	IF xAutoMode THEN
		// Start pump based on setpoint with hysteresis
		IF rActualLevel < rLevelSetpoint - 5.0 AND NOT xPumpActive THEN
			fbStartupDelay(IN := TRUE, PT := T#2S);
			IF fbStartupDelay.Q THEN
				xPumpActive := TRUE;
				iStartCounter := iStartCounter + 1; // Update counter
			END_IF
		ELSIF rActualLevel >= rLevelSetpoint THEN
			xPumpActive := FALSE;
			fbStartupDelay(IN := FALSE);
		END_IF
	ELSE
		// In manual mode just monitor limits
		xPumpActive := xEnable AND (rActualLevel < MAX_CAPACITY);
	END_IF
	
ELSE
	xPumpActive := FALSE;
	fbStartupDelay(IN := FALSE);
END_IF

// 3. Alarm handling
xLowLevelAlarm := (rActualLevel < MIN_LIMIT);

// 4. Operating time accumulation (RETAIN)
IF xPumpActive THEN
	diOperatingSeconds := diOperatingSeconds + 1;
END_IF

// 5. Call Action to calculate flow
ST_ACTION();

// 6. Use Property to work with operating hours
diOperatingHours := ST_PROPERTY; // GET: Read hours converted from seconds

IF xResetHours THEN
    ST_PROPERTY := 0;            // SET: Reset seconds by setting property hours to 0
    xResetHours := FALSE;
END_IF

// 7. Status update
IF xLowLevelAlarm THEN
	diGlobalStatus := 999; // Error code
ELSIF xPumpActive THEN
	diGlobalStatus := 100; // Running
ELSE
	diGlobalStatus := 0;   // Standby
END_IF