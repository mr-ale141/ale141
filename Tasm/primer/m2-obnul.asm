;����������� ������: ���㫥��� ���� ����⮢ �������������������������������
; ���⠥��� ���ᨢ �� � ��᫥ ��ࠡ�⪨       � ���ਬ��:   "3 2 8 5 7 6 4 9"
;  (� ���� ��ப��)                            �             "3 0 0 5 7 0 0 9"
; � ���� ����訩 ࠧ�� "0", � ������ "-1"

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS
  call Prim          ;����� ��室���� ���ᨢ�
  WRITELN

  lea BX, Y          ;���� ���ᨢ�
  mov CX, Len        ;���-�� ����⮢ ���ᨢ�
Metka:
  mov AL, [BX]       ;����� ���ᨢ� � AL
                     ;���㫨�� �� ࠧ���, �஬� ����襣�
  test AL,00000001b  ;  (��� ���� �ᥫ �������� 0, ��� ������ 1)
  jnz Metka1         ;�᫨ ����� �����, �� ���� ��� �������
    mov AL,0         ;  ���㫥��� ����� ���ᨢ� (�᫨ �� ���)
    mov [BX],AL      ;  ���:   mov byte ptr [BX], 0
Metka1:
  inc BX             ;� ᫥���饬� ������ ���ᨢ�
  dec CX             ;横� �믮������ CX ࠧ
  jnz Metka

  call Prim          ;����� �८�ࠧ�������� ���ᨢ�
  PAUSE
  STOP

  Y db  3, 2, 8, 5, 7, 6, 4, 9
  Len = $ - Y

  include _dec.pp

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

end Start
