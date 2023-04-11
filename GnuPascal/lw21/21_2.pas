PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
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
        Code[LiterCh] := CodeCh
      END
  ELSE
    Status := FALSE;      
  Initialize := Status        
END; {Initialize}

PROCEDURE Encode(VAR S: Str; LenOfString: IndexType);
VAR
  Index: IndexType;
BEGIN {Encode}
  FOR Index := 1 TO LenOfString
  DO
    IF S[Index] IN ['A' .. 'Z', ' ']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
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
            WRITE(OUTPUT, Msg[I])
          END;
        READLN(INPUT);
        WRITELN(OUTPUT);
        {распечатать кодирование сообщение}
        Encode(Msg, I)
      END
  ELSE
    WRITELN(OUTPUT, 'Eror code file!');    
END.  {Encryption}

