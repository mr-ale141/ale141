;컴컴컴컴컴� 똿뜛 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
; 룼 Д�� ��誓Д�젰恂� �젹첓 か젪②젹� "궋�齧" � "궘��"    -� 承�昔�
;                          � か젪②젹� "궖ⅱ�" � "궚�젪�"  -�� む膝�
; 뤲� 췅쬊殊� Enter �η졻젰恂� 췅㎖젺�� �濡�젺��． �勝も�
; 귣若� - か젪②ⅸ Esc

  .model tiny
  .code
  org 100h
  include _abc.mac
Start:
  CLS
  VIDEO
                  
  call Copy       ;ぎ�ⓣ�쥯筍 Д�� �� 收め�� 췅 咨�젺
  mov SI, Adres   ;� "SI" -咨�젺�硫 젮誓� 收ゃ耀． (��舒�．) �勝も� Д��

Metka0:
  KURSOR 0,0
  TEXT help       ;��ㅱ첓㎦� � か젪②졾
Metka:
  mov DH, Cwet    ;��첓쭬筍 �젹ゃ (��誓む졹ⓥ� 收ゃ蟯� �勝も Д�� 歟β�� Cwet)
  call Kras       
                  
  mov AH,10h      ;��昔� か젪쯄栒贍 (ぎ� � "AL", 召ζぎ� � "AH")
  int 16h
                  
  mov DH, Cwet0   ;嵩�졻� �젹ゃ (��誓む졹ⓥ� 收ゃ蟯� �勝も Д�� 歟β�� Cwet0)  
  call Kras       

    ;-----------젺젷�� 췅쬊獸．
  cmp AL,27       ;αエ 췅쬊獸 "Esc" -�音��
  jnz Metka1       
    PAUSE                        ;�音��
    STOP

    ;------------굧늾
Metka1:
  cmp AH, 80      ;αエ 췅쬊獸 "궘��"  - �젹ゃ ˛�� (ㄾ 承���)
  jnz Metka2
    add SI, 160                  ;��誓淞ⓥ졻� 젮誓� �勝も� ˛��
    cmp SI, Adres+Kol*160        ;蓀젪�ⓥ� � 젮誓貰� ぎ�η��． �勝も�
    jc Metka                     ;αエ ι� � Д��, 獸 � 췅�젷� 與か�
      sub SI, 160                ;αエ �泣エ 쭬 Д��, 獸 �젫 췅쭬�
      jmp Metka                  ; � 췅 췅�젷� 與か�

Metka2:
  cmp AH, 77      ;αエ 췅쬊獸 "궚�젪�"  - �젹ゃ ˛�� (�� む膝�)
  jnz Metka3
    add SI, 160                  
    cmp SI, Adres+Kol*160  
    jc Metka               
      mov SI, Adres              ;αエ �泣エ 쭬 Д��, 獸 SI -췅 ��舒硫 �勝も
      jmp Metka                

    ;------------굚뀗�
Metka3:
  cmp AH, 72      ;αエ 췅쬊獸 "궋�齧" - �젹ゃ ⇔�齧 (ㄾ 承���)
  jnz Metka4
    sub SI, 160                  ;��誓淞ⓥ졻� 젮誓� �勝も� ⇔�齧
    cmp SI, Adres                ;蓀젪�ⓥ� � 젮誓貰� 췅�젷彛�． �勝も�
    jnc Metka                    ;αエ ι� � Д��, 獸 � 췅�젷� 與か�
      add SI, 160                ;αエ �泣エ 쭬 Д��, 獸 �젫 췅쭬�
      jmp Metka                  ; � 췅 췅�젷� 與か�

Metka4:
  cmp AH, 75      ;αエ 췅쬊獸 "궖ⅱ�" - �젹ゃ ⇔�齧 (�� む膝�)
  jnz Metka5
    sub SI, 160         
    cmp SI, Adres       
    jnc Metka           
      mov SI,Adres+Kol*160-160   ;αエ �泣エ 쭬 Д��, 獸 SI -췅 ��笹ⅳ�Ł �勝も
      jmp Metka                

    ;------------궀룑땷닋� �勝も
Metka5:
  cmp AL,13       ;αエ 췅쬊獸 "Enter" - 稅��ⓣ�쥯筍 �� �젹え � ㅰ膝�� Д飡�
  jnz Metka            ;췅 췅�젷� 與か�
    mov DH, 0Ch        ;��誓む졹ⓥ� 收ゃ蟯� �勝も Д�� 歟β�� 12
    call Kras       
                       ;稅��ⓣ�쥯筍 � 젮誓�� ES:[SI]  (�� �젹え) "Len" 歲Б�ギ�
                       ;            � 젮誓�  ES:[BX]  (� ´齧�傳 飡昔ゃ)
    push SI               ;쭬��Лⓥ� 젮誓� 췅�젷� �勝も�
    mov BX, 0*160+72*2    ;ゃ쩆 ぎ�ⓣ�쥯筍 (飡昔첓 0, ��㎤與� 72)
    mov CX, Len           ;稅�レぎ 歲Б�ギ� ぎ�ⓣ�쥯筍
  Metka6:
    mov AL,      ES:[SI]  ;ˇ汀� � 咨�젺�
    mov ES:[BX],   AL     ;ぎ�ⓣ�쥯筍 � ´齧�傳 飡昔ゃ
    mov ES:[BX+1], DH     ;��誓む졹ⓥ� � ´齧�ⅸ 飡昔ぅ
    add SI,2              ;��誓淞β 젮誓�� � Д��
    add BX,2              ;��誓淞β 젮誓�� � ´齧�ⅸ 飡昔ぅ
    dec CX                ;�誘�キⓥ� CX �젳
    jnz Metka6
    pop SI                ;¡遜�젺�˘筍 젮誓� 췅�젷� �勝も�

    PAUSE
  jmp Metka0      ;췅 췅�젷� 與か� (췅 ��ㅱ첓㎦�)
                  

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
                        ;-歟β �勝も�� Д��
  Cwet  db 4Eh              ;歟β � �젹ぅ
  Cwet0 db 0Ah              ;歟β ‥� �젹え
                        ;-收め� �勝も�� Д�� (�ㄸ��ぎ¡� ㄻÞ�)
  T1 db  " New  "        
     db  " Load "
     db  " Save "
  T2 db  " Edit "
                        ;-ㄻÞ� � ぎ�-¡ �勝も��
  Len =   $ - T2            ;ㄻÞ� 첓┐�． �勝も� Д��
  Kol = ( $ - T1) / Len     ;ぎ�-¡ �勝も�� Д�� (ㄻÞ� ㏇ε �勝も��, ㄵゥ�췅�
                            ;                     췅 ㄻÞ� �ㄽ�． �勝も�)
                        ;-ぎ�西Þ졻� Д�� 췅 咨�젺�
   Y=12                     ; Y - �� 0 �� 25-Kol
   X=20                     ; X - �� 0 �� 80-Len
  Adres = Y*160 + X*2       ;젮誓� Д�� 췅 咨�젺�

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  ;--�/� 뒑룉릮��뜄� "Kol" �勝も�� Д�� ㄻÞ�� �� "Len" 歲Б�ギ� 첓┐硫
  ;                   �� ��誓Д���� "T1" � �∥졹筍 췅 咨�젺� "Adres"
  ;                     (첓� ㄲ僧�惜硫 쵟遜Ð 歲Б�ギ�, �.�. 쵟遜Ð 飡昔�)
Copy:
  mov SI, Adres      ;젮誓� Д�� 췅 咨�젺�
  mov BX, offset T1  ;젮誓� ��誓Д���� 收め�� Д��
  mov DI, Kol        ;ぎ�-¡ 飡昔� Д�� 
Copy1:
    push BX          ;貰魚젺ⓥ� 췅�젷� 收め��
    push SI          ;貰魚젺ⓥ� 췅�젷� 飡昔え 咨�젺�
  mov AH, Cwet0      ;첓え� 歟β��
  mov CX, Len        ;稅�レぎ 歲Б�ギ� ぎ�ⓣ�쥯筍
Copy2:
  mov AL, [BX]       ;ˇ汀� 歲Б�� �� ��誓Д����
  mov ES:[SI], AL    ;ぎ�ⓣ�쥯筍 ⅲ� 췅 咨�젺
  mov ES:[SI+1], AH  ;歟β
  inc BX             ;� 笹ⅳ莘耀с 歲Б�ャ ��誓Д����
  add SI,2           ;� 笹ⅳ莘耀� ��㎤與� 咨�젺�
  dec CX
  jnz Copy2
    pop SI           ;¡遜�젺�˘筍 췅�젷� 飡昔え 咨�젺�
    add SI,160       ;��誓⒱� 췅 췅�젷� 笹ⅳ莘耀� 飡昔え 咨�젺�
    pop BX           ;¡遜�젺�˘筍 췅�젷� 收め��
    add BX, Len      ;��誓⒱� 췅 췅�젷� 笹ⅳ莘耀� 飡昔え 收め��
  dec DI
  jnz Copy1
  ret

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  ;--�/� 룆릣뒓�몜� 收ゃ耀． �勝も� Д�� 췅 咨�젺�
  ;                 歟β �� "DH", ㄻÞ� �� "Len", 젮誓� 췅 咨�젺� �� "SI"
Kras:
    push SI
  mov CX, Len        ;稅�レぎ 歲Б�ギ� む졹ⓥ�
Kras1:
  mov ES:[SI]+1,DH   ;��誓む졹ⓥ� 歲Б��
  add SI,2           ;� 笹ⅳ莘耀� ��㎤與� 咨�젺� 
  dec CX             ;��誓む졹ⓥ� Len 歲Б�ギ�
  jnz Kras1
    pop SI
  ret

  Help db " ESC-�音��  굚뀗�/굧늾-� 承�昔�  굥뀆�/굩��굨-�� む膝�  ENTER-�誘�キⓥ�       ",'$'
end Start
