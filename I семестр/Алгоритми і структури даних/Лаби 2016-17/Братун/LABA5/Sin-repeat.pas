program sinus;

var
  x, e, z, p, S: real;
  i, j, n: integer;

begin
  write('���i��� - 0 ��� ������� - 1: '); readln(i);
  write('����i�� x = '); readln(x);
  write('����i�� � = '); readln(e);
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
  writeln('�i���i��� ������i� = ', n);
end.