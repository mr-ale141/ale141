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

PROCEDURE CopyAndSwap(VAR F1, F2: TEXT; VAR Sorted: CHAR);
BEGIN {CopyAndSwap}
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch2);
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
      WRITELN(F2, Ch1) 
    END
END; {CopyAndSwap}  

BEGIN {RunBubbleSort}
  { ???????? INPUT ? F1 }
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      { ???????? F1 ? F2,???????? ?????????????????
       ? ??????????? ?????? ???????? ??????? ?? ???????}
      RESET(F1);
      REWRITE(F2);
      CopyAndSwap(F1, F2, Sorted);
      { ???????? F2 ? F1 }
      RESET(F2);
      REWRITE(F1);
      CopyFile(F2, F1)
    END;
  { ???????? F1 ? OUTPUT }
  RESET(F2);
  CopyFile(F2, OUTPUT)
END. {RunBubbleSort}
