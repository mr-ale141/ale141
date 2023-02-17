rem   Пакетный файл для запуска редактора AsmEd

  cls                        
  @if %1.==. goto No         
  asmed.exe %1.asm          
  @goto End                  
:No     
  asmed.exe
:End   
  del %1.map
  del %1.obj
  cls


