PROGRAM Sum(INPUT, OUTPUT);
VAR
  Num: INTEGER;  

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

PROCEDURE ReadNumber(VAR FIn: TEXT; VAR NumRet: INTEGER);
VAR 
  Digit: INTEGER; 
BEGIN {ReadNumber}
  NumRet := -1;
  Digit := 0;
  WHILE (NOT EOLN(FIn)) AND (Digit >= 0)
  DO
    BEGIN
      ReadDigit(FIn, Digit);
      IF (Digit >= 0) AND (NumRet = -1)
      THEN
        NumRet := 0;
      IF (NumRet <= (MAXINT - Digit) DIV 10)
      THEN
        NumRet := NumRet * 10 + Digit
      ELSE
         BEGIN
           Digit := -1;
           NumRet := -2
         END
    END                
END; {ReadNumber}

BEGIN {ReadDigitDriver}
  WRITELN('Maxint = ', MAXINT);  //2147483647
  ReadNumber(INPUT, Num); 
  WRITELN('Number = ', Num)  
END. {ReadDigitDriver}
