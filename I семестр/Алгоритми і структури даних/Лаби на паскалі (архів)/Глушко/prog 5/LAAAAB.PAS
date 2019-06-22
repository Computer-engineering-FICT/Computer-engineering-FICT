 program lab5;
        type Tindex= 1..100;
             Tvector= array [Tindex] of integer;
        var V:Tvector;
            i,j,n:Tindex;
        x,k,M,buf,first,last:integer;
            found,f: boolean;
procedure input(v:Tvector;n:integer);
begin
     writeln ('Vvedite dlinu vektora');
     readln (n);
            for i:=1 to n do
            begin
            writeln('Vvedite',i,'element massiva');
            readln (V[i]);
            end;
            end;{input}
procedure sort(v:Tvector;n:integer);
begin
       repeat
      found:=false;
      for j:=1 to n-1 do
        begin
       if V[j+1] < V[j] then
       begin
       found:= true;
       buf:=V[j];
       V[j]:= V[j+1];
       V[j+1]:= buf;
       end;
       end;
       until not found;
       for j:=1 to n do
      write (V[j],' ');
end;{sort}



procedure find(v:Tvector;n:integer);

var a:Tvector;
k,l,m,r:integer;
begin
      {writeln ('iskomui element ');
read (x);
first:=1;
last:=n;
while (last>=first) and (v[m]<>m) do
begin
  m:=(first+last) div 2;
  if (v[m]>=x) then last:=m+1
  else if (v[m]<=x) then first:=m-1}





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



end;


{ if v[m]=x then
 writeln(m)
 else writeln('net takogo!=(');
 readln;
end;}{find}



BEGIN
     input(v,n);
     sort(v,n);
     writeln;
     find(v,n);
      readln
END.


