PROGRAM Count3_Test(INPUT, OUTPUT);
USES Count3;
VAR
  V100, V10, V1, Ch1, Ch2, Ch3: CHAR;
BEGIN
  Start;
  Value(V100, V10, V1);       
  WRITELN(OUTPUT, 'Начало: ', V100, V10, V1);
  Ch1 := ' ';
  Ch2 := ' ';
  Ch3 := ' ';
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch1);
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Ch2);
  IF NOT EOLN(INPUT)
  THEN
    BEGIN
      READ(INPUT, Ch3);
      IF (Ch1 < Ch2) AND (Ch3 < Ch2)
      THEN
        Bump
      ELSE  
        IF (Ch1 > Ch2) AND (Ch3 > Ch2)
        THEN
          Bump;
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          IF NOT EOLN(INPUT)
          THEN
            BEGIN
              Ch1 := Ch2;
              Ch2 := Ch3;
              READ(INPUT, Ch3)
            END; 
          IF (Ch1 < Ch2) AND (Ch3 < Ch2)
          THEN
            Bump
          ELSE  
            IF (Ch1 > Ch2) AND (Ch3 > Ch2)
            THEN
              Bump
        END
    END;    
  Value(V100, V10, V1);       
  WRITELN(OUTPUT, 'Количество реверсов: ', V100, V10, V1)   
END.
