Unit module;
Interface
Type
  fun1=function(var x:real):real;
  sims1=procedure(var a,b,e,s2:real);
  exec1=procedure(var a,b,e:real; fun:fun1; sims:sims1);
var a,b,e:real;
  function fun(var x:real):real;
  procedure sims(var a,b,e,s2:real);
  procedure exec(var a,b,e:real;fun:fun1;sims:sims1);

Implementation

function fun(var x:real):real;
  begin
    fun:=x*x;
  end;

procedure sims(var a,b,e,s2:real);
var 
  r,s1,h,q:real;
  m,i,j,c,k:integer;
begin
  s1 := (b-a)*(fun(a)+fun(b))/3;
  m:= 1;
  repeat
  m:= m*2;
  h:= (b-a)/m;
  s2:= 0;
  for i:=0 to m do
  begin
    if (i = 0) or (i = m)
  then
    k:= 1
  else
    if (i mod 2) = 0 then k := 2 else k := 4;
      q:=a+i*h;
      s2 := s2 + k * fun(q);
  end;
  s2 := s2*h/3;
  r := abs(s1-s2);
  s1 := s2;
  until r <= e;
end;

procedure exec(var a,b,e:real;fun:fun1;sims:sims1);
var 
  s2:real;
begin
  write('Enter left limit: ');
  readln(a);
  write('Enter right limit: ');
  readln(b);
  write('Enter accuracy: ');
  readln(e);
  sims(a,b,e,s2);
  writeln('Integral = ',s2:7:4);
  readln
end;
end.