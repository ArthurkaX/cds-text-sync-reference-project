// === IMPLEMENTATION ===
// This action simulates flow rate calculation based on pump activity
// Ideally called every cycle when pump is active

IF xPumpActive THEN
    // Simple simulation: flow increases until it reaches a nominal value
    IF rFlowRate < 45.5 THEN
        rFlowRate := rFlowRate + 0.5;
    ELSE
        rFlowRate := 45.5; // Nominal flow
    END_IF
ELSE
    // Flow drops when pump is off
    IF rFlowRate > 0.0 THEN
        rFlowRate := rFlowRate - 1.0;
    ELSE
        rFlowRate := 0.0;
    END_IF
END_IF