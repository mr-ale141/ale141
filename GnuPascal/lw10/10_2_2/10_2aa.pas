PROGRAM Syntax(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5, NewLn: CHAR; 
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
  Parenthesis := 'N';
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
          WHILE W5 = ' '
          DO
            READ(INPUT, W5);             
{Print BEGIN}          
          IF (W1 = 'B') AND (W2 = 'E') AND (W3 = 'G') AND (W4 = 'I') AND 
             (W5 = 'N') AND (Parenthesis = 'N') 
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
          IF (W1 <> ' ') AND (NewLn = 'Y') AND (Parenthesis = 'N')
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
          IF (W1 <> ' ') AND (NewLn = 'N') AND (Parenthesis = 'N')
            AND NOT ((W1 = 'E') AND (W2 = 'N') AND (W3 = 'D'))
          THEN
            WRITE(OUTPUT, W1);
{Print Argyment Operator.}
          IF (W1 <> ' ') AND (Parenthesis = 'Y') 
            AND NOT ((W1 = 'E') AND (W2 = 'N') AND (W3 = 'D') AND (W4 = '.'))
          THEN
            IF (Point = 'Y') OR (Comma = 'Y') OR (Semicolon = 'Y')
            THEN
              WRITE(OUTPUT, ' ', W1)
            ELSE
              WRITE(OUTPUT, W1);                            
{Find and print end OPERATOR.}
          IF (W1 = ';')
          THEN
            Parenthesis := 'N';
          IF (W1 = ';') AND (W2 <> ';') AND (Parenthesis = 'N')
          THEN
            BEGIN
              WRITELN(OUTPUT);
              NewLn := 'Y'                             
            END;
{Update Flags}
  {Flag '('}            
          IF W1 = '('
          THEN
            Parenthesis := 'Y'; 
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
              Parenthesis := 'N'
            END
          ELSE
            IF (W3 = 'E') AND (W4 = 'N') AND (W5 = 'D') AND EOLN(INPUT) 
               AND (Parenthesis = 'N')
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
                  AND (Parenthesis = 'N')
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
          Parenthesis := 'N'
        END
    END
END.
