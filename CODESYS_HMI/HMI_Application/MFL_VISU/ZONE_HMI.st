{attribute 'qualified_only'}
VAR_GLOBAL
    // === Global Commands (HMI -> PLC) ===
    xStart: BOOL; // Master Start pulse for all zones
    xStop: BOOL; // Master Stop pulse for all zones
    xReset: BOOL; // Master Reset for all errors
    xReverse: BOOL; // Global direction control (Logic Level)
    xEmitt1: BOOL;
    xEmitt2: BOOL;


    // === Global Status (PLC -> HMI) ===
    xAnyError: BOOL; // True if any zone in error state
    xAnyWarning: BOOL; // True if any zone has a warning
    xSystemOK: BOOL; // True if communication and all zones are OK
    xRunning: BOOL; // True if at least one conveyor is moving

    // === Visualization Mapping ===
    // This array holds references to the frames used by the HMI.
    // It is initialized in MAIN.st to point to VISUALIZATION.aFrames.
    arConveyors: ARRAY[1..4] OF DUT_CONV_FRAME;
	
	arErrors : ARRAY[0..10] OF BOOL;

END_VAR