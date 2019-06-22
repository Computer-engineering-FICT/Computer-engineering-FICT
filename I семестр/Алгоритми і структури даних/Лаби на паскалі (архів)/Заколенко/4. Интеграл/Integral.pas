Program Integral;
 var
  m,i,j,k:integer;
  a,b,e,S1,S2,h,d,R,delta:real;
 function f(x:real):real;
  begin
   f:=x*x;
  end;
begin
 write('a=');
 read(a);
 write('b=');
 read(b);
 write('e=');
 read(e);
 writeln('1-method of left rectangles');
 writeln('2-method of right rectangles');
 writeln('3-method of medium rectangles');
 writeln('4-method of trapeze');
 writeln('5-method of parabola');
 writeln('6-Bode method');
 readln(k);
 m:=1;
 delta:=b-a;
 case(k) of
  1:
   begin
    S1:=delta*f(a);
    repeat
     m:=m*2;
     S2:=0;
     h:=delta/m;
     for i:=0 to m-1 do
      S2:=S2+f(a+i*h);
     S2:=S2*h;
     R:=abs(S2-S1);
     S1:=S2;
    until R<=e;
   end;
  2:
   begin
    S1:=delta*f(b);
    repeat
     m:=m*2;
     h:=delta/m;
     S2:=0;
     for i:=1 to m do
      S2:=S2+f(a+i*h);
     S2:=S2*h;
     R:=abs(S2-S1);
     S1:=S2;
    until R<=e;
   end;
  3:
   begin
    S1:=delta*f((a+b)/2);
    repeat
     m:=m*2;
     h:=delta/m;
     S2:=0;
     for i:=0 to m-1 do
      S2:=S2+f(a+i*h+h/2);
     S2:=S2*h;
     R:=abs(S2-S1);
     S1:=S2;
    until R<=e;
   end;
  4:
   begin
    S1:=delta*(f(a)+f(b))/2;
    repeat
     m:=m*2;
     h:=delta/m;
     S2:=0;
     for i:=0 to m-1 do
      S2:=S2+f(a+i*h)+f(a+(i+1)*h);
     S2:=S2*h/2;
     R:=abs(S2-S1);
     S1:=S2;
    until R<=e;
   end;
  5:
   begin
    S1:=delta*(f(a)+f(b))/3;
    repeat
     m:=m*2;
     h:=delta/m;
     S2:=0;
     for i:=0 to m do
      begin
       if (i=0) or (i=m) then k:=1
        else if i mod 2=0 then k:=2
         else k:=4;
       S2:=S2+k*f(a+i*h);
      end;
     S2:=S2*h/3;
     R:=abs(S2-S1);
     S1:=S2;
    until R<=e;
   end;
  6:
   begin
     d:=delta/4;
     S1:=2*d/45*(7*f(a)+32*f(a+d)+12*f(a+2*d)+32*f(a+3*d)+7*f(a+4*d));
    repeat
     m:=m*2;
     S2:=0;
     h:=delta/m;
     d:=h/4;
     for i:=0 to m-1 do
      for j:=0 to 4 do
       begin
        if (j=0) or (j=4) then k:=7;
        if (j=1) or (j=3) then k:=32;
        if (j=2) then k:=12;
        S2:=S2+k*f(a+i*h+j*d)
       end;
     S2:=S2*2*d/45;
     R:=abs(S2-S1);
     S1:=S2;
    until R<=e;
   end;
 end;
writeln('S=',S1,',m=',m);
end.



