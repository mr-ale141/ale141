format PE64 GUI 5.0
entry start
include '../include/win64a.inc'

section '.data' data readable writeable

    message db 'Hello, World!',0
    title db 'My first window',0

section '.code' code readable executable

    start:
        sub rsp, 32
        mov rcx, 0
        mov rdx, message
        mov r8,  title
        mov r9,  0
        call [MessageBox]
        
        xor rcx, rcx
        call [ExitProcess]

section '.idata' import data readable writeable

    library kernel32,'kernel32.dll',\
            user32,'user32.dll'

    import  kernel32,\
            ExitProcess, 'ExitProcess'
            
    import  user32,\
            MessageBox, 'MessageBoxA'