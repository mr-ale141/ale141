PROGRAM Prime(INPUT, OUTPUT);
CONST
  MAX = 100;
  MIN = 2;
  EmptySet = [];
TYPE
  IntSet = SET OF MIN .. MAX;
VAR
  Sieve: IntSet;
  Num, NumMod: INTEGER;
BEGIN
  Num := MIN;
  NumMod := 0;
  Sieve := [MIN .. MAX];
  WRITELN(OUTPUT, 'Простые числа в диаппазоне до 100:');
  WHILE Sieve <> EmptySet
  DO
    BEGIN
      IF Num IN Sieve
      THEN
        BEGIN 
          WRITELN(Num);
          Sieve := Sieve - [Num]
        END;
      NumMod := Num + Num;    
      WHILE NumMod <= MAX
      DO
        BEGIN
          Sieve := Sieve - [NumMod];
          NumMod := NumMod + Num
        END;
      Num := Num + 1      
    END
END.
















    
