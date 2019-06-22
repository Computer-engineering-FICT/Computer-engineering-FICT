var
  x,f: real;
  y,i,s: integer;
begin
write('x = ');
readln(x);
write('y = ');
readln(y);
f:=1;
if y<=0 then begin
  if x=0 then write('не має розв''язків для ',x,'^',y)
  else begin
    s:=abs(y);
    for i:=1 to s do f:=f*x;
      f:=1/f;
      print(x,'^',y,' = ',f)
  end
end
else begin
  for i:=1 to y do f:=f*x;
    print(x,'^',y,' = ',f)
end
end.
