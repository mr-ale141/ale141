UNIT UsesTree;

INTERFACE

  CONST
    MaxLenTree = 1000;    
    
  PROCEDURE InitTree();                           {инициализация пустого дерева}
  FUNCTION InsertInTree(WordIn: STRING): INTEGER; {добавить слово в дерево возвращает кол-во элементов в дереве}
  PROCEDURE WriteTree(VAR FOut: TEXT);            {запись дерева в файл}
  
IMPLEMENTATION

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
  Root := NIL;
  LenTree := 0
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
      Ptr^.Right := NIL;
      LenTree := LenTree + 1
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

FUNCTION InsertInTree(WordIn: STRING): INTEGER;
BEGIN {InsertInTree}
  Insert(Root, WordIn);
  InsertInTree := LenTree    
END;  {InsertInTree}

PROCEDURE WriteElt(VAR FOut: TEXT; Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      WriteElt(FOut, Ptr^.Left);
      WRITELN(FOut, Ptr^.Word, ' ', Ptr^.Count);
      WriteElt(FOut, Ptr^.Right)
    END
END;  {PrintTree}

PROCEDURE WriteTree(VAR FOut: TEXT);
BEGIN {WriteTree}
  WriteElt(FOut, Root)
END; {WriteTree}

BEGIN
END.
