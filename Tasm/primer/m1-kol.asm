;컴컴컴컴컴� ��몣늹: ぎエ曄飡¡ 葉醒�, ��ㅵ�ㅿ蟯� 信ギ˘� 컴컴컴컴컴컴컴컴컴컴�
; 룯�졻젰恂� 쵟遜Ð � 췅ħ����� ぎエ曄飡¡ 葉醒�, Д�麟ⓨ 10

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS
  TEXT T1            ;收め� "쵟遜Ð"
  call Prim          ;�η졻� 姉�Д�獸� 쵟遜Ð�

                  ;---췅若┐���� ぎ�-쥯 姉�Д�獸� (� AL)
  mov BX, offset Y   ;젮誓� 쵟遜Ð�
  mov CX, Len        ;ぎ�-¡ 姉�Д�獸� 쵟遜Ð�
  mov AL,0           ;췅�.ぎ�-¡ 췅ħ���音
Metka:
  mov AH, [BX]       ;姉�Д�� 쵟遜Ð� � AH
  cmp AH,10          ;蓀젪����� � 10 
  jnc Metka1         ;αエ 姉�Д�� 10 � ‘ゥ�, 獸 AL 瑟�エ葉쥯筍 �� 췅ㄾ
    inc AL           ;瑟�エ曄��� ぎ�-쥯 (αエ 姉�Д�� Д�麟� 10)
Metka1:
  inc BX             ;� 笹ⅳ莘耀с 姉�Д�栒 쵟遜Ð�
  dec CX             ;與か �誘�キⓥ碎 CX �젳
  jnz Metka

  TEXT T2            ;收め� "췅ħ���"
  call DecAL         ;�η졻� ぎ�-쥯 췅ħ���音 姉�Д�獸� (�� AL)

  PAUSE
  STOP

 include _dec.pp     ;Мㅳレ � ��ㄿ昔｀젹М� "DecAL"

        ;---��ㄿ昔｀젹쵟 �η졻� 쵟遜Ð� "Y" �� "Len" 姉�Д�獸�
PriM:
    push AX
    push BX
    push CX
  mov BX, offset Y   ;젮誓� 쵟遜Ð�
  mov CX, Len        ;ぎ�-¡ 姉�Д�獸� 쵟遜Ð�
Prim1:
  mov AL,[BX]        ;姉�Д�� 쵟遜Ð� � AL
  call DecAL         ;�η졻� AL � 10-��� ˘ㄵ (�/� �� Мㅳワ "_dec.pp")
  inc BX             ;� 笹ⅳ莘耀с 姉�Д�栒 쵟遜Ð�
  dec CX             ;僧��麟���� 淞β葉첓
  jnz Prim1          ;αエ 姉�Д�瞬 �� 쭬ぎ�葉エ刷, 獸 � 췅�젷� 與か�
    pop CX
    pop BX
    pop AX
  ret

  Y db  2, 23, 5, 16, 7, 10, 35, 123, 9       ;쵟遜Ð
  Len = $ - Y                                 ;ぎ�-¡ 姉�Д�獸�

  T1 db       "씖�Д�瞬 쵟遜Ð�:     ", '$'
  T2 db 13,10,"뒶�-¡ 췅ħ���音 = ",    '$'

end Start
