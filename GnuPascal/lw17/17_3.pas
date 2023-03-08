PROGRAM Stat(INPUT, OUTPUT);
VAR
  Num, Sum, Count, Min, Max, AverageInt, AverageFloat, Average: INTEGER;  

PROCEDURE ReadDigit(VAR FIn: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  READ(FIn, Ch);
  IF Ch = '0' THEN D := 0 ELSE
  IF Ch = '1' THEN D := 1 ELSE
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9 
  ELSE
    D := -1  
END; {ReadDigit}

PROCEDURE ReadNumber(VAR FIn: TEXT; VAR Result: INTEGER);
VAR 
  Digit: INTEGER; 
BEGIN {ReadNumber}
  Result := -1;
  Digit := 0;
  WHILE (NOT EOLN(FIn)) AND (Digit >= 0)
  DO
    BEGIN
      ReadDigit(FIn, Digit);
      IF (Digit >=0) AND (Result = -1)
      THEN
        Result := 0;
      IF (Digit >= 0) AND (Result <> 0)
      THEN
        IF (MAXINT DIV Result) < 10
        THEN
          BEGIN
            Digit := -1;
            Result := -2
          END
        ELSE
          IF (MAXINT DIV Result) = 10
          THEN
            IF (MAXINT MOD 10) < Digit
            THEN  
              BEGIN
                Digit := -1;
                Result := -2
              END;
      IF Digit >= 0
      THEN
        Result := Result * 10 + Digit
    END
END; {ReadNumber}

PROCEDURE SumInt(VAR Sum, Num: INTEGER);
VAR
  Hold: INTEGER;
BEGIN {SumInt}
  Hold := MAXINT - Sum;
  IF Num > Hold
  THEN
    BEGIN
      Sum := -2
    END
  ELSE
    BEGIN
      Sum := Sum + Num
    END  
END; {SumInt}

BEGIN {Stat}
  WRITELN(MAXINT);
  Num := 0;
  Sum := 0;
  Count := 0;
  Min := 0;
  Max := 0;
  AverageInt := 0;
  AverageFloat := 0;
  Average := 0;
  WHILE NOT EOLN(INPUT) AND (Num >= 0)
  DO
    BEGIN
      ReadNumber(INPUT, Num);
      IF Num = -2
      THEN
        WRITELN('ERROR! Oferflow integer (Num)')
      ELSE
        IF Num = -1
        THEN
          WRITELN('ERROR! Incorrect data')
        ELSE
          BEGIN
            IF Count < MAXINT
            THEN
              Count := Count + 1
            ELSE
              BEGIN
                WRITELN('ERROR! Oferflow integer (Count)');
                Sum := -2
              END  
          END     
    END;
  WRITELN('Sum = ', Sum)   
END. {Stat}
