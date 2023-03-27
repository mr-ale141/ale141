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
    {DP 1.1 ��������� ����� ���� � DateFile � ��������������� �����}
    BEGIN
      ReadDate(FInput, D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {DP 1.1.1 �������� �������� ������, ��� D �� DateFile � TFile}
          {�������� D � TFile}
          WRITE(DateFile, D);
          {DP 1.1.3 �������� ������� DateFile � TFile}
          {DP 1.1.4 �������� TFile � DateFile}    
        END
    END;
  {DP 1.2 �������� DateFile � OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile)
END. {SortDate}
















    
