var
  m: integer;
  a, b, e, s: real;

function f(x: real): real;
begin
  f := x * x;
end;

procedure bode(a, b, e: real; var s2: real);
var
  i: integer;
  s1, x, r, h, d: real;
begin
  m := 1;
  s1 := 1/90 * (b - a) * (7 * f(a) + 32 * f((3 * a + b)/4) + 12 * f((a + b)/2) + 32 * f((3 * b + a)/4) + 7 * f(b));
  repeat
    m := m + 2;
    h := (b - a) / m;
    x := a + h;
    s2 := 0.0;
    d := h/4;
    for i := 0 to m - 1 do
    begin
      s2 := s2 + (b - a) * (7 * f(a + x) + 32 * f(a + x - d) + 12 * f(a + x - 2 * d) + 32 * f(a + x - 3 * d) + 7 * f(a + x - 4 * d));
      x := x + h;
    end;
    s2 := s2 * 2 * d/45;
    r := abs(s2 - s1);
    s1 := s2;
  until r <= e;
end;


begin
  write('a= ');
  read(a);
  write('b= ');
  read(b);
  write('e= ');
  read(e);
  bode(a, b, e, s);
  writeln('Bode= ', s:12:10);
  writeln(m);
end.