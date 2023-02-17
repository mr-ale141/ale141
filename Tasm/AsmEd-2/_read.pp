;��������� ����ணࠬ�� ��� ����� ����� � �������� �ᥫ �������������������
;
;call ReadAX     ; ����   10-�� ����� � AX
;                ;   (�������� ⮫쪮 ᨬ���� '0'..'9' � ��-������)
;
;����������������
;call ReadS      ; ���� ������ � ��६����� � ���ᮬ �� BX 
;                ;   ����� ����� -����⨥� Enter (� ��६����� ���������� '$')
;                ;                ���   �� ����饣��� � ��६����� ᨬ���� '$'
;                ;   ���-�� ��������� ᨬ����� (��� ����筮�� '$') �㤥� � CX
; ���ਬ��:
;       Y db 5 dup (0),'$' ;��६����� "Y" (5 ᨬ����� � �������騩 '$')
;
;      mov BX, offset Y    ;���� ��६����� "Y" � ॣ���� BX    ���:  lea BX,Y
;      call ReadS          ;���� ⥪�� � "Y" (�� Enter,�� �� ����� 5 ᨬ�����)
;                          ;� ॣ���� CX �㤥� ���-�� ��������� ᨬ�����
;      text Y              ;����� ���������� ⥪�� �� ��६����� "Y"
;
;������������������������������������������������������������������������������


;----���� ⥪�� � ���ᨢ � ���ᮬ �� BX (���� � CX ���-�� ��������� ᨬ�����)
; ���ਬ�� ���ᠭ ���ᨢ:
;   Y db 5 dup (0),'$'  ;��६����� "Y" (5 ᨬ����� � �������騩 ᨬ��� '$')
; �맮�:
;   mov BX, offset Y    ;���� ��६����� "Y" � ॣ���� BX    ���:  lea BX,Y
;   call ReadS          ;���� ⥪�� � "Y" (�� Enter, �� �� ����� 5 ᨬ�����)
;                       ;� ॣ���� CX �㤥� ���-�� ��������� ᨬ�����
;   text Y              ;����� ���������� ⥪�� �� ��६����� "Y"
 
ReadS:
  push AX
  push BX
    mov CX, 0           ;���-�� ��������� ᨬ�����
ReadS_1:
    mov AL,[BX]         ;ᨬ��� �� ��६�����
    cmp AL, '$'         ;� ��६����� 㦥 ���� ᨬ��� '$' (����� �����) ?
    jnc ReadS_2         ;�᫨ ��६����� �����稫���
  mov AH,10h
  int 16h               ;���� ᨬ���� � ����������
    cmp AL,13
    jz ReadS_2          ;�᫨ ����� Enter, � �����襭��
  mov [BX],AL           ;������ ᨬ��� � ��६�����
  mov AH,0Eh                  
  int 10h               ;����� ����⮣� ᨬ���� �� AL
    inc BX              ;� ᫥���饩 �祩�� ��६�����
    inc CX              ;���-�� ��������� ᨬ�����
  jmp ReadS_1
ReadS_2:
    mov AL,'$'          ;�����襭�� ����� (ᨬ��� '$' � ����� ⥪��)
    mov [BX],AL
  pop BX
  pop AX
  ret



;--------���� 10-�� �᫠ � AX  (�� ����� 65535) ⮫쪮 ����

 Read_ db '$',5 dup (0)        ;���� ��� �᫠ (��࠭�祭 ᨬ����� '$')
 Read_M dw 10,100,1000,10000   ;�����⥫� (��� 2..5 ࠧ�冷� �ࠢ� ������)

ReadAX:
  push BX
  push CX
  push DX
  push SI
  push DI
                ;---���� ᨬ����� (��� �᫠) � ����
  mov SI, 1               ;㪠��⠫� � ��砫� ���� (���������: �� 1 �� 5)
ReadAX_2:
  mov AH,10h
  int 16h                 ;���� ᨬ���� � ���������� � AL
    cmp AL,13
    jz ReadAX_3           ;�᫨ ����� Enter, � ����� �����, �� ��ࠡ���
      cmp AL,'0'
      jc ReadAX_2
      cmp AL,'9'+1
      jnc ReadAX_2        ;�᫨ ����� �� ���, � �� ����� �����
  mov AH,0Eh
  int 10h                 ;����� ���������� ᨬ���� �� AL
    mov Read_[SI],AL      ;������ ᨬ���� � ����
    inc SI                ;���稪 ����権 � ���� ��ࠢ� (1..5)
      cmp SI,6            ;���� ���稫�� (������� 5 ᨬ�����)?
      jnz ReadAX_2        ;�᫨ ���� �� ���稫��, ���� ᫥���饣� ᨬ����
                ;---��ࠡ�⪠ ���������� �᫠: �ࠢ� ������, �� '$'
ReadAX_3:
  mov DI,offset Read_M    ;���� �����⥫��
  dec SI                  ;���稪 ����権 ����� (�� ��᫥����, ������� ����)
  mov CH,0                ;���訩 ���� ������⥫� =0
  mov CL,Read_[SI]        ;����訩 ���� ������⥫� =������ ��� (ᨬ���)
  sub CL,30h              ;��� ����� ����� ᨬ���� �� 30h
ReadAX_4:
  dec SI                  ;㪠��⥫� ����樨 ᤢ����� �����
  mov AL,Read_[SI]        ;ᨬ��� �� ���� � ����樨 SI
    cmp AL,'$'            ;�᫨ ����� �᫠ (����� ��砫� ����), � ��室
    jz ReadAX_5
  sub AL,30h              ;��� ����� ����� ᨬ���� �� 30h
  mov BX,[DI]             ;�����⥫� ��� ����  (10,100,1000,10000)
  add DI,2                ;� ᫥���饬� �����⥫�
  mov AH,0                ;���訩 ���� ᮬ����⥫� -����
  mul BX                  ;㬭������ ���� �� �����⥫�:  AX = AL * BX
  add CX,AX               ;���������� १���� � CX
  jmp ReadAX_4
                ;---�᫮ ���稫���
ReadAX_5:
  push CX
  pop AX                  ;�� ������⥫� � AX
    pop DI
    pop SI
    pop DX
    pop CX
    pop BX
  ret
