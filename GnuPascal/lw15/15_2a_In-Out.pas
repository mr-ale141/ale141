PROGRAM TestRemove(INPUT, OUTPUT);
  {Читает строку из входа, пропускает ее через RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
  
{PROCEDURE RemoveExtraBlanks;
  {Удаляет лишние пробелы между слова на одной строке}
  
BEGIN {TestRemove}
  EmptyQ;
  WRITE('Вход:');
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(OUTPUT, Ch);
      AddQ(Ch)
    END;
  WRITELN(OUTPUT);
 { RemoveExtraBlanks;  }
  WRITE('Выход:');
  HeadQ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(OUTPUT, Ch);
      DelQ;
      HeadQ(Ch)
    END;
  WRITELN(OUTPUT)    
END. {TestRemove} 

