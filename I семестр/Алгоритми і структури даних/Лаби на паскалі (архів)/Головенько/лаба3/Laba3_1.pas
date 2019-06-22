program Laba3_1;

{$APPTYPE CONSOLE}
 var
 x, e, z, p, pi, S : real;
 j,i,n : integer;
begin
  write('Вычисления в градусах(1) или радианах(2)');
  readln(i);
  write ('Ввод x=');
  readln(x);
  write('Ввод e=');;
  readln(e);
  pi := 3.14;
  if i=1
    then
      x := (x/180)*pi;
      z := abs(x);
      while z >= 2*pi do
        begin
          z := z-2*pi;
        end;
    p := z;
    S := z;
    n := 1;
    j := 3;
  repeat
    begin
      p := -(p*z*z)/(j*(j-1));
      S := S+p;
      j := j+2;
      n := n+1
    end;
  until abs(p) <= e;
    writeln ('S= ',S:0:8);
    writeln ('Количество слагаемых=', n);
readln;
 end.

