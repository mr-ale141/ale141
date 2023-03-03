                 ;--шаблон
  .model tiny
  .code
  org 100h
  include _abc.mac      ;библиотека макросов
Start:
  CLS                   ;очистка экрана

  TEXT Y  
  CALL Shifr                      ;--текст ПРОГРАММЫ--
  TEXT Y
  CALL Shifr
  TEXT Y

  PAUSE                 ;пауза
  STOP                  ;стоп

  Y db  "Привет", 10, 13, '$'    ;переменные
  Len = $ - Y - 3       ;константы
  K db "ABCD"
  Len2 = $ - K

Shifr:
  mov SI, 0
  mov BX, 0
  mov CX, Len
Shifr1:
  mov AL, K[SI]
  xor Y[BX], AL
  inc BX
  inc SI
  cmp SI, Len2
  jc Shifr2
  mov SI, 0
Shifr2:
  dec CX
  jnz Shifr1
  ret


; include _dec.pp       ;библиотека подпрограмм

;                       ;--тексты ПОДПРОГРАММ--

end Start
