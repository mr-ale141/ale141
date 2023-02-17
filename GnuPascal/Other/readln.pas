PROGRAM TicTakToe(INPUT, OUTPUT);
Var
  Ch1, Ch2: CHAR;
BEGIN
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      READ(Ch1);
      READLN;
      READ(Ch2);
      WRITELN('|', Ch1, '-', Ch2, '|')
    END
END.
