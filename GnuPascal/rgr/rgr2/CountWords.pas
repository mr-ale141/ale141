PROGRAM CountWords(INPUT, OUTPUT);

USES UsesWord; {CP1251}
USES UsesTree; {MaxLenTree = 1000}

CONST
  NameFileIn = 'waw.txt';
  NameFileOut = 'words.txt';
  MaxLenTree = 1000;
  
VAR
  FIn, FOut: TEXT;
  Count: INTEGER;
  Word: STRING;     

BEGIN {CountWords}
  ASSIGN(FIn, NameFileIn);
  ASSIGN(FOut, NameFileOut);
  RESET(FIn);
  REWRITE(FOut);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      InitTree();
      Count := 0;
      WHILE (Count <= MaxLenTree) AND NOT EOF(FIn) 
      DO
        BEGIN
          Word := GetWord(FIn);
          IF Word <> ''
          THEN
            InsertInTree(StrToSmall(Word));
          Count := Count + 1
        END;     
      WriteTree(FOut)
    END    
END. {CountWords}
