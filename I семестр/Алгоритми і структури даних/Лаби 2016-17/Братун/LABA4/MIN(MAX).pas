program findmin1; 
var n,i,min:integer; arr:array[1..7] of integer; 
begin 
writeln('Введіть 7 елементів: '); 
for i:=1 to 7 do read(arr[i]); 
writeln(arr); 
min:=arr[1]; 
for i:=2 to 7 do 
if (arr[i]<min) then 
min:=arr[i]; 
writeln('Мінімальний елемент =',min); 
end.