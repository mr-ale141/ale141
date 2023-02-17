rem   Пакетный файл для запуска редактора AsmShell

  cls                        
  @if %1.==. goto No         
  #ts.com %1.asm          
  @goto End                  
:No     
  #ts.com
:End   
  del %1.map
  del %1.obj
  cls


