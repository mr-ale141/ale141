PROGRAM Display(INPUT, OUTPUT);
CONST
  StartMatrixSymbol = 1;
  EndMatrixSymbol = 25;
  LenStringSymbol = 5;
  LenStringDisplay = 50;
  StartDisplay = 1;
  EndDisplay = 250;
  
  
TYPE
  MatrixSymbol = SET OF StartMatrixSymbol .. EndMatrixSymbol;
  MatrixDisplay = SET OF StartDisplay .. EndDisplay;
  Position = 0 .. 10;

VAR
  Ch: CHAR;
  MatrixCh: MatrixSymbol;
  Display: MatrixDisplay;
  Cursor: Position;
  StorageChar: TEXT;
  
FUNCTION ReadChAndCheck(VAR Ch: CHAR): BOOLEAN;
BEGIN {ReadChAndCheck}
  READ(INPUT, Ch);
  ReadChAndCheck := ((Ch >= 'A') AND (Ch <= 'Z')) 
END; {ReadChAndCheck}

FUNCTION GetMatrix(VAR StorageChar: TEXT; FindCh: CHAR): MatrixSymbol;
VAR
  Ch: CHAR;
  IndexMatrixCh: StartMatrixSymbol .. EndMatrixSymbol;
  MatrixCh: MatrixSymbol;
BEGIN {GetMatrix}
  RESET(StorageChar);
  Ch := ' ';
  MatrixCh := [];
  WHILE NOT EOF(StorageChar) AND (Ch <> FindCh)
  DO
    BEGIN
      READ(StorageChar, Ch);
      IF (Ch <> FindCh)
      THEN
        READLN(StorageChar)
    END;  
  WHILE NOT EOLN(StorageChar)
  DO
    BEGIN
      READ(StorageChar, Ch);
      READ(StorageChar, IndexMatrixCh);
      MatrixCh := MatrixCh + [IndexMatrixCh];
    END;
  GetMatrix := MatrixCh         
END; {GetMatrix}

PROCEDURE InsMatrixCh(VAR Display: MatrixDisplay; MatrixCh: MatrixSymbol; Cursor: Position);
VAR
  IndexDisplay: StartDisplay .. EndDisplay;
  IndexMatrixCh: StartMatrixSymbol .. EndMatrixSymbol;
BEGIN {InsMatrixCh}
  FOR IndexMatrixCh := StartMatrixSymbol TO EndMatrixSymbol
  DO
    BEGIN
      IF (IndexMatrixCh IN MatrixCh)
      THEN
        BEGIN
          IndexDisplay := IndexMatrixCh + LenStringSymbol * (Cursor - 1) + ((IndexMatrixCh - 1) DIV 5) * 45;
          Display := Display + [IndexDisplay]
        END
    END
END; {InsMatrixCh}

PROCEDURE PrintDisplay(Display: MatrixDisplay);
VAR
  IndexDisplay: StartDisplay .. EndDisplay;   
BEGIN {PrintDisplay}
  FOR IndexDisplay := StartDisplay TO EndDisplay
  DO
    BEGIN
      IF (IndexDisplay IN Display)
      THEN
        WRITE(OUTPUT, '#')
      ELSE
        WRITE(OUTPUT, ' ');
      IF (IndexDisplay MOD LenStringSymbol = 0)
      THEN
        IF (IndexDisplay MOD LenStringDisplay = 0)
        THEN 
          WRITELN(OUTPUT)
        ELSE
          WRITE(OUTPUT, ' ')      
    END
END; {PrintDisplay}

BEGIN {Display}
  ASSIGN(StorageChar, 'liter.txt');
  Cursor := 1;
  Display := [];
  WHILE NOT EOLN(INPUT) AND (Cursor <= 10) AND (Cursor > 0) 
  DO
    BEGIN
      IF ReadChAndCheck(Ch)
      THEN
        BEGIN
          InsMatrixCh(Display, GetMatrix(StorageChar, Ch), Cursor);
          Cursor := Cursor + 1
        END
      ELSE
        BEGIN
          WRITELN(OUTPUT, 'ERROR! Input symbol not correct!');
          Cursor := 0
        END;
      IF (Cursor > 10) AND NOT EOLN(INPUT)
      THEN
        WRITELN(OUTPUT, 'WARNING! Len >= 10 char!')      
    END;
  IF Display <> []
  THEN  
    PrintDisplay(Display)  
END. {Display}
