UNIT UsesStemmer;

INTERFACE
  
  FUNCTION GetBase(Word: STRING): STRING;
  
IMPLEMENTATION

TYPE
  SetChar = SET OF CHAR;
  ArrString = ARRAY [1 .. 40] OF STRING;

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
  
FUNCTION CheckLastStr(Word: STRING; LastStr: ArrString): STRING;
VAR
  I: INTEGER;
  SubStr, PreSubStr: STRING;
BEGIN {CheckLastStr}
  SubStr := '';
  PreSubStr := '';
  I := 1;
  WHILE Length(LastStr[I]) <> 0
  DO
    BEGIN
      SubStr := Copy(Word, Length(Word) - Length(LastStr[I]) + 1, Length(LastStr[I]));
      IF (SubStr = LastStr[I]) AND (Length(SubStr) > Length(PreSubStr))
      THEN
        PreSubStr := SubStr;
      SubStr := '';   
      I := I + 1      
    END;
  CheckLastStr := PreSubStr 
END; {CheckLastStr}

FUNCTION GetAdjective(WordRV: STRING): STRING;
VAR
  SubStr: STRING;
BEGIN {SubAdjective}
  GetAdjective := CheckLastStr(WordRV, ADJECTIVE)
END; {SubAdjective}

FUNCTION GetReflexive(WordRV: STRING): STRING;
VAR
  SubStr: STRING;
BEGIN {SubGerund}
  GetReflexive := CheckLastStr(WordRV, REFLEXIVE)
END; {SubGerund} 

FUNCTION GetVerb(WordRV: STRING): STRING;
VAR
  SubStr, Str: STRING;
BEGIN {SubGerund}
  SubStr := CheckLastStr(WordRV, VERB_1);
  IF (SubStr <> '') AND ((WordRV[Length(WordRV) - Length(SubStr)] = '�') 
                          OR ((WordRV[Length(WordRV) - Length(SubStr)] = '�')))
  THEN
    Str := SubStr
  ELSE
    Str := CheckLastStr(WordRV, VERB_2);  
  GetVerb := Str  
END; {SubGerund}  

FUNCTION GetNoun(WordRV: STRING): STRING;
VAR
  SubStr: STRING;
BEGIN {SubGerund}
  GetNoun := CheckLastStr(WordRV, NOUN)
END; {SubGerund}

FUNCTION GetDerivational(WordR2: STRING): STRING;
VAR
  SubStr: STRING;
BEGIN {SubGerund}
  GetDerivational := CheckLastStr(WordR2, DERIVATIONAL) 
END; {SubGerund}

FUNCTION GetSuperlative(WordR2: STRING): STRING;
VAR
  SubStr: STRING;
BEGIN {SubGerund}
  GetSuperlative := CheckLastStr(WordR2, SUPERLATIVE)
END; {SubGerund}
  
FUNCTION GetGerund(WordRV: STRING): STRING;
VAR
  SubStr, Str: STRING;
BEGIN {SubGerund}
  SubStr := CheckLastStr(WordRV, GERUND_1);
  IF (SubStr <> '') AND ((WordRV[Length(WordRV) - Length(SubStr)] = '�') 
                          OR ((WordRV[Length(WordRV) - Length(SubStr)] = '�')))
  THEN
    Str := SubStr
  ELSE
    Str := CheckLastStr(WordRV, GERUND_2);
  GetGerund := Str  
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

FUNCTION DelEndWord(Word: STRING; SubStr: STRING): STRING;
BEGIN {DelSubStr}
  Delete(Word, Length(Word) - Length(SubStr) + 1, Length(SubStr));
  DelEndWord := Word
END; {DelSubStr} 

FUNCTION GetBase(Word: STRING): STRING;
VAR
  Str, WordRV, WordR2: STRING;
BEGIN {GetBase}
  WordRV := GetRV(Word);
  Str := GetGerund(WordRV);
  IF Str = ''
  THEN
    BEGIN
      Str := GetReflexive(WordRV);
      IF Str <> ''
      THEN
        BEGIN
          Word := DelEndWord(Word, Str);
          WordRV := DelEndWord(WordRV, Str);
          Str := ''
        END;
      Str := GetAdjective(WordRV);
      IF Str = ''
      THEN
        BEGIN
          Str := GetVerb(WordRV);
          IF Str = ''
          THEN
            Str := GetNoun(WordRV)
        END 
    END;
  IF Str <> ''
  THEN
    BEGIN
      Word := DelEndWord(Word, Str);
      WordRV := DelEndWord(WordRV, Str);
      Str := ''
    END;
  IF Word[Length(Word)] = '�'
  THEN
    Delete(Word, Length(Word), 1);
  IF WordRV[Length(WordRV)] = '�'
  THEN
    Delete(WordRV, Length(WordRV), 1);    
  WordR2 := GetR2(Word);    
  Str := GetDerivational(WordR2);
  IF Str <> ''
  THEN
    BEGIN
      Word := DelEndWord(Word, Str);
      WordRV := DelEndWord(WordRV, Str);
      Str := ''
    END;
  IF '��' = Copy(Word, Length(Word) - 1, 2)
  THEN
    Delete(Word, Length(Word), 1)
  ELSE
    BEGIN
      Str := GetSuperlative(WordRV);
      IF Str <> ''
      THEN
        BEGIN
          Word := DelEndWord(Word, Str);
          WordRV := DelEndWord(WordRV, Str);
          Str := '';
          IF '��' = Copy(Word, Length(Word) - 1, 2)
          THEN
            Delete(Word, Length(Word), 1)
        END
      ELSE      
        IF '�' = Copy(Str, Length(Str), 1)
        THEN
          Delete(Str, Length(Str), 1)
    END;
  GetBase := Word
END; {GetBase}

BEGIN
END.  
