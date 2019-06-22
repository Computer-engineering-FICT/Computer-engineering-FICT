Program MyProcedure;
  var
    x,a,z:real;
  Procedure MyProc(x1,a1:real;var z1:real);
    begin
      z1:=x1*exp(a1*x1)/sqr(1+a1*x1);
      writeln('z=',z1);
    end;
  Function f(x1,a1:real):real;
    begin
      f:=x1*a1;
    end;
  begin
    write('Enter x, x=');
    read(x);
    write('Enter a, a=');
    read(a);
    MyProc(x,a,z);
    writeln('f=',f(x,a));
  end.