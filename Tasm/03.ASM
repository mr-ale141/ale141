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
    mov AL,[BX]         ;Из ячейки в AL
    PRINT
    inc BX
    cmp AL,0
    jnz Metka
    ret                 ;Возврат в операционную систему
 Y db "Hello WORLD!!!!!",0
    end Start