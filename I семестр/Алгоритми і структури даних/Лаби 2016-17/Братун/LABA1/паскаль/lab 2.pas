var 
	result , x , a , c : real;
	
begin
	write('Enter base: ');
	readln(x); // base
	write('Enter degree for base: ');
 	readln(a); // degree
 	c:=a;
 	result := x;

	if (x=0) AND (a<=0) then
	begin 
		writeln('No answer');
		exit;
	end
	
	else if (c>0) then
	begin
		while (c>1) do
			begin
				result := result * x;
				c := c-1;
			end
 	end
 	
 	else if (c<0) then
	begin
		c := Abs(c);
		while (c>1) do
			begin
				result := result * x;
				c := c-1;
			end;
		result := 1/result;
 	end
 	
 	else 
 	begin 
		result := 1;
 	end;  
 	writeln('Result: ', x , '^' , a , ' = ' ,result);
	
	
end.