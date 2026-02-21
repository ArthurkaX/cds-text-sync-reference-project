PROPERTY ST_PROPERTY : DINT

// === IMPLEMENTATION ===
// === GET ===
VAR
END_VAR

// === IMPLEMENTATION ===
// Returns operating time in hours
ST_PROPERTY := diOperatingSeconds / 3600;

// === SET ===
VAR
END_VAR

// === IMPLEMENTATION ===
// Allows manual override/reset of operating seconds via hours
diOperatingSeconds := ST_PROPERTY * 3600;