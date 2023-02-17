;����������� ������ ���������� ᨬ����� ���������������������������������������
; �������� ��������� ᨬ���� � �� ����. ��室 - �����襩 Esc

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS

Metka:
  mov AH,10h
  int 16h         ;���� (��� � AL, �᫨ AL=0 ��� 224, � � AH -ᯥ檮�)

  cmp AL,27       ;����� Esc ?
  jnz Metka0      ;�᫨ ��, � ��室
    PAUSE
    STOP
Metka0:
  WRITELN         ;��ॢ�� �����

  cmp AL,0
  jz Metka3       ;�᫨ ᯥ檮� (�㭪樮���쭠� ������: F1,F2...)
  cmp AL,224
  jz Metka3       ;�᫨ ᯥ檮� (����ୠ� ������: ��५��,Home,PgUp...)
  cmp AL,32
  jc Metka2       ;�᫨ ���� �� 32 (Enter,Tab,BackSpace...)

      ;--ᨬ��� (���� 32..255)
Metka1:
  TEXT T1         ;⥪�� "ᨬ���"
  WRITE AL        ;����� ᨬ����
  TEXT T2         ;⥪�� "���"
  call DecAL      ;����� ����
  jmp Metka

      ;--�� ᨬ��� (���� 1..31)
Metka2:
  TEXT T0         ;⥪�� "�� ᨬ���"
  WRITE ' '       ;�஡��
  TEXT T2         ;⥪�� "���"
  call DecAL      ;����� ����
  jmp Metka

      ;--ᯥ檮�
Metka3:
  TEXT T3         ;⥪�� "���抮�"
  mov AL,AH
  call DecAL      ;����� ᯥ檮��
  jmp Metka

 T0 db  "�� ᨬ��� ",'$'
 T1 db  "������    ",'$'
 T2 db  "    ���",'$'
 T3 db  "  ���抮�",'$'

  include _dec.pp
end Start
