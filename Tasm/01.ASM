    .model tiny
    .code
    org 100h
Start:
    mov BX,offset Y 
Metka:
    mov AL,[BX]         ;Из ячейки в AL
    mov AH,0Eh          ;Функция
    int 10h             ;CALL FD24
    inc BX
    cmp AL,0
    jnz Metka
    ret                 ;Возврат в операционную систему
 Y db "Hello WORLD!!!!!",0
    end Start