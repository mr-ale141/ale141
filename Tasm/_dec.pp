;��������� ����ணࠬ�� ��� ���������� �ᥫ ����������������������������������
;
;call DecAL      ; ����� 10-�� �᫠ �� AL   (���� 4 ����樨)
;
;call DecAX      ; ����� 10-�� �᫠ �� AX   (���� 8 ����権) 
;
;������������������������������������������������������������������������������


;########################################################### ⥪��� ����ணࠬ�

;------ ����� ����������� �᫠ �� AL � 4 �������:  "...3"  "..12"  ".255"
DecAL:
  push AX
  push CX
  push DX
              ;--�ନ஢���� ॣ���஢ CH,CL,DH (�� ������� ����)
  mov AH,0          ;���ਬ��, AL=234  (���ᨬ��쭮 �� 10-�� ����)
  mov DL,100     ;������ �� 100
  div DL         ;����� ���: AL=2 � ���⮪: AH=34
  mov CH,AL      ;����� ���: CH=2
  mov AL,AH      ;���⮪ ������ �����
    mov AH,0
    mov DL,10    ;������ �� 10
    div DL       ;�।��� ���: AL=3 � ���⮪ AH=4
    mov CL,AL    ;�।��� ���: CL=3
    mov DH,AH    ;������ ���: DH=4    
  add CH,30h     ;����� ��� � CH - '2' (����� ᨬ���� �� 30h ����� ����)
  add CL,30h     ;�।��� ��� � CL - '3'
  add DH,30h     ;������ ��� � DH - '4'
              ;--��஡����� �।�㫨 � ॣ�����
  cmp CH,'0'     ;����� ���=0 ?
  jnz DecAL_1    ;�᫨ ���, � ����� ��� ���
  mov CH,' '     ;�᫨ ��, �������� '0' �஡����
    cmp CL,'0'   ;�।��� ���=0 ?
    jnz DecAL_1  ;�᫨ ���, � ����� ��� ���
    mov CL,' '   ;�᫨ ��, �������� '0' �஡����
              ;--����� ��� �� ॣ���஢ CH,CL,DH
DecAL_1:
  mov AL,' '     ;����� �஡��� 
  mov AH,0Eh         
  int 10h
    mov AL,CH    ;����� ���襩 ���� 
    int 10h
  mov AL,CL      ;����� �।��� ���� 
  int 10h
    mov AL,DH    ;����� ����襩 ����
    int 10h
  pop DX   
  pop CX   
  pop AX
  ret


;------ ����� ����������� �᫠ �� AX � 8 �������:  ".......3"  "...65535"
DecAX:                                                             
  push AX
  push BX
  push CX
  push DX
              ;--����� ��� �஡����
  push AX
  mov AL,' '     
  mov AH,0Eh         
  int 10h
  int 10h
  int 10h
  pop AX
DecAX_1:
  mov CX,0       ;䫠�: �।�㫥� �� �뫮
  mov DX,0
  mov BX,10000   ;����⥫� 10000
  call Dec_pp
  mov BX,1000    ;����⥫�  1000
  call Dec_pp
  mov BX,100     ;����⥫�   100 
  call Dec_pp
  mov BX,10      ;����⥫�    10
  call Dec_pp
  mov BX,1       ;����⥫�     1
  call Dec_pp
DecAX_2:      ;--��室
  pop DX
  pop CX
  pop BX
  pop AX
  ret
         ;�ᯮ���.�/� ��ࠡ�⪨ � ���� ����
Dec_pp:
  div BX         ;楫�� � AX, ���⮪ � DX
  add AL,30h     ;���� � ᨬ��� (����� ᨬ���� �� 30h ����� ����)
  cmp CX,0       ;䫠� �।���
  jnz Dec_pp1    ;�।�㫨 ���稫���
    mov CX,1     ;��ࠡ�⪠ �।�㫥�
    cmp AL ,'0'
    jnz Dec_pp1
      mov AL,' ' ;�஡�� ����� 0
      mov CX,0
Dec_pp1:      ;--�᫨ AX=0, � �� �⮬ AL=' ' � BX=1
  cmp AL,' '   
  jnz Dec_pp2  
  cmp BX,1       ; �᫨ AL �஡��
  jnz Dec_pp2    ; � �᫨ �� �����⢥���� ���,
    mov AL,'0'   ; � �������� �஡�� ᨬ����� '0'
Dec_pp2:  
  mov AH,0Eh     ;����� ����
  int 10h
  mov AX,DX      ;���⮪ ��� �������
  mov DX,0       ;��.�������� ��������
  ret
