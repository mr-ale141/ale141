{ пример 3: то же самое на Паскале }   { Вычисление площади круга   }

uses crt;

label Start;

const Pi = 3.14;

var R : integer;
    S : real;
    j : integer;
    A : char;

function Plos_Kruga (Temp:integer) :real;
  begin
    Plos_Kruga := Pi*Temp*Temp;
  end;

BEGIN
  clrscr;
  writeln(' Вычисление площади круга ');
  for J:=1 to 26 do write('=');

Start:
  writeln;
  write('Введите радиус ');  readln(R);
  if (R<=0) then
    begin
      writeln('   Нужно положительное!');
      goto Start;
    end;
  S := Plos_Kruga (R);
  writeln('Площадь равна ', S:6:2);

  while true do
    begin
      writeln(' Y-повтор N-выход');
      A := readKey;
      if (A='Y') or (A='y') then goto Start;
      if (A='N') or (A='n') then break;
      writeln('  Не ту клавишу нажали!  ');
    end;

  writeln('Конец работы');
  repeat
    write('нажми Esc ');
  until readkey = #27;
  halt;
END.
