{attribute 'qualified_only'}
{attribute 'strict'}
TYPE ENUM_SegmentStatus :
(
	Empty_Segment := 95,     // '_' Empty 50mm space
	Cargo_Start := 91,       // '[' Left boundary of cargo item
	Cargo_End := 93,         // ']' Right boundary of cargo item
	Cargo_Filled := 35,      // '#' Segment fully occupied by cargo
	Sensor_Inactive := 111,  // 'o' Sensor position, no cargo detected
	Sensor_Active := 120,    // 'x' Sensor position, cargo detected
	Conveyor_Start := 123,   // '{'  Start edge of conveyor
	Conveyor_End := 125,     // '}' end edge of conveyor
	NULL := 0				 // String termination
)USINT;
END_TYPE