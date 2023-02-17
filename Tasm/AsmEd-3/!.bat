rem   Пакетный файл для запуска редактора AsmEdit

  cls                        
  @if %1.==. goto No         
  asmed2.exe %1.asm          
  @goto End                  
:No     
  asmed2.exe
:End   
  del %1.map
  del %1.obj
  cls


