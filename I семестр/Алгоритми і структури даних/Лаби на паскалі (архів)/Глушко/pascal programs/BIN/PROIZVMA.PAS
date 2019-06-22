program matrix2;
var i,k,n,m,p,w:integer;
    a,b,s:array[1..100,1..100] of integer;

begin
 writeln('vvedite razmernosti 1i matricu: kol-vo strok i stolbikov');
 readln(m,n);
 writeln('vvedite elementu 1i matricu');
 for i:=1 to m do
  begin
   for k:=1 to n do
    read(a[i,k]);
   readln;
  end;

 writeln('vvedite kol-vo stolbikov 2i matricu');
 readln(p);
 writeln('vvedite elementu 2i matricu');
 for i:=1 to n do
  begin
   for k:=1 to p do
    read(b[i,k]);
   readln;
  end;

  for i:=1 to m do
  begin
   for k:=1 to p do
    begin
     s[i,k]:=0;
     for w:=1 to n do
      begin
       s[i,k]:=s[i,k]+a[i,w]*b[w,k];
      end;
    end;


   readln;
  end;

 writeln('poly4ennaya matrica');
   for i:=1 to m do
   begin
    for k:=1 to p do
     write(s[i,k],' ');
    writeln;
   end;
  readln;
end.