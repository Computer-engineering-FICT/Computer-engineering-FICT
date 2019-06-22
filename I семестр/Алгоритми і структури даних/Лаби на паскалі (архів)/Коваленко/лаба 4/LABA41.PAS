program integral;

function F(x:real):real;
begin
  F:=x*x;
end;

function fx1(a,b,e:real; var m:integer):real;
var i:integer;
    h,s1,s2,r:real;
begin
  s1:=(b-a)*F(a);
  m:=1;
  repeat
    m:=m*2;
    s2:=0;
    h:=(b-a)/m;
    for i:=0 to m-1 do
    s2:=s2+F(a+i*h);
  s2:=s2*h;
  r:=abs(s2-s1);
  s1:=s2;
  until r<e;
  fx1:=s2;
end;

function fx2(a,b,e:real; var m:integer):real;
var i:integer;
    h,s1,s2,r:real;
begin
  s1:=(b-a)*F(a);
  m:=1;
  repeat
    m:=m*2;
    s2:=0;
    h:=(b-a)/m;
    for i:=1 to m do
    s2:=s2+F(b-i*h);
  s2:=s2*h;
  r:=abs(s2-s1);
  s1:=s2;
  until r<e;
  fx2:=s2;
end;

function fx3(a,b,e:real; var m:integer):real;
var i:integer;
    h,s1,s2,r:real;
begin
  s1:=(b-a)*F((a+b)/2);
  m:=1;
  repeat
    m:=m*2;
    s2:=0;
    h:=(b-a)/m;
    for i:=0 to m-1 do
    s2:=s2+F(a+(i*h)+h/2);

    s2:=s2*h;
    r:=abs(s2-s1);
    s1:=s2;
  until r<=e;
  fx3:=s2;
end;

function fx4(a,b,e:real; var m:integer):real;
var i:integer;
    h,s1,s2,r:real;
begin
  s1:=(b-a)*(F(a)+F(b))/2;
  m:=1;
  repeat
    m:=m*2;
    s2:=0;
    h:=(b-a)/m;
    for i:=0 to m-1 do
    s2:=s2+(F(a+i*h)+F(a+(i+1)*h));
  s2:=s2*h/2;
  r:=abs(s2-s1);
  s1:=s2;
  until r<=e;
  fx4:=s2;
end;

function fx5(a,b,e:real; var m:integer):real;
var i,k:integer;
    h,s1,s2,r:real;
begin
  s1:=(b-a)*(F(a)+F(b))/3;
  m:=1;
  repeat
    m:=m*2;
    s2:=0;
    h:=(b-a)/m;
    for i:=0 to m do
    begin
      if (i=0) or (i=m)
      then k:=1
      else
      if (i mod 2)=0 then
      k:=2
      else k:=4;

    s2:=s2+k*F(a+i*h);
    end;
  s2:=s2*h/3;
  r:=abs(s1-s2);
  s1:=s2;
  until r<=e;
  fx5:=s2;
end;

function fx6(a,b,e:real; var m:integer):real;
var i,j:integer;
    h,s1,s2,r,d,k:real;
begin
  m:=1;
  h:=(b-a);
  s1:=h*s1/90;
  repeat
    m:=m*2;
    h:=(b-a)/m;
    s2:=0;

    for i:=0 to m-1 do
      for j:=0 to 4 do
        begin
        if (j=0) or (j=4) then
        k:=7
          else
          if (j=1) or (j=3) then
          k:=32
            else
            if j=2
            then
              k:=12;
    s2:=s2+k*(F(a+h*i+j*d));
    end;


    s2:=h*s2/90;
  r:=abs(s1-s2);
  s1:=s2;
  until r<=e;
  fx6:=s2;
end;


var a,b,e,r1,r2,r3,r4,r5,r6:real;
    m:integer;
begin
  writeln('enter left limit a');
  readln(a);
  writeln('enter right limit b');
  readln(b);
  writeln('enter accuracy');
  readln(e);
  writeln('Integral from a=',a:3:2,' to b=',b:3:2,' :');
  r1:=fx1(a,b,e,m);
  writeln('1) left rectangle=',r1:7:2);
  writeln('Number of interations=',m);
  writeln;
  r2:=fx2(a,b,e,m);
  writeln('2) right rectangle=',r2:7:2);
  writeln('Number of interations=',m);
  writeln;
  r3:=fx3(a,b,e,m);
  writeln('3) middle rectangle=',r3:7:2);
  writeln('Number of interations=',m);
  writeln;
  r4:=fx4(a,b,e,m);
  writeln('4) trapezoid=',r4:7:2);
  writeln('Number of interations=',m);
  writeln;
  r5:=fx5(a,b,e,m);
  writeln('5) parabola=',r5:7:2);
  writeln('Number of interations=',m);
  writeln;
  r6:=fx6(a,b,e,m);
  writeln('6) Bode=',r6:7:2);
  writeln('Number of interations=',m);
  readln
  end.




