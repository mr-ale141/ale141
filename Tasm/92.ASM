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
SortStart:
  mov BX, 0  
  mov CX, Len-1
  mov DX, 0
MetSort:
  mov AL, Y[BX]
  mov AH, Y[BX+1]
  cmp AL, AH  
  jnc MetSort1 
  mov DX, 1
  mov Y[BX], AH
  mov Y[BX+1], AL
MetSort1:
  inc BX
  dec CX
  jnz MetSort
  cmp DX, 0
  jnz SortStart

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
  Y db 6, 7, 5, 9, 4, 2      ;переменные
  Len = $ - Y           ;константы

  include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
