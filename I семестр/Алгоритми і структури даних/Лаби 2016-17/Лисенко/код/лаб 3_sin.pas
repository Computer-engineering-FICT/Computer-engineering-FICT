var
  x,p,s,e: real;
  j,n: integer;
begin
write('����i�� ��� � �������: ');
readln(x);
write('������ �������: ');
readln(e);
p:=x;
s:=x;
j:=3;
n:=1;
repeat
  p:=-(p*x*x)/j/(j-1);
  s:=s+p;
  j:=j+2;
  n:=n+1
until abs(p)<=e;
writeln('sin(',x,') = ',s);
write('������� �������: ',n)
end.
