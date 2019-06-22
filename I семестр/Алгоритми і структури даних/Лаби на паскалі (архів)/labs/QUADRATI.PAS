Program Quadratic;
  var
    a, b, c: integer;
    d, x1, x2, Rex1, Rex2, Imx1, Imx2, d1: real;
  begin
    writeln('Enter koefficients: a, b, c');
    readln(a, b, c);
    if a = 0
      then
        if b = 0
         then
          if c = 0
           then
             writeln('all numbers are root')
            else
             writeln('no roots')
          else
          begin
            x1:=-c/b;
            writeln('x=',x1:6:2);
          end
      else
      begin
        d := sqr(b) - 4*a*c;
        d1 := sqrt(abs(d));
        if d > 0
          then
            begin
             x1:=(-b-d1)/(a*2);
             x2:=(-b+d1)/(a*2);
             writeln('x1=', x1:6:2);
             writeln('x2=', x2:6:2);
            end
          else
          if d = 0
            then
              writeln('roots are equal: x=', -b/(2*a):6:2)
            else
              begin
                writeln('complex roots');
                Rex1:=-b/(a*2);
                Rex2:=Rex1;
                Imx1:=D1/(a*2);
                Imx2:=-Imx1;
                writeln('Rex1=', Rex1:6:2, '  Imx1=', Imx1:6:2, 'i');
                writeln('Rex2=', Rex2:6:2, '  Imx2=', Imx2:6:2, 'i');
              end
      end
  end.