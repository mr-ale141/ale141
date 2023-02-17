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
  KURSOR 12,30
  TEXT Y

  PAUSE
;     ;пауза
  STOP
;     ;стоп

 Y db  "Привет",13,10,"XYZ",'$'
;'    ;переменные
; Len = $ - Y - 1
;     ;константы

; include _dec.pp
;     ;библиотека п
;одпрограмм


  end Start