PROGRAM RCopyDriver(INPUT, OUTPUT);
  
PROCEDURE RCopy(VAR FIn, FOut: TEXT);
VAR
  Ch: CHAR;
BEGIN{RCopy}
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      READ(FIn, Ch);
      WRITE(FOut, Ch);
      RCopy(FIn, Fout)
    END  
END;{RCopy}

BEGIN{CopyReverseDriver}
  RCopy(INPUT, OUTPUT)    
END.{CopyReverseDriver}
