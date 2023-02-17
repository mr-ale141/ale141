                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
  
Start:
  CLS                   ;очистка экрана

;                       ;--текст ПРОГРАММЫ--
;  mov DH, 10
;  mov DL, 10
;  mov BH, 0
;  mov AH,2
;  int 10h
  kursor y1,x1
  TEXT Z

  PAUSE                 ;пауза
  STOP                  ;стоп

 Z db  "Привет",'$'    ;переменные
; Len = $ - Y - 1       ;константы

  y1 = 13
  x1 = 13
; include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
