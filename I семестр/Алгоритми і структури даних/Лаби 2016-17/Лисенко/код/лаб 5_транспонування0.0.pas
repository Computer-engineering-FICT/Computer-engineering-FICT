var
  A: array[1..100,1..100] of integer;
  i,j,n,c:integer;
  
begin
write('������ ����� ��������� ������� A(nxn), n = ');
readln(n);
writeln('������ �����');
for i:=1 to n do for j:=1 to n do read(A[i,j]);
for i:=2 to n do begin
  for j:=1 to i-1 do begin
    c:=A[i,j];
    A[i,j]:=A[j,i];
    A[j,i]:=c
  end
end;
writeln('������������� �������:');
for i:=1 to n do begin
  for j:=1 to n do write(A[i,j],' ');
  writeln('')
end
end.