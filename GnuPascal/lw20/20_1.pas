PROGRAM PrintPsevdoSimbol(INPUT, OUTPUT);
CONST
  StartMatrix = 1;
  EndMatrix = 25;
  LenStringMatrix = 5;
  ValidSimbol = ['O', 'M', 'L'];
  MatrixM = [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
  MatrixO = [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];
  MatrixL = [1, 6, 11, 16, 20, 21 , 22, 23 ,24, 25];
  
TYPE
  SetSimbol = SET OF StartMatrix .. EndMatrix;

VAR
  Ch: CHAR;
  Matrix: SetSimbol;
  
FUNCTION ReadChAndCheck(VAR Ch: CHAR): BOOLEAN;
BEGIN {ReadChAndCheck}
  READ(INPUT, Ch);
  ReadChAndCheck := Ch IN ValidSimbol 
END; {ReadChAndCheck}

FUNCTION GetMatrix(Ch: CHAR): SetSimbol;
BEGIN {GetMatrix}
  CASE Ch OF
    'M': GetMatrix := MatrixM;
    'O': GetMatrix := MatrixO;
    'L': GetMatrix := MatrixL
  END   
END; {GetMatrix}

PROCEDURE PrintMatrix(Matrix: SetSimbol);
VAR
  I: StartMatrix .. EndMatrix;  
BEGIN {PrintMatrix}
  FOR I := StartMatrix TO EndMatrix
  DO
    BEGIN
      IF (I IN Matrix)
      THEN
        WRITE(OUTPUT, 'X')
      ELSE
        WRITE(OUTPUT, ' ');
      IF (I MOD LenStringMatrix = 0)
      THEN
        WRITELN(OUTPUT)    
    END
END; {PrintMatrix}

BEGIN {PrintPsevdoSimbol}
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      IF ReadChAndCheck(Ch)
      THEN
        PrintMatrix(GetMatrix(Ch))
      ELSE
        WRITELN(OUTPUT, 'This simbol not in set!');
      WRITELN(OUTPUT)    
    END
END. {PrintPsevdoSimbol}
