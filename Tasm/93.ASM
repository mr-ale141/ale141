                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  CLS                   ;очистка экрана
  TEXT NameArr
  CALL MASPRINT
  WRITELN
  mov CX, Len/2
  mov SI, Len-1
  mov DI, 0
MetRev:
  mov AL, Y[DI]
  mov AH, Y[SI]
  mov Y[DI], AH
  mov Y[SI], AL
  inc DI
  dec SI
  dec cx
  jnz MetRev
  
  TEXT NameSum
  CALL MASPRINT          ;--текст ПРОГРАММЫ--
  

  PAUSE                 ;пауза
  STOP                  ;стоп

MASPRINT:
  push AX
  push BX
  push CX    
  mov BX, offset Y
  mov CX, Len
MASPRINT1:
  mov AX, [BX]
  CALL DECAL
  inc BX
  dec CX
  jnz MASPRINT1
  pop CX
  pop BX
  pop AX
  ret

  NameArr db "До   ", '$'
  NameSum db "После", '$'
  Y db 6, 7, 6, 9, 4, 2      ;переменные
  Len = $ - Y           ;константы

  include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
