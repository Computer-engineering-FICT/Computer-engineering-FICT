program sin;
var i:integer;
    x,p,k,s,g:real;
begin
writeln('vvedite znachenie argumenty');
readln(x);
writeln('vvedite max pogreshnost');
readln(p);
k:=x;
s:=x;
i:=1;
while abs(k)>=p do begin
i:=i+1;
k:=-k*x*x/((2*i-2)*(2*i-1));
s:=s+k;
end;
writeln('sin=',s);
writeln('pogreshnost=',p);
readln
end.