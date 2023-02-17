;����������� ����� �ᥫ ������������������������������������������������������
; �����뢠���� �᫠ �� ���� �������⮢�� ��६�����.                    AX
; �㬬� � ���塠�⮢�� ��६�����.                                      ��Ŀ
; �������� �᫠ �� ��६����� (᫠����� � �㬬�)                    AH AL  
;   ������⥫�� �㬬� ���� AX                                       ÿڴ
;   �᫨ �㬬� �� ����� ����, � AH=0:   15 + 240 = 255     0F + F0 = 00FF
;   �᫨ �㬬�    ����� ����, � AH=1:  255 + 255 = 510     FF + FF = 01FE  
;                                         �������          ��⭠������
; �� ᫮����� 8-ࠧ�來�� �ᥫ ������ ࠧ�� �㬬� �� 䫠�� ��७��

 .model tiny
 .code
  org 100h
  include _abc.mac     ;������⥪� ����ᮢ
Start:
  CLS
             ;��� 1 ᯮᮡ: �����, �।�������� 1-���⮢�� �㬬�
  mov AH,0             ;���訩 ���� �㬬�=0 (�।�������� �㬬� �������⮢��)
  mov AL, Y            ;��ࢮ� ᫠������ �� �祩�� � ������⥫�
  add AL, Z            ;���������� ��ண� ᫠�������  ���:  add AL,Y+1
  jnc Metka1           ;�᫨ ��� ��७��, � AH ��⠥��� �㫥��
    mov AH,1           ;�᫨ ���� ��७��, � AH=1
Metka1:                
  mov Sum,AX           ;䨪��� �㬬� � ���塠�⮢�� ��६�����
  call Result          ;����� १���� (�ᥫ �� �祥� Y,Z,Sum)

             ;��� 2 ᯮᮡ: ������, 
  mov BX,offset Y      ;���� ��ࢮ� �祩��
  mov AL, [BX]         ;  ��ࢮ� ᫠������
  add AL, [BX+1]       ;  ��஥ ᫠������    ���:  inc BX  �  add AL,[BX]
  mov AH,0             ;AH=0
  jnc Metka2           
    inc AH             ;AH=1 (���塠�⮢�� �㬬�)
Metka2:                
  mov Sum,AX           ;�㬬�
  call Result          ;����� १����

             ;��� 3 ᯮᮡ: �������, �।�������� 2-���⮢�� �㬬�
  mov BX,0             ;������ ��ࢮ� �祩��
  mov AL, Y[BX]        ;  ��ࢮ� ᫠������
  add AL, Y[BX]+1      ;  ��஥ ᫠������    ���:  inc BX  �  add AL,Y[BX]
  mov AH,1             ;�।�������� 2-���⮢�� �㬬�: AH=1
  jc Metka3            ;
    sub AH,AH          ;��� ��७��, AH=0
Metka3:                
  mov Sum,AX           ;�㬬�
  call Result          ;����� १����

             ;��� 4 ᯮᮡ: �� ���� �祥� � AX (�� Y � AL, �� Y+1 � AH)
  mov BX,offset Y      ;��� �������: mov BX,0               ��� �����:
  mov AX,word ptr [BX] ;             mov AX,word ptr Y[BX]    mov AX,word ptr Y
  add AL,AH            ;�㬬� ᫠������
  mov AH,0             ;���訩 ���� �㬬� ���㫨�� (AH=0)
  adc AH,0             ;�ਡ����� ��७�� ( AH=AH+0+��७��) 
  mov Sum,AX           ;�㬬�
  call Result          ;����� १����

             ;��� 5 ᯮᮡ: �� ���� �祥� � AX � DX
  mov AH,0
  mov AL, Y            ;��ࢮ� ᫠������ � ���塠�⮢� ॣ���� AX
  mov DH,0
  mov DL, Z            ;��஥ ᫠������ � ���塠�⮢� ॣ���� DX
  add AX,DX            ;᫮����� ���塠�⮢��
  mov Sum,AX           ;�㬬�
  call Result          ;����� १����

  PAUSE
  STOP

  Y   db 200           ;��ࢮ� ᫠������
  Z   db 251           ;��஥ ᫠������
  Sum dw 0             ;�㬬� (���塠�⮢�� ��६�����)

  include _dec.pp      ;������⥪� ����ணࠬ� ��� ���� 10-��� �ᥫ

                   ;--����ணࠬ�� ���� १���� 
Result:
  mov AL,Y
  call DecAL
  WRITE ' '
  WRITE '+'
  mov AL,Z
  call DecAL
  WRITE ' '
  WRITE '='
  mov AX,Sum
  call DecAX
  WRITELN
  ret




end Start
