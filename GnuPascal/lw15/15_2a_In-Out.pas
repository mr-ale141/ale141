PROGRAM TestRemove(INPUT, OUTPUT);
  {������ ������ �� �����, ���������� �� ����� RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
  
{PROCEDURE RemoveExtraBlanks;
  {������� ������ ������� ����� ����� �� ����� ������}
  
BEGIN {TestRemove}
  EmptyQ;
  WRITE('����:');
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(OUTPUT, Ch);
      AddQ(Ch)
    END;
  WRITELN(OUTPUT);
 { RemoveExtraBlanks;  }
  WRITE('�����:');
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

