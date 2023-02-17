PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch1, Ch2, Ch: CHAR;
  F1, F2: TEXT;
BEGIN {BubbleSort}
  {Копируем INPUT в F1}
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(F1, Ch)
    END;
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN {Пока Sorted = 'N'}
      {Копируем F1 в F2, переставляя соседние по порядку}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      WHILE NOT EOF(F1)
      DO
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOF(F1)
          DO
            BEGIN
              {Выводим min (Ch1, Ch2) в F2, остаток в F1}
              READ(F1, Ch2);
              IF Ch1 < Ch2
              THEN
                BEGIN {Ch1 < Ch2}
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END {Ch1 < Ch2}
              ELSE
                BEGIN {Ch1 >= Ch2}
                  WRITE(F2, Ch2);
                  Sorted := 'N'
                END {Ch1 >= Ch2} 
            END;
          WRITELN(F2, Ch1)
        END;
      {Копируем F2 в F1} 
      RESET(F2);
      REWRITE(F1);
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, Ch);
          WRITE(F1, Ch)
        END
    END; {Пока Sorted = 'N'}
  {Копируем F1 в OUTPUT}
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(OUTPUT, Ch)
    END   
END. {BubbleSort}
