Program Sine;//repeat//
 var
  n,j:integer;
  e,p,S,x,x1,x2:real;
 begin
  write('enter x,x=');
  read(x);
  write('enter e,0<e<1, e=');
  read(e);
  x1:=x;
  while x1<0 do x1:=x1+6.28318;
  while x1>6.28318 do x1:=x1-6.28318;
  p:=x1;
  S:=x1;
  x2:=x1*x1;
  j:=3;
  n:=1;
  repeat
   begin
    p:=(-p*x2)/(j*(j-1));
    S:=S+p;
    j:=j+2;
    n:=n+1;
   end;
  until abs(p)<=e;
  writeln('sin(',x,')=',S:0:7,', n=',n);
 end.
 