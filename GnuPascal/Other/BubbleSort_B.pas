PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch1, Ch2, Ch: CHAR;
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
      {Копируем F2 в F1} 
    END; {Пока Sorted = 'N'}
  {Копируем F1 в OUTPUT}
END. {BubbleSort}