PROGRAM ReversString(INPUT, OUTPUT);
USES Count3;
VAR
  V100, V10, V1, Ch1, Ch2, Ch3: CHAR;
BEGIN {ReversString}
  Start;
  WRITE(OUTPUT, 'Вход: ');
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
      IF (Ch1 < Ch2) AND (Ch3 < Ch2) OR (Ch1 > Ch2) AND (Ch3 > Ch2)
      THEN
        Bump
    END;    
  Value(V100, V10, V1);       
  WRITELN(OUTPUT, 'Количество реверсов: ', V100, V10, V1)   
END. {ReversString}
