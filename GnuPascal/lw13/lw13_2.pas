PROGRAM BigWord(INPUT, OUTPUT);
VAR
  Ansver, Ch: CHAR;
  Word1, Word2: TEXT;

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN {WHILE}
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2'
    END; {WHILE}   
  IF Result = '0'
  THEN
    IF NOT EOLN(F1)
    THEN
      Result := '2'
    ELSE
      IF NOT EOLN(F2)
      THEN
        Result := '1'   
END; {Lexico}

BEGIN {BigWord}
  REWRITE(Word1);
  REWRITE(Word2);
  READ(INPUT, Ch);
  WHILE Ch <> ' '
  DO
    BEGIN
      WRITE(Word1, Ch);
      READ(INPUT, Ch)
    END;
  WRITELN(Word1);
  READ(INPUT, Ch);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      WRITE(Word2, Ch);
      READ(INPUT, Ch)
    END;
  WRITELN(Word2, Ch);  
  Lexico(Word1, Word2, Ansver);
  WRITELN(Ansver)     
END. {BigWord}
