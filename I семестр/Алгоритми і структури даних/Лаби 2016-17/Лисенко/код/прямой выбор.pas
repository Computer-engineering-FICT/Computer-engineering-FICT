const
  Nmax=100;
var
  x: array[1..Nmax] of real;
  a: real;
  n,k,i,min: integer;
begin
write('введіть кількість чисел у масиві: ');
readln(n);
if (n>1) and (n<=100) then begin
  writeln('введіть числа');
  for i:=1 to n do read(x[i]);
  for i:=1 to n-1 do begin
    min:=i;
    for k:=i+1 to n do if x[k]<x[min] then min:=k;
    if min<>i then begin
      a:=x[i];
      x[i]:=x[min];
      x[min]:=a  
    end    
  end;
  writeln('відсортований масив:');
  for i:=1 to n do write(x[i],' ')
end
else print('кількість повинна бути від 2 до 100')
end.