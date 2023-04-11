PROGRAM Decryption(INPUT, OUTPUT);
CONST
  Len = 255;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY [' ' .. '_'] OF CHAR;
  IndexType = 0 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: IndexType;
  StorageCode: TEXT;
  StatusInit: BOOLEAN;
  
FUNCTION Initialize(VAR StorageCode: TEXT; VAR Code: Chiper): BOOLEAN;
VAR
  LiterCh, CodeCh: CHAR;
  Status: BOOLEAN;
BEGIN {Initialize}
  RESET(StorageCode);
  Status := (NOT EOLN(StorageCode));
  IF (Status = TRUE)
  THEN
    WHILE (NOT EOF(StorageCode)) AND (Status = TRUE)
    DO
      BEGIN
        Status := (NOT EOLN(StorageCode));
        IF (Status = TRUE)
        THEN
          READ(StorageCode, LiterCh);
        Status := (NOT EOLN(StorageCode));
        IF (Status = TRUE)
        THEN
          READLN(StorageCode, CodeCh);
        Code[CodeCh] := LiterCh
      END
  ELSE
    Status := FALSE;      
  Initialize := Status        
END; {Initialize}

PROCEDURE Uncode(VAR S: Str; LenOfString: IndexType);
VAR
  Index: IndexType;
BEGIN {Uncode}
  FOR Index := 1 TO LenOfString
  DO
    IF S[Index] IN [' ' .. '_']
    THEN
      WRITE(OUTPUT, Code[S[Index]])
    ELSE
      WRITE(OUTPUT, S[Index])
END;  {Uncode}

BEGIN {Decryption}
  ASSIGN(StorageCode, 'code.txt');
  {инициализировать Code}
  StatusInit := Initialize(StorageCode, Code);
  IF (StatusInit = TRUE)
  THEN
    WHILE NOT EOF(INPUT)
    DO
      BEGIN
        {читать строку в Msg и распечатать ее}
        I := 0;
        WHILE NOT EOLN(INPUT) AND (I < Len)
        DO
          BEGIN
            I := I + 1;
            READ(INPUT, Msg[I]);
          END;
        READLN(INPUT);
        {распечатать кодирование сообщение}
        Uncode(Msg, I);
        WRITELN(OUTPUT);
      END
  ELSE
    WRITELN(OUTPUT, 'Eror code file!');    
END.  {Decryption}

