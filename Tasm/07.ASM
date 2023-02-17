;-
;-шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac
;     ;библиотека м
;акросов
Start:
  CLS
;     ;очистка экра
;на
  mov DX,offset Y
  mov AH,9
  int 21h
  PAUSE
;     ;пауза
  STOP
;     ;стоп

 Y db  "Привет",'$'
;'    ;переменные
; Len = $ - Y - 1
;     ;константы

; include _dec.pp
;     ;библиотека п
;одпрограмм


  end Start
