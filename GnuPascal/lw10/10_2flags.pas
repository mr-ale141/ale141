PROGRAM Syntax(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5, Space, OpenH, OpenL: CHAR; 
  Semicolon, Comma, Point, Digit, AlphaH, AlphaL, Another: CHAR;
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  Space := 'N';
  OpenH := '0';
  OpenL := '0';
  Semicolon := 'N';
  Comma := 'N';
  Point := 'N';
  Digit := 'N';
  AlphaH := 'N';
  AlphaL := 'N';
  Another := 'N';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO  
        BEGIN
	  READ(INPUT, W5);	
          IF ((W5 < 'A') OR (W5 > 'Z')) AND ((W5 < 'a') OR (W5 > 'z'))
          THEN
            IF W5 = ';'
            THEN
                Semicolon := 'Y'
            ELSE 
	      IF W5 = '('
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
                IF W5 = ')'
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
                ELSE
                  IF W5 = ','
                  THEN
                    Comma := 'Y'
                  ELSE
                    IF W5 = '.'
                    THEN
                      Point := 'Y'
                    ELSE
                      IF (W5 >= '0') AND (W5 <= '9')
                      THEN
                        Digit := 'Y'
                      ELSE
                        IF W5 = ' '
                        THEN
                          Space := 'Y'
                        ELSE
                          Another := 'Y'
          ELSE
            IF (W5 >= 'A') AND (W5 <= 'Z')
            THEN
              AlphaH := 'Y'
            ELSE
              AlphaL := 'Y';
  WRITE(W5, '| |=', Space, ' ()=', OpenH, OpenL); 
  WRITE(' ;=', Semicolon, ' ,=', Comma, ' .=', Point, ' 1=', Digit);
  WRITELN(' AL=', AlphaL, ' AH=', AlphaH, ' #=', Another)  	  

  {Space := 'N';
  Semicolon := 'N';
  Comma := 'N';
  Point := 'N';
  Digit := 'N';
  AlphaH := 'N';
  AlphaL := 'N';
  Another := 'N'} 

        END;
        READLN(INPUT)
    END
END.
