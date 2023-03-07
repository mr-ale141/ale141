PROGRAM Sum(INPUT, OUTPUT);
VAR
  Num, P: INTEGER;  

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
  Result := 0;
  Digit := 0;
  P := 0;
  WHILE (NOT EOLN(INPUT)) AND (Digit >= 0)
  DO
    BEGIN
      ReadDigit(INPUT, Digit);
      P := MAXINT - Result * 10;
      writeln(Result * 10);
      IF (Digit >= 0) AND (Digit > P)
      THEN
        BEGIN
          Digit := -1;
          Result := -2;
        END;
      IF Digit >= 0
      THEN
        Result := Result * 10 + Digit
    END;
  IF Result = 0
  THEN
    Result := -1
END; {ReadNumber}

BEGIN {ReadDigitDriver}
  WRITELN(MAXINT);  //2147483647
  ReadNumber(INPUT, Num); 
  WRITELN('Number = ', Num)  
END. {ReadDigitDriver}
