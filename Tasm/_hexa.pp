;��������� ����ணࠬ�� ��� ����������������� �ᥫ ���������������������������
;
;call HexAL      ; ����� 16-�� �᫠ �� AL   (���    ����:    '00'    'FF' )
;call HexAX      ; ����� 16-�� �᫠ �� AX   (���� ����:  '0000'  'FFFF' )
; 
;call BinAL      ; �����  2-�� �᫠ �� AL   (��ᥬ� ���:     '00100011'   )
;
;call InputAL    ; ����   16-�� �᫠ � AL    (���    ����)
;call InputAX    ; ����   16-�� �᫠ � AX    (���� ����)
;                ;  (�������� ⮫쪮 '0'..'9' 'A'..'F' 'a'..'f' � ��-������)
;
;������������������������������������������������������������������������������



;########################################################### ⥪��� ����ணࠬ�

;------  ������ �᫠ �� AL  (��� 16-� ����)
HexAL:
   push AX
   push BX
   push CX
  mov CL,AL      ;���⠥��� �᫮
  lea BX,HexAL_    ;���� ⠡����:   ���  mov BX,offset HexAL_
    shr AL,1     ;ᤢ�� ���襩 ����  (������)
    shr AL,1
    shr AL,1
    shr AL,1
  XLAT           ;� AL �� [BX][AL]
  mov AH,0Eh     ;����� ᨬ���� �� AL
  int 10h 
    mov AL,CL      ;���⠥��� �᫮
    and AL,0Fh     ;���⪠ ��.���� (������)
  XLAT           ;� AL �� [BX][AL]
  mov AH,0Eh     ;����� ᨬ���� �� AL
  int 10h 
   pop CX
   pop BX
   pop AX
   ret
 HexAL_ db "0123456789ABCDEF" 


;------  ������ �᫠ �� AX  (���� 16-� ����)
HexAX:
  xchg AH,AL
  call HexAL
  xchg AH,AL
  call HexAL
  ret

;------ ����� ��������� �᫠ �� AL:       "00100011"
BinAL:
   push AX
   push BX
   push CX
  mov CX,8             ;���-�� ᤢ����
  mov BH,AL            ;���⠥��� �᫮
  mov BL, 10000000b    ;��砫쭠� ��᪠ (����� ���訩 ࠧ��)
BinAL_1:
  mov AL,'0'           ;�।��������, �� ࠧ�� �㫥��� 
  test BH,BL           ;�ࠢ����� � ��᪮� (0 -�᫨ ࠧ�� 0, ���� �� 0)
  jz BinAL_2         
   inc AL              ;�᫨ ࠧ�� ������, � AL='1'
BinAL_2:
  mov AH,0Eh
  int 10h              ;����� "0" ��� "1"
  shr BL,1             ;ᤢ�� ��᪨ ��ࠢ� 
  dec CX               ;������� 8 ࠧ 
  jnz BinAL_1
   pop CX
   pop BX
   pop AX
  ret


;------ ���� ����� 16-���� ��� � AX (� �宬)
InputAX:       
  push BX
    call InputAL           ;���訩 ����
    mov BH,AL
    call InputAL           ;����訩 ����
    mov AH,BH
  pop BX
  ret


;------ ���� ���� 16-���� ��� � AL (� �宬)
InputAL:       
  push BX
  push CX
    call Input_1           ;���� ��ࢮ� ����
    mov BH,AL             ;��࠭���� ��ࢮ� ����
    call Input_pp          ;����� ��ࢮ� ����
      rol BH,1            ;�८�ࠧ������ ��ࢮ� ����
      rol BH,1
      rol BH,1
      rol BH,1
    call Input_1           ;���� ��ன ����
    mov BL,AL
    call Input_pp          ;����� ��ன ����
      mov AL,BL           ;ᡮઠ ����
      add AL,BH
  pop CX
  pop BX
  ret


    ;--- �ᯮ����⥫쭠�: ���� 16-�筮� ����   (⮫쪮  0..9 A..F a..f )
Input_1:   
  mov AH,10h            ;���� ᨬ���� � AL
  int 16h
    cmp AL,30h
    jc Input_1           ;�᫨ ����� "0", �� �����
    cmp AL,3Ah
    jc  Input_2          ;�� "0" �� "9", �� ��室
  and AL,11011111b      ;�㪢� -�����쪨� � ��������
  cmp AL,41h        
  jc Input_1             ;����� "A", �� �����
    cmp AL,47h
    jnc Input_1          ;����� "�", �� �����
  sub AL,07h            ;�� "A" �� "F", ��ࠡ�⪠
Input_2:             
  sub AL,30h            ;�� "0" �� "9", ��ࠡ�⪠
  ret

  ;--- �ᯮ����⥫쭠� ����ணࠬ��:  ����� ���� �� AL
Input_pp:     
   and AX,000Fh         
   mov BL,AL            
   mov CX,070Ah         
   div CL               
   mul CH               
   add AL,30h           
   add AL,BL            
   mov AH,0Eh           
   int 10h        
   ret
