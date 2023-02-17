PROGRAM CountChar(INPUT, OUTPUT);
VAR
  O, H, T, Ch: CHAR;
BEGIN
  O := '0';
  T := '0';
  H := '0';
  READ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF O = '0'
      THEN
        O := '1'
      ELSE
        IF O = '1'
        THEN
          O := '2'
        ELSE
          IF O = '2'
          THEN
            O := '3'
          ELSE
            IF O = '3'
            THEN
              O := '4'
            ELSE
              IF O = '4'
              THEN
                O := '5'
              ELSE
                IF O = '5'
                THEN
                  O := '6'
                ELSE
                  IF O = '6'
                  THEN
                    O := '7'
                  ELSE
                    IF O = '7'
                    THEN
                      O := '8'
                    ELSE
                      IF O = '8'
                      THEN
                        O := '9'
                      ELSE
                        IF O = '9'
                        THEN                           {TEN}
                          BEGIN
                            O := '0';
                            IF T = '0'
                            THEN
                              T := '1'
                            ELSE
                              IF T = '1'
                              THEN
                                T := '2'
                              ELSE
                                IF T = '2'
                                THEN
                                  T := '3'
                                ELSE
                                  IF T = '3'
                                  THEN
                                    T := '4'
                                  ELSE
                                    IF T = '4'
                                  THEN
                                    T := '5'
                                  ELSE
                                    IF T = '5'
                                    THEN
                                      T := '6'
                                    ELSE
                                      IF T = '6'
                                      THEN
                                        T := '7'
                                      ELSE
                                        IF T = '7'
                                        THEN
                                          T := '8'
                                        ELSE
                                          IF T = '8'
                                          THEN
                                            T := '9'
                                          ELSE
                                            IF T = '9'  {TEN}
                                            THEN
                                              BEGIN
                                                T := '0';
                                                IF H = '0'
                                                THEN
                                                  H := '1'
                                                ELSE
                                                  IF H = '1'
                                                  THEN
                                                    H := '2'
                                                  ELSE
                                                    IF H = '2'
                                                    THEN
                                                      H := '3'
                                                    ELSE
                                                      IF H = '3'
                                                      THEN
                                                        H := '4'
                                                      ELSE
                                                        IF H = '4'
                                                        THEN
                                                          H := '5'
                                                        ELSE
                                                          IF H = '5'
                                                          THEN
                                                            H := '6'
                                                          ELSE
                                                            IF H = '6'
                                                            THEN
                                                              H := '7'
                                                            ELSE
                                                              IF H = '7'
                                                              THEN
                                                                H := '8'
                                                              ELSE
                                                                IF H = '8'
                                                                THEN
                                                                  H := '9'
                                                                ELSE
                                                                  IF H = '9'
                                                                  THEN
								    WRITELN('!!!!Counter overflow, the result is not correct!!!!')
                                              END
                          END;
      READ(Ch)
    END;
  WRITELN('Number of characters is ', H, T, O)
END.
