PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch1, Ch2, Ch: CHAR;
BEGIN {BubbleSort}
  {�������� INPUT � F1}
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
    BEGIN {���� Sorted = 'N'}
      {�������� F1 � F2, ����������� �������� �� �������}
      {�������� F2 � F1} 
    END; {���� Sorted = 'N'}
  {�������� F1 � OUTPUT}
END. {BubbleSort}