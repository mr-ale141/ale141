;컴컴컴컴컴� 꼥늽뀓늼 몚똼럨� 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
; 뫅Б�� ㄲĲβ碎 か젪②젹� 貰 飡誓オ젹� (� �┬쩆���� 췅쬊殊�), �飡젪ワ� 笹ⅳ
; 곥あ� -細�췅 笹ⅳ�.    귣若� か젪②ⅸ Esc.
 
  .model tiny 
  .code       
  org 100h    
  include _abc.mac
Start:      
  CLS               ;�葉飡첓 咨�젺�
  TEXT T1           ;�η졻� ��ㅱ첓㎦� � か젪②졾
  VIDEO             ;췅飡昔ø� ES 췅 ˘ㄵ�▲芯�

  mov BX,12*160+80  ;췅�젷彛�� 細ι���� 췅 咨�젺� (飡昔첓 12, ��㎤與� 40)
  mov DX,0          ;췅��젪ゥ���: (궚�젪� +2, 궖ⅱ� -2, 궘�� +160, 궋�齧 -160)
  mov CH,'�'        ;歲Б��, ぎ獸贍� ㄲª젰恂� ("歲Б��")
  mov CL,'�'        ;歲Б�� ㄻ� 笹ⅳ�          ("笹ⅳ")

                ;---黍貰쥯��� 歲Б�쳽
Metka:              
  mov ES:[BX],CH    ;"歲Б��" �� CH � 瀞ⅸゃ, ��Д� ぎ獸昔� � BX
            
  mov AH,8          ;��昔� か젪쯄栒贍 (췅쬊瞬� 歲Б�� � AL)
  int 21h   
        
  cmp AL,27         ;αエ 췅쬊獸 Esc, 獸 �音��
  jnz Metka0
    PAUSE
    STOP            ;쭬´殲���� �昔｀젹щ

Metka0:
  cmp AL,0          ;췅쬊� 召ζぎ� ? (ㄻ� 召ζぎ쩆 AL=0 )
  jz Metka5         ;αエ 召ζぎ�, 獸 ��昔� か젪쯄栒贍 ι� �젳 (첓ぎ� 召ζぎ�)
    mov CL,AL       ;αエ ▲あ�, 獸 細�췅 "笹ⅳ�" � CL
    jmp Metka       ; � 췅 黍貰쥯��� "歲Б�쳽"

                ;---兒席ⓣ�쥯��� DX (췅��젪ゥ�⑨) � 쭬˘歲М飡� �� AL (か젪②�)
Metka5:
  mov AH,8          ;첓ぎ� ┘ 召ζぎ� ? (™�昔� ��昔� か젪쯄栒贍)
  int 21h   
                 
  cmp AL,75         ;˙ⅱ� ?
  jnz Metka1        ;αエ �β, 獸 췅 笹ⅳ莘耀� 蓀젪�����
    mov DX, -2      ;αエ 쩆,  獸 췅��젪ゥ��� � DX (˙ⅱ�)

Metka1:               
  cmp AL,77         ;¿�젪� ?
  jnz Metka2          
    mov DX, 2       ;  췅��젪ゥ��� ¿�젪�

Metka2:   
  cmp AL,80         ;˛�� ?
  jnz Metka3              
    mov DX, 160     ;  췅��젪ゥ��� ˛��

Metka3:   
  cmp AL,72         ;⇔�齧 ?
  jnz Metka4              
  mov DX, -160      ;  췅��젪ゥ��� ⇔�齧

                ;---ㄵ⒰手⑨ ��笹� ��誓ㄵゥ�⑨ 췅��젪ゥ�⑨
Metka4:   
  mov ES:[BX],CL    ;飡ⓣ젺�� 歲Б�쳽 笹ⅳ�� (�� � CL)
  add BX,DX         ;��誓淞β  BX=BX+DX   (BX-收ゃ蟯� 젮誓�   DX-췅��젪ゥ���)
    cmp BX, 160     ;�泣�  2 飡昔え ?
    jc  Metka6
    cmp BX, 160*24  ;�Ĳ� 24 飡昔え ?
    jnc Metka6
  jmp Metka         ;� �誓ㄵ쳽� 咨�젺� (췅 黍貰쥯��� "歲Б�쳽")

                ;---�젫 췅쭬� (承�� 췅 ´齧�ⅸ � �Ĳ�ⅸ ｀젺ⓩ� 咨�젺�)
Metka6:
  sub BX,DX         ;��誓淞β  BX=BX-DX   (BX-收ゃ蟯� 젮誓�   DX-췅��젪ゥ���)
  jmp Metka         ;췅 ｀젺ⓩ졾 咨�젺� (ㄲª졻藺� ��レ㏆)

 T1 db  '   ESC -�音��   몤릣땴� -��誓Д耀���   걪뒄� -細�췅 笹ⅳ�  ', '$'
end Start
