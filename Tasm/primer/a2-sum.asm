;컴컴컴컴컴� 몥뙆� 葉醒� 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
; 뫇쳽ㅻ쥯荻碎 葉笹� �� ㄲ愼 �ㄽ�줎⒱��音 ��誓Д��音.                    AX
; 묆К� � ㄲ愼줎⒱�㏂� ��誓Д��莘.                                      旼커
; 룯�졻좐恂� 葉笹� �� ��誓Д��音 (笹젫젰щ� � 率К�)                    AH AL  
;   뜝ぎ�ⓥ�ゥ� 率К� 琠ワβ碎 AX                                       첼渼
;   끷エ 率К� �� ‘レ蜈 줎⒱�, 獸 AH=0:   15 + 240 = 255     0F + F0 = 00FF
;   끷エ 率К�    ‘レ蜈 줎⒱�, 獸 AH=1:  255 + 255 = 510     FF + FF = 01FE  
;                                         ㄵ碎殊嶺瑜          蜈飡췅ㅶ졻ⓣ①�瑜
; 뤲� 笹�┘�Ŀ 8-�젳涉ㄽ音 葉醒� ㄵ�汀硫 �젳涉� 率К� ¡ 氏젫� ��誓����

 .model tiny
 .code
  org 100h
  include _abc.mac     ;〃∥Ŧ收첓 쵟む�貰�
Start:
  CLS
             ;컴� 1 召�貰�: 닃뀓�, �誓ㄿ�쳽짛�� 1-줎⒱�㏂� 率К�
  mov AH,0             ;飡졷鼇� 줎⒱ 率К�=0 (�誓ㄿ�쳽짛�� 率К� �ㄽ�줎⒱�㏂�)
  mov AL, Y            ;��舒�� 笹젫젰М� �� 瀞ⅸえ � 췅ぎ�ⓥ�レ
  add AL, Z            ;ㄾ줎˙���� ™�昔． 笹젫젰М．  Œ�:  add AL,Y+1
  jnc Metka1           ;αエ �β ��誓����, 獸 AH �飡젰恂� �乘ⅱ臾
    mov AH,1           ;αエ α筍 ��誓���, 獸 AH=1
Metka1:                
  mov Sum,AX           ;十め졿⑨ 率К� � ㄲ愼줎⒱�¡� ��誓Д����
  call Result          ;�η졻� 誓㎯レ�졻� (葉醒� �� 瀞ⅴ� Y,Z,Sum)

             ;컴� 2 召�貰�: �꼸뀘�, 
  mov BX,offset Y      ;젮誓� ��舒�� 瀞ⅸえ
  mov AL, [BX]         ;  ��舒�� 笹젫젰М�
  add AL, [BX+1]       ;  ™�昔� 笹젫젰М�    Œ�:  inc BX  �  add AL,[BX]
  mov AH,0             ;AH=0
  jnc Metka2           
    inc AH             ;AH=1 (ㄲ愼줎⒱�쥯� 率К�)
Metka2:                
  mov Sum,AX           ;率К�
  call Result          ;�η졻� 誓㎯レ�졻�

             ;컴� 3 召�貰�: 닄꼨뒔�, �誓ㄿ�쳽짛�� 2-줎⒱�㏂� 率К�
  mov BX,0             ;Þㄵめ ��舒�� 瀞ⅸえ
  mov AL, Y[BX]        ;  ��舒�� 笹젫젰М�
  add AL, Y[BX]+1      ;  ™�昔� 笹젫젰М�    Œ�:  inc BX  �  add AL,Y[BX]
  mov AH,1             ;�誓ㄿ�쳽짛�� 2-줎⒱�㏂� 率К�: AH=1
  jc Metka3            ;
    sub AH,AH          ;�β ��誓����, AH=0
Metka3:                
  mov Sum,AX           ;率К�
  call Result          ;�η졻� 誓㎯レ�졻�

             ;컴� 4 召�貰�: �� ㄲ愼 瀞ⅴ� � AX (�� Y � AL, �� Y+1 � AH)
  mov BX,offset Y      ;Œ� Þㄵめ�: mov BX,0               Œ� º�췅:
  mov AX,word ptr [BX] ;             mov AX,word ptr Y[BX]    mov AX,word ptr Y
  add AL,AH            ;率К� 笹젫젰щ�
  mov AH,0             ;飡졷鼇� 줎⒱ 率К� �∼乘ⓥ� (AH=0)
  adc AH,0             ;�黍줎˘筍 ��誓��� ( AH=AH+0+��誓���) 
  mov Sum,AX           ;率К�
  call Result          ;�η졻� 誓㎯レ�졻�

             ;컴� 5 召�貰�: �� ㄲ愼 瀞ⅴ� � AX � DX
  mov AH,0
  mov AL, Y            ;��舒�� 笹젫젰М� � ㄲ愼줎⒱��硫 誓（飡� AX
  mov DH,0
  mov DL, Z            ;™�昔� 笹젫젰М� � ㄲ愼줎⒱��硫 誓（飡� DX
  add AX,DX            ;笹�┘��� ㄲ愼줎⒱�¡�
  mov Sum,AX           ;率К�
  call Result          ;�η졻� 誓㎯レ�졻�

  PAUSE
  STOP

  Y   db 200           ;��舒�� 笹젫젰М�
  Z   db 251           ;™�昔� 笹젫젰М�
  Sum dw 0             ;率К� (ㄲ愼줎⒱�쥯� ��誓Д�췅�)

  include _dec.pp      ;〃∥Ŧ收첓 ��ㄿ昔｀젹� ㄻ� �η졻� 10-�音 葉醒�

                   ;--��ㄿ昔｀젹쵟 �η졻� 誓㎯レ�졻� 
Result:
  mov AL,Y
  call DecAL
  WRITE ' '
  WRITE '+'
  mov AL,Z
  call DecAL
  WRITE ' '
  WRITE '='
  mov AX,Sum
  call DecAX
  WRITELN
  ret




end Start
