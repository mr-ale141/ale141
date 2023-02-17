PROGRAM Syntax(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5, Coment, Liter, NewLn: CHAR; 
  Space, Open, Comma, Point, Semicolon: CHAR;
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  Space := 'N';
  Comma := 'N';
  Point := 'N';
  Coment := '0';
  Liter := 'N';
  Open := '0';
  NewLn := 'Y';
  Semicolon := 'N';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO  
        BEGIN
{Move Windows}        
          W1 := W2;
          W2 := W3;
          W3 := W4;
          W4 := W5;
          READ(INPUT, W5); 
          {WHILE W5 = ' '
          DO
            READ(INPUT, W5);}             
{Print BEGIN}          
          IF (W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') AND 
             (W5 = 'N') AND (Open = '0') AND (Liter = 'N') AND (Coment = '0') 
          THEN
            BEGIN
              IF NewLn = 'N'
              THEN
                WRITELN(OUTPUT);
              WRITELN(OUTPUT, 'BEGIN');
              NewLn := 'Y';
              W1 := ' ';
              W2 := ' ';
              W3 := ' ';
              W4 := ' ';
              W5 := ' '
            END;
{Print New Operator.}
          IF (W1 <> ' ') AND (NewLn = 'Y') AND (Open = '0') AND (Liter = 'N') 
            AND (Coment = '0')
            AND NOT ((W1 = 'E') AND (W2 = 'N') AND (W3 = 'D'))
          THEN
            IF (W1 <> '{') AND (W1 <> '}')
            THEN
              BEGIN    
                NewLn := 'N';
                WRITE(OUTPUT, '  ');
              END
            ELSE    
              NewLn := 'N';  
{Print Operator.}
          IF (W1 <> ' ') AND (NewLn = 'N') AND (Open = '0') AND (Liter = 'N') 
            AND (Coment = '0') 
            AND NOT ((W1 = 'E') AND (W2 = 'N') AND (W3 = 'D'))
          THEN
            WRITE(OUTPUT, W1);
{Print Argyment Operator.}
          IF (W1 <> ' ') AND (Open <> '0') AND (Liter = 'N') AND (Coment = '0')
          THEN
            IF (Point = 'Y') OR (Comma = 'Y') OR (Semicolon = 'Y')
            THEN
              WRITE(OUTPUT, ' ', W1)
            ELSE
              WRITE(OUTPUT, W1);                            
{Find end OPERATOR.}
          IF (W1 = ';') AND (W2 <> ';') AND (Open = '0') AND (Liter = 'N') 
            AND (Coment = '0')
          THEN
            BEGIN
              WRITELN(OUTPUT);
              NewLn := 'Y'                             
            END;
{Update Flags}
  {Flag '('}            
          IF W1 = '('
          THEN
            BEGIN
              IF Open = '0' THEN Open := '1' ELSE
              IF Open = '1' THEN Open := '2' ELSE
              IF Open = '2' THEN Open := '3' ELSE
              IF Open = '3' THEN Open := '4' ELSE
              IF Open = '4' THEN Open := '5' ELSE
              IF Open = '5' THEN Open := '6' ELSE
              IF Open = '6' THEN Open := '7' ELSE
              IF Open = '7' THEN Open := '8' ELSE
              IF Open = '8' THEN Open := '9' ELSE
              IF Open = '9' 
              THEN 
                BEGIN
                  Open := '0';
                  WRITE(OUTPUT, '{Counter overflow ''()''}')
                END  
            END;
          IF W1 = ')'
          THEN
            BEGIN
              IF Open = '9' THEN Open := '8' ELSE
              IF Open = '8' THEN Open := '7' ELSE
              IF Open = '7' THEN Open := '6' ELSE
              IF Open = '6' THEN Open := '5' ELSE
              IF Open = '5' THEN Open := '4' ELSE
              IF Open = '4' THEN Open := '3' ELSE
              IF Open = '3' THEN Open := '2' ELSE
              IF Open = '2' THEN Open := '1' ELSE
              IF Open = '1' THEN Open := '0' ELSE
              IF Open = '0' 
              THEN
                BEGIN
                  Open := '9';
                  WRITE(OUTPUT, '{Downplaying the counter ''()''}')
                END
            END; 
  {Flag '''}            
          IF (W1 = '''') AND (W2 <> '''') AND (Liter = 'N') 
          THEN
            Liter := 'Y';
          IF (W1 = '''') AND (W2 <> '''') AND (Liter = 'Y') 
          THEN
            Liter := 'N';
          IF (W1 = '''') AND (W2 = '''')
          THEN
            BEGIN
              WRITE(OUTPUT, W1, W2);
              W1 := ' ';
              W2 := ' '
            END;     
  {Flag '{'}            
          IF W1 = '{'
          THEN
            BEGIN
              IF Coment = '0' THEN Coment := '1' ELSE
              IF Coment = '1' THEN Coment := '2' ELSE
              IF Coment = '2' THEN Coment := '3' ELSE
              IF Coment = '3' THEN Coment := '4' ELSE
              IF Coment = '4' THEN Coment := '5' ELSE
              IF Coment = '5' THEN Coment := '6' ELSE
              IF Coment = '6' THEN Coment := '7' ELSE
              IF Coment = '7' THEN Coment := '8' ELSE
              IF Coment = '8' THEN Coment := '9' ELSE
              IF Coment = '9' 
              THEN 
                BEGIN
                  Coment := '0';
                  WRITE(OUTPUT, '{Counter overflow ''{}''}')
                END  
            END;
          IF W1 = '}'
          THEN
            BEGIN
              IF Coment = '9' THEN Coment := '8' ELSE
              IF Coment = '8' THEN Coment := '7' ELSE
              IF Coment = '7' THEN Coment := '6' ELSE
              IF Coment = '6' THEN Coment := '5' ELSE
              IF Coment = '5' THEN Coment := '4' ELSE
              IF Coment = '4' THEN Coment := '3' ELSE
              IF Coment = '3' THEN Coment := '2' ELSE
              IF Coment = '2' THEN Coment := '1' ELSE
              IF Coment = '1' THEN Coment := '0' ELSE
              IF Coment = '0' 
              THEN
                BEGIN
                  Coment := '9';
                  WRITE(OUTPUT, '{Downplaying the counter ''{}''}')
                END
            END;
  {Flag ';'}            
          IF (W1 = ';')
          THEN
            Semicolon := 'Y'
          ELSE
            Semicolon := 'N';
  {Flag '.'}            
          IF (W1 = '.')
          THEN
            Point := 'Y'
          ELSE
            Point := 'N';  
  {Flag ','}            
          IF (W1 = ',')
          THEN
            Comma := 'Y'
          ELSE
            Comma := 'N';                                      
{Print END.}
          IF (W1 = 'E') AND (W2 = 'N') AND (W3 = 'D') 
             AND (Open = '0') AND (Liter = 'N') AND (Coment = '0')
          THEN
            BEGIN
              IF NewLn = 'N'
              THEN
                WRITELN(OUTPUT);
              WRITE(OUTPUT, 'END');
              W1 := ' ';
              W2 := ' ';
              W3 := ' ';
              IF W4 = '.'
              THEN
                BEGIN
                  WRITE(OUTPUT, W4);
                  W4 := ' ';
                  WRITELN(OUTPUT);
                  NewLn := 'Y'
                END
              ELSE    
                IF W4 <> '.'
                THEN
                  BEGIN
                    WRITELN(OUTPUT);    
                    NewLn := 'Y'
                  END
            END
          ELSE
            IF (W3 = 'E') AND (W4 = 'N') AND (W5 = 'D') AND EOLN(INPUT) 
               AND (Open = '0') AND (Liter = 'N') AND (Coment = '0')
            THEN
              BEGIN
                IF W2 <> ' '
                THEN
                  WRITE(OUTPUT, W2);
                IF NewLn = 'N'
                THEN
                  WRITELN(OUTPUT);
                WRITE(OUTPUT, 'END');
                NewLn := 'N';
                W2 := ' ';
                W3 := ' ';
                W4 := ' ';
                W5 := ' '
              END
            ELSE
              BEGIN
                IF (W2 = 'E') AND (W3 = 'N') AND (W4 = 'D') AND EOLN(INPUT) 
                   AND (Open = '0') AND (Liter = 'N') AND (Coment = '0')
                THEN
                  BEGIN
                    IF NewLn = 'N'
                    THEN
                      WRITELN(OUTPUT);
                    WRITE(OUTPUT, 'END');
                    W2 := ' ';
                    W3 := ' ';
                    W4 := ' ';
                    IF W5 = '.'
                    THEN
                      BEGIN
                        WRITE(OUTPUT, W5);
                        W5 := ' '
                      END
                    ELSE
                      BEGIN
                        WRITELN(OUTPUT);
                        WRITE(OUTPUT, W5);
                        W5 := ' '
                      END
                  END
              END                                                      
        END;
{Before EOLN}      
      READLN(INPUT);
      IF NOT EOF(INPUT) AND (Coment = '0') AND (Open = '0') AND (Liter = 'N')
      THEN
        BEGIN
          WRITELN(OUTPUT);
          NewLn := 'Y'
        END
    END
END.
