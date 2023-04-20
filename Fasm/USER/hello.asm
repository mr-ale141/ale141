        format  pe gui
        entry   start
        include 'C:\IPS\ale141\fasm\include\win32a.inc'

section '.data' data readable writeable

        message db 'Hello, World!',0
        title db 'My first window',0

section '.code' code readable executable

        start:
                invoke  MessageBox,NULL,message,title,MB_OK
                invoke  ExitProcess,0

section '.idata' import data readable writeable
        library kernel32,'kernel32.dll',\
                user32,'user32.dll'
        import  kernel32,\
                ExitProcess,'ExitProcess'
        import  user32,\
                MessageBox,'MessageBoxA'