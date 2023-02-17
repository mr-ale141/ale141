rem   Пакетный файл для компиляции Asm-файла с указанным именем в Com-файл

  cls                        
  @echo        Нужно указать имя ASM-файла (без расширения)
  @echo        .                                          .
  @if %1.==. goto No         
  #tasm.exe  %1.asm          
  #tlink.exe /t %1.obj          
  del %1.map, %1.obj
  @goto End                  
:No                          
  @echo            -----------------------------------
  @echo             ОШИБКА ! Не указано имя ASM-файла 
  @echo            -----------------------------------
  @echo        .                                          .
  @pause
:End   

