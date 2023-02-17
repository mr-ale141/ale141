                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  CLS                   ;очистка экрана
  TEXT Y
;                       ;--текст ПРОГРАММЫ--
  mov BX,offset Y[Len-1]
  mov CX,Len
metka1:
  mov AL,[BX]
  mov AH,0Eh
  int 10h  
  dec BX  
  dec CX
  jnz metka1

  PAUSE                 ;пауза
  STOP                  ;стоп

  Y db  "Привет", 10, 13, '$'    ;переменные
  Len = $ - Y - 3       ;константы

; include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
