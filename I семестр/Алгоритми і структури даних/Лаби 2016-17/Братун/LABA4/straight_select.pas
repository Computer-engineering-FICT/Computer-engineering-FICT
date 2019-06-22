var
	array_size : integer = 14;
	random_limit : integer = 100;
	temp_min , temp: integer ; 
	A: array [0..14] of integer;
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
	temp_min := i;
	for j:=i+1 to array_size do 
	begin
		if (A[temp_min] > A[j] ) then
		begin
			temp_min := j;
		end;
	end;

	if(temp_min<>i) then
	begin
		temp := A[i];
		A[i] := A[temp_min];
		A[temp_min] := temp;
	end;
	
end;

writeln('');
// print sorted array
write('Sorted array : [ ');
for i :=0 to array_size do
	begin
		if (i <> array_size) then write(A[i],' , ')
		else write(A[i], ' ]'); 
	end;


end.