PROGRAM CountWords(INPUT, OUTPUT);

USES UsesWord; {CP1251}
USES UsesTree; {MaxLenTree = 1000}

CONST
  NameFileIn = 'waw.txt';
  NameFileOut = 'words.txt';
VAR
  FIn, FOut: TEXT;
  I: INTEGER;
     
BEGIN {CountWords}
  ASSIGN(FIn, NameFileIn);
  ASSIGN(FOut, NameFileOut);
  RESET(FIn);
  InitTree();
  I := 0;
  WHILE (I <= MaxLenTree) AND NOT EOF(FIn) 
  DO
    I := InsertInTree(StrToSmall(GetWord(FIn)));
  REWRITE(Fout);
  WriteTree(FOut)
END. {CountWords}
