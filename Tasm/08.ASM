;-
;-蠡���
  .model tiny
  .code
  org 100h
  include _abc.mac
;     ;������⥪� �
;���ᮢ
Start:
  CLS
;     ;���⪠ ���
;��
  KURSOR 12,30
  TEXT Y

  PAUSE
;     ;��㧠
  STOP
;     ;�⮯

 Y db  "�ਢ��",13,10,"XYZ",'$'
;'    ;��६����
; Len = $ - Y - 1
;     ;����⠭��

; include _dec.pp
;     ;������⥪� �
;���ணࠬ�


  end Start