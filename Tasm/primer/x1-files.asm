;컴컴컴컴컴� ��뎸� 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
; 1.뫌ℓ젰恂� �젵� "primer.txt" � � �ⅲ� 쭬�ⓤ猶좐恂� 歲Б�ル  "abcdefgh"
; 2.닱Д�畑恂� 5-� 줎⒱ �젵쳽 (쵟ゥ�履좑 ▲あ� � 쭬＋젪�莘):   "abcdeFgh"
; 3.뫌ㄵ逝º�� �젵쳽 �η졻젰恂� 췅 咨�젺� (ㄾ ぎ��� �젵쳽)

  .model tiny
  .code
  org 100h
  include _abc.mac
Start: 

;컴컴컴컴컴컴컴1.뫌ℓ젺�� �젵쳽 � 쭬�ⓤ� � �ⅲ� �αぎレえ� 歲Б�ギ◐컴컴컴컴컴�
                       ;--貰ℓ졻� � �洙贍筍 �젵�
  mov DX,offset Names       ;젮誓� º��� �젵쳽
  call Make                 ;貰ℓ졻� �젵� �洙贍瞬� ㄻ� 쭬�ⓤ�
    mov AL, 'a'        ;--쭬�ⓤ졻� � �젵� 歲Б�ル �� 'a' ㄾ 'h'
 Metka11:              
    call Save               ;쭬�ⓤ졻� � �젵� 歲Б�� �� AL
    inc AL                   
      cmp AL, 'h'+1         ;ㄾ獄� ㄾ ��笹ⅳ�ⅲ� 歲Б�쳽 ?
      jnz Metka11           ;αエ �β, 獸 �昔ㄾウⓥ� 與か
  call Close           ;--쭬む淫� �젵�

;컴컴컴컴컴컴컴2.닱Д����� 줎⒱� � �젵ゥ컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
                       ;--�洙贍筍 �젵� ㄻ� �㎚����⑨
  mov DX,offset Names       ;젮誓� º��� �젵쳽
  mov AL, 2                 ;誓┬�=2 -ㄻ� �㎚����⑨
  call Open                 ;�洙贍筍 �젵�  
                       ;--��飡젪ⓥ� 丞젳졻�レ � �昔葉�졻� 줎⒱ �� �젵쳽 � AL
  mov DX, 5                 ;��㎤與� � �젵ゥ (��Д� �㎚��畑М． 줎⒱�,淞β c 0)
  call Seek                 ;��飡젪ⓥ� 丞젳졻�レ � �젵ゥ
  call Load                 ;�昔葉�졻� 줎⒱ �� �젵쳽 � AL
    sub AL,32          ;--�㎚��ⓥ� 줎⒱ (쵟ゥ�履莘 ▲あ� � 쭬＋젪�莘)
                       ;--��飡젪ⓥ� 丞젳졻�レ � 쭬�ⓤ졻� 줎⒱ �� AL � �젵�
  mov DX, 5                 ;��㎤與� � �젵ゥ (��Д� �㎚��畑М． 줎⒱�)
  call Seek                 ;��飡젪ⓥ� 丞젳졻�レ � �젵ゥ
  call Save                 ;쭬�ⓤ졻� � �젵� �� AL
  call Close           ;--쭬む淫� �젵�      

;컴컴컴컴컴컴컴3.룯�졻� 貰ㄵ逝º�． �젵쳽컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  CLS                       ;쵟む�� �葉飡え 咨�젺�
                       ;--�洙贍筍 �젵� ㄻ� 譽��⑨
  mov DX,offset Names       ;젮誓� º��� �젵쳽
  mov AL,0                  ;誓┬�=0 -ㄻ� 譽��⑨ 
  call Open                 ;�洙贍筍 �젵�  
 Metka31:              ;--譽���� 줎⒱�� ㄾ ぎ��� �젵쳽 � �η졻�
    call Load               ;譽���� �� �젵쳽 � AL
    cmp AL, 0               ;將� ぎ�ζ �젵쳽 ?
    jz Metka32              ;αエ ぎ�ζ �젵쳽, 獸 �音�� �� 與か�
      mov AH,0Eh
      int 10h               ;�η졻� 歲Б�쳽 �� AL
    jmp Metka31             ;췅 �昔ㄾウ���� 譽��⑨ � �η졻�
 Metka32:
  call Close           ;--쭬む淫� �젵�      
         
  PAUSE                     ;쵟む�� 캙習�
  STOP                      ;쵟む�� 쭬´殲��⑨ �昔｀젹щ

;============== 룆릣똿뜊썒 (�∽쭬收レ�瑜) =====================================

  Names db "primer.txt",0   ;º� �젵쳽 (쭬첓�葉쥯β碎 �乘��)
  Bufer db 0                ;▲芯� (� �ⅲ� 葉�젰恂�, �� �ⅲ� 쭬�ⓤ猶젰恂�)
  Nomer dw 0                ;��Д� 收ゃ耀． �젵쳽 (��Д�젰恂� �黍 �洙贍殊�,
                            ; ⓤ��レ㎯β碎 �黍 譽��Ŀ/쭬�ⓤ�/쭬む淫Ŀ/信�젺�˚�

;============== 룑꼷릮깘�뙆� ㄻ� �□젩�洙� �젵ギ� =============================

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
 ;== 럲뒓썟늼 �젵쳽              �� DX   -젮誓� º��� �젵쳽 
 ;                               �� AL   -誓┬�  (0 -譽, 1 -쭬�, 2 -譽/쭬�)
 ;                               � Nomer -��Д� �젵쳽
Open:
    push AX
    push CX
  mov CX, 0    ;쵟稅� -�〓嶺硫 �젵�
  mov AH, 3Dh
  int 21h
  mov Nomer,AX ;��Д� �젵쳽
    pop CX
    pop AX
  ret

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
 ;== 몠뇙�뜄� �젵쳽 ㄻ� 쭬�ⓤ�   �� DX -젮誓� º��� �젵쳽
 ;                               � Nomer -��Д� �젵쳽
Make: 
    push AX
    push CX
  mov CX, 0    ;쵟稅� -�〓嶺硫 �젵�
    mov AH, 3Ch
    int 21h
  mov Nomer,AX ;��Д� �젵쳽
    pop CX
    pop AX
    ret

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
 ;== ��뒓썟늼 �젵쳽              �� Nomer -��Д� �젵쳽
Close:
    push AX
    push BX
  mov BX, Nomer ;��Д� �젵쳽
    mov AH, 3Eh          
    int 21h
  pop BX
  pop AX 
  ret

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
 ;== 뿋뀓늼 �ㄽ�． 줎⒱� �� �젵쳽 � AL (丞젳졻�レ 細ι젰恂�)
 ;                    �� Nomer -��Д� �젵쳽
 ;                    � AL     -줎⒱ �� �젵쳽 (αエ �젵� 쭬ぎ�葉メ�, 獸 AL=0 )
Load:
    push BX
    push CX
    push DX  
  mov BX, Nomer             ;��Д� �젵쳽
  mov CX,1                  ;ぎエ曄飡¡ 葉�젰щ� 줎⒱��
  mov DX,offset Bufer       ;젮誓� ▲芯��
    mov AH,3Fh          
    int 21h                 ;αエ �젵� 쭬ぎ�葉メ�, 獸 AX=0
  cmp AX,0
  jz Load1 
    mov AL, Bufer           ;�昔葉�젺�硫 �� �젵쳽 줎⒱
Load1:
  pop DX
  pop CX
  pop BX
  ret

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
 ;== ��룉몴 �ㄽ�． 줎⒱� �� AL � �젵� (丞젳졻�レ 細ι젰恂�)
 ;                    �� Nomer -��Д� �젵쳽
 ;                    ��  AL   -쭬�ⓤ猶젰щ� 줎⒱
Save:
  push AX 
  push BX 
  push CX
  push DX  
    mov Bufer, AL           ;쭬�⑤쥯�щ� 줎⒱
    mov BX, Nomer           ;��Д� �젵쳽
    mov CX,1                ;ぎエ曄飡¡ 쭬�ⓤ猶젰щ� 줎⒱��
    mov DX,offset Bufer     ;젮誓� ▲芯�� 
      mov AH,40h          
      int 21h                 
  pop DX
  pop CX
  pop BX
  pop AX
  ret

;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
 ;== 뱫��뜋굤� 丞젳졻�ワ � �젵ゥ 췅 줎⒱ � ��Д昔� �� DX (�젵ル ㄾ 64 뒦젵�)
 ;                   �� DX     -��涉ㄺ��硫 ��Д� 줎⒱� (�� 0 �� 65535)
 ;                   �� Nomer  -��Д� �젵쳽
Seek:              
  push AX 
  push BX 
  push CX  
  push DX
    mov BX, Nomer  ;��Д� �젵쳽    
    mov CX, 0      ;飡졷�좑 �졹筍 ��Д�� 줎⒱� (Й젮�좑 �졹筍 -� DX)
    mov AL, 0      ;淞β 줎⒱�� -�� 췅�젷� (1 -�� 收ゃ耀� ��㎤與�, 2 -�� ぎ���)
      mov AH,42h
      int 21h
  pop DX
  pop CX
  pop BX
  pop AX
  ret
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
end Start
