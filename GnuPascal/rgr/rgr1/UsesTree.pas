UNIT UsesTree;

INTERFACE
USES UsesWord;

  CONST
    MaxLenTree = 10;    
    
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
      WriteElt(FOut, Ptr^.Right);
      DISPOSE(Ptr)
    END
END;  {PrintTree}

PROCEDURE WriteTree(VAR FOut: TEXT);
BEGIN {WriteTree}
  WriteElt(FOut, Root);
  Root := NIL
END; {WriteTree}

BEGIN
END.
