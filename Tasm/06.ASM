    .model tiny
    .code
    org 100h
    include _abc.mac
Start:
    CLS
    mov BX,offset Y 
Metka:
    mov AL,[BX]          ;Из ячейки в AL
    PRINT
    inc BX
    cmp AL,0
    jnz Metka
    PAUSE
    STOP                 ;Возврат в операционную систему
 Y db "Hello WORLD!!!!!",0
    end Start