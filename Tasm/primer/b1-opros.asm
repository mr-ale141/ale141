;컴컴컴컴컴� 뜋똿�� 췅┬쵟�щ� 歲Б�ギ� 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
; 룯�졻좐恂� 췅┬쵟�щ� 歲Б�ル � ⓨ ぎㅻ. 귣若� - か젪②ⅸ Esc

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS

Metka:
  mov AH,10h
  int 16h         ;��昔� (ぎ� � AL, αエ AL=0 Œ� 224, 獸 � AH -召ζぎ�)

  cmp AL,27       ;췅쬊獸 Esc ?
  jnz Metka0      ;αエ 쩆, 獸 �音��
    PAUSE
    STOP
Metka0:
  WRITELN         ;��誓¡� ゃ褻���

  cmp AL,0
  jz Metka3       ;αエ 召ζぎ� (押�ゆŦ췅レ췅� か젪②�: F1,F2...)
  cmp AL,224
  jz Metka3       ;αエ 召ζぎ� (ゃ褻�惜좑 か젪②�: 飡誓オ�,Home,PgUp...)
  cmp AL,32
  jc Metka2       ;αエ ぎㅻ ㄾ 32 (Enter,Tab,BackSpace...)

      ;--歲Б�� (ぎㅻ 32..255)
Metka1:
  TEXT T1         ;收め� "歲Б��"
  WRITE AL        ;�η졻� 歲Б�쳽
  TEXT T2         ;收め� "ぎ�"
  call DecAL      ;�η졻� ぎ쩆
  jmp Metka

      ;--�� 歲Б�� (ぎㅻ 1..31)
Metka2:
  TEXT T0         ;收め� "�� 歲Б��"
  WRITE ' '       ;�昔‥�
  TEXT T2         ;收め� "ぎ�"
  call DecAL      ;�η졻� ぎ쩆
  jmp Metka

      ;--召ζぎ�
Metka3:
  TEXT T3         ;收め� "뫍ζ뒶�"
  mov AL,AH
  call DecAL      ;�η졻� 召ζぎ쩆
  jmp Metka

 T0 db  "뜢 歲Б�� ",'$'
 T1 db  "뫅Б��    ",'$'
 T2 db  "    뒶�",'$'
 T3 db  "  뫍ζ뒶�",'$'

  include _dec.pp
end Start
