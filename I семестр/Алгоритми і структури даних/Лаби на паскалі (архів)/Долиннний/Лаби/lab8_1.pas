program lab8_1;
type 
  indexN=1..100;
  vector=array[indexN]of longint;
  tproc=procedure(n,m:longint; a,b:vector; var c:vector);

var n,m:longint;
    a,b,c:vector;

procedure slim(n,m:longint; a,b:vector; var c:vector);
var i,j,k:longint;
begin
  j:=1;
  i:=1;
  k:=1;
  While (i<=n)and(j<=m) do
    begin
    If (a[i]<b[j]) then 
      begin
      c[k]:=a[i];
      inc(k);
      inc(i);
      end
    else
      begin
      c[k]:=b[j];
      inc(k);
      inc(j);
      end;
    end;
  if i>n then 
    For i:=j to m do
      begin
      c[k]:=b[i];
      inc(k);
      end
  else
    For j:=i to n do
      begin
      c[k]:=a[j];
      inc(k);
      end;
end;
      
    

procedure exec(var n:longint; var a:vector; var m:longint; var b:vector; var c:vector; slim:tproc);
var i:longint;
begin
  Read(n);
  For i:=1 to n do
    Read(a[i]);
  Read(m);
  for i:=1 to m do
    Read(b[i]);
  Slim(n,m,a,b,c);
  for i:=1 to n+m do
    Write(c[i],' ');
end;
begin
exec(n,a,m,b,c,slim);
end.