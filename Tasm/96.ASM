                 ;--蠡���
  .model tiny
  .code
  org 100h
  include _abc.mac      ;������⥪� ����ᮢ
Start:
  CLS                   ;���⪠ ��࠭�
  TEXT NameArr
  CALL MASPRINT
  WRITELN  
  TEXT NameSum          ;--⥪�� ���������--
  
  mov BX, offset Y
  mov CX, Len
  mov AL, Y
MetSum:
  cmp AL, [BX]
  jnc Met1
  mov AL, [BX]
Met1:  
  inc BX
  dec CX 
  jnz MetSum
  CALL DECAL
  PAUSE                 ;��㧠
  STOP                  ;�⮯

MASPRINT:
  push AX
  push BX
  push CX    
  mov BX, offset Y
  mov CX, Len
MASPRINT1:
  mov AX, [BX]
  CALL DECAL
  inc BX
  dec CX
  jnz MASPRINT1
  pop CX
  pop BX
  pop AX
  ret

  NameArr db "���ᨢ", '$'
  NameSum db "����.", '$'
  Y db 5, 7, 6, 9, 4, 2      ;��६����
  Len = $ - Y           ;����⠭��

  include _dec.pp       ;������⥪� ����ணࠬ�

;                       ;--⥪��� �����������--

end Start
