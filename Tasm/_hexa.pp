;───────── подпрограммы для ШЕСТНАДЦАТИРИЧНЫХ чисел ───────────────────────────
;
;call HexAL      ; печать 16-го числа из AL   (две    цифры:    '00'    'FF' )
;call HexAX      ; печать 16-го числа из AX   (четыре цифры:  '0000'  'FFFF' )
; 
;call BinAL      ; печать  2-го числа из AL   (восемь цифр:     '00100011'   )
;
;call InputAL    ; ввод   16-го числа в AL    (две    цифры)
;call InputAX    ; ввод   16-го числа в AX    (четыре цифры)
;                ;  (вводятся только '0'..'9' 'A'..'F' 'a'..'f' с эхо-печатью)
;
;──────────────────────────────────────────────────────────────────────────────



;########################################################### тексты подпрограмм

;------  ПЕЧАТЬ числа из AL  (две 16-е цифры)
HexAL:
   push AX
   push BX
   push CX
  mov CL,AL      ;печатаемое число
  lea BX,HexAL_    ;адрес таблицы:   или  mov BX,offset HexAL_
    shr AL,1     ;сдвиг старшей цифры  (индекс)
    shr AL,1
    shr AL,1
    shr AL,1
  XLAT           ;в AL из [BX][AL]
  mov AH,0Eh     ;печать символа из AL
  int 10h 
    mov AL,CL      ;печатаемое число
    and AL,0Fh     ;очистка мл.цифры (индекс)
  XLAT           ;в AL из [BX][AL]
  mov AH,0Eh     ;печать символа из AL
  int 10h 
   pop CX
   pop BX
   pop AX
   ret
 HexAL_ db "0123456789ABCDEF" 


;------  ПЕЧАТЬ числа из AX  (четыре 16-е цифры)
HexAX:
  xchg AH,AL
  call HexAL
  xchg AH,AL
  call HexAL
  ret

;------ печать ДВОИЧНОГО числа из AL:       "00100011"
BinAL:
   push AX
   push BX
   push CX
  mov CX,8             ;кол-во сдвигов
  mov BH,AL            ;печатаемое число
  mov BL, 10000000b    ;начальная маска (ловим старший разряд)
BinAL_1:
  mov AL,'0'           ;предполагаем, что разряд нулевой 
  test BH,BL           ;сравнение с маской (0 -если разряд 0, иначе не 0)
  jz BinAL_2         
   inc AL              ;если разряд единица, то AL='1'
BinAL_2:
  mov AH,0Eh
  int 10h              ;печать "0" или "1"
  shr BL,1             ;сдвиг маски вправо 
  dec CX               ;повторить 8 раз 
  jnz BinAL_1
   pop CX
   pop BX
   pop AX
  ret


;------ ВВОД четырех 16-ричных цифр в AX (с эхом)
InputAX:       
  push BX
    call InputAL           ;старший байт
    mov BH,AL
    call InputAL           ;младший байт
    mov AH,BH
  pop BX
  ret


;------ ВВОД двух 16-ричных цифр в AL (с эхом)
InputAL:       
  push BX
  push CX
    call Input_1           ;ввод первой цифры
    mov BH,AL             ;сохранение первой цифры
    call Input_pp          ;печать первой цифры
      rol BH,1            ;преобразование первой цифры
      rol BH,1
      rol BH,1
      rol BH,1
    call Input_1           ;ввод второй цифры
    mov BL,AL
    call Input_pp          ;печать второй цифры
      mov AL,BL           ;сборка байта
      add AL,BH
  pop CX
  pop BX
  ret


    ;--- вспомогательная: ввод 16-ричной цифры   (только  0..9 A..F a..f )
Input_1:   
  mov AH,10h            ;ввод символа в AL
  int 16h
    cmp AL,30h
    jc Input_1           ;если меньше "0", на повтор
    cmp AL,3Ah
    jc  Input_2          ;от "0" по "9", на выход
  and AL,11011111b      ;буквы -маленькие в заглавные
  cmp AL,41h        
  jc Input_1             ;меньше "A", на повтор
    cmp AL,47h
    jnc Input_1          ;больше "А", на повтор
  sub AL,07h            ;от "A" по "F", обработка
Input_2:             
  sub AL,30h            ;от "0" по "9", обработка
  ret

  ;--- вспомогательная подпрограмма:  печать цифры из AL
Input_pp:     
   and AX,000Fh         
   mov BL,AL            
   mov CX,070Ah         
   div CL               
   mul CH               
   add AL,30h           
   add AL,BL            
   mov AH,0Eh           
   int 10h        
   ret
