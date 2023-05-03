UNIT UsesStemmer;

INTERFACE
  
  FUNCTION SubGerund(Word: STRING): STRING;
  FUNCTION GetRV(Word: STRING): STRING;
  FUNCTION GetR2(Word: STRING): STRING;
  FUNCTION GetR1(Word: STRING): STRING;
  
IMPLEMENTATION

TYPE
  SetChar = SET OF CHAR;
  ArrString = ARRAY [1 .. 36] OF STRING;

CONST
  VOWELS: SetChar = ['�', '�', '�', '�', '�', '�', '�', '�', '�', '�'];
  GERUND_1: ArrString = ('�', '���', '�����');
  GERUND_2: ArrString = ('��', '����', '������', '��', '����', '������');
  ADJECTIVE: ArrString = ('��', '��', '��', '��', '���', '���', '��', '��', '��', '��', 
               '��', '��', '��', '��', '���', '���', '���', '���', '��', 
               '��', '��', '��', '��', '��', '��', '��');
  PARTICIPLE_1: ArrString = ('��', '��', '��', '��', '�');
  PARTICIPLE_2: ArrString = ('���', '���', '���');
  REFLEXIVE: ArrString = ('��', '��');
  VERB_1: ArrString = ('��', '��', '���', '���', '��', '�', '�', '��', '�', '��', '��',
            '��', '��', '��', '��', '���', '���');
  VERB_2: ArrString = ('���', '���', '���', '����', '����', '���', '���', '���', '��', 
            '��', '��', '��', '��', '��', '��', '���', '���', '���', '��', 
            '���', '���', '��', '��', '���', '���', '���', '���', '��', '�');          
  NOUN: ArrString = ('�', '��', '��', '��', '��', '�', '����', '���', '���', '��', '��', 
          '�', '���', '��', '��', '��', '�', '���', '��', '���', '��', '��', 
          '��', '�', '�', '��', '���', '��', '�', '�', '��', '��', '�', '��',
          '��', '�');
  SUPERLATIVE: ArrString = ('���', '����');
  DERIVATIONAL: ArrString = ('���', '����');
  
FUNCTION SubGerund(Word: STRING): STRING;
VAR
  I, Position: INTEGER;
  WordRV, SubStr: STRING;
  Found: BOOLEAN;
BEGIN {SubGerund}    
  WordRV := GetRv(Word);
  SubStr := '';
  Found := FALSE;
  FOR I := Low(GERUND_1) TO High(GERUND_1)
  DO
    BEGIN
      Position := Pos(GERUND_1[I], WordRV);
      IF Position = Length(WordRV) - Length(SubStr) + 1
      THEN
        IF (WordRV[Position] = '�') OR (WordRV[Position] = '�')
        THEN
          IF Length(GERUND_1[I]) > Length(SubStr)
          THEN
            BEGIN
              Found := TRUE;
              SubStr := GERUND_1[I]
            END
    END;
  IF Found = TRUE
  THEN
    Delete(WordRV, Length(WordRV) - Length(SubStr) + 1, Length(SubStr));
  SubGerund := WordRV  
END; {SubGerund}                               
  
FUNCTION GetRV(Word: STRING): STRING;
VAR
  I: INTEGER;
  WordRV: STRING;
  FoundVowels: BOOLEAN;
BEGIN {GetRV}
  WordRV := '';
  FoundVowels := FALSE;
  FOR I := 1 TO Length(Word)
  DO
    BEGIN
      IF FoundVowels = FALSE
      THEN
        FoundVowels := Word[I] IN VOWELS
      ELSE
        WordRV := WordRV + Word[I]
    END;
  GetRV := WordRV;  
END; {GetRV}

FUNCTION GetR1(Word: STRING): STRING;
VAR
  I: INTEGER;
  WordR1, WordRV: STRING;
  Found, Before: BOOLEAN;
BEGIN {GetR1}
  WordR1 := '';
  WordRV := GetRV(Word);
  Found := FALSE;
  Before := FALSE;
  FOR I := 1 TO Length(WordRV)
  DO
    BEGIN
      IF Found = FALSE
      THEN
        IF (Before = TRUE) AND (WordRV[I] IN VOWELS)
        THEN
          BEGIN
            Found := TRUE;
            WordR1 := WordR1 + WordRV[I] 
          END
        ELSE
          Before := NOT (WordRV[I] IN VOWELS)
      ELSE 
        WordR1 := WordR1 + WordRV[I]  
    END;
  GetR1 := WordR1; 
END; {GetR1}

FUNCTION GetR2(Word: STRING): STRING;
VAR
  I: INTEGER;
  WordR1, WordR2: STRING;
  Found, Before: BOOLEAN;
BEGIN {GetR2}
  WordR2 := '';
  WordR1 := GetR1(Word);
  Found := FALSE;
  Before := FALSE;
  FOR I := 1 TO Length(WordR1)
  DO
    BEGIN
      IF Found = FALSE
      THEN
        IF (Before = TRUE) AND (WordR1[I] IN VOWELS)
        THEN
          BEGIN
            Found := TRUE;
            WordR2 := WordR2 + WordR1[I] 
          END
        ELSE
          Before := NOT (WordR1[I] IN VOWELS)
      ELSE 
        WordR2 := WordR2 + WordR1[I]  
    END;
  GetR2 := WordR2;
END; {GetR2}

BEGIN
END.
   
