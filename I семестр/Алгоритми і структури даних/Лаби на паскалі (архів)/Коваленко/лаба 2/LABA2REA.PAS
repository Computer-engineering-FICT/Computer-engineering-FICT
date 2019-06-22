program power;
var y,i,k:integer;
    x,s:real;
begin
writeln('enter x');
readln(x);
writeln('enter y');
readln(y);
if x=0 then
   if y>0 then
     begin
       s:=0;
       writeln(s:2:1);
       end
   else writeln('uncertainty')
else begin
  s:=1;
  k:=abs(y);
     if y=0 then
       writeln(s)
     else begin
       for i:=1 to k do
       s:=s*x;
       if y<0 then
         s:=1/s
  end;
  writeln(s:2:3);
  end;
readln;
end.

