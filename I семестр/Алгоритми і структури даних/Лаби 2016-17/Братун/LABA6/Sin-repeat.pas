program sinus;

var
  x, e, z, p, S: real;
  i, j, n: integer;

begin
  write('Радiани - 0 або градуси - 1: '); readln(i);
  write('Введiть x = '); readln(x);
  write('Введiть е = '); readln(e);
  if i = 1 then
               x := (x / 180) * pi;
  z := abs(x);
  while z >= 2 * pi do
  begin
    z := z - 2 * pi;
  end;
  p := z;
  S := z;
  n := 1;
  j := 3;
  repeat 
    begin
      p := (-p * z * z) / (j * (j - 1));
      S := S + p;
      n := n + 1;
      j := j + 2;
    end;
  until abs(p) <= e;
  writeln('S = ', S:0:8);
  writeln('Кiлькiсть доданкiв = ', n);
end.