program Quadratic_equation;
var a,b,c:real;
    x1,x2:real;
    D,Re1,Re2,Im1,Im2:real;
begin
  write('enter a, a= ');
  readln(a);
  write('enter b, b= ');
  readln(b);
  write('enter c, c= ');
  readln(c);
  if a=0 then
     begin
      if b=0 then
              if c=0 then writeln('xºR')
                     else writeln('no roots')
             else
              begin
               x1:=(-c/b);
               writeln('x1= ',x1:0:3);
              end;
     end
         else
          begin
           D:=b*b-4*a*c;
           if D<0 then
                    begin
                     Re1:=(-b)/2/a;
                     Re2:=Re1;
                     Im1:=(sqrt(abs(D)))/2/a;
                     Im2:=-Im1;
                     if Im1>0 then begin
                                    writeln('x1= ',Re1:0:3,'+',Im1:0:3,'i');
                                    writeln('x2= ',Re2:0:3,Im2:0:3,'i');
                                   end
                              else begin
                                    writeln('x1= ',Re1:0:3,Im1:0:3,'i');
                                    writeln('x2= ',Re2:0:3,'+',Im2:0:3,'i');
                                   end
                    end
                     else if D=0 then writeln('x1=x2= ',((-b)/(2*a)):0:3)
                                 else begin
                                       x1:=(-b-sqrt(D))/2/a;
                                       x2:=(-b+sqrt(D))/2/a;
                                       writeln('x1= ',x1:0:3);
                                       writeln('x2= ',x2:0:3);
                                      end;
           end;
end.