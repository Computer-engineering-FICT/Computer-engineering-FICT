program matrix;
var i,k,n,m:integer;
    a:array[1..100,1..100] of integer;
    at:array[1..100,1..100] of integer;
begin
 writeln('vvedite razmernosti matricu: kolvo strok i stolbcov');
 readln(m,n);
 writeln('vvedite elementu matricu');
 for i:=1 to m do
  begin
   for k:=1 to n do
    read(a[i,k]);
   readln;
  end;

  for i:=1 to m do
   for k:=1 to n do
    at[k,i]:=a[i,k];

 writeln;
 writeln('transponirovannaya matrica');

  for i:=1 to n do
   begin
    for k:=1 to m do
     write(at[i,k],' ');
    writeln;
   end;
  readln;
end.