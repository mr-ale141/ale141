                 ;--蠡���
  .model tiny
  .code
  org 100h
  include _abc.mac      ;������⥪� ����ᮢ
Start:
  CLS                   ;���⪠ ��࠭�

  TEXT Y  
  CALL Shifr                      ;--⥪�� ���������--
  TEXT Y
  CALL Shifr
  TEXT Y

  PAUSE                 ;��㧠
  STOP                  ;�⮯

  Y db  "�ਢ��", 10, 13, '$'    ;��६����
  Len = $ - Y - 3       ;����⠭��
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


; include _dec.pp       ;������⥪� ����ணࠬ�

;                       ;--⥪��� �����������--

end Start
