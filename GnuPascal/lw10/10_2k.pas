PROGRAM Syntax(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5, Space, Open, Semicolon, Comma, OpenH, OpenL: CHAR;
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  Space := 'N';
  Open := 'N';
  Semicolon := 'N';
  Comma := 'N';
  OpenH := '0';
  OpenL := '0';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO  
        BEGIN
          W1 := W2;
          W2 := W3;
          W3 := W4;
          W4 := W5;
          READ(INPUT, W5);
          IF W1 = ' '
          THEN
            IF W2 = ' '
            THEN
            ELSE
              IF (OpenH <> '0') OR (OpenL <> '0')
              THEN
                IF Open = 'Y'
                THEN
                ELSE
                  IF (W2 = ')') OR (W2 = '(') OR (W2 = ',') OR (W2 = ';')
                  THEN
                  ELSE
                    WRITE(OUTPUT, W1)
              ELSE
                IF ((W2 = 'E') AND (W3 = 'N') AND (W4 = 'D') AND (W5 = '.')) OR
                   ((W2 = 'e') AND (W3 = 'n') AND (W4 = 'd') AND (W5 = '.')) OR
                   ((W2 = 'E') AND (W3 = 'n') AND (W4 = 'd') AND (W5 = '.'))
                THEN
                  BEGIN
                    WRITELN(OUTPUT);
                    WRITELN(OUTPUT, 'END.');
                    W2 := ' ';
                    W3 := ' ';
                    W4 := ' ';
                    W5 := ' ';
                    WHILE NOT EOLN(INPUT)
                    DO 
                      BEGIN
                        READ(INPUT, W1);
                        WRITE(OUTPUT, W1)
                      END;
                    W1 := ' ';
                    WRITELN(OUTPUT)  
                  END
                ELSE                                        
          ELSE
            IF ((W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') 
                AND (W5 = 'N')) OR ((W1 = 'B') AND (W2 = 'e') AND (W3 = 'g') 
                AND (W4 = 'i') AND (W5 = 'n')) OR ((W1 = 'b') AND (W2 = 'e') 
                AND (W3 = 'g') AND (W4 = 'i') AND (W5 = 'n'))  
            THEN
              IF (OpenH = '0') AND (OpenL = '0')
              THEN
                BEGIN
                  WRITE(OUTPUT, 'BEGIN');
                  W1 := ' ';
                  W2 := ' ';
                  W3 := ' ';
                  W4 := ' ';
                  W5 := ' '
                END
              ELSE
                IF Comma = 'Y'
                THEN
                  WRITE(OUTPUT, ' ', W1)
                ELSE
                  WRITE(OUTPUT, W1) 
            ELSE
              IF Space = 'Y'
              THEN
                IF (OpenH = '0') AND (OpenL = '0')
                THEN
                  IF (W1 = '(') OR (W1 = ';')
                  THEN
                    IF (Semicolon = 'Y') AND (W1 = ';')
                    THEN
                      BEGIN
                        WRITELN(OUTPUT);
                        Semicolon := 'N';
                        WRITE(OUTPUT, '  ', W1)
                      END  
                    ELSE
                      WRITE(OUTPUT, W1)
                  ELSE
                    BEGIN
                      WRITELN(OUTPUT);
                      Semicolon := 'N';
                      WRITE(OUTPUT, '  ', W1)
                    END
                ELSE
                  BEGIN
                    Open := 'N';
                    Semicolon := 'N';
                    WRITE(OUTPUT, W1)
                  END
              ELSE
                IF Semicolon = 'Y'
                THEN
                  BEGIN
                    WRITELN(OUTPUT);
                    Semicolon := 'N';
                    WRITE(OUTPUT, '  ', W1)
                  END  
                ELSE
                  IF Comma = 'Y'
                  THEN
                    WRITE(OUTPUT, ' ', W1)
                  ELSE
                    BEGIN
                      Open := 'N';
                      WRITE(OUTPUT, W1)
                    END;          
          Space := 'N';
          Comma := 'N';        
          IF W1 = ' '
          THEN
            Space := 'Y'
          ELSE 
	        IF W1 = '('
            THEN
              BEGIN
                Open := 'Y';
                IF OpenL = '0' 
                THEN 
                  OpenL := '1' 
                ELSE
                  IF OpenL = '1' 
                  THEN 
                    OpenL := '2' 
                  ELSE
                    IF OpenL = '2' 
                    THEN 
                      OpenL := '3' 
                    ELSE
                      IF OpenL = '3' 
                      THEN 
                        OpenL := '4' 
                      ELSE
                        IF OpenL = '4' 
                        THEN 
                          OpenL := '5' 
                        ELSE
                          IF OpenL = '5' 
                          THEN 
                            OpenL := '6' 
                          ELSE
                            IF OpenL = '6' 
                            THEN 
                              OpenL := '7' 
                            ELSE
                              IF OpenL = '7' 
                              THEN 
                                OpenL := '8' 
                              ELSE
                                IF OpenL = '8' 
                                THEN 
                                  OpenL := '9' 
                                ELSE
                                  IF OpenL = '9'
                                  THEN
                                    BEGIN
                                      OpenL := '0';
                                      IF OpenH = '0' THEN OpenH := '1' ELSE
                                      IF OpenH = '1' THEN OpenH := '2' ELSE
                                      IF OpenH = '2' THEN OpenH := '3' ELSE
                                      IF OpenH = '3' THEN OpenH := '4' ELSE
                                      IF OpenH = '4' THEN OpenH := '5' ELSE
                                      IF OpenH = '5' THEN OpenH := '6' ELSE
                                      IF OpenH = '6' THEN OpenH := '7' ELSE
                                      IF OpenH = '7' THEN OpenH := '8' ELSE
                                      IF OpenH = '8' THEN OpenH := '9' ELSE
                                      IF OpenH = '9' 
                                      THEN
                                        BEGIN
                                          OpenH := '0';
                                          OpenL := '0';
                                          WRITELN(OUTPUT);
                                          WRITELN('!!!Why so much?!!!')		
                                        END
                                    END
              END
            ELSE
              IF W1 = ')'
              THEN
                BEGIN
                  IF OpenL = '9' 
                  THEN 
                    OpenL := '8' 
                  ELSE
                    IF OpenL = '8' 
                    THEN 
                      OpenL := '7' 
                    ELSE
                      IF OpenL = '7' 
                      THEN 
                        OpenL := '6' 
                      ELSE
                        IF OpenL = '6' 
                        THEN 
                          OpenL := '5' 
                        ELSE
                          IF OpenL = '5' 
                          THEN 
                            OpenL := '4' 
                          ELSE
                            IF OpenL = '4' 
                            THEN 
                              OpenL := '3' 
                            ELSE
                              IF OpenL = '3' 
                              THEN 
                                OpenL := '2' 
                              ELSE
                                IF OpenL = '2' 
                                THEN 
                                  OpenL := '1' 
                                ELSE
                                  IF OpenL = '1' 
                                  THEN 
                                    OpenL := '0' 
                                  ELSE
                                    IF OpenL = '0'
                                    THEN
                                      BEGIN
                                        OpenL := '9';
                                        IF OpenH = '9' THEN OpenH := '8' ELSE
                                        IF OpenH = '8' THEN OpenH := '7' ELSE
                                        IF OpenH = '7' THEN OpenH := '6' ELSE
                                        IF OpenH = '6' THEN OpenH := '5' ELSE
                                        IF OpenH = '5' THEN OpenH := '4' ELSE
                                        IF OpenH = '4' THEN OpenH := '3' ELSE
                                        IF OpenH = '3' THEN OpenH := '2' ELSE
                                        IF OpenH = '2' THEN OpenH := '1' ELSE
                                        IF OpenH = '1' THEN OpenH := '0' ELSE
                                        IF OpenH = '0' 
                                        THEN
                                          BEGIN
                                            OpenL := '9';
                                            OpenH := '9';
                                            WRITELN(OUTPUT);
                                            WRITELN('!!!Why so much?!!!')		
                                          END
                                      END
                END
              ELSE
               IF W1 = ';'
               THEN
                 Semicolon := 'Y'
               ELSE
                 IF W1 = ','
                 THEN
                   Comma := 'Y';    
        END;
        READLN(INPUT)
    END
END.
