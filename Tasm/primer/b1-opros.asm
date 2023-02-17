;─────────── НОМЕРА нажимаемых символов ───────────────────────────────────────
; Печатаются нажимаемые символы и их коды. Выход - клавишей Esc

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS

Metka:
  mov AH,10h
  int 16h         ;опрос (код в AL, если AL=0 или 224, то в AH -спецкод)

  cmp AL,27       ;нажато Esc ?
  jnz Metka0      ;если да, то выход
    PAUSE
    STOP
Metka0:
  WRITELN         ;перевод курсора

  cmp AL,0
  jz Metka3       ;если спецкод (функциональная клавиша: F1,F2...)
  cmp AL,224
  jz Metka3       ;если спецкод (курсорная клавиша: стрелки,Home,PgUp...)
  cmp AL,32
  jc Metka2       ;если коды до 32 (Enter,Tab,BackSpace...)

      ;--символ (коды 32..255)
Metka1:
  TEXT T1         ;текст "символ"
  WRITE AL        ;печать символа
  TEXT T2         ;текст "код"
  call DecAL      ;печать кода
  jmp Metka

      ;--не символ (коды 1..31)
Metka2:
  TEXT T0         ;текст "не символ"
  WRITE ' '       ;пробел
  TEXT T2         ;текст "код"
  call DecAL      ;печать кода
  jmp Metka

      ;--спецкод
Metka3:
  TEXT T3         ;текст "СпецКод"
  mov AL,AH
  call DecAL      ;печать спецкода
  jmp Metka

 T0 db  "Не символ ",'$'
 T1 db  "Символ    ",'$'
 T2 db  "    Код",'$'
 T3 db  "  СпецКод",'$'

  include _dec.pp
end Start
