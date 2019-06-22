
const 
	random_limit : integer = 100;
	array_size : integer = 14;
var
	temp : integer ; 
	A: array [0..array_size] of integer;
	i , j : byte;

begin

for i :=0 to array_size do 
	begin
		A [ i ]:= random (random_limit);
	end;

write('Unsorted array : [ ');
for i :=0 to array_size do
	begin
		if (i <> array_size) then write(A[i],' , ')
		else write(A[i], ' ]'); 
	end;
// sorting
for i:=0 to array_size-1 do 
begin
	for j:=0 to array_size-1 do 
	begin
		if (A[j]>A[j+1]) then
		begin
			temp := A[j+1];
			A[j+1] := A[j];
			A[j] := temp;
		end
		
	end
end;

writeln('');

write('Sorted array : [ ');
for i :=0 to array_size do
	begin
		if (i <> array_size) then write(A[i],' , ')
		else write(A[i], ' ]'); 
	end;


end.