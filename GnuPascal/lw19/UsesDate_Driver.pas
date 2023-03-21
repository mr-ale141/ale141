PROGRAM UsesDateDriver(INPUT, OUTPUT);
USES UsesDate;
VAR
  Copying: BOOLEAN;
  D1, D2: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;

BEGIN{DateIODriver}
  REWRITE(DateFile);
  ReadDate(INPUT, D1);
  READLN(INPUT);
  ReadDate(INPUT, D2);
  Copying := Less(D1, D2);
  WRITE(DateFile, D1);
  WRITE(DateFile, D2);
  RESET(DateFile);
  CopyOut(DateFile);
  IF Copying = TRUE
  THEN
    WRITELN(OUTPUT, 'D1 < D2')
  ELSE  
    WRITELN(OUTPUT, 'D1 > D2')
    
END.{DateIODriver}
