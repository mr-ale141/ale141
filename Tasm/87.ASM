                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  VIDEO
  CLS                   ;очистка экрана
  mov BX,0
  mov CH,25
  mov CL,80
  mov AL,'#'
  mov AH,4Eh
  CALL RAMKA  


  mov BX,12*160+40*2
  mov CH,'0'
  mov CL,'+'
  mov DX,0  
  CALL Movi  
  
  PAUSE                 ;пауза
  STOP                  ;стоп


;  Y db 6, 7, 6, 9, 4, 2      ;переменные
;  Len = $ - Y           ;константы

;  include _dec.pp       ;библиотека подпрограмм
  include _ekr.pp
;                       ;--тексты ПОДПРОГРАММ--

Movi:
  mov ES:[BX],CH
  KEY
  DELAY 100
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
  cmp byte ptr ES:[BX],'#'
  jnz Movi
  sub BX,DX
  neg DX
  jmp Movi

end Start
