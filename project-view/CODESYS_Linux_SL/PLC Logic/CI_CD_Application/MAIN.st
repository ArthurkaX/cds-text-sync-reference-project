PROGRAM MAIN
VAR
	// CI/CD test instances â variables visible via read_variable/write_variable
	fbArith : FB_Arithmetic;
	fbScale : FB_Scale;
	fbDeadband : FB_Deadband;
	fbRangeCheck : FB_RangeCheck;
	fbChecksum : FB_Checksum;
	fbCounter : FB_Counter_UD;
END_VAR

// --- implementation ---

// Pass-through call: inputs read from instance variables (set via online API),
// outputs written back to instance variables.
fbArith(rA := fbArith.rA, rB := fbArith.rB,
        eOp := fbArith.eOp, xExecute := fbArith.xExecute);

fbScale(rRaw := fbScale.rRaw, rRawMin := fbScale.rRawMin,
        rRawMax := fbScale.rRawMax, rScaledMin := fbScale.rScaledMin,
        rScaledMax := fbScale.rScaledMax, xExecute := fbScale.xExecute);

fbDeadband(rValue := fbDeadband.rValue, rBand := fbDeadband.rBand,
           xExecute := fbDeadband.xExecute);

fbRangeCheck(rValue := fbRangeCheck.rValue, rMin := fbRangeCheck.rMin,
             rMax := fbRangeCheck.rMax, xExecute := fbRangeCheck.xExecute);

fbChecksum(bA := fbChecksum.bA, bB := fbChecksum.bB,
           bC := fbChecksum.bC, xExecute := fbChecksum.xExecute);

fbCounter(xUp := fbCounter.xUp, xDown := fbCounter.xDown,
          xReset := fbCounter.xReset, uiLimit := fbCounter.uiLimit);
