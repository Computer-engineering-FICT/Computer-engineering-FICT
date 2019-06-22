Program Insert_sort;
type
 mass=array [1..100]of integer;
var a:mass;
    n,i:integer;
procedure insertion(Var a:mass);
Var i,j,k,x,pr,sr: integer;
begin
pr:=0;    {присваивания*}
sr:=0;    {сравнения*}
for i:=2 to n do
   begin
    x:=a[i]; inc(pr);
    j:=1;
    inc(sr);
    while x<a[j] do
        begin
          inc(j);
          inc(sr);
        end;
     for k:=i-1 downto j do
       begin
           a[k+1]:= a[k];
          inc(pr);
        end;
    a[j]:=x;inc(pr);
   end;
writeln('Oтсортированный массив:');
for i:=1 to n do
write(a[i],' ');
writeln;
writeln;
writeln('Kol-vo prisvaivanii=',pr,#13#10,'Kol-vo sravnenii=',sr);
end;
begin
randomize;
write('n=');readln(n);
writeln('Исходный массив:');
for i:=1 to n do
   begin
     a[i]:=random(20);;
     write(a[i],' ');
   end;
writeln;
writeln;
insertion(a);   
readln
end.