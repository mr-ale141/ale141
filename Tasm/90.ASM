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

  mov DX,2
  CALL PrintLine
  mov DX,160
  CALL PrintLine
  mov DX,-2
  CALL PrintLine
  mov DX,-160
  CALL PrintLine

  PAUSE                 ;пауза
  STOP                  ;стоп


;  Y db 6, 7, 6, 9, 4, 2      ;переменные
;  Len = $ - Y           ;константы

;  include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--
PrintLine:
  push CX
  
PrintLine1: 
  mov ES:[BX],AX
  add BX,DX
  dec CL
  jnz PrintLine1
  pop CX
  sub BX,DX
  xchg CH,CL
  ret

end Start
