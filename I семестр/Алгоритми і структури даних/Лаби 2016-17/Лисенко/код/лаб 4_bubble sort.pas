const
  Nmax=100;
var
  x: array[1..Nmax] of real;
  a,s,min,max: real;
  n,k,i: integer;
  f: boolean;
begin
write('введіть кількість чисел у масиві: ');
readln(n);
writeln('введіть числа');
for i:=1 to n do read(x[i]);
for k:=1 to n-1 do begin
  f:=True;
  for i:=1 to n-k do
    if x[i]>x[i+1] then begin
      a:=x[i];
      x[i]:=x[i+1];
      x[i+1]:=a;
      f:=False;
    end;
  if f then break
end;    
writeln('відсортований масив:');
for i:=1 to n do write(x[i],' ');
min:=x[1];
max:=x[n];
s:=x[1];
for i:=2 to n do s:=s+x[i];
writeln('');
writeln('максимум: ',max);
writeln('мінімум: ',min);
writeln('сума чисел: ',s)
end.
