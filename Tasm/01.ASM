    .model tiny
    .code
    org 100h
Start:
    mov BX,offset Y 
Metka:
    mov AL,[BX]         ;�� �祩�� � AL
    mov AH,0Eh          ;�㭪��
    int 10h             ;CALL FD24
    inc BX
    cmp AL,0
    jnz Metka
    ret                 ;������ � ����樮���� ��⥬�
 Y db "Hello WORLD!!!!!",0
    end Start