PROGRAM RecursiveSortDriver(INPUT, OUTPUT);
VAR
  FileIn: TEXT;
  Ch: CHAR;
  
PROCEDURE Split(VAR F1, F2, F3: TEXT);
VAR
  Ch, Switch: CHAR;
BEGIN{Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  Switch := '2';
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          IF Switch = '2'
          THEN
            BEGIN
              WRITE(F2, Ch);
              Switch := '3';
              READ(F1, Ch)
            END
          ELSE
            BEGIN
              WRITE(F3, Ch);
              Switch := '2';
              READ(F1, Ch)
            END  
        END;
      IF Switch = '2'
      THEN
        BEGIN
          WRITELN(F2, Ch);
          WRITELN(F3)
        END
      ELSE
        BEGIN
          WRITELN(F3, Ch);
          WRITELN(F2)
        END
    END         
  ELSE
    BEGIN
      WRITELN(F2);
      WRITELN(F3)
    END
END;{Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR
  Ch2, Ch3: CHAR;
BEGIN{Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  IF (NOT EOLN(F2)) AND (NOT EOLN(F3))
  THEN
    BEGIN
      READ(F2, Ch2);
      READ(F3, Ch3);
      WHILE (NOT EOLN(F2)) AND (NOT EOLN(F3))
      DO
        BEGIN
          IF Ch2 < Ch3
          THEN
            BEGIN
              WRITE(F1, Ch2);
              READ(F2, Ch2)
            END
          ELSE
            BEGIN
              WRITE(F1, Ch3);
              READ(F3, Ch3)
            END  
        END;
      IF Ch2 <= Ch3
      THEN
        BEGIN
          WRITE(F1, Ch2);
          WRITE(F1, Ch3)
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          WRITE(F1, Ch2)
        END;
    END; 
  WHILE NOT EOLN(F2)
  DO
    BEGIN
      READ(F2, Ch2);
      WRITE(F1, Ch2)
    END;
  WHILE NOT EOLN(F3)
  DO  
    BEGIN
      READ(F3, Ch3);
      WRITE(F1, Ch3)
    END;
  WRITELN(F1)            
END;{Merge}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN{RecursiveSort}
  RESET(F1);
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);    
          Merge(F1, F2, F3)
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
