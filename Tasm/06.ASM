    .model tiny
    .code
    org 100h
    include _abc.mac
Start:
    CLS
    mov BX,offset Y 
Metka:
    mov AL,[BX]          ;�� �祩�� � AL
    PRINT
    inc BX
    cmp AL,0
    jnz Metka
    PAUSE
    STOP                 ;������ � ����樮���� ��⥬�
 Y db "Hello WORLD!!!!!",0
    end Start