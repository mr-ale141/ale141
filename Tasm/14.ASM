                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  CLS                   ;очистка экрана
  mov AL,DS:118h
  print

  mov AL,y+2
  print

  mov AL,y[2]
  print

  mov BX, offset y
  inc BX
  inc BX
  mov AL,[BX]
  print

  mov BX, offset y
  add BX, 2
  mov AL,[BX]
  print

; mov BX, offset y+2
;  mov BX, 2  
  mov BX, offset y
  mov SI, 2
  mov AL, [BX][SI]
  print

  PAUSE                 ;пауза
  STOP                  ;стоп

 Y db  "Привет",'$'    ;переменные
; Len = $ - Y - 1       ;константы

; include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
