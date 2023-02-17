    .model tiny
    .code
    org 100h
PRINT macro
    mov AH,0Eh
    int 10h
endm
CLS macro
    mov AX,3
    int 10h
endm
PAUSE macro
    mov AH,10h
    int 16h
endm
STOP macro
    mov AH,4Ch
    int 21h
endm
Start:
    CLS
    mov BX,offset Y 
Metka:
    mov AL,[BX]         ;Из ячейки в AL
    PRINT
    inc BX
    cmp AL,0
    jnz Metka
    PAUSE
    STOP                 ;Возврат в операционную систему
 Y db "Hello WORLD!!!!!",0
    end Start