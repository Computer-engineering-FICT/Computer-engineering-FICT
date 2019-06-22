Program Sinus;
  var
    j, n: integer;
    e, x, p, s, x1, x2, e1: real;
  begin
    write('Enter function argument x = ');
    readln(x);
    write('Enter mistake e = ');
    readln(e);
    j := 3;
    p := x;
    s := x;
    x2 := x * x;
    n := 1;
    repeat
      p := -p * x2 / (j * (j -1));
      s := s + p;
      j := j + 2;
      n := n + 1;
    until abs(p) <= e;
    writeln('sin(x) = ', s:6:4);
    writeln('Terms of the series: ', n);
  end.