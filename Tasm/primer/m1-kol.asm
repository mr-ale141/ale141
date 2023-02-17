;����������� ������: ������⢮ �ᥫ, ���室��� �᫮��� ���������������������
; ���⠥��� ���ᨢ � ��������� ������⢮ �ᥫ, ������ 10

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS
  TEXT T1            ;⥪�� "���ᨢ"
  call Prim          ;����� ����⮢ ���ᨢ�

                  ;---��宦����� ���-�� ����⮢ (� AL)
  mov BX, offset Y   ;���� ���ᨢ�
  mov CX, Len        ;���-�� ����⮢ ���ᨢ�
  mov AL,0           ;���.���-�� ���������
Metka:
  mov AH, [BX]       ;����� ���ᨢ� � AH
  cmp AH,10          ;�ࠢ����� � 10 
  jnc Metka1         ;�᫨ ����� 10 � �����, � AL 㢥��稢��� �� ����
    inc AL           ;㢥��祭�� ���-�� (�᫨ ����� ����� 10)
Metka1:
  inc BX             ;� ᫥���饬� ������ ���ᨢ�
  dec CX             ;横� �믮������ CX ࠧ
  jnz Metka

  TEXT T2            ;⥪�� "�������"
  call DecAL         ;����� ���-�� ��������� ����⮢ (�� AL)

  PAUSE
  STOP

 include _dec.pp     ;����� � ����ணࠬ��� "DecAL"

        ;---����ணࠬ�� ���� ���ᨢ� "Y" �� "Len" ����⮢
PriM:
    push AX
    push BX
    push CX
  mov BX, offset Y   ;���� ���ᨢ�
  mov CX, Len        ;���-�� ����⮢ ���ᨢ�
Prim1:
  mov AL,[BX]        ;����� ���ᨢ� � AL
  call DecAL         ;����� AL � 10-��� ���� (�/� �� ����� "_dec.pp")
  inc BX             ;� ᫥���饬� ������ ���ᨢ�
  dec CX             ;㬥��襭�� ���稪�
  jnz Prim1          ;�᫨ ������ �� �����稫���, � � ��砫� 横��
    pop CX
    pop BX
    pop AX
  ret

  Y db  2, 23, 5, 16, 7, 10, 35, 123, 9       ;���ᨢ
  Len = $ - Y                                 ;���-�� ����⮢

  T1 db       "�������� ���ᨢ�:     ", '$'
  T2 db 13,10,"���-�� ��������� = ",    '$'

end Start
