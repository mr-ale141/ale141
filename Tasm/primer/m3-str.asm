;����������� ������: �८�ࠧ������ ᨬ����� ����������������������������������
; �����쪨� ��⨭᪨� - � ��������    � ���ਬ��:
; �������� ��⨭᪨� - � �����쪨�    �   ��室��� ��ப�:  "yfj-27^RQT_䨟"
; ��⠫�� ᨬ���� �� ����������      �   ��室��� ��ப�:  "YFJ-27^rqt_䨟"
;   (��� �����쪮� ��⨭᪮� �㪢� 
;    �� 32 ����� ���� ���������)                                        ���

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS
  TEXT Y                ;����� ⥪�� ��室����
  WRITELN

  mov BX, 0             ;��砫�� ������
  mov CX, Len-1         ;���-�� ᨬ����� (����)
Metka:
  mov AL, Y[BX]         ;ᨬ��� ⥪�� � AL
                  ;-�� ��������� ��⨭᪠� ?
  cmp AL, 'A'
  jc Metka1             ;���
  cmp AL, 'Z'+1
  jnc Metka1            ;���
    add AL,32           ;��, �ਡ����� 32
    mov Y[BX],AL        ;��������� ᨬ��� ��࠭��� � ⥪��
    jmp Metka2          ;�� �த������� ��ࠡ�⪨
                  ;-�� �����쪠� ��⨭᪠� ?
Metka1:
  cmp AL, 'a'
  jc Metka2             ;���
  cmp AL, 'z'+1
  jnc Metka2            ;���
    sub AL,32           ;��, ������ 32
    mov Y[BX],AL        ;��������� ᨬ��� ��࠭��� � ⥪��

Metka2:           ;-� ᫥���饬� ᨬ����
  inc BX                ;� ᫥���饬� ᨬ����
  dec CX                ;横� �믮������ CX ࠧ
  jnz Metka

  TEXT Y                ;����� ⥪�� �८�ࠧ��������
  PAUSE
  STOP


  Y db  "yfj-27^RQT_䨟", '$'
  Len = $ - Y

end Start
