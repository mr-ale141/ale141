    format  pe64 gui 5.0
    entry   start
    include '../include/win64a.inc'

section '.data' data readable writeable

    message db 'Hello, World!',0
    title db 'My first window',0

section '.code' code readable executable

    start:
    
        invoke MessageBox,0,message,title,0

        invoke ExitProcess,0

section '.idata' import data readable writeable
        library kernel32,'kernel32.dll',\
                user32,'user32.dll'
        import  kernel32,\
                ExitProcess,'ExitProcess'
        import  user32,\
                MessageBox,'MessageBoxA'