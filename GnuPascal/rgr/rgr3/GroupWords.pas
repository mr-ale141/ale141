PROGRAM GroupWords(INPUT, OUTPUT);

USES UsesStemmer;

CONST
  NameFileIn = 'words.txt';
  NameFileOut = 'group.txt';
VAR
  Word, PreWord: STRING;
  Ch: CHAR;
  Count, CountSum: INTEGER;
  FIn, FOut: TEXT;
BEGIN {GroupWords}
  ASSIGN(FIn, NameFileIn);
  ASSIGN(FOut, NameFileOut);
  RESET(FIn);
  REWRITE(FOut);
  CountSum := 0;
  PreWord := '';
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      READ(FIn, Ch);
      Word := '';
      WHILE Ch <> ' '
      DO
        BEGIN
          Word := Word + Ch;
          READ(FIn, Ch)
        END;  
      READLN(FIn, Count);
      IF (GetBase(PreWord) = GetBase(Word))
      THEN
        BEGIN
          PreWord := Word;
          WRITE(FOut, ',', Word);
          CountSum := CountSum + Count
        END
      ELSE
        IF CountSum <> 0
        THEN
          BEGIN
            WRITELN(FOut, ': ', CountSum);
            CountSum := 0;
            PreWord := Word;
            WRITE(FOut, Word);
            CountSum := CountSum + Count
          END 
        ELSE
          BEGIN
            PreWord := Word;
            WRITE(FOut, Word);
            CountSum := CountSum + Count
          END
    END
END. {GroupWords}
