program sinus;
var x,e,rez,s1,s2,s3,a:real;
    m:integer;
begin
 writeln('enter x');
 readln(x);
/* a:=x/(2*Pi);
 if (a>1)
  then x:=x-(trunc(a)*2*Pi); */
 e:=0.001;

 s1:=x;
 s2:=1;
 s3:=s1/s2;
 m:=2;
 rez:=x;
 while (s3<e) do
  begin
   s1:=(-1)*s1*x*x;
   s2:=s2*(2*m-2)*(2*m-1);
   s3:=s1/s2;
   rez:=rez+s3;
   m:=m+1;
  end;
 writeln(rez:0:3);
 readln;
end.
