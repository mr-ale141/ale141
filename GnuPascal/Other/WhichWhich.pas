PROGRAM WhichWhich(INPUT, OUTPUT);
VAR
  Which: CHAR;

PROCEDURE Zap;
BEGIN {Zap}
  Which := 'Z'
END; {Zap}

PROCEDURE Invoke;
VAR
  Which: CHAR;
BEGIN {Invoke}
  Which := 'B';
  Zap;
  WRITE(Which)
END; {Invoke}

BEGIN {WhichWhich}
  Which := 'A';
  Invoke;
  WRITELN(Which)
END. {WhichWhich}   
