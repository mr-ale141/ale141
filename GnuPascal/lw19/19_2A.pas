PROGRAM SortDate(INPUT, OUTPUT);

USES UsesDate;

VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;
  
PROCEDURE CopyOut(VAR DateFile: FileOfDate);
VAR
  VarDate: Date;
BEGIN {CopyOut}
  WHILE NOT EOF(DateFile)
  DO
    BEGIN
      READ(DateFile, VarDate);
      WriteDate(OUTPUT, VarDate);
      WRITELN;
    END
END;  {CopyOut}  
  
BEGIN {SortDate}
  {DP 1}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  {RESET(DateFile);}
  WHILE NOT EOF(FInput)
  DO
    {DP 1.1 Поместить новую дату в DateFile в соответствующее место}
    BEGIN
      ReadDate(FInput, D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {DP 1.1.1 Копируем элементы меньше, чем D из DateFile в TFile}
          {Копируем D в TFile}
          WRITE(DateFile, D);
          {DP 1.1.3 Копируем остаток DateFile в TFile}
          {DP 1.1.4 Копируем TFile в DateFile}    
        END
    END;
  {DP 1.2 Копируем DateFile в OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile)
END. {SortDate}
















    
