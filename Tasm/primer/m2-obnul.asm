;컴컴컴컴컴� ��몣늹: �∼乘���� 曄狩音 姉�Д�獸� 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
; 룯�졻젰恂� 쵟遜Ð ㄾ � ��笹� �□젩�洙�       � 뜝�黍Д�:   "3 2 8 5 7 6 4 9"
;  (� ㄲ愼 飡昔첓�)                            �             "3 0 0 5 7 0 0 9"
; � 曄狩音 Й젮鼇� �젳涉� "0", � �ηβ�音 "-1"

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS
  call Prim          ;�η졻� ⓤ若ㄽ�． 쵟遜Ð�
  WRITELN

  lea BX, Y          ;젮誓� 쵟遜Ð�
  mov CX, Len        ;ぎ�-¡ 姉�Д�獸� 쵟遜Ð�
Metka:
  mov AL, [BX]       ;姉�Д�� 쵟遜Ð� � AL
                     ;�∼乘ⓥ� ㏇� �젳涉ㅻ, む�Д Й젮蜈．
  test AL,00000001b  ;  (ㄻ� 曄狩音 葉醒� ��ャ葉恂� 0, ㄻ� �ηβ�音 1)
  jnz Metka1         ;αエ 姉�Д�� �ηβ�硫, �� 췅ㄾ ⅲ� �∼乘汀�
    mov AL,0         ;  �∼乘���� 姉�Д��� 쵟遜Ð� (αエ �� 曄狩硫)
    mov [BX],AL      ;  Œ�:   mov byte ptr [BX], 0
Metka1:
  inc BX             ;� 笹ⅳ莘耀с 姉�Д�栒 쵟遜Ð�
  dec CX             ;與か �誘�キⓥ碎 CX �젳
  jnz Metka

  call Prim          ;�η졻� �誓�□젳�쥯���． 쵟遜Ð�
  PAUSE
  STOP

  Y db  3, 2, 8, 5, 7, 6, 4, 9
  Len = $ - Y

  include _dec.pp

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

end Start
