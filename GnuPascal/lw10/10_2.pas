PROGRAM Syntax(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5, Space, OpenH, OpenL: CHAR;
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  Space := 'N';
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
                IF W2 = ')'
                THEN
                ELSE
                  WRITE(OUTPUT, W1)
              ELSE
                IF (W2 = 'E') AND (W3 = 'N') AND (W4 = 'D') AND (W5 = '.')
                THEN
                  BEGIN
                    WRITELN(OUTPUT);
                    WRITE(OUTPUT, W2, W3, W4, W5);
                    W1 := W5;
                    W2 := ' ';
                    W3 := ' ';
                    W4 := ' ';
                    W5 := ' '
                  END
                ELSE                                          
          ELSE
            IF (W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') 
                AND (W5 = 'N') 
            THEN
              IF (OpenH = '0') AND (OpenL = '0')
              THEN
                BEGIN
                  WRITE(OUTPUT, W1, W2, W3, W4, W5);
                  W1 := W5;
                  W2 := ' ';
                  W3 := ' ';
                  W4 := ' ';
                  W5 := ' '
                END
              ELSE
                WRITE(OUTPUT, W1) 
            ELSE
              IF Space = 'Y'
              THEN
                IF (OpenH = '0') AND (OpenL = '0')
                THEN
                  BEGIN
                    WRITELN(OUTPUT);
                    WRITE(OUTPUT, '  ', W1)
                  END
                ELSE
                  WRITE(OUTPUT, W1)
              ELSE  
                WRITE(OUTPUT, W1);          
          Space := 'N';        
          IF W1 = ' '
          THEN
            Space := 'Y'
          ELSE 
	        IF W1 = '('
            THEN
              BEGIN
                IF OpenL = '0' THEN OpenL := '1' ELSE
                IF OpenL = '1' THEN OpenL := '2' ELSE
                IF OpenL = '2' THEN OpenL := '3' ELSE
                IF OpenL = '3' THEN OpenL := '4' ELSE
                IF OpenL = '4' THEN OpenL := '5' ELSE
                IF OpenL = '5' THEN OpenL := '6' ELSE
                IF OpenL = '6' THEN OpenL := '7' ELSE
                IF OpenL = '7' THEN OpenL := '8' ELSE
                IF OpenL = '8' THEN OpenL := '9' ELSE
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
                        WRITELN('!!!!!!!!!!!!!Why so much?!!!!!!!!!!!!!')		
                      END
                  END
              END
            ELSE
              IF W1 = ')'
              THEN
                BEGIN
                  IF OpenL = '9' THEN OpenL := '8' ELSE
                  IF OpenL = '8' THEN OpenL := '7' ELSE
                  IF OpenL = '7' THEN OpenL := '6' ELSE
                  IF OpenL = '6' THEN OpenL := '5' ELSE
                  IF OpenL = '5' THEN OpenL := '4' ELSE
                  IF OpenL = '4' THEN OpenL := '3' ELSE
                  IF OpenL = '3' THEN OpenL := '2' ELSE
                  IF OpenL = '2' THEN OpenL := '1' ELSE
                  IF OpenL = '1' THEN OpenL := '0' ELSE
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
                          WRITELN('!!!!!!!!!!!!!Why so much?!!!!!!!!!!!!!')		
                        END
                    END
                END
        END;
        READLN(INPUT)
    END
END.
