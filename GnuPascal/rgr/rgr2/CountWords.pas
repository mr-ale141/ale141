PROGRAM CountWords(INPUT, OUTPUT);

USES UsesWord; {CP1251}
USES UsesStorage;

CONST
  NameFileIn = 'waw.txt';
  NameFileOut = 'words.txt';
  
VAR
  FIn, FOut: TEXT;
  Count: INTEGER;
  Word: STRING;
  
PROCEDURE ClearScr();
VAR
  I, J: INTEGER;
BEGIN {ClearScr}
  FOR I := 0 TO 44
  DO
    WRITELN
END; {ClearScr}       

BEGIN {CountWords}
  ClearScr();
  ASSIGN(FIn, NameFileIn);
  ASSIGN(FOut, NameFileOut);
  RESET(FIn);
  REWRITE(FOut);
  WRITE(OUTPUT, 'I''m doing ');
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
      WriteTree(FOut);
      WRITE('.')
    END;                            
  WRITELN(OUTPUT);
  WRITE(OUTPUT, 'Done!');      
END. {CountWords}
