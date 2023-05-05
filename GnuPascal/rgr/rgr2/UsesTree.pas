UNIT UsesStorage;

INTERFACE
USES UsesWord;
  
  PROCEDURE InitStorage();                   {инициализация пустого дерева}
  PROCEDURE InsertInStorage(WordIn: STRING); {добавить слово в дерево возвращает кол-во элементов в дереве}
  PROCEDURE WriteStorage(VAR FOut: TEXT);    {слияние дерева в файлом}
  
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

PROCEDURE InitTree();
BEGIN {InitTree}
  Root := NIL
END; {InitTree} 

PROCEDURE Insert(VAR Ptr: Tree; WordIn: STRING);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {Создать лист со значением Data}
      NEW(Ptr);      
      Ptr^.Word := WordIn;     
      Ptr^.Count := 1;
      Ptr^.Left := NIL;
      Ptr^.Right := NIL
    END
  ELSE
    IF GetLess(Ptr^.Word, WordIn) = 2
    THEN
      Insert(Ptr^.Left, WordIn)
    ELSE
      IF GetLess(Ptr^.Word, WordIn) = 1
      THEN
        Insert(Ptr^.Right, WordIn)
      ELSE
        Ptr^.Count := Ptr^.Count + 1  
END;  {Insert}

PROCEDURE InsertInTree(WordIn: STRING);
BEGIN {InsertInTree}
  Insert(Root, WordIn)    
END;  {InsertInTree}

PROCEDURE WriteElt(VAR FOut: TEXT; Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      WriteElt(FOut, Ptr^.Left);     
      WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);
      WriteElt(FOut, Ptr^.Right);
      DISPOSE(Ptr)
    END
END;  {PrintTree}

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
  PopSmallElt := Ptr      
END;

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
        BEGIN
          WordBuf := ReadWord(FBufer);
          READLN(FBufer, CountBuf)
        END;
      IF Ptr = NIL
      THEN  
        Ptr := PopSmallElt(Root);       
      IF (GetLess(WordBuf, Ptr^.Word) = 2)
      THEN
        BEGIN
          WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);       
          DISPOSE(Ptr);
          Ptr := NIL
        END
      ELSE
        IF GetLess(WordBuf, Ptr^.Word) = 1
        THEN
          BEGIN 
            WRITELN(FOut, WordBuf, ' ', CountBuf);         
            WordBuf := '';
            CountBuf := 0
          END
        ELSE
          BEGIN  
            WRITELN(FOut, WordBuf, ' ', CountBuf + Ptr^.Count);             
            DISPOSE(Ptr);
            Ptr := NIL;
            WordBuf := '';
            CountBuf := 0
          END;         
    END;     
  WHILE (NOT EOF(FBufer)) OR (Root <> NIL)
  DO
    BEGIN             
      IF (WordBuf = '') AND (NOT EOF(FBufer))
      THEN
        BEGIN
          WordBuf := ReadWord(FBufer);
          READLN(FBufer, CountBuf)
        END;
      IF (Ptr = NIL) AND (Root <> NIL)
      THEN
        Ptr := PopSmallElt(Root);        
      IF (Ptr <> NIL) AND (WordBuf <> '')
      THEN
        BEGIN               
          IF (GetLess(WordBuf, Ptr^.Word) = 2)
          THEN
            BEGIN
              WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);
              DISPOSE(Ptr);
              Ptr := NIL
            END
          ELSE
            IF GetLess(WordBuf, Ptr^.Word) = 1
            THEN
              BEGIN 
                WRITELN(FOut, WordBuf, ' ', CountBuf);
                WordBuf := '';
                CountBuf := 0
              END
            ELSE
              BEGIN  
                WRITELN(FOut, WordBuf, ' ', CountBuf + Ptr^.Count);
                DISPOSE(Ptr);
                Ptr := NIL;
                WordBuf := '';
                CountBuf := 0
              END
        END
      ELSE    
        IF WordBuf <> '' 
        THEN
          BEGIN
            WRITELN(FOut, WordBuf, ' ', CountBuf);          
            WordBuf := '';
            CountBuf := 0
          END
        ELSE
          IF Ptr <> NIL 
          THEN
            BEGIN
              WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);    
              DISPOSE(Ptr);
              Ptr := NIL
            END                      
    END;
    IF WordBuf <> '' 
    THEN
      BEGIN
        WRITELN(FOut, WordBuf, ' ', CountBuf);          
        WordBuf := '';
        CountBuf := 0
      END
    ELSE
      IF Ptr <> NIL 
      THEN
        BEGIN
          WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);    
          DISPOSE(Ptr);
          Ptr := NIL
        END
END; {MergeTreeAndFile}

PROCEDURE WriteTree(VAR FOut: TEXT);
VAR
  FBufer: TEXT;
BEGIN {WriteTree}
  RESET(Fout);
  IF EOF(FOut)
  THEN
    BEGIN
      REWRITE(Fout);
      WriteElt(FOut, Root)
    END
  ELSE
    BEGIN  
      ASSIGN(FBufer, NameFileBufer);
      REWRITE(FBufer);
      CopyFile(FBufer, FOut);
      RESET(FBufer);
      REWRITE(FOut);
      MergeTreeAndFile(FOut, FBufer);
      CLOSE(FBufer);
      ERASE(FBufer) 
    END   
END; {WriteTree}

BEGIN
END.
