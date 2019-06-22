program slava_lab1;

{$APPTYPE CONSOLE}

var
  a, b, c, x1, x2, imx1, imx2, rex1, rex2, D: real;
begin
  write('Введите значение переменной a: ');
  readln(a);
  write('Введите значение переменной b: ');
  readln(b);
  write('Введите значение переменной c: ');
  readln(c);
  if a = 0
    then
      begin
        if b = 0
          then
            begin
              if c = 0
                then
                  writeln('Корень может быть любой')
                else
                  writeln('Не правильно введены данные');
            end
          else
            begin
              x1 := -c/b;
              writeln('x1=', x1:0:8);
            end;
        end
    else
      begin
        D := sqr(b) - 4*a*c;
        if D = 0
          then
            begin
              x1:=-b/(2*a);
              writeln('x1=', x1:0:8);
            end
          else
            begin
              if D < 0
                then
                  begin
                    rex1 := -b/(2*a);
                    imx1 := sqrt(abs(D))/(2*a);
                    rex2 := -rex1;
                    imx2 := -imx1;
                    writeln('Реальная часть rex1=', rex1:0:8);
                    writeln('Мнимая часть imx1=' ,imx1:0:8);
                    writeln('Реальная часть rex2=',rex2:0:8);
                    writeln('Мнимая часть imx2=',imx2:0:8);
                  end
                else
                  begin
                    x1 := (-b - sqrt(D))/(2*a);
                    writeln('x1=', x1:0:8);
                    x2 := (-b + sqrt(D))/(2*a);
                    writeln('x2=', x2:0:8);
                  end;
            end;
      end;
  readln;
end.
