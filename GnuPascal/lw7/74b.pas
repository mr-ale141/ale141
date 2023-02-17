PROGRAM BubbleSortMLB(INPUT, OUTPUT);
{Сортируем первую строку INPUT в OUTPUT}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2, F3: TEXT;
BEGIN {BubbleSortMLB}
  { Копируем INPUT в F1 }
  REWRITE(F1);
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          READ(Ch);
          WRITE(F1, Ch)
        END;
      WRITELN(F1);
      READLN(INPUT)
    END;
  RESET(F1);  
  WHILE NOT EOF(F1)
  DO
    BEGIN
      REWRITE(F3);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(F3, Ch)
        END;
      WRITELN(F3);
      Sorted := 'N';
      WHILE Sorted = 'N'
      DO
        BEGIN
          { Копируем F1 в F2,проверяя отсортированность
           и переставляя первые соседние символы по порядку}
          RESET(F3);
          Sorted := 'Y';
          REWRITE(F2);
          IF NOT EOLN(F3)
          THEN
            BEGIN
              READ(F3, Ch1);
              WHILE NOT EOLN(F3)
              DO { По крайней мере два символа остается для Ch1,Ch2 }
                BEGIN
                  READ(F3, Ch2);
                  { Выводим   min(Ch1,Ch2) в  F2, записывая
                   отсортированные символы }
                  IF Ch1 <= Ch2
                  THEN
                    BEGIN
                      WRITE(F2, Ch1);
                      Ch1 := Ch2
                    END
                  ELSE
                    BEGIN
                      WRITE(F2, Ch2);
                      Sorted := 'N'
                    END
                END;
              WRITELN(F2, Ch1) { Выводим последний символ в F2 }
            END;
          { Копируем F2 в F1 }
          REWRITE(F3);
          RESET(F2);
          WHILE NOT EOLN(F2)
          DO
            BEGIN
              READ(F2, Ch);
              WRITE(F3, Ch)
            END;
          WRITELN(F3)
        END;
      { Копируем F1 в OUTPUT }
      RESET(F3);
      WHILE NOT EOLN(F3)
      DO
        BEGIN
          READ(F3, Ch);
          WRITE(OUTPUT, Ch)
        END;
      WRITELN(OUTPUT);
      READLN(F1)
    END
END. {BubbleSortMLB}

