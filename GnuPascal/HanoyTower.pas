PROGRAM HanoyTower(INPUT, OUTPUT);
VAR
  Count1, Count2, Count3, N, OutPin, InPin, OneDigit: CHAR;
  
PROCEDURE IncCount;
BEGIN {IncCount}
  IF Count1 = '0' THEN Count1 := '1' ELSE
  IF Count1 = '1' THEN Count1 := '2' ELSE
  IF Count1 = '2' THEN Count1 := '3' ELSE
  IF Count1 = '3' THEN Count1 := '4' ELSE
  IF Count1 = '4' THEN Count1 := '5' ELSE
  IF Count1 = '5' THEN Count1 := '6' ELSE
  IF Count1 = '6' THEN Count1 := '7' ELSE
  IF Count1 = '7' THEN Count1 := '8' ELSE
  IF Count1 = '8' THEN Count1 := '9' ELSE
  IF Count1 = '9' 
  THEN
    BEGIN 
      Count1 := '0';
      IF Count2 = '0' THEN Count2 := '1' ELSE
      IF Count2 = '1' THEN Count2 := '2' ELSE
      IF Count2 = '2' THEN Count2 := '3' ELSE
      IF Count2 = '3' THEN Count2 := '4' ELSE
      IF Count2 = '4' THEN Count2 := '5' ELSE
      IF Count2 = '5' THEN Count2 := '6' ELSE
      IF Count2 = '6' THEN Count2 := '7' ELSE
      IF Count2 = '7' THEN Count2 := '8' ELSE
      IF Count2 = '8' THEN Count2 := '9' ELSE
      IF Count2 = '9'
      THEN
        BEGIN 
          Count2 := '0';
          IF Count3 = '0' THEN Count3 := '1' ELSE
          IF Count3 = '1' THEN Count3 := '2' ELSE
          IF Count3 = '2' THEN Count3 := '3' ELSE
          IF Count3 = '3' THEN Count3 := '4' ELSE
          IF Count3 = '4' THEN Count3 := '5' ELSE
          IF Count3 = '5' THEN Count3 := '6' ELSE
          IF Count3 = '6' THEN Count3 := '7' ELSE
          IF Count3 = '7' THEN Count3 := '8' ELSE
          IF Count3 = '8' THEN Count3 := '9' ELSE
          IF Count3 = '9'
          THEN
            BEGIN
              Count1 := '#';
              Count2 := '0';
              Count3 := '0';
              WRITELN('!!!!!!!!!!!!!!!!Overflow!!!!!!!!!!!!!!!!!!!!!!!!')
            END
        END    
    END  
END; {IncCount}

PROCEDURE DecVar(VAR Digit: CHAR);
BEGIN {DecVar}
  IF Digit = '9' THEN Digit := '8' ELSE
  IF Digit = '8' THEN Digit := '7' ELSE
  IF Digit = '7' THEN Digit := '6' ELSE
  IF Digit = '6' THEN Digit := '5' ELSE
  IF Digit = '5' THEN Digit := '4' ELSE
  IF Digit = '4' THEN Digit := '3' ELSE
  IF Digit = '3' THEN Digit := '2' ELSE
  IF Digit = '2' THEN Digit := '1' ELSE
  IF Digit = '1' THEN Digit := '0' ELSE
  IF Digit = '0'
  THEN
    WRITELN('!!!!!!!!!DEC ZERO!!!!!!!!!!!!!!!!!!!!!!!!')
END; {DecVar}

PROCEDURE DecVarCount(VAR Digit, DecCount: CHAR);
VAR
  Sub: CHAR;
BEGIN {DecVarCount}
  Sub := DecCount;
  WHILE Sub > '0'
  DO
    BEGIN
      DecVar(Digit);
      DecVar(Sub)
    END
END; {DecVarCount}

PROCEDURE MovOneStep(VAR N, OutPin, InPin: CHAR);
VAR
  HoldPin, NDecOne: CHAR;
BEGIN {MovOneStep}
  NDecOne := N;
  IF (NDecOne = '1') AND (Count1 <> '#')
  THEN
    BEGIN
      IncCount;
      WRITE('Step #', Count3, Count2, Count1);
      WRITELN(' (Mov disk from ', OutPin, '-pin to ', InPin, '-pin)')
    END
  ELSE
    IF NDecOne <> '0'
    THEN 
      BEGIN
        HoldPin := '6';
        DecVarCount(HoldPin, OutPin);
        DecVarCount(HoldPin, InPin);
        DecVar(NDecOne);
        MovOneStep(NDecOne, OutPin, HoldPin);
        MovOneStep(OneDigit, OutPin, InPin);
        MovOneStep(NDecOne, HoldPin, InPin)
      END
    ELSE
      WRITELN('!!!!!!!!!No disk to mov!!!!!!!!!!!');    
END; {MovOneStep}

BEGIN {HanoyTower}
  Count1 := '0';
  Count2 := '0';
  Count3 := '0';
  WRITELN('HanoyTower. Moving n disks from 1-pin to 3-pin');
  WRITE('(Max n = 9) n = ');
  READ(N);
  IF (NOT EOLN) OR ((N < '0') OR (N > '9'))
  THEN
    WRITELN('Incorrect data! N = 0..9')
  ELSE
    BEGIN 
      OutPin := '1';
      InPin := '3';
      OneDigit := '1';
      MovOneStep(N, OutPin, InPin);
      WRITELN('Done!')
    END   
END. {HanoyTower}
