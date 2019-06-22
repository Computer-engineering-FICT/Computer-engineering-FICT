
program sort;
uses crt;
type
 tindex=1..6;
 tvector=array[tindex] of integer;
var
 i,j,n:tindex; f:boolean;
 k,buf,r,q,l,m:integer;
 a:tvector;

begin
  clrscr;
  n:=6;
  writeln ('Vvedite vector: ');
  for i:=1 to n do
  begin
    read (a[i]);
  end;
  writeln;
  f:=true;
  while f do
  begin
    f:=false;
    for i:=1 to n-1 do
    begin
      if a[i]>a[i+1] then
      begin
        f:=true;
        buf:=a[i];
        a[i]:=a[i+1];
        a[i+1]:=buf;
      end;
    end;
  end;
for i:=1 to n do
write (a[i]:4);
writeln;
writeln ('Vvedite element dlya poiska: ');
read (r);
k:=(n div 2);
l:=1;
m:=n;
 while (a[k]<>r) and (l<=m) do
 begin
  k:=(l+m) div 2;
  if r<=a[k] then
  m:=k-1
  else
  l:=k+1;
 end;
 writeln(k);
readkey;
end.