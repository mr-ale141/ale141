PROGRAM WhichWhich(INPUT, OUTPUT);
VAR
  Which: CHAR;
PROCEDURE Zap;
BEGIN
  Which := 'Z'
END;
PROCEDURE Invoke;
VAR
  Which: CHAR;
BEGIN
  Which := 'B';
  Zap;
  WRITE(Which)
END;
BEGIN
  Which := 'A';
  Invoke;
  WRITELN(Which)
END.
