PROGRAM AsmInPascal(INPUT, OUTPUT);
USES crt;
VAR
  y: BYTE;
BEGIN
  CLRSCR;
  y := 65;
  WRITE(y);
  asm
    mov AL, y
    mov AH, 0Eh
    int 10h
    inc AL; mov y, AL
    mov AH, 0Eh
    int 10h
    inc AL; mov y, AL
  end;
  WRITE(y);
  READKEY
END.
