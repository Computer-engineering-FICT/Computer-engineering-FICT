program square;
var
  a,b,c,D,rex1,rex2,imx1,imx2,x1,x2:real;
begin
  write('Введiть a: '); read(a);
  write('Введiть b: '); read(b);
  write('Введiть c: '); read(c);
  if a=0 then
          begin
            if b=0 then
                    begin
                      if c=0 then writeln('Будь-який корiнь')
                             else writeln('Помилка');
                    end
                   else
                    begin
                      x1:=-c/b;
                      writeln('x1=',x1);
                    end
          end
         else
          begin
            if c=0 then
                    begin
                      D:=b*b;
                      x1:=(b-sqrt(D))/(2*a);
                      x2:=(b+sqrt(D))/(2*a);
                      writeln('x1=',x1);
                      writeln('x2=',x2);
                    end
                    else
                    begin
              D:=b*b-4*a*c;
                begin
                  if D=0 then
                          begin
                            x1:=-b/(2*a);
                            x2:=x1;
                            writeln('x1=',x1, '=x2=',x2);
                          end
                        else if D<0 then
                                      begin
                                        rex1:=-b/(2*a);
                                        rex2:=rex1;
                                        imx1:=sqrt(abs(D))/(2*a);
                                        imx2:=-imx1;
                                        writeln('Реальна частина - rex1=',rex1);
                                        writeln('Уявна частина - imx1=',imx1);
                                        writeln('Реальна частина - rex2=',rex2);
                                        writeln('Уявна частина - imx2=',imx2);
                                      end
                                    else
                                      begin
                                        x1:=(-b-sqrt(D))/(2*a);
                                        x2:=(-b+sqrt(D))/(2*a);
                                        writeln('x1=',x1);
                                        writeln('x2=',x2);
                                      end
              end
              end
          end
end.