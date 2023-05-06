UNIT UsesStorage;

INTERFACE
USES UsesWord;
  
  PROCEDURE InitStorage(NameFileStorage: STRING);  {инициализация, принимает имя файла хранилища}
  PROCEDURE InsertInStorage(WordIn: STRING);       {добавить слово в хранилище}
  PROCEDURE CloseStorage();                        {сохранения дерева в файл и закрытие хранилища}
  
IMPLEMENTATION

CONST
  NameFileBufer = 'bufer.txt';
  MaxLenTree = 1000;
TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;
           Count: INTEGER;
           Left, Right: Tree
         END;
VAR
  Root: Tree;
  LenTree: INTEGER;
  FBufer, FStorage: TEXT;
    
PROCEDURE CopyFile(VAR FOut, FIn: TEXT);
VAR
  Str: STRING;
BEGIN {CopyFile}
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      READLN(FIn, Str);
      WRITELN(FOut, Str)
    END
END; {CopyFile}      

PROCEDURE InsertElt(VAR Ptr: Tree; WordIn: STRING);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {Создать лист со значением Data}
      NEW(Ptr);          
      Ptr^.Word := WordIn;     
      Ptr^.Count := 1;
      Ptr^.Left := NIL;
      Ptr^.Right := NIL;
      LenTree := LenTree + 1
    END
  ELSE
    IF GetLess(Ptr^.Word, WordIn) = 2
    THEN
      InsertElt(Ptr^.Left, WordIn)
    ELSE
      IF GetLess(Ptr^.Word, WordIn) = 1
      THEN
        InsertElt(Ptr^.Right, WordIn)
      ELSE
        Ptr^.Count := Ptr^.Count + 1  
END;  {Insert}

PROCEDURE WriteTreeInFile(VAR FOut: TEXT; Ptr: Tree);
BEGIN {WriteTreeInFile}
  IF Ptr <> NIL
  THEN  
    BEGIN
      WriteTreeInFile(FOut, Ptr^.Left);     
      WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);
      LenTree := LenTree - 1;
      WriteTreeInFile(FOut, Ptr^.Right);
      DISPOSE(Ptr);
      Ptr := NIL     
    END
END;  {WriteTreeInFile}

FUNCTION ReadWord(VAR F: TEXT): STRING;
VAR
  Word: STRING;
  Ch: CHAR;
BEGIN {ReadWord}
  Word := '';
  IF NOT EOF(F)
  THEN
    BEGIN
      READ(F, Ch);
      WHILE (Ch <> ' ')
      DO
        BEGIN
          Word := Word + Ch;
          READ(F, Ch) 
        END
    END;    
  ReadWord := Word  
END; {ReadWord}

FUNCTION PopSmallElt(Ptr: Tree): Tree;
VAR
  ParentElt: Tree;
BEGIN
  ParentElt := NIL;
  WHILE Ptr^.Left <> NIL
  DO
    BEGIN
      ParentElt := Ptr;
      Ptr := Ptr^.Left
    END;
  IF ParentElt <> NIL
  THEN
    ParentElt^.Left := Ptr^.Right
  ELSE
    Root := Ptr^.Right;
  IF Ptr <> NIL
  THEN  
    LenTree := LenTree - 1;          
  PopSmallElt := Ptr      
END;

PROCEDURE WritePtr(VAR F: TEXT; VAR Ptr: Tree);
BEGIN {WritePtr}
  WRITELN(F, Ptr^.Word, ' ', Ptr^.Count);       
  DISPOSE(Ptr);
  Ptr := NIL
END; {WritePtr}

PROCEDURE WriteWordDigit(VAR F: TEXT; VAR Word: STRING; VAR Count: INTEGER);
BEGIN {WriteWordDigit}
  WRITELN(F, Word, ' ', Count);         
  Word := '';
  Count := 0
END; {WriteWordDigit}

PROCEDURE WriteAll(VAR F: TEXT; VAR Word: STRING; VAR Count: INTEGER;  VAR Ptr: Tree);
BEGIN {WriteAll}
  WRITELN(F, Word, ' ', Count + Ptr^.Count);             
  DISPOSE(Ptr);
  Ptr := NIL;
  Word := '';
  Count := 0
END; {WriteAll}

PROCEDURE WriteLast(VAR F: TEXT; VAR Word: STRING; VAR Count: INTEGER; VAR Ptr: Tree);
BEGIN {WriteLast}
  IF Word <> '' 
  THEN
    WriteWordDigit(F, Word, Count)
  ELSE
    IF Ptr <> NIL 
    THEN
      WritePtr(F, Ptr)
END; {WriteLast}

FUNCTION ReadLine(VAR F: TEXT; VAR Count: INTEGER): STRING;
BEGIN {ReadLine}
  ReadLine := ReadWord(F);
  READLN(F, Count) 
END; {ReadLine}

PROCEDURE WriteLess(VAR F: TEXT; VAR Word: STRING; VAR Count: INTEGER; VAR Ptr: Tree);
VAR
  Less: INTEGER;
BEGIN {WriteLess}
  Less := GetLess(Word, Ptr^.Word);
  IF Less = 2
      THEN
        WritePtr(F, Ptr)
      ELSE
        IF Less = 1
        THEN
          WriteWordDigit(F, Word, Count)
        ELSE
          WriteAll(F, Word, Count, Ptr)
END; {WriteLess}

PROCEDURE MergeTreeAndFile(VAR FOut, FBufer: TEXT);
VAR
  WordBuf: STRING;
  CountBuf: INTEGER;
  Ptr: Tree;
BEGIN {MergeTreeAndFile}
  Ptr:= NIL;
  WordBuf := '';
  CountBuf := 0; 
  WHILE (NOT EOF(FBufer)) AND (Root <> NIL)
  DO
    BEGIN
      IF WordBuf = ''
      THEN
        WordBuf := ReadLine(FBufer, CountBuf);
      IF Ptr = NIL
      THEN  
        Ptr := PopSmallElt(Root);       
      WriteLess(FOut, WordBuf, CountBuf, Ptr)         
    END;     
  WHILE (NOT EOF(FBufer)) OR (Root <> NIL)
  DO
    BEGIN             
      IF (WordBuf = '') AND (NOT EOF(FBufer))
      THEN
        WordBuf := ReadLine(FBufer, CountBuf);
      IF (Ptr = NIL) AND (Root <> NIL)
      THEN
        Ptr := PopSmallElt(Root);        
      IF (Ptr <> NIL) AND (WordBuf <> '')
      THEN
        WriteLess(FOut, WordBuf, CountBuf, Ptr)
      ELSE    
        WriteLast(FOut, WordBuf, CountBuf, Ptr)                      
    END;
  WriteLast(FOut, WordBuf, CountBuf, Ptr)
END; {MergeTreeAndFile}

PROCEDURE WriteStorage();
VAR
  FBufer: TEXT;
BEGIN {WriteTree}
  ASSIGN(FBufer, NameFileBufer);
  REWRITE(FBufer);
  RESET(FStorage);
  CopyFile(FBufer, FStorage);
  RESET(FBufer);
  REWRITE(FStorage);
  IF EOF(FBufer)
  THEN
    BEGIN
      WriteTreeInFile(FStorage, Root);
      Root := NIL
    END
  ELSE 
    MergeTreeAndFile(FStorage, FBufer);   
  CLOSE(FBufer);
  ERASE(FBufer)     
END; {WriteTree}

PROCEDURE InsertInStorage(WordIn: STRING);
BEGIN {InsertInTree} 
  IF LenTree < MaxLenTree
  THEN      
    InsertElt(Root, WordIn)
  ELSE
    BEGIN   
      WriteStorage(); 
      InsertElt(Root, WordIn)     
    END
END;  {InsertInTree}

PROCEDURE InitStorage(NameFileStorage: STRING);
BEGIN {InitStorage}
  ASSIGN(FStorage, NameFileStorage);
  {$I-}
  RESET(FStorage);
  {$I+}
  IF IOresult<>0 
  THEN
    REWRITE(FStorage); 
  Root := NIL;
  LenTree := 0
END; {InitStorage} 

PROCEDURE CloseStorage();
BEGIN {CloseStorage}
  WriteStorage();
  CLOSE(FStorage);
END; {CloseStorage}

BEGIN {UsesStorage}  
END. {UsesStorage}







