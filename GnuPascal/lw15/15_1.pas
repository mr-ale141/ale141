PROGRAM Count3_Test(INPUT, OUTPUT);
USES Count3, CopyFile;
VAR
  V100, V10, V1, Ch1, Ch2, Ch3, Ch: CHAR;
BEGIN
  Start;
  WRITE(OUTPUT, 'Вход: ');
  RESET(INPUT);  
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch2);
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch3);   
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      Ch1 := Ch2;
      Ch2 := Ch3;
      READ(INPUT, Ch3);
      IF (Ch1 < Ch2) AND (Ch3 < Ch2)
      THEN
        Bump
      ELSE  
        IF (Ch1 > Ch2) AND (Ch3 > Ch2)
        THEN
          Bump
    END;    
  Value(V100, V10, V1);       
  WRITELN(OUTPUT, 'Количество реверсов: ', V100, V10, V1)   
END.
