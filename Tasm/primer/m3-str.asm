;컴컴컴컴컴� 몤릮뒋: �誓�□젳�쥯��� 歲Б�ギ� 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
; 뙛ゥ�履�� 쳽殊�稅�� - � 쭬＋젪�瑜    � 뜝�黍Д�:
; 뇿＋젪�瑜 쳽殊�稅�� - � 쵟ゥ�履��    �   ⓤ若ㄽ좑 飡昔첓:  "yfj-27^RQT_十�"
; 롟�젷彛瑜 歲Б�ル �� �㎚��禎恂�      �   �音�ㄽ좑 飡昔첓:  "YFJ-27^rqt_十�"
;   (ぎ� 쵟ゥ�履�� 쳽殊�稅�� ▲あ� 
;    췅 32 ‘レ蜈 ぎ쩆 쭬＋젪���)                                        걼鼇

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS
  TEXT Y                ;�η졻� 收め�� ⓤ若ㄽ�．
  WRITELN

  mov BX, 0             ;췅�젷彛硫 Þㄵめ
  mov CX, Len-1         ;ぎ�-¡ 歲Б�ギ� (줎⒱)
Metka:
  mov AL, Y[BX]         ;歲Б�� 收め�� � AL
                  ;-將� 쭬＋젪췅� 쳽殊�稅좑 ?
  cmp AL, 'A'
  jc Metka1             ;�β
  cmp AL, 'Z'+1
  jnc Metka1            ;�β
    add AL,32           ;쩆, �黍줎˘筍 32
    mov Y[BX],AL        ;�㎚�����硫 歲Б�� 貰魚젺ⓥ� � 收め收
    jmp Metka2          ;췅 �昔ㄾウ���� �□젩�洙�
                  ;-將� 쵟ゥ�履좑 쳽殊�稅좑 ?
Metka1:
  cmp AL, 'a'
  jc Metka2             ;�β
  cmp AL, 'z'+1
  jnc Metka2            ;�β
    sub AL,32           ;쩆, �揖α筍 32
    mov Y[BX],AL        ;�㎚�����硫 歲Б�� 貰魚젺ⓥ� � 收め收

Metka2:           ;-� 笹ⅳ莘耀с 歲Б�ャ
  inc BX                ;� 笹ⅳ莘耀с 歲Б�ャ
  dec CX                ;與か �誘�キⓥ碎 CX �젳
  jnz Metka

  TEXT Y                ;�η졻� 收め�� �誓�□젳�쥯���．
  PAUSE
  STOP


  Y db  "yfj-27^RQT_十�", '$'
  Len = $ - Y

end Start
