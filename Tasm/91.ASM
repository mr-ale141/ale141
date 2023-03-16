                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  VIDEO
  CLS                   ;очистка экрана
  mov BX,0
  mov AL,0B0h
  mov AH,7Fh
  CALL PrintLine
  mov AL,0B1h
  mov AH,1Bh
  CALL PrintLine
  mov AL,0B2h
  mov AH,4Ch
  CALL PrintLine


  PAUSE                 ;пауза
  STOP                  ;стоп

PrintLine:
  mov CX,8*80
Screen:
  mov ES:[BX],AX
  add BX,2
  dec CX
  jnz Screen 
  ret  

;  Y db 6, 7, 6, 9, 4, 2      ;переменные
;  Len = $ - Y           ;константы

;  include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
