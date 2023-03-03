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
  TEXT NameSum          ;--текст ПРОГРАММЫ--
  
  mov BX, offset Y
  mov CX, Len
  mov AL, Y
MetSum:
  cmp AL, [BX]
  jnc Met1
  mov AL, [BX]
Met1:  
  inc BX
  dec CX 
  jnz MetSum
  CALL DECAL
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

  NameArr db "Массив", '$'
  NameSum db "Макс.", '$'
  Y db 5, 7, 6, 9, 4, 2      ;переменные
  Len = $ - Y           ;константы

  include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
