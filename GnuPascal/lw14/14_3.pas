PROGRAM RecursiveSortDriver(INPUT, OUTPUT);
VAR
  FileIn: TEXT;
  Ch: CHAR;
  
PROCEDURE Split(VAR FIn, FOut2, FOut3: TEXT);
VAR
  Ch, Switch: CHAR;
BEGIN{Split}
  RESET(FIn);
  REWRITE(FOut2);
  REWRITE(FOut3);
  Switch := '2';
  READ(FIn, Ch);
  WHILE NOT EOLN(FIn)
  DO
    BEGIN
      IF Switch = '2'
      THEN
        BEGIN
          WRITE(FOut2, Ch);
          Switch := '3';
          READ(FIn, Ch)
        END
      ELSE
        BEGIN
          WRITE(FOut3, Ch);
          Switch := '2';
          READ(FIn, Ch)
        END  
    END;
  IF Switch = '2'
  THEN
    BEGIN
      WRITELN(FOut2, Ch);
      WRITELN(FOut3)
    END
  ELSE
    BEGIN
      WRITELN(FOut3, Ch);
      WRITELN(FOut2)
    END
END;{Split}

PROCEDURE Merge(VAR FOut, FIn2, FIn3: TEXT);
VAR
  ChHold, Ch2, Ch3: CHAR;
BEGIN{Merge}
  RESET(FIn2);
  RESET(FIn3);
  REWRITE(FOut);
  READ(FIn2, Ch2);
  READ(FIn3, Ch3);
  WHILE (NOT EOLN(FIn2)) OR (NOT EOLN(FIn3)) 
  DO
    BEGIN
      WHILE (NOT EOLN(FIn2)) AND (NOT EOLN(FIn3))
      DO
        BEGIN
          IF Ch2 < Ch3
          THEN
            BEGIN
              WRITE(FOut, Ch2);
              READ(FIn2, Ch2)
            END
          ELSE
            BEGIN
              WRITE(FOut, Ch3);
              READ(FIn3, Ch3)
            END  
        END;
      IF (NOT EOLN(FIn2)) AND (EOLN(FIn3))
      THEN
        IF Ch2 <= Ch3
        THEN
          BEGIN
            WRITE(FOut, Ch2);
            READ(FIn2, Ch2)
          END
        ELSE
          BEGIN
            ChHold := Ch2;
            Ch2 := Ch3;
            Ch3 := ChHold 
          END;  
      IF (NOT EOLN(FIn3)) AND (EOLN(FIn2))
      THEN
        IF Ch3 <= Ch2
        THEN
          BEGIN
            WRITE(FOut, Ch3);
            READ(FIn3, Ch3)
          END 
        ELSE
          BEGIN
            ChHold := Ch2;
            Ch2 := Ch3;
            Ch3 := ChHold 
          END      
    END;
  IF Ch2 < Ch3
  THEN
    BEGIN
      WRITE(FOut, Ch2);
      WRITE(FOut, Ch3)
    END
  ELSE
    BEGIN
      WRITE(FOut, Ch3);
      WRITE(FOut, Ch2)
    END;                   
  WRITELN(FOut)            
END;{Merge}

PROCEDURE RecursiveSort(VAR FIn: TEXT);
VAR
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN{RecursiveSort}
  RESET(FIn);
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      READ(FIn, Ch);
      IF NOT EOLN(FIn)
      THEN
        BEGIN
          Split(FIn, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);    
          Merge(FIn, F2, F3)
        END  
    END  
END;{RecursiveSort}

BEGIN{RecursiveSortDriver}
  REWRITE(FileIn);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      WRITE(FileIn, Ch)
    END;
  WRITELN(FileIn);    
  RecursiveSort(FileIn); 
  RESET(FileIn);
  WHILE NOT EOLN(FileIn)
  DO
    BEGIN
      READ(FileIn, Ch);
      WRITE(OUTPUT, Ch)
    END;
  WRITELN(OUTPUT)  
END.{RecursiveSortDriver}
