{Задача:
На вход подаётся строка из 9 знаков из X или O,
как в игре крестики нолики. На выходе требуется выдать, кто выиграл: X или O или ничья}
PROGRAM TicTakToe(INPUT, OUTPUT);
Var
  Cell, Value, WonX, WonO, Str, Col1, Col2, Col3, Diag1, Diag2, Err: CHAR;
BEGIN{TicTacToe}
  {переменные для определения выигрышных комбинаций соперников}
  WonX := 'F';
  WonO := 'F';
  {Переменные для проверки комбинаций. 0 - сброс комбинации, 1 - Х, 2 - О}
  Str := '0'; {string - переменная для проверки по строкам}
  Col1 := '0'; {column 1 - переменная для проверки 1 столбца}
  Col2 := '0'; {column 2 - переменная для проверки 2 столбца}
  Col3 := '0'; {column 3 - переменная для проверки 3 столбца}
  Diag1 := '0'; {diagonal 1 - переменная для проверки диагонали 1-5-9}
  Diag2 := '0'; {diagonal 2 - переменная для проверки диагонали 3-5-7}
  {перменная для проверки ошибки заполнения комбинации}
  Err := 'F'; 
  WRITELN('Input tic tak toe combination in string');
  Cell := '1';
  WHILE Cell <> '0'
  DO
    BEGIN
      READ(Value);
      WRITE(Value, ' ');
      IF Value <> 'X'{Проверка на правильное заполнение}
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
          IF Value = 'X'{ячейка 1:1 входит в множество строки, 1 столбца, 1 диагонали}
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
        IF Cell = '2'{ячейка 1:2 входит в множество строки, 2 столбца}
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
          IF Cell = '3'{ячейка 1:3 входит в множество строки, 3 столбца, 2 диагонали}
          THEN
            BEGIN {перенос строки для табличного изображения партии}
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
            IF Cell = '4'{ячейка 2:1 входит в множество строки, 1 столбца}
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
              IF Cell = '5'{ячейка 2:2 входит в множество строки, 2 столбца, 1 и 2 диагонали}
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
                IF Cell = '6'{ячейка 2:3 входит в множество строки, 3 столбца}
                THEN
                  BEGIN {перенос строки для табличного изображения партии}
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
                  IF Cell = '7'{ячейка 3:1 входит в множество строки, 1 столбца, 2 диагонали}
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
                    IF Cell = '8'{ячейка 3:2 входит в множество строки, 2 столбца}
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
                      IF Cell = '9'{ячейка 3:3 входит в множество строки, 3 столбца, 1 диагонали}
                      THEN
                        BEGIN {перенос строки для табличного изображения партии}
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
    IF WonX = 'T'{Вывод победителя}
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
