program integral;
 var h,a,b,s1,s2,s3,s4,s5,s6,x,d:real;
 m,i,k:integer;
 function y(x:real):real;
  begin
  y:=x*x*x;
 end;
begin


 writeln('vvedite predelu integrirovania');
 readln(a,b);
 if (a>b) then halt;
 writeln('vvedite m');
 readln(m);
 h:=(b-a)/m;
 s1:=0;
 for i:=0 to (m-1) do
 begin
  x:=a+i*h;
  s1:=y(x)*h+s1;
 end;
 writeln('metod levuh pryamoygolnikov, integral=',s1);

 s2:=0;
 for i:=1 to m do
 begin
  x:=b-i*h;
  s2:=y(x)*h+s2;
 end;
 writeln('metod pravuh pryamoygolnikov, integral=',s2);

 s3:=0;
 for i:=1 to m do
 begin
  x:=a+i*h-h/2;
  s3:=y(x)*h+s3;
 end;
 writeln('metod srednih pryamoygolnikov, integral=',s3);

 s4:=0;
 for i:=0 to (m-1) do
 begin
  x:=a+i*h;
  s4:=s4+(y(x)+y(x+1))*(h/2);
 end;
 writeln('metod trapecii, integral=',s4);

 s5:=0;
 for i:=0 to m do
  begin
   x:=a+i*h;
   if (i=0)
    then k:=1
    else
     if (i mod 2)=0
      then k:=2
      else k:=4;
   s5:=s5+y(x)*k*(h/3);
  end;
 writeln('metod Simpsona, integral=',s5);

 s6:=0;
 d:=h/4;
 for i:=0 to (m-1) do
  begin
  x:=a+i*h;
  s6:=s6+(2*d/45)*(7*y(x)+32*y(x+d)+12*y(x+2*d)+32*y(x+3*d)+7*y(x+4*d));
  end;
 writeln('metod Bode, integral=',s6);











 readln;
end.













  end.