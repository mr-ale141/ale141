  .model tiny
  .code
  org 100h
Start:

  mov AX,3
  int 10h

  mov AX,0B800h
  mov ES,AX
  call PRINTEXIT
  mov BX,160
  mov DX,0
  call PRINT

  add DX,162
  mov CL,'0'
Metka0:
  call PRINT
  call GETDX
  call UPDATEDX
  call DELLAY
  call PRINTEXIT
  in AL,60h
  cmp AL,1
  jz STOP
  jmp Metka0

STOP:
  mov AX,3
  int 10h
  mov AH,4ch
  int 21h

GETDX:
  push AX
  in AL,60h
  cmp AL,16
  jz Q
  cmp AL,17
  jz W
  cmp AL,18
  jz E
  cmp AL,30
  jz A
  cmp AL,57
  jz Space
  cmp AL,32
  jz D
  cmp AL,44
  jz Z
  cmp AL,45
  jz X
  cmp AL,46
  jz C
  jmp EXITNOW
C:
  mov DX,162
  jmp EXITNOW
X:
  mov DX,160
  jmp EXITNOW
Z:
  mov DX,158
  jmp EXITNOW
D:
  mov DX,2
  jmp EXITNOW
Space:
  in AL,60h
  cmp AL,57
  jnz EXITSPACE
  jmp Space
A:
  mov DX,-2
  jmp EXITNOW
E:
  mov DX,-158
  jmp EXITNOW
W:
  mov DX,-160
  jmp EXITNOW
Q:
  mov DX,-162
  jmp EXITNOW
EXITSPACE:
  call DELLAY
  call DELLAY
  call DELLAY
  call DELLAY
  call DELLAY
  call DELLAY
  call DELLAY
  cmp BX,1678
  jc DECCL
  cmp BX,1684
  jc INCCL
  cmp BX,1838
  jc DECCL
  cmp BX,1844
  jc INCCL
  cmp BX,1998
  jc DECCL
  cmp BX,2004
  jc INCCL
DECCL:
  dec CL
  cmp CL, '/'
  jnz EXITNOW
  mov CL,'0'
  jmp EXITNOW
INCCL:
  inc CL
  cmp CL,':'
  jnz EXITNOW
  mov CL,'0'
EXITNOW:
  pop AX
  RET

UPDATEDX:
  push AX
  push CX
  cmp BX,3840
  jc Metka1
  cmp BX,3998
  jnz Metka00
  mov DX,-162
  jmp Metka222
Metka00:
  cmp BX,3840
  jnz Metka000
  mov DX,-158
  jmp Metka222
Metka000:
  add DX,-320
  jmp Metka222

Metka1:
  cmp BX,320
  jnc Metka2
  cmp BX,318
  jnz Metka11
  mov DX,158
  jmp Metka222
Metka11:
  cmp BX,160
  jnz Metka111
  mov DX,162
  jmp Metka222
Metka111:
  add DX,320
  jmp Metka222

Metka2:
  mov AX,BX
  mov CL,160
  div CL
  cmp AH,0
  jnz Metka22
  add DX,4
  jmp Metka222
Metka22:
  cmp AH,158
  jnz Metka222
  add DX,-4

Metka222:
  pop CX
  pop AX
  ret

DELLAY:
  push CX
  mov CX,0FFFFh
  Loop1:
  push CX
  mov CX,20
Loop2:
  loop Loop2
  pop CX
  loop Loop1
  pop CX
  ret

PAUSE:
  mov AH,10h
  int 16h
  ret

PRINT:
  in AL,60h
  cmp AL,31
  jz Without
  mov AX,3
  int 10h
  mov AH,0Eh
  mov AL,0
  mov ES:[BX],AX
  call PRINTEXIT
Without:
  mov AL,'#'
  add BX,DX
  mov ES:[BX],AX
  ret

PRINTEXIT:
  push BX
  mov BX,64
  mov AH,0Eh
  mov AL,'P'
  mov ES:[BX],AX
  add BX,2
  mov AL,'r'
  mov ES:[BX],AX
  add BX,2
  mov AL,'e'
  mov ES:[BX],AX
  add BX,2
  mov AL,'s'
  mov ES:[BX],AX
  add BX,2
  mov AL,'s'
  mov ES:[BX],AX
  add BX,2
  mov AL,' '
  mov ES:[BX],AX
  add BX,2
  mov AL,'E'
  mov ES:[BX],AX
  add BX,2
  mov AL,'S'
  mov ES:[BX],AX
  add BX,2
  mov AL,'C'
  mov ES:[BX],AX
  add BX,2
  mov AL,' '
  mov ES:[BX],AX
  add BX,2
  mov AL,'t'
  mov ES:[BX],AX
  add BX,2
  mov AL,'o'
  mov ES:[BX],AX
  add BX,2
  mov AL,' '
  mov ES:[BX],AX
  add BX,2
  mov AL,'e'
  mov ES:[BX],AX
  add BX,2
  mov AL,'x'
  mov ES:[BX],AX
  add BX,2
  mov AL,'i'
  mov ES:[BX],AX
  add BX,2
  mov AL,'t'
  mov ES:[BX],AX

  mov BX,146
  mov AL, 'S'
  mov ES:[BX],AX
  add BX,2
  mov AL,'c'
  mov ES:[BX],AX
  add BX,2
  mov AL,'o'
  mov ES:[BX],AX
  add BX,2
  mov AL,'r'
  mov ES:[BX],AX
  add BX,2
  mov AL,'e'
  mov ES:[BX],AX
  add BX,2
  mov AL,' '
  mov ES:[BX],AX

  add BX,2
  mov AL,48       ;'0'
  add CL,-48
  add AL,CL
  add CL,48
  mov ES:[BX],AX

  mov AL,'*'
  mov BX,1518
  mov ES:[BX],AX
  add BX,2
  mov ES:[BX],AX
  add BX,2
  mov ES:[BX],AX
  add BX,162
  mov ES:[BX],AX
  add BX,160
  mov ES:[BX],AX
  add BX,160
  mov ES:[BX],AX
  add BX,158
  mov ES:[BX],AX
  add BX,-2
  mov ES:[BX],AX
  add BX,-2
  mov ES:[BX],AX
  add BX,-162
  mov ES:[BX],AX
  add BX,-160
  mov ES:[BX],AX
  add BX,-160
  mov ES:[BX],AX
  pop BX
  ret

  end Start