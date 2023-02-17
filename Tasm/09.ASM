  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS
  mov BX,offset y
  mov CX,6
Metka:
  mov AL,[BX]
  PRINT
  inc BX
  dec CX
  jnz Metka

  PAUSE
  STOP

 Y db  "ABCDEF"

  end Start