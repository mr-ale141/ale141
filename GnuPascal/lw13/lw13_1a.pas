PROGRAM RunBubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  READLN(InFile);
  WRITELN(OutFile)  
END; {CopyFile}

BEGIN {RunBubbleSort}
  REWRITE(F1);
  CopyFile(INPUT, F1);
  RESET(F1);
  CopyFile(F1, OUTPUT);
END. {RunBubbleSort}
