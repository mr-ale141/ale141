UNIT UsesTree;

INTERFACE

  PROCEDURE InitTree();                   {инициализация пустого дерева}
  PROCEDURE InsertInTree(WordIn: STRING); {добавить слово в дерево возвращает кол-во элементов в дереве}
  PROCEDURE WriteTree(VAR FOut: TEXT);    {слияние дерева в файлом}
  
IMPLEMENTATION

CONST
  NameFileBufer = 'bufer.txt';
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
   
FUNCTION WhoIsSmaller(W1, W2: STRING): INTEGER;
VAR
  Index1, Index2: INTEGER;
  Answer: INTEGER;
BEGIN {IsSmaller}
  Index1 := 1;
  Index2 := 1;
  Answer := 0;
  WHILE ((Index1 <= Length(W1)) AND (Index2 <= Length(W2))) AND (Answer = 0)
  DO
    BEGIN {WHILE}
      IF (W1[Index1] < W2[Index2])
      THEN {Ch1 < Ch2 или F1 короче F2}
        Answer := 1
      ELSE
        IF (W1[Index2] > W2[Index1])
        THEN {Ch1 > Ch2 или F2 короче F1}
          Answer := 2;
      Index1 := Index1 + 1;
      Index2 := Index2 + 1        
    END; {WHILE}   
  IF Answer = 0
  THEN
    IF Index1 <= Length(W1)
    THEN
      Answer := 2
    ELSE
      IF Index2 <= Length(W2)
      THEN
        Answer := 1;             
  WhoIsSmaller := Answer        
END; {IsSmaller} 

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
    IF WhoIsSmaller(Ptr^.Word, WordIn) = 2
    THEN
      Insert(Ptr^.Left, WordIn)
    ELSE
      IF WhoIsSmaller(Ptr^.Word, WordIn) = 1
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
      IF (WhoIsSmaller(WordBuf, Ptr^.Word) = 2)
      THEN
        BEGIN
          WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);       
          DISPOSE(Ptr);
          Ptr := NIL
        END
      ELSE
        IF WhoIsSmaller(WordBuf, Ptr^.Word) = 1
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
          IF (WhoIsSmaller(WordBuf, Ptr^.Word) = 2)
          THEN
            BEGIN
              WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);
              DISPOSE(Ptr);
              Ptr := NIL
            END
          ELSE
            IF WhoIsSmaller(WordBuf, Ptr^.Word) = 1
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
