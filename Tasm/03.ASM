    .model tiny
    .code
    org 100h
PRINT macro
    mov AH,0Eh
    int 10h
endm
Start:
    mov BX,offset Y 
Metka:
    mov AL,[BX]         ;�� �祩�� � AL
    PRINT
    inc BX
    cmp AL,0
    jnz Metka
    ret                 ;������ � ����樮���� ��⥬�
 Y db "Hello WORLD!!!!!",0
    end Start