UNIT UsesStemmer;

INTERFACE
  
  FUNCTION GetBase(Word: STRING): STRING;
  
IMPLEMENTATION

TYPE
  SetChar = SET OF CHAR;
  ArrString = ARRAY [1 .. 40] OF STRING;

CONST
  VOWELS: SetChar = ['а', 'е', 'Є', 'и', 'о', 'у', 'ы', 'э', 'ю', '€'];
  GERUND_1: ArrString = ('в', 'вши', 'вшись');
  GERUND_2: ArrString = ('ив', 'ивши', 'ившись', 'ыв', 'ывши', 'ывшись');
  ADJECTIVE: ArrString = ('ее', 'ие', 'ые', 'ое', 'ими', 'ыми', 'ей', 'ий', 'ый', 'ой', 
               'ем', 'им', 'ым', 'ом', 'его', 'ого', 'ему', 'ому', 'их', 
               'ых', 'ую', 'юю', 'а€', '€€', 'ою', 'ею');
  PARTICIPLE_1: ArrString = ('ем', 'нн', 'вш', 'ющ', 'щ');
  PARTICIPLE_2: ArrString = ('ивш', 'ывш', 'ующ');
  REFLEXIVE: ArrString = ('с€', 'сь');
  VERB_1: ArrString = ('ла', 'на', 'ете', 'йте', 'ли', 'й', 'л', 'ем', 'н', 'ло', 'но',
            'ет', 'ют', 'ны', 'ть', 'ешь', 'нно');
  VERB_2: ArrString = ('ила', 'ыла', 'ена', 'ейте', 'уйте', 'ите', 'или', 'ыли', 'ей', 
            'уй', 'ил', 'ыл', 'им', 'ым', 'ен', 'ило', 'ыло', 'ено', '€т', 
            'ует', 'уют', 'ит', 'ыт', 'ены', 'ить', 'ыть', 'ишь', 'ую', 'ю');          
  NOUN: ArrString = ('а', 'ев', 'ов', 'ие', 'ье', 'е', 'и€ми', '€ми', 'ами', 'еи', 'ии', 
          'и', 'ией', 'ей', 'ой', 'ий', 'й', 'и€м', '€м', 'ием', 'ем', 'ам', 
          'ом', 'о', 'у', 'ах', 'и€х', '€х', 'ы', 'ь', 'ию', 'ью', 'ю', 'и€',
          'ь€', '€');
  SUPERLATIVE: ArrString = ('ейш', 'ейше');
  DERIVATIONAL: ArrString = ('ост', 'ость');
  
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
  IF (SubStr <> '') AND ((WordRV[Length(WordRV) - Length(SubStr)] = 'а') 
                          OR ((WordRV[Length(WordRV) - Length(SubStr)] = '€')))
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
  IF (SubStr <> '') AND ((WordRV[Length(WordRV) - Length(SubStr)] = 'а') 
                          OR ((WordRV[Length(WordRV) - Length(SubStr)] = '€')))
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
  IF Word[Length(Word)] = 'и'
  THEN
    Delete(Word, Length(Word), 1);
  IF WordRV[Length(WordRV)] = 'и'
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
  IF 'нн' = Copy(Word, Length(Word) - 1, 2)
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
          IF 'нн' = Copy(Word, Length(Word) - 1, 2)
          THEN
            Delete(Word, Length(Word), 1)
        END
      ELSE      
        IF 'ь' = Copy(Str, Length(Str), 1)
        THEN
          Delete(Str, Length(Str), 1)
    END;
  GetBase := Word
END; {GetBase}

BEGIN
END.  
