PROGRAM Stat(INPUT, OUTPUT);
VAR
  Num, Sum, Count, Min, Max, AverageInt, AverageFloat: INTEGER;  

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
  Num := 0;
  Sum := 0;
  Count := 0;
  Min := MAXINT;
  Max := 0;
  AverageInt := 0;
  AverageFloat := 0;
  WHILE NOT EOLN(INPUT) AND (Num >= 0)
  DO
    BEGIN
      ReadNumber(INPUT, Num);
      IF Num = -2
      THEN
        WRITELN('ERROR! Oferflow integer (Num).')
      ELSE
        IF Num = -1
        THEN
          BEGIN
            WRITELN('WARNING! Incorrect input data.');
            Num := 0
          END  
        ELSE
          BEGIN
            IF Count < MAXINT
            THEN
              BEGIN
                Count := Count + 1;
                IF Min > Num
                THEN
                  Min := Num;
                IF Max < Num
                THEN
                  Max := Num;    
                SumInt(Sum, Num)
              END
            ELSE
              BEGIN
                WRITELN('ERROR! Oferflow integer (Count).');
                Num := -2
              END  
          END;
      IF Sum = -2
      THEN
        BEGIN
          WRITELN('ERROR! Oferflow integer (Sum).');
          Num := -2
        END         
    END;
  IF (Count <> 0) AND (Sum >= 0)
  THEN
    BEGIN
      AverageInt := Sum DIV Count;
      AverageFloat := ((Sum MOD Count) * 100) DIV Count;
      IF AverageFloat MOD 10 = 0
      THEN
        AverageFloat := AverageFloat DIV 10;
      WRITELN('Count = ', Count);  
      WRITELN('Sum = ', Sum);
      WRITELN('Min = ', Min);
      WRITELN('Max = ', Max);
      WRITELN('Average = ', AverageInt, '.', AverageFloat);  
    END   
END. {Stat}
