UNIT UsesWord;

INTERFACE
  
   FUNCTION GetWord(VAR Fin: TEXT): STRING;        {ïðî÷èòàòü ñëîâî èç ôàéëà}
   FUNCTION StrToSmall(Str: STRING): STRING;       {ïðåîáðàçîâàíèå ñòðîêè â ñòðî÷íûå áóêâû}
   FUNCTION GetLess(W1, W2: STRING): INTEGER;
    
IMPLEMENTATION

FUNCTION IsAlpha(Ch: CHAR): BOOLEAN;
BEGIN {IsAlpha}
  IsAlpha := ( ((Ch >= 'A') AND (Ch <= 'Z')) OR ((Ch >= 'a') AND (Ch <= 'z')) 
                     OR (Ch >= 'À') OR (Ch = '¨') OR (Ch = '¸') 
                     OR (Ch = '-') OR (Ch = '''') )
END; {IsAlpha}

FUNCTION DelExtHyphen(Str: STRING): STRING;
BEGIN {DelExtHyphen}
  WHILE Str[Length(Str)] = '-'
  DO
    Delete(Str, Length(Str), 1);
  WHILE (Str[1] = '-') AND (Str <> '')
  DO
    Delete(Str, 1, 1);
  DelExtHyphen := Str
END; {DelExtHyphen}

FUNCTION GetWord(VAR FIn: TEXT): STRING;
VAR
  Ch: CHAR;
  Str: STRING;
BEGIN {GetWord}
  Ch := ' ';
  Str := '';
  WHILE NOT EOF(FIn) AND NOT IsAlpha(Ch)
  DO
    READ(FIn, Ch);
  WHILE NOT EOF(FIn) AND IsAlpha(Ch)
  DO
    IF Ch <> '-'
    THEN
      BEGIN 
        Str := Str + Ch;
        Read(FIn, Ch)
      END
    ELSE
      IF EOLN(FIn)
      THEN
        BEGIN
          Str := Str + Ch;
          READLN(FIn);
          Ch := ' ';
          WHILE (Ch = ' ') AND (NOT EOF(FIn))
          DO
            Read(FIn, Ch)  
        END
      ELSE
        BEGIN
          Str := Str + Ch;   
          Read(FIn, Ch)
        END;      
  IF Str <> ''
  THEN
    Str := DelExtHyphen(Str);
  IF (Str = '') AND (NOT EOF(FIn))
  THEN
    GetWord := GetWord(FIn)
  ELSE
    GetWord := Str       
END; {GetWord}

FUNCTION GetLess(W1, W2: STRING): INTEGER;
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
      THEN {Ch1 < Ch2 èëè F1 êîðî÷å F2}
        Answer := 1
      ELSE
        IF (W1[Index2] > W2[Index1])
        THEN {Ch1 > Ch2 èëè F2 êîðî÷å F1}
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
  GetLess := Answer        
END; {IsSmaller}  

FUNCTION StrToSmall(Str: STRING): STRING;
VAR
  StrUpper, StrSmall, StrOut: STRING;
  I: INTEGER;
BEGIN {StrToSmall}
  StrOut := '';
  StrUpper := 'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß';
  StrSmall := 'abcdefghijklmnopqrstuvwxyzàáâãäå¸æçèéêëìíîïðñòóôõö÷øùúûüýþÿ';
  FOR I := 1 TO Length(Str)
  DO
    IF Pos(Str[I], StrUpper) > 0
    THEN
      StrOut := StrOut + StrSmall[Pos(Str[I], StrUpper)]
    ELSE
      StrOut := StrOut + Str[I];
  StrToSmall := StrOut        
END; {StrToSmall}

BEGIN
END.

{   CP1251
  WHILE NOT EOF(FIn) AND ((Ch < 'A') OR (Ch > 'Z')) AND ((Ch < 'a') OR (Ch > 'z')) 
                     AND (Ch < #192) AND (Ch <> #168) AND (Ch <> #184) AND (Ch <> '-')
  DO
    READ(FIn, Ch);
  WHILE NOT EOF(FIn) AND ( ((Ch >= 'A') AND (Ch <= 'Z')) OR ((Ch >= 'a') AND (Ch <= 'z')) 
                     OR (Ch >= #192) OR (Ch = #168) OR (Ch = #184) OR (Ch = '-') )
  DO
}

{  CP866
WHILE NOT EOF(FIn) AND ((Ch < 'A') OR (Ch > 'Z')) AND ((Ch < 'a') OR (Ch > 'z')) 
                     AND ((Ch < #128) OR (Ch > #175)) AND ((Ch < #224) OR (Ch > #241))
                     AND (Ch <> '-')
  DO
    READ(FIn, Ch);
  WHILE NOT EOF(FIn) AND ( ((Ch >= 'A') AND (Ch <= 'Z')) OR ((Ch >= 'a') AND (Ch <= 'z')) 
                     OR ((Ch >= #128) AND (Ch <= #175)) OR ((Ch >= #224) AND (Ch <= #241))
                     OR (Ch = '-') )
  DO
}

{  CP866
  WHILE NOT EOF(FIn) AND ((Ch < 'A') OR (Ch > 'Z')) AND ((Ch < 'a') OR (Ch > 'z')) 
                     AND ((Ch < 'À') OR (Ch > 'ï')) AND ((Ch < 'ð') OR (Ch > '¸')) 
                     AND (Ch <> '-')
  DO
    BEGIN
      READ(FIn, Ch);
      Str := Str + '#';
    END;
  WHILE NOT EOF(FIn) AND ( ((Ch >= 'A') AND (Ch <= 'Z')) OR ((Ch >= 'a') AND (Ch <= 'z')) 
                     OR ((Ch >= 'À') AND (Ch <= 'ï')) OR ((Ch >= 'ð') AND (Ch <= '¸'))
                     OR (Ch = '-') )
}
