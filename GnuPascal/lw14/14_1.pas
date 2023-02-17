PROGRAM CopyReverseDriver(INPUT, OUTPUT);
  
PROCEDURE CopyReverse(VAR FIn, FOut: TEXT);
VAR
  Ch: CHAR;
BEGIN{CopyReverse}
  IF NOT EOLN(FIn)
  THEN
    BEGIN
      READ(FIn, Ch);
      CopyReverse(FIn, Fout);
      WRITE(FOut, Ch)
    END
END;{CopyReverse}

BEGIN{CopyReverseDriver}
  CopyReverse(INPUT, OUTPUT);
  WRITELN(OUTPUT)    
END.{CopyReverseDriver}
