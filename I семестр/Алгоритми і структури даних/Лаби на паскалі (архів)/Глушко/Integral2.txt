program t1;

function f(x: real): real;
begin
 f:=x*x;
end;


function levpr(a,b,e:real): real; 
 var h,s,s1: real; 
     i,n: longint;
begin
 s:=0;
 n:=1;
 repeat
  s1:=s;
  s:=0;
  n:=n*2;
  h:=(b-a)/n;
  for i:=0 to n-1 do 
   s:=s+f(a+i*h);
  s:=s*h;
 until abs(s1-s)<e;
 levpr:=s;
end;

function pravpr(a,b,e: real): real;
 var h,s,s1: real;
     i,n: longint;
begin
 s:=0;
 n:=1;
 repeat
  s1:=s;
  s:=0;
  n:=n*2;
  h:=(b-a)/n;
  for i:=1 to n do 
    s:=s+f(a+i*h);
  s:=s*h;
 until abs(s1-s)<e;
 pravpr:=s;
end;

function sredpr(a,b,e: real): real;
 var h,s,s1: real;
     i,n:longint;
begin
 s:=0;
 n:=1;
 repeat
  s1:=s;
  s:=0;
  n:=n*2;
  h:=(b-a)/n;
  for i:=0 to n-1 do 
    s:=s+f((a+i*h)+(h/2));
  s:=s*h;
 until abs(s1-s)<e;
 sredpr:=s;
end;

function trapec(a,b,e: real): real;
 var h,s,s1: real;
     i,n: longint;
begin
 s:=0;
 n:=1;
 repeat
  s1:=s;
  s:=0;
  n:=n*2;
  h:=(b-a)/n;
  for i:=0 to n-1 do 
   s:=s+(f(a+i*h)+f(a+(i+1)*h))/2;
  s:=s*h;
 until abs(s1-s)<e;
 trapec:=s;
end;

function parabol(a,b,e: real): real;
 var h,s,s1,z: real;
     i,n: longint;
begin
 s:=0;
 n:=1;
 repeat
  s1:=s;
  s:=0;
  n:=n*2;
  h:=(b-a)/n;
  z:=h/2;
  for i:=1 to n do 
    s:=s+(f(a+i*h-2*z)+4*f(a+i*h-z)+f(a+i*h));
  s:=s*(z/3);
 until abs(s1-s)<e;
 parabol:=s;
end;

function bode(a,b,e: real): real;
var h,s,s1,z: real; 
    i,n: longint;
begin
 s:=0;
 n:=1;
 repeat
  s1:=s;
  s:=0;
  n:=n*2;
  h:=(b-a)/n; z:=h/4;
  for i:=1 to n do 
    s:=s+(7*f(a+i*h-4*z)+32*f(a+i*h-3*z)+12*f(a+i*h-2*z)+32*F(a+i*h-z)+7*F(a+i*h));
  s:=s*2*z/45;
 until abs(s1-s)<e;
 bode:=s;
end;

 var res,a,b,e: real;
begin
 write('a=');
 readln(a);
 write('b=');
 readln(b);
 write('e=');
 readln(e);
 res:=levpr(a,b,e);
 writeln('LevPr=',res);
 res:=pravpr(a,b,e);
 writeln('PravPr=',res);
 res:=sredpr(a,b,e);
 writeln('SredPr=',res);
 res:=trapec(a,b,e);
 writeln('Trapec=',res);
 res:=parabol(a,b,e);
 writeln('Parabol=',res);
 res:=bode(a,b,e);
 writeln('Bode=',res);
 readln;
end.
