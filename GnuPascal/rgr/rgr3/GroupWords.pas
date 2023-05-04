PROGRAM GroupWords(INPUT, OUTPUT);

USES UsesStemmer;

VAR
  Word: STRING;
  Ch: CHAR;
  Count: INTEGER;
BEGIN {GroupWords}
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      Word := '';
      WHILE Ch <> ' '
      DO
        BEGIN
          Word := Word + Ch;
          READ(INPUT, Ch)
        END;
      READLN(INPUT, Count);
      WRITELN(GetBase(Word), ' ', Count)
    END
END. {GroupWords}
