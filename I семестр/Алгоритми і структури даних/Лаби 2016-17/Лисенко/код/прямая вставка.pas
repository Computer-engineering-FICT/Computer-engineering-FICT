const
  Nmax=100;
var
  x: array[1..Nmax] of real;
  a: real;
  n,k,i,j: integer;
begin
write('������ ������� ����� � �����: ');
readln(n);
if (n>1) and (n<=100) then begin
  writeln('������ �����');
  for i:=1 to n do read(x[i]);
  for i:=2 to n do
    for k:=1 to i-1 do
      if x[i]<x[k] then begin 
        a:=x[i];
        j:=i;
        while j>k do begin
          x[j]:=x[j-1];
          j:=j-1
        end;
        x[k]:=a;
        break
      end;
  writeln('������������ �����:');
  for i:=1 to n do write(x[i],' ')
end
else print('������� ������� ���� �� 2 �� 100')
end.