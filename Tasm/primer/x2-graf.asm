;컴컴컴컴컴� 깘�뵂�� 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
; 뮢囹�, 췅か��췅� エ�⑨, �젹첓, ㄲ� ˙�┘��音 쭬む좄���音 �涉М膝�レ�Ø�

  .model tiny
  .code
  org 100h
  include _abc.mac
Start: 
  CLS                  ;쵟む�� �葉飡え 咨�젺�
  call GrafOn          ;˚ヮ曄��� ｀졽①αぎ． 誓┬쵟
                       ;--獸囹�
  mov CX, 50                ; X
  mov DX, 50                ; Y
  mov AL, 15                ;歟β
  call Pixel
                       ;--エ�⑨
  mov CX, 11                ; X 췅�젷� エ�Ŀ
  mov DX, 11                ; Y 췅�젷� エ�Ŀ
  mov SI, 2                 ; �젫 �� X
  mov DI, 6                 ; �젫 �� Y
  mov BX, 24                ;ㄻÞ� エ�Ŀ (ぎ�-¡ 獸曄�)
  mov AL, 14                ;歟β
  call gLine
                       ;--�젹첓
  mov CX, 10                ; X ゥ¡． ´齧�
  mov DX, 10                ; Y ゥ¡． ´齧�
  mov SI, 620               ; �젳Д� �� X (ㄻÞ�)
  mov DI, 460               ; �젳Д� �� Y (�吟���)
  mov AL, 11                ;歟β
  call gRamka
                       ;--쭬む좄���硫 �涉М膝�レ�Ø
  mov CX, 60                ; X ゥ¡． ´齧�
  mov DX, 60                ; Y ゥ¡． ´齧�
  mov SI, 200               ; �젳Д� �� X (ㄻÞ�)
  mov DI, 100               ; �젳Д� �� Y (�吟���)
  mov AL, 12                ;歟β
  call gBox
                       ;--쭬む좄���硫 �涉М膝�レ�Ø (˛呻誓��Ł)
  add CX, 5                 ; X ゥ¡． ´齧�
  add DX, 5                 ; Y ゥ¡． ´齧�
  sub SI,  10               ; �젳Д� �� X (ㄻÞ�)
  sub DI,  10               ; �젳Д� �� Y (�吟���)
  mov AL, 2                 ;歟β
  call gBox

  PAUSE                ;쵟む�� 캙習�
  call GrafOff         ;¡㎖�졻 � 收め獸�硫 誓┬� (Œ� 쵟む�貰� "CLS")
  STOP                 ;쵟む�� 쭬´殲��⑨ �昔｀젹щ


;============== 룑꼷릮깘�뙆� ㄻ� �□젩�洙� ｀졽Ø� (ㄻ� 0 飡�젺ⓩ�) ==========

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
 ;== 굤떈뾽뜄� ｀졽①αぎ． 誓┬쵟 (��Д� 誓┬쵟 �� AL)
GrafOn:
    push AX
  mov AL,12h     ;Y �� 0 ㄾ 480, X �� 0 ㄾ 640, 16 歟β�� (歟β 0 -飡ⓣ젺��)
  mov AH,0               
  int 10h
    pop AX
    ret

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
 ;== 궀뒎옑뀓늼 ｀졽①αぎ． 誓┬쵟  (¡㎖�졻 � 收め獸�硫 誓┬�) 
GrafOff:          
    push AX
  mov AX,0003h   
  int 10h
    pop AX
    ret

;컴컴컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴컴컴컴컴
 ;== 뭿뿂�          낏� CX  -ぎ�西Þ졻� X  (0..639)  낏� AL  -歟β (1..15
 ;                  낏� DX  -ぎ�西Þ졻� Y  (0..479)  �              0-飡ⓣ젺��)
Pixel:             ;읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴컴컴�
    push AX
    push BX
  mov BH,0         ;飡�젺ⓩ� 0
  mov AH,0Ch        
  int 10h
    pop BX
    pop AX
    ret

;컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컴
 ;== 땲뜄�       낏� CX  -X 췅�젷� エ�Ŀ  낏� SI -�젫 �� X  낏� BX -ㄻÞ� エ�Ŀ
 ;               낏� DX  -Y 췅�젷� エ�Ŀ  낏� DI -�젫 �� Y  낏� AL  -歟β エ�Ŀ
 ;               읕컴컴컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴
 ;            �젫 �� X,Y:  "1" -¿�젪�,˛��   "-1" -˙ⅱ�,⇔�齧  "0" -�� �㎚-碎
 ;            ぎ�西Þ졻� CX,DX ▲ㅳ� 췅 ��笹ⅳ�ⅸ 췅黍貰쥯���� 獸囹�
gLine:           
  push BX
gLine1:
  call Pixel       ;獸囹�
  add CX,SI        ;��誓淞β ぎ�西Þ졻 췅 �젫
  add DX,DI        ;
  dec BX
  jnz gLine1
    sub CX,SI      ;�젫 췅쭬� (췅 ��笹ⅳ�傳 췅黍貰쥯��莘 獸囹�)
    sub DX,DI      ;
  pop BX
  ret

;컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴�
 ;== ��뙄�       낏� CX  -X ゥ¡． ´齧�  낏� SI -�젳Д� �� X  낏� AL  -歟β
 ;               낏� DX  -Y ゥ¡． ´齧�  낏� DI -�젳Д� �� Y  �
 ;               읕컴컴컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴좔컴컴컴컴컴컴컴컴�
 ;                    � CX,DX ¡㎖�좈젰� ぎ�西Þ졻� ゥ¡． ´齧�ⅲ� 膝쳽
gRamka:
              ;-エ�⑨ ¿�젪� (ㄻÞ� �� SI, dX=1, dY=0)
  mov BX,SI      ;ㄻÞ� � BX
    push SI      ;貰魚젺ⓥ� �젳Д贍 �� SI,DI
    push DI      
  mov SI,1       ;�젫 �� � =1  (¿�젪�)
  mov DI,0       ;�젫 �� Y =0 
  call gLine     ;黍貰쥯��� エ�Ŀ (CX,DX ▲ㅳ� 췅 ��笹ⅳ�ⅸ 췅黍貰쥯���� 獸囹�)
    pop DI       ;¡遜�젺�˘筍 �젳Д贍 � SI,DI
    pop SI       
              ;-エ�⑨ ˛�� (ㄻÞ� �� DI, dX=0, dY=1)
  mov BX,DI      
    push SI
    push DI
  mov SI,  0       
  mov DI,  1       
  call gLine
    pop DI
    pop SI
              ;-エ�⑨ ˙ⅱ� (ㄻÞ� �� SI, dX=-1, dY=0)
  mov BX,SI      
    push SI
    push DI
  mov SI, -1      
  mov DI,  0       
  call gLine
    pop DI
    pop SI
              ;-エ�⑨ ⇔�齧 (ㄻÞ� �� DI, dX=0, dY=-1)
  mov BX,DI
    push SI
    push DI
  mov SI,  0
  mov DI, -1
  call gLine
    pop DI
    pop SI
    ret

;컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴컴컴컴컫컴컴컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴�
 ;== ��뒓�쁾뜊�� 낏� CX  -X ゥ¡． ´齧�  낏� SI -�젳Д� �� X  낏� AL  -歟β
 ;   ��뙄�       낏� DX  -Y ゥ¡． ´齧�  낏� DI -�젳Д� �� Y  �
 ;               읕컴컴컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴좔컴컴컴컴컴컴컴컴�
 ;                    � CX,DX ¡㎖�좈젰� ぎ�西Þ졻� ゥ¡． ´齧�ⅲ� 膝쳽
gBox:
  push CX           ;쭬��Лⓥ� ぎ�西Þ졻� ゥ¡． ´齧�
  push DX
    push SI         ;쭬��Лⓥ� �젳Д贍 (��設汀碎 � 與か�)
    push DI
gBox2:              ;˛θ�Ł 與か:     -췅黍貰쥯筍 DI エ�Ł
  push CX           ;  쭬��Лⓥ� 췅�젷� エ�Ŀ
  push SI           ;  쭬��Лⓥ� �젳Д� �� �
gBox1:              ;˛呻誓��Ł 與か:  -췅黍貰쥯筍 エ�⑧ ¿�젪� �� SI 獸曄�
    call Pixel      ;  獸囹� ("X" �� CX, "Y" �� DX, 歟β �� AL)
    inc CX          ;  ��誓若� ��젪ⅴ: X=X+1
    dec SI
    jnz gBox1
  pop CX            ;¡遜�젺�˘筍 췅�젷� エ�Ŀ
  pop SI            ;¡遜�젺�˘筍 �젳Д� �� � 
  inc DX            ;��誓若� �Ĳ�: Y=Y+1
  dec DI
  jnz gBox2
    pop DI          ;¡遜�젺�˘筍 �젳Д贍
    pop SI
  pop DX            ;¡遜�젺�˘筍 � CX,DX ぎ�西Þ졻� ゥ¡． ´齧�
  pop CX
  ret
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
end Start
