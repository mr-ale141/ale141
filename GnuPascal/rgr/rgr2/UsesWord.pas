UNIT UsesWord;

INTERFACE
  
   FUNCTION GetWord(VAR Fin: TEXT): STRING;        {ïðî÷èòàòü ñëîâî èç ôàéëà, '' - ôàéë ïóñò }
   FUNCTION StrToSmall(Str: STRING): STRING;       {ïðåîáðàçîâàíèå ñòðîêè â ñòðî÷íûå áóêâû}
    
IMPLEMENTATION

FUNCTION GetWord(VAR FIn: TEXT): STRING;
VAR
  Ch: CHAR;
  Str: STRING;
BEGIN {GetWord}
  Ch := ' ';
  Str := '';
  WHILE NOT EOF(FIn) AND ((Ch < 'A') OR (Ch > 'Z')) AND ((Ch < 'a') OR (Ch > 'z')) 
                     AND (Ch < 'À') AND (Ch <> '¨') AND (Ch <> '¸') 
                     AND (Ch <> '-') AND (Ch <> '''')
  DO
    READ(FIn, Ch);
  WHILE NOT EOF(FIn) AND ( ((Ch >= 'A') AND (Ch <= 'Z')) OR ((Ch >= 'a') AND (Ch <= 'z')) 
                     OR (Ch >= 'À') OR (Ch = '¨') OR (Ch = '¸') 
                     OR (Ch = '-') OR (Ch = '''') )
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
  If Str <> ''
  THEN
    BEGIN
      WHILE Str[Length(Str)] = '-'
      DO
        Delete(Str, Length(Str), 1);
      WHILE (Str[1] = '-') AND (Str <> '')
      DO
        Delete(Str, 1, 1)
    END;
  IF (Str = '') AND (NOT EOF(FIn))
  THEN
    GetWord := GetWord(FIn)
  ELSE   
    GetWord := Str
END; {GetWord}

 

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
