PROGRAM Syntax(INPUT, OUTPUT);
VAR
  Ch, W1, W2, W3, W4, W5, Status, NewLn: CHAR;
BEGIN
  Ch := ' ';
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  Status := 'B'; {B-Begin, E-End, 0-Operator, 1-9 -Argument, A-Assignment}
  NewLn := 'Y';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN {WHILE NOT EOF(INPUT)}
      WHILE NOT EOLN(INPUT)
      DO  
        BEGIN {WHILE NOT EOLN(INPUT)}
          WHILE (Ch = ' ') AND NOT EOLN(INPUT)
          DO
            READ(INPUT, Ch);
          IF Ch = '{'
          THEN
            BEGIN {Ch = '{'} 
              WRITE(OUTPUT, Ch);
              NewLn := 'N';
              WHILE (Ch <> '}') AND NOT EOLN(INPUT)
              DO
                BEGIN
                  READ(INPUT, Ch);
                  WRITE(OUTPUT, Ch)
                END;
              {IF Status = 'B'
              THEN
                BEGIN
                  WRITELN(OUTPUT);
                  NewLn := 'Y'
                END;}
              Ch := ' '          
            END {Ch = '{'}
          ELSE  
            IF Ch = ''''
            THEN
              BEGIN {Ch = ''''}
                WRITE(OUTPUT, Ch);
                NewLn := 'N';
                IF NOT EOLN(INPUT)
                THEN
                  READ(INPUT, Ch);
                WHILE (Ch <> '''') AND NOT EOLN(INPUT)
                DO
                  BEGIN
                    WRITE(OUTPUT, Ch);
                    READ(INPUT, Ch)
                  END;
                WRITE(OUTPUT, Ch);
                Ch := ' '  
              END {Ch = ''''}
            ELSE            
              IF Status = 'B'
              THEN
                BEGIN {Status = 'B'}
                  IF Ch = 'B'
                  THEN
                    BEGIN {Ch = 'B'}
                      WHILE (W1 = ' ') AND NOT EOLN(INPUT)
                      DO
                        BEGIN
                          W1 := W2;
                          W2 := W3;
                          W3 := W4;
                          READ(INPUT, W4);
                          WHILE (W4 = ' ') AND NOT EOLN(INPUT)
                          DO
                            READ(INPUT, W4)
                        END;
                      IF (W1 = 'E') AND (W2 = 'G') AND (W3 = 'I') AND (W4 = 'N')
                      THEN
                        BEGIN
                          IF NewLn = 'N'
                          THEN
                            WRITELN(OUTPUT);
                          WRITE(OUTPUT, 'BEGIN');
                          Ch := ' ';
                          W1 := ' ';
                          W2 := ' ';
                          W3 := ' ';
                          W4 := ' ';
                          Status := 'E';
                          NewLn := 'N'
                        END
                      ELSE
                        BEGIN
                          WRITE(OUTPUT, Ch, W1, W2, W3, W4);
                          Ch := ' ';
                          W1 := ' ';
                          W2 := ' ';
                          W3 := ' ';
                          W4 := ' ';
                          NewLn := 'N'
                        END    
                    END {Ch = 'B'}
                  ELSE
                    BEGIN
                      WRITE(OUTPUT, Ch);
                      NewLn := 'N';
                      Ch := ' '
                    END  
                END {Status = 'B'}
              ELSE
                BEGIN {Status <> 'B'}
                  IF Status = 'E'
                  THEN
                    BEGIN {Status = 'E'}
                      IF Ch = 'E'
                      THEN
                        BEGIN {Ch = 'E'}
                          WHILE (W1 = ' ') AND NOT EOLN(INPUT)
                          DO
                            BEGIN
                              W1 := W2;
                              READ(INPUT, W2);
                              WHILE (W2 = ' ') AND NOT EOLN(INPUT)
                              DO
                                READ(INPUT, W2)
                            END;    
                          IF (W1 = 'N') AND (W2 = 'D') 
                          THEN
                            BEGIN
                              IF NewLn = 'N'
                              THEN
                                WRITELN(OUTPUT);
                              WRITE(OUTPUT, 'END');
                              Ch := ' ';
                              W1 := ' ';
                              W2 := ' ';
                              NewLn := 'N'
                            END
                          ELSE
                            BEGIN
                              IF W5 = '$'
                              THEN
                                BEGIN
                                  Status := 'A';
                                  W5 := ' '
                                END
                              ELSE
                                Status := '0';    
                              NewLn := 'Y'
                            END  
                        END {Ch = 'E'}
                      ELSE
                        IF Ch = '.'
                        THEN
                          BEGIN {Ch = '.'}
                            WRITE(OUTPUT, '.');
                            Status := 'B';
                            Ch := ' '
                          END {Ch = '.'}
                        ELSE
                          BEGIN
                            IF W5 = '$'
                              THEN
                                BEGIN
                                  Status := 'A';
                                  W5 := ' '
                                END
                              ELSE
                                Status := '0';
                            NewLn := 'Y'
                          END {Ch <> 'E'}    
                    END {Status = 'E'}
                  ELSE
                    BEGIN {Status <> 'E'}
                      IF Status = '0'
                      THEN
                        BEGIN {Status = '0'}
                          IF NewLn = 'Y'
                          THEN
                            BEGIN
                              WRITELN(OUTPUT);
                              WRITE(OUTPUT, '  ')
                            END;
                          NewLn := 'N';
                          IF Ch = '('
                          THEN
                            BEGIN
                              WRITE(OUTPUT, Ch);
                              Status := '1';
                              Ch := ' '
                            END
                          ELSE
                            IF Ch = ';'
                            THEN
                              BEGIN
                                WRITE(OUTPUT, Ch);
                                Ch := ' ';
                                WHILE (Ch = ' ') AND NOT EOLN(INPUT)
                                DO
                                  READ(INPUT, Ch);
                                IF Ch <> ';'
                                  THEN
                                    Status := 'E'
                                  ELSE
                                    WRITE(OUTPUT, Ch)
                              END
                            ELSE
                              IF (Ch = ':') OR (Ch = '<') OR (Ch = '>')
                              THEN
                                BEGIN
                                  WHILE (W2 = ' ') AND NOT EOLN(INPUT)
                                  DO
                                    READ(INPUT, W2);
                                  IF W2 = '='
                                  THEN
                                    BEGIN
                                      WRITE(OUTPUT, ' ', Ch, W2, ' ');
                                      Status := 'A';
                                      Ch := ' ';
                                      W2 := ' '
                                    END                                            
                                  ELSE
                                    BEGIN
                                      WRITE(OUTPUT, Ch, ' ', W2);
                                      Ch := ' ';
                                      W2 := ' '
                                    END  
                                END
                              ELSE
                                BEGIN
                                  WRITE(OUTPUT, Ch);
                                  Ch := ' '
                                END;
                          IF W1 <> ' '
                          THEN
                            BEGIN
                              IF W1 = '('
                              THEN
                                BEGIN
                                  WRITE(OUTPUT, W1);
                                  Status := '1';
                                  Ch := W2
                                END
                              ELSE
                                IF W1 = '{'
                                THEN
                                  BEGIN
                                    WRITE(OUTPUT, W1);
                                    W1 := ' ';
                                    NewLn := 'N';
                                    WHILE (Ch <> '}') AND NOT EOLN(INPUT)
                                    DO
                                      BEGIN
                                        IF W2 <> ' '
                                        THEN
                                          BEGIN
                                            Ch := W2;
                                            W2 := ' '
                                          END
                                        ELSE
                                          READ(INPUT, Ch);
                                        WRITE(OUTPUT, Ch)
                                      END;
                                    Ch := ' '
                                  END
                                ELSE
                                  BEGIN  
                                    Ch := W1;
                                    W1 := ' '
                                  END
                            END  
                          ELSE
                            IF W2 <> ' '
                            THEN
                              BEGIN
                                Ch := W2;
                                W2 := ' '
                              END  
                        END {Status = '0'}
                      ELSE
                        IF Status = 'A'
                        THEN
                          BEGIN {Status = 'A'}
                            IF (Ch = '+') OR (Ch = '-') OR (Ch = '*') OR 
                                 (Ch = '/') OR (Ch = '&') OR (Ch = '^') OR 
                                 (Ch = '%') OR (Ch = '$') OR (Ch = '#') OR
                                 (Ch = '@') OR (Ch = '=')
                            THEN
                              BEGIN
                                WRITE(OUTPUT, ' ', Ch, ' ');
                                Ch := ' '
                              END
                            ELSE
                              IF (Ch >= '0') AND (Ch <= '9')
                              THEN
                                BEGIN
                                  WRITE(OUTPUT, Ch);
                                  Ch := ' '
                                END
                              ELSE
                                IF Ch = ';'
                                THEN
                                  Status := '0'
                                ELSE
                                  IF Ch = 'E'
                                  THEN
                                    Status := 'E'
                                  ELSE
                                    IF (Ch = '<') OR (Ch = '>')
                                    THEN
                                      BEGIN
                                        WHILE (W2 = ' ') AND NOT EOLN(INPUT)
                                        DO
                                          READ(INPUT, W2);
                                        IF W2 = '='
                                        THEN
                                          BEGIN
                                            WRITE(OUTPUT, ' ', Ch, W2, ' ');
                                            Ch := ' ';
                                            W2 := ' '
                                          END
                                      END
                                    ELSE
                                      BEGIN
                                        WRITE(OUTPUT, Ch);
                                        Ch := ' '
                                      END;  
                            IF W1 <> ' '
                            THEN
                              Ch := W1
                            ELSE
                              IF W2 <> ' '
                              THEN
                                Ch := W2
                          END {Status = 'A'}
                        ELSE  
                          BEGIN {Status = '1-9'}
                            IF Ch = ','
                            THEN
                              BEGIN
                                WRITE(OUTPUT, Ch, ' ');
                                Ch := ' '
                              END  
                            ELSE
                              IF Ch = '('
                              THEN
                                BEGIN
                                  IF Status = '1' THEN Status := '2' ELSE
                                  IF Status = '2' THEN Status := '3' ELSE
                                  IF Status = '3' THEN Status := '4' ELSE
                                  IF Status = '4' THEN Status := '5' ELSE
                                  IF Status = '5' THEN Status := '6' ELSE
                                  IF Status = '6' THEN Status := '7' ELSE
                                  IF Status = '7' THEN Status := '8' ELSE
                                  IF Status = '8' THEN Status := '9' ELSE
                                  IF Status = '9' 
                                  THEN 
                                    BEGIN
                                      Status := '1';
                                      WRITE(OUTPUT, '{Counter overflow ''()''}')
                                    END;
                                  WRITE(OUTPUT, Ch);
                                  Ch := ' '    
                                END
                              ELSE
                                IF Ch = ')'
                                THEN
                                  BEGIN
                                    IF Status = '9' THEN Status := '8' ELSE
                                    IF Status = '8' THEN Status := '7' ELSE
                                    IF Status = '7' THEN Status := '6' ELSE
                                    IF Status = '6' THEN Status := '5' ELSE
                                    IF Status = '5' THEN Status := '4' ELSE
                                    IF Status = '4' THEN Status := '3' ELSE
                                    IF Status = '3' THEN Status := '2' ELSE
                                    IF Status = '2' THEN Status := '1' ELSE
                                    IF Status = '1' THEN Status := '0' ELSE
                                    IF Status = 'E'
                                    THEN 
                                      BEGIN
                                        Status := '9';
                                        WRITE(OUTPUT, '{Counter overflow ''()''}')
                                      END;
                                    WRITE(OUTPUT, Ch);
                                    Ch := ' ';  
                                    WHILE (Ch = ' ') AND NOT EOLN(INPUT)
                                    DO
                                      READ(INPUT, Ch);
                                    IF Ch = ';'
                                    THEN
                                      Status := '0'
                                    ELSE
                                      IF Ch = ')'
                                      THEN
                                      ELSE
                                        IF Ch = '{'
                                        THEN
                                        ELSE
                                          Status := 'E'       
                                  END
                                ELSE
                                  IF (Ch = '+') OR (Ch = '-') OR (Ch = '*') OR 
                                     (Ch = '/') OR (Ch = '&') OR (Ch = '^') OR 
                                     (Ch = '%') OR (Ch = '$') OR (Ch = '#') OR
                                     (Ch = '@') OR (Ch = '=')
                                  THEN
                                    BEGIN
                                      WRITE(OUTPUT, ' ', Ch, ' ');
                                      Ch := ' '
                                    END
                                  ELSE
                                    IF (Ch = '<') OR (Ch = '>')
                                    THEN
                                      BEGIN
                                        WHILE (W2 = ' ') AND NOT EOLN(INPUT)
                                        DO
                                          READ(INPUT, W2);
                                        IF W2 = '='
                                        THEN
                                          BEGIN
                                            WRITE(OUTPUT, ' ', Ch, W2, ' ');
                                            Ch := ' ';
                                            W2 := ' '
                                          END
                                      END
                                    ELSE
                                      BEGIN
                                        WRITE(OUTPUT, Ch);
                                        Ch := ' '
                                      END
                          END  {Status = '1-9'}
                    END {Status <> 'E'} 
                END {Status <> 'B'}                   
        END; {WHILE NOT EOLN(INPUT)}
        READLN(INPUT);
        WRITELN(OUTPUT);
        NewLn := 'Y';
        Status := 'B'
    END {WHILE NOT EOF(INPUT)}
END.
