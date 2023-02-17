PROGRAM Syntax(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5, NewLn, Coment, Liter: CHAR; 
  Space, Parenthesis, Comma, Point, Semicolon: CHAR;
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  Space := 'N';
  Comma := 'N';
  Point := 'N';
  Parenthesis := '0';
  NewLn := 'Y';
  Semicolon := 'N';
  Coment := '0';
  Liter := 'N';
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
          WHILE W5 = ' '
          DO
            READ(INPUT, W5);             
{Print BEGIN}          
          IF (W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') AND 
             (W5 = 'N') AND (Parenthesis = '0') 
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
          IF (W1 <> ' ') AND (NewLn = 'Y') AND (Parenthesis = '0')
            AND NOT ((W1 = 'E') AND (W2 = 'N') AND (W3 = 'D'))
          THEN
            IF ((W1 >= 'A') AND (W1 <= 'Z')) OR ((W1 >= 'a') AND (W1 <= 'z'))
              OR (W1 = ';')
            THEN
              BEGIN    
                NewLn := 'N';
                WRITE(OUTPUT, '  ');
              END
            ELSE    
              NewLn := 'N';  
{Print Operator.}
          IF (W1 <> ' ') AND (NewLn = 'N') AND (Parenthesis = '0')
            AND NOT ((W1 = 'E') AND (W2 = 'N') AND (W3 = 'D'))
          THEN
            IF ((W1 >= 'A') AND (W1 <= 'Z')) OR ((W1 >= 'a') AND (W1 <= 'z')) 
              OR (W1 = '(') OR (W1 = ';') OR ((W1 >= '0') AND (W1 <= '9'))
            THEN 
              WRITE(OUTPUT, W1); 
{Assignment}            
          IF (W1 = ':') AND (W2 = '=') AND (Parenthesis = '0')
          THEN
            BEGIN
              WRITE(OUTPUT, ' ', W1, W2, ' ');
              W1 := ' ';
              W2 := ' '
            END;
          IF (W1 = '*') OR (W1 = '/') OR (W1 = '+') OR (W1 = '-')
          THEN
            BEGIN
              WRITE(OUTPUT, ' ', W1, ' ');
              W1 := ' '
            END;     
{Print Argyment Operator.}
          IF (W1 <> ' ') AND (Parenthesis <> '0') AND (W1 <> '*')
            AND NOT ((W1 = 'E') AND (W2 = 'N') AND (W3 = 'D') AND (W4 = '.'))
          THEN
            IF (Point = 'Y') OR (Comma = 'Y') OR (Semicolon = 'Y')
            THEN
              WRITE(OUTPUT, ' ', W1)
            ELSE
              WRITE(OUTPUT, W1);                            
{Find and print end OPERATOR.}
          IF (W1 = ';') AND (W2 <> ';') AND (Parenthesis = '0')
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
              IF Parenthesis = '0' THEN Parenthesis := '1' ELSE
              IF Parenthesis = '1' THEN Parenthesis := '2' ELSE
              IF Parenthesis = '2' THEN Parenthesis := '3' ELSE
              IF Parenthesis = '3' THEN Parenthesis := '4' ELSE
              IF Parenthesis = '4' THEN Parenthesis := '5' ELSE
              IF Parenthesis = '5' THEN Parenthesis := '6' ELSE
              IF Parenthesis = '6' THEN Parenthesis := '7' ELSE
              IF Parenthesis = '7' THEN Parenthesis := '8' ELSE
              IF Parenthesis = '8' THEN Parenthesis := '9' ELSE
              IF Parenthesis = '9' 
              THEN 
                BEGIN
                  Parenthesis := '0';
                  WRITE(OUTPUT, '{Counter overflow ''()''}')
                END  
            END;
          IF W1 = ')'
          THEN
            BEGIN
              IF Parenthesis = '9' THEN Parenthesis := '8' ELSE
              IF Parenthesis = '8' THEN Parenthesis := '7' ELSE
              IF Parenthesis = '7' THEN Parenthesis := '6' ELSE
              IF Parenthesis = '6' THEN Parenthesis := '5' ELSE
              IF Parenthesis = '5' THEN Parenthesis := '4' ELSE
              IF Parenthesis = '4' THEN Parenthesis := '3' ELSE
              IF Parenthesis = '3' THEN Parenthesis := '2' ELSE
              IF Parenthesis = '2' THEN Parenthesis := '1' ELSE
              IF Parenthesis = '1' THEN Parenthesis := '0' ELSE
              IF Parenthesis = '0' 
              THEN
                BEGIN
                  Parenthesis := '0';
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
              WRITE(OUTPUT, W2);
              W2 := ' ';
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
          IF (W1 = 'E') AND (W2 = 'N') AND (W3 = 'D') AND (W4 = '.')
          THEN
            BEGIN
              IF NewLn = 'N'
              THEN
                WRITELN(OUTPUT);
              WRITE(OUTPUT, 'END.');
              W1 := ' ';
              W2 := ' ';
              W3 := ' ';
              W4 := ' ';
              Parenthesis := '0'
            END
          ELSE
            IF (W3 = 'E') AND (W4 = 'N') AND (W5 = 'D') AND EOLN(INPUT) 
               AND (Parenthesis = '0')
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
              IF (W2 = 'E') AND (W3 = 'N') AND (W4 = 'D') AND (W5 = '.') 
                AND EOLN(INPUT)
              THEN
                 BEGIN
                   IF NewLn = 'N'
                   THEN
                     WRITELN(OUTPUT);
                   WRITE(OUTPUT, 'END.');
                   W2 := ' ';
                   W3 := ' ';
                   W4 := ' ';
                   W5 := ' '
                 END
              ELSE
                IF (W2 = 'E') AND (W3 = 'N') AND (W4 = 'D') AND (W5 <> '.') 
                  AND (Parenthesis = '0')
                THEN
                  BEGIN
                    IF NewLn = 'N'
                    THEN
                      WRITELN(OUTPUT);
                    WRITE(OUTPUT, 'END');
                    NewLn := 'N';
                    W2 := ' ';
                    W3 := ' ';
                    W4 := ' '  
                  END                                                        
        END;
{EOLN}      
      READLN(INPUT);
      IF NOT EOF(INPUT)
      THEN
        BEGIN
          WRITELN(OUTPUT);
          NewLn := 'Y';
          Parenthesis := '0'
        END
    END
END.
