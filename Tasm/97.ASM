                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  CLS                   ;очистка экрана
  TEXT Y
                       ;--текст ПРОГРАММЫ--
  mov BX, 0
  mov CX, Len
  mov DI, Len+1
Metka1:
  mov AL, Y[BX]
  PRINT
  mov AL, 13
  PRINT
  mov AL, 10
  PRINT
  inc BX
  dec CX
  jnz Metka1
  PAUSE                 ;пауза
  STOP                  ;стоп

  Y db  "ABCD", 13, 10, '$'    ;переменные
  Len = $ - Y - 3       ;константы

; include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
