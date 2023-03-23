                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  VIDEO
  CLS                   ;очистка экрана
  
  mov BX,160
  mov CH,'0'
  mov CL,'+'
  mov DX,2  
  CALL Movi  
  
  PAUSE                 ;пауза
  STOP                  ;стоп


;  Y db 6, 7, 6, 9, 4, 2      ;переменные
;  Len = $ - Y           ;константы

;  include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

Movi:
  mov ES:[BX],CH
  PAUSE
  mov ES:[BX],CL
  cmp AL,27
  jnz Movi0
    STOP
Movi0:
  cmp AH,77
  jnz Movi1
    mov DX,2
Movi1:
  cmp AH,75
  jnz Movi2
    mov DX,-2
Movi2:
  cmp AH,80
  jnz Movi3
    mov DX,160
Movi3:
  cmp AH,72
  jnz Movi4
    mov DX,-160
Movi4:    
  add BX,DX
  jmp Movi

end Start
