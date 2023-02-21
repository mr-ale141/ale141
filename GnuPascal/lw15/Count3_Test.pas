PROGRAM Count3_Test(INPUT, OUTPUT);
USES Count3;
VAR
  V100, V10, V1, Ch: CHAR;
BEGIN
  Start;
  Value(V100, V10, V1);       
  WRITELN(OUTPUT, V100, V10, V1);  
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      Bump;
      Value(V100, V10, V1);       
      WRITELN(OUTPUT, 'Символ №', V100, V10, V1, ' - ', Ch)
    END;
  Value(V100, V10, V1);       
  WRITELN(OUTPUT, 'Всего: ', V100, V10, V1)   
END.
