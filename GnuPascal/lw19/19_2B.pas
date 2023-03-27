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
  RESET(DateFile);
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
          REWRITE(TFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate, D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END;
          {DP 1.1.2 �������� D � TFile}
          WRITE(TFile, D);
          {DP 1.1.3 �������� ������� DateFile � TFile}
          IF NOT Copying
          THEN
            WRITE(TFile, VarDate);
          WHILE NOT EOF(DateFile)
          DO
            BEGIN
              READ(DateFile, VarDate);
              WRITE(TFile, VarDate)
            END;
          {DP 1.1.4 �������� TFile � DateFile}
          RESET(TFile);
          REWRITE(DateFile);
          WHILE NOT EOF(TFile)
          DO
            BEGIN
              READ(TFile, VarDate);
              WRITE(DateFile, VarDate)
            END;
          RESET(DateFile)    
        END
    END;
  {DP 1.2 �������� DateFile � OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile)
END. {SortDate}
















    
