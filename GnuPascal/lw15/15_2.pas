PROGRAM TestRemove(INPUT, OUTPUT);
  {Читает строку из входа, пропускает ее через RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
  
PROCEDURE RemoveExtraBlanks;
  {Удаляет лишние пробелы между слова на одной строке}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd := '$';
  AddQ(LineEnd); {Помечаем конец текста в очереди}
  HeadQ(Ch);
  {Удаляем пробелы}
  WHILE Ch = Blank
  DO
    BEGIN
      DelQ;
      HeadQ(Ch)
    END;
  WHILE Ch <> LineEnd
  DO
    BEGIN
      {Читаем слово}
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
      DO
        BEGIN
          AddQ(Ch);
          DelQ;
          HeadQ(Ch)
        END;
      {Удаляем пробелы}  
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ;
          HeadQ(Ch)
        END;    
      {Вставляем пробел между словами}
      IF Ch <> LineEnd
      THEN
        AddQ(Blank)
    END;
  DelQ {Удаляем LineEnd из очереди}  
END; {RemoveExtraBlanks}  
  
BEGIN {TestRemove}
  EmptyQ;
  WRITE('Вход:');
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      {WRITE(OUTPUT, Ch);}
      AddQ(Ch)
    END;
  {WRITELN(OUTPUT);}
  RemoveExtraBlanks;
  WRITE('Выход:');
  {HeadQ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(OUTPUT, Ch);
      DelQ;
      HeadQ(Ch)
    END;
  WRITELN(OUTPUT)}
  WriteQ;
  EmptyQ   
END. {TestRemove} 

