                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  VIDEO
  CLS                   ;очистка экрана
  mov AL,'#'
  mov AH,0Eh
  mov CL,10
  mov CH,5
  CALL Box
  mov AL,' '
  mov CL,8
  mov CH,3
  add BX,162
  CALL Box
  

  PAUSE                 ;пауза
  STOP                  ;стоп


;  Y db 6, 7, 6, 9, 4, 2      ;переменные
;  Len = $ - Y           ;константы

;  include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--
Box:
  push CX
  push BX
Box2:
  push CX
  push BX 
Box1: 
  mov ES:[BX],AX
  add BX,2
  dec CL
  jnz Box1
  pop BX
  add BX,160
  pop CX
  dec CH
  jnz Box2
  pop BX
  pop CX
  ret

end Start
