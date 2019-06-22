program sin;
var e,j,p,s,x,rez:real;
numb:integer;
begin
numb:=1;
 writeln('enter x,e');
 readln(x,e);
 if (x<0)
  then repeat
   x:=x+2*pi
  until x>=0;
 if (x>2*pi)
  then repeat
   x:=x-2*pi
  until x<=2*pi;

 s:=x;
 p:=x;
 j:=2;
 while abs(p)>=e do
  begin
   p:=-(p*x*x)/(j*(j+1));
   s:=s+p;
   j:=j+2;
    numb:=numb+1;
  end;
  rez:=s;
  writeln('sin = ',rez:10:10);
  writeln(numb);
  readln;
end.