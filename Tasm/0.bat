rem   ������ 䠩� ��� �������樨 Asm-䠩�� � 㪠����� ������ � Com-䠩�

  cls                        
  @echo        �㦭� 㪠���� ��� ASM-䠩�� (��� ���७��)
  @echo        .                                          .
  @if %1.==. goto No         
  #tasm.exe  %1.asm          
  #tlink.exe /t %1.obj          
  del %1.map, %1.obj
  @goto End                  
:No                          
  @echo            -----------------------------------
  @echo             ������ ! �� 㪠���� ��� ASM-䠩�� 
  @echo            -----------------------------------
  @echo        .                                          .
  @pause
:End   

