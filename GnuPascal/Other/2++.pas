{�����:
�� �室 �������� ��ப� �� 9 ������ �� X ��� O,
��� � ��� ���⨪� ������. �� ��室� �ॡ���� �뤠��, �� �먣ࠫ: X ��� O ��� �����}
PROGRAM TicTakToe(INPUT, OUTPUT);
Var
  Cell, Value, WonX, WonO, Str, Col1, Col2, Col3, Diag1, Diag2, Err: CHAR;
BEGIN{TicTacToe}
  {��६���� ��� ��।������ �먣����� �������権 ᮯ�୨���}
  WonX := 'F';
  WonO := 'F';
  {��६���� ��� �஢�ન �������権. 0 - ��� �������樨, 1 - �, 2 - �}
  Str := '0'; {string - ��६����� ��� �஢�ન �� ��ப��}
  Col1 := '0'; {column 1 - ��६����� ��� �஢�ન 1 �⮫��}
  Col2 := '0'; {column 2 - ��६����� ��� �஢�ન 2 �⮫��}
  Col3 := '0'; {column 3 - ��६����� ��� �஢�ન 3 �⮫��}
  Diag1 := '0'; {diagonal 1 - ��६����� ��� �஢�ન ��������� 1-5-9}
  Diag2 := '0'; {diagonal 2 - ��६����� ��� �஢�ન ��������� 3-5-7}
  {��ଥ���� ��� �஢�ન �訡�� ���������� �������樨}
  Err := 'F'; 
  WRITELN('Input tic tak toe combination in string');
  Cell := '1';
  WHILE Cell <> '0'
  DO
    BEGIN
      READ(Value);
      WRITE(Value, ' ');
      IF Value <> 'X'{�஢�ઠ �� �ࠢ��쭮� ����������}
      THEN
        IF Value <> 'O'
        THEN
          BEGIN
            Err := 'T';
            Cell := '0';
            WRITELN('- is unsupported symbol')
          END;
      IF Cell = '1'
      THEN
        BEGIN
          Cell := '2';
          IF Value = 'X'{�祩�� 1:1 �室�� � ������⢮ ��ப�, 1 �⮫��, 1 ���������}
          THEN
            BEGIN
              Str := '1';
              Col1 := '1';
              Diag1 := '1';
            END
          ELSE
            BEGIN
              Str := '2';
              Col1 := '2';
              Diag1 := '2';
            END
        END
      ELSE	
        IF Cell = '2'{�祩�� 1:2 �室�� � ������⢮ ��ப�, 2 �⮫��}
        THEN
          BEGIN
            Cell := '3';
            IF Value = 'X'
            THEN
              BEGIN
                Col2 := '1';
                IF Str = '2'
                THEN
                  Str := '0'
              END
            ELSE
              BEGIN
                Col2 := '2';
                IF Str = '1'
                THEN
                  Str := '0'
              END
          END
        ELSE
          IF Cell = '3'{�祩�� 1:3 �室�� � ������⢮ ��ப�, 3 �⮫��, 2 ���������}
          THEN
            BEGIN {��७�� ��ப� ��� ⠡��筮�� ����ࠦ���� ���⨨}
              Cell := '4';
              IF Value = 'X'
              THEN
                 BEGIN
                   Diag2 := '1';
                   Col3 := '1';
                   IF Str = '1'
                   THEN
                     WonX := 'T'
                 END
              ELSE
                 BEGIN
                   Diag2 := '2';
                   Col3 := '2';
                   IF Str = '2'
                   THEN
                     WonO := 'T'
                 END;
              Str := '0';
              WRITELN
            END
          ELSE
            IF Cell = '4'{�祩�� 2:1 �室�� � ������⢮ ��ப�, 1 �⮫��}
            THEN
              BEGIN
                Cell := '5';
                IF Value = 'X'
                THEN
                  BEGIN
                    Str := '1';
                    IF Col1 = '2'
                    THEN
                      Col1 := '0'
                  END
                ELSE
                  BEGIN
                    Str := '2';
                    IF Col1 = '1'
                    THEN
                      Col1 := '0'
                  END
              END
            ELSE
              IF Cell = '5'{�祩�� 2:2 �室�� � ������⢮ ��ப�, 2 �⮫��, 1 � 2 ���������}
              THEN
                BEGIN
                  Cell := '6';
                  IF Value = 'X'
                  THEN
                    BEGIN
                      IF Str = '2'
                      THEN
                        Str := '0';
                      IF Col2 = '2'
                      THEN
                        Col2 := '0';
                      IF Diag1 = '2'
                      THEN
                        Diag1 := '0';
                      IF Diag2 = '2'
                      THEN
                        Diag2 := '0'
                    END
                  ELSE
                    BEGIN
                      IF Str = '1'
                      THEN
                        Str := '0';
                      IF Col2 = '1'
                      THEN
                        Col2 := '0';
                      IF Diag1 = '1'
                      THEN
                        Diag1 := '0';
                      IF Diag2 = '1'
                      THEN
                        Diag2 := '0'
                    END
                END
              ELSE
                IF Cell = '6'{�祩�� 2:3 �室�� � ������⢮ ��ப�, 3 �⮫��}
                THEN
                  BEGIN {��७�� ��ப� ��� ⠡��筮�� ����ࠦ���� ���⨨}
                    Cell := '7';
                    IF Value = 'X'
                    THEN
                      BEGIN
                        IF Str = '1'
                        THEN
                          WonX := 'T';
                        IF Col3 = '2'
                        THEN
                          Col3 := '0';
                      END
                    ELSE
                      BEGIN
                        IF Str = '2'
                        THEN
                          WonO := 'T';
                        IF Col3 = '1'
                        THEN
                          Col3 := '0';
                      END;
                    Str := '0';
                    WRITELN
                  END
                ELSE
                  IF Cell = '7'{�祩�� 3:1 �室�� � ������⢮ ��ப�, 1 �⮫��, 2 ���������}
                  THEN
                    BEGIN
                      Cell := '8';
                      IF Value = 'X'
                      THEN
                        BEGIN
                          Str := '1';
                          IF Col1 = '1'
                          THEN
                            WonX := 'T';
                          IF Diag2 = '1'
                          THEN
                            WonX := 'T';
                        END
                      ELSE
                        BEGIN
                          Str := '2';
                          IF Col1 = '2'
                          THEN
                            WonO := 'T';
                          IF Diag2 = '2'
                          THEN
                            WonO := 'T';
                        END
                    END
                  ELSE
                    IF Cell = '8'{�祩�� 3:2 �室�� � ������⢮ ��ப�, 2 �⮫��}
                    THEN
                      BEGIN
                        Cell := '9';
                        IF Value = 'X'
                        THEN
                          BEGIN
                            IF Col2 = '1'
                            THEN
                              WonX := 'T';
                            IF Str = '2'
                            THEN
                              Str := '0'
                          END
                        ELSE
                          BEGIN
                            IF Col2 = '2'
                            THEN
                              WonO := 'T';
                            IF Str = '1'
                            THEN
                              Str := '0'
                          END
                      END
                    ELSE
                      IF Cell = '9'{�祩�� 3:3 �室�� � ������⢮ ��ப�, 3 �⮫��, 1 ���������}
                      THEN
                        BEGIN {��७�� ��ப� ��� ⠡��筮�� ����ࠦ���� ���⨨}
                          Cell := '0';
                          IF Value = 'X'
                          THEN
                            BEGIN
                              IF Str = '1'
                              THEN
                                WonX := 'T';
                              IF Col3 = '1'
                              THEN
                                WonX := 'T';
                              IF Diag1 = '1'
                              THEN
                                WonX := 'T';
                            END
                          ELSE
                            BEGIN
                              IF Str = '2'
                              THEN
                                WonO := 'T';
                              IF Col3 = '2'
                              THEN
                                WonO := 'T';
                              IF Diag1 = '2'
                              THEN
                                WonO := 'T';
                            END;
                          WRITELN
                        END;

  END;
  IF Err <> 'T' 
  THEN
    IF WonX = 'T'{�뢮� ������⥫�}
    THEN
      IF WonO = 'T'
      THEN
        WRITELN('Draw')
      ELSE
        WRITELN('X won!')
    ELSE
      IF WonO = 'T'
      THEN
        WRITELN('O won!')
      ELSE
        WRITELN('Draw')
END.{TicTacToe}
