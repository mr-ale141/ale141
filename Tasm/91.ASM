                 ;--蠡���
  .model tiny
  .code
  org 100h
  include _abc.mac      ;������⥪� ����ᮢ
Start:
  VIDEO
  CLS                   ;���⪠ ��࠭�
  mov BX,0
  mov AL,0B0h
  mov AH,7Fh
  CALL PrintLine
  mov AL,0B1h
  mov AH,1Bh
  CALL PrintLine
  mov AL,0B2h
  mov AH,4Ch
  CALL PrintLine


  PAUSE                 ;��㧠
  STOP                  ;�⮯

PrintLine:
  mov CX,8*80
Screen:
  mov ES:[BX],AX
  add BX,2
  dec CX
  jnz Screen 
  ret  

;  Y db 6, 7, 6, 9, 4, 2      ;��६����
;  Len = $ - Y           ;����⠭��

;  include _dec.pp       ;������⥪� ����ணࠬ�

;                       ;--⥪��� �����������--

end Start
