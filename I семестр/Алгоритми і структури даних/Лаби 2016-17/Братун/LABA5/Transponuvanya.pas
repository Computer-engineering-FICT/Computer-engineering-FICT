program TraHcnoHipoBaHie;
uses crt;
type mas = array[1..100,1..100] of integer;
var A,B: mas;
    i,j,n,m: byte;
Begin
randomize;
write('������ ������� ����� �� �������� �������: ');
readln(n,m);
writeln('�������:');
for i:=1 to n do begin
  for j:=1 to m do begin
  A[i,j]:=random(100);
  write(A[i,j]:4);
  end;
writeln end;
writeln; writeln;
writeln('������������ �������: ');
for i:=1 to m do begin
  for j:=1 to n do begin
  B[i,j]:=A[j,i];
  write(B[i,j]:4);
  end;
writeln end;
readkey;
       end.
