PROGRAM SortMonth(INPUT, OUTPUT);
USES DateIO;
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;
  
PROCEDURE InitWindow(VAR W1, W2, W3, W4: CHAR);
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' '
END;
{
PROCEDURE InitBooleanTrue(VAR Bool: BOOLEAN);
BEGIN
  Bool := TRUE
END;
 }
PROCEDURE InitBooleanFalse(VAR Bool: BOOLEAN);
BEGIN
  Bool := FALSE
END;

PROCEDURE MovWindow(VAR W1, W2, W3, W4: CHAR);
BEGIN
  W1 := W2;
  W2 := W3;
  W3 := W4;
  READ(W4)
END;

PROCEDURE CheckLooking(VAR Looking: BOOLEAN);
BEGIN
  Looking := NOT EOLN(INPUT)
END;

PROCEDURE CheckLand(VAR Land: BOOLEAN);
BEGIN
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd')
END;

PROCEDURE CheckSea(VAR Sea: BOOLEAN);
BEGIN
  Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
END;

PROCEDURE WriteMsg(VAR Land, Sea: BOOLEAN);
BEGIN
  IF Land
  THEN
    WRITELN('The British are coming by land')
  ELSE
    IF Sea
    THEN
      WRITELN('The British are coming by sea')
    ELSE
      WRITELN('Sarah didn''t say')
END;
  
BEGIN {SarahRevere}
  InitWindow(W1, W2, W3, W4);
  CheckLooking(Looking);
  InitBooleanFalse(Land);
  InitBooleanFalse(Sea);  
  WHILE Looking AND NOT (Land OR Sea)
  DO
    BEGIN
      MovWindow(W1, W2, W3, W4);
      CheckLooking(Looking);
      CheckLand(Land);
      CheckSea(Sea)
    END;
  WriteMsg(Land, Sea)      
END.{SarahRevere}


