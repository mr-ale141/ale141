PROGRAM CountWords(INPUT, OUTPUT);

USES UsesWord; {CP1251}
USES UsesStorage;

CONST
  NameFileIn = 'waw.txt';
  NameFileStorage = 'storage.txt';
  
VAR
  FIn: TEXT;     
  Word: STRING;
  
BEGIN {CountWords}
  ASSIGN(FIn, NameFileIn);
  {$I-}
  RESET(FIn);
  {$I+}
  IF IOresult<>0 
  THEN
    WRITELN('ERROR! File ''', NameFileIn, ''' not found!')
  ELSE
    BEGIN   
      WRITELN(OUTPUT, 'I''m doing ');
      InitStorage(NameFileStorage);
      WHILE NOT EOF(FIn)
      DO
        BEGIN 
          Word := GetWord(FIn);
          IF Word <> ''
          THEN
            InsertInStorage(StrToSmall(Word))
        END;
      CloseStorage();  
      WRITELN(OUTPUT, 'Done!')
    END       
END. {CountWords}
