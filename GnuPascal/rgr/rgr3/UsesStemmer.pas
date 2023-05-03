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
        IF (WordRV[Position] = 'а') OR (WordRV[Position] = '€')
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
   
