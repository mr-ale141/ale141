PROGRAM CountWords(INPUT, OUTPUT);

USES UsesWord; {CP1251}
USES UsesTree; {MaxLenTree = 1000}

CONST
  NameFileIn = 'waw.txt';
  NameFileOut = 'words.txt';
VAR
  FIn, FOut: TEXT;
  I: INTEGER;
  Word: STRING;    
BEGIN {CountWords}
  ASSIGN(FIn, NameFileIn);
  ASSIGN(FOut, NameFileOut);
  RESET(FIn);
  InitTree();  
  I := 1;
  WHILE (I < MaxLenTree) AND NOT EOF(FIn) 
  DO
    BEGIN
      Word := GetWord(FIn);
      IF Word <> ''
      THEN
        I := InsertInTree(StrToSmall(Word))
    END;      
  REWRITE(Fout);
  WriteTree(Fout)
END. {CountWords}
