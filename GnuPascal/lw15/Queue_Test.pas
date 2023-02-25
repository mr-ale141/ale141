PROGRAM Queue_Test(INPUT, OUTPUT);
USES Queue;
VAR
  Ch: CHAR;
BEGIN
  EmptyQ;
  WRITELN(OUTPUT, 'E - EmptyQ');
  WRITELN(OUTPUT, 'A''Ch'' - AddQ(Ch)');
  WRITELN(OUTPUT, 'D - DelQ');
  WRITELN(OUTPUT, 'H - HeadQ(Ch)');
  WRITELN(OUTPUT, '$ - Exit');
  WRITE(OUTPUT, 'Cmd:');
  READ(INPUT, Ch);
  WHILE Ch <> '$'
  DO
    BEGIN
      IF Ch = 'E'
      THEN
        EmptyQ
      ELSE
        IF Ch = 'A'
        THEN
          BEGIN
            READ(INPUT, Ch);
            AddQ(Ch)
          END
        ELSE
          IF Ch = 'D'
          THEN
            DelQ
          ELSE
            IF Ch = 'H'
            THEN
              BEGIN
                HeadQ(Ch);
                WRITE(OUTPUT, 'Голова - ', Ch, '; ')
              END;
      READLN(INPUT);                
      WRITE(OUTPUT, 'Queue:');
      WriteQ;
      WRITELN(OUTPUT, 'E - EmptyQ');
      WRITELN(OUTPUT, 'A''Ch'' - AddQ(Ch)');
      WRITELN(OUTPUT, 'D - DelQ');
      WRITELN(OUTPUT, 'H - HeadQ(Ch)');
      WRITELN(OUTPUT, '$ - Exit');
      WRITE(OUTPUT, 'Cmd:');
      READ(INPUT, Ch)   
    END
END.
