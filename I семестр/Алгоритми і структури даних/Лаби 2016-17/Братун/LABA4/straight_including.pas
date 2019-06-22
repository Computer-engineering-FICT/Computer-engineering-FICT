const 
	random_limit : integer = 100;
	array_size : integer = 14;
var
	temp : integer ; 
	A: array [0..array_size] of integer; // declareted array with 15 elements
	i , j : byte;

begin

for i :=0 to array_size do 
	begin
		A [ i ]:= random (random_limit);
	end;

write('Не сортований масив : [ ');
for i :=0 to array_size do
	begin
		if (i <> array_size) then write(A[i],' , ')
		else write(A[i], ' ]'); 
	end;
// sorting
for i := 1 to array_size do
begin
	temp := A[i];
	j:=i;
	while (j>0) AND (A[j-1] > temp) do
		begin
			A[j] := A[j-1];
			j:=j-1;
		end;
	A[j] :=temp;
		
end;

writeln('');

write('Сортований масив : [ ');
for i :=0 to array_size do
	begin
		if (i <> array_size) then write(A[i],' , ')
		else write(A[i], ' ]'); 
	end;



end.