                 ;--蠡���
  .model tiny
  .code
  org 100h
  include _abc.mac      ;������⥪� ����ᮢ
  
Start:
  CLS                   ;���⪠ ��࠭�

;                       ;--⥪�� ���������--
;  mov DH, 10
;  mov DL, 10
;  mov BH, 0
;  mov AH,2
;  int 10h
  kursor 12,12
  TEXT Z

  PAUSE                 ;��㧠
  STOP                  ;�⮯

 Z db  "�ਢ��",'$'    ;��६����
; Len = $ - Y - 1       ;����⠭��

; include _dec.pp       ;������⥪� ����ணࠬ�

;                       ;--⥪��� �����������--

end Start
