package body Unit is
---------------------------------------
	procedure VectorIn (x : out Vector) is
	begin								
		for i in 1..N loop
			x(i):=2;		
		end loop;
	end VectorIn;
---------------------------------------
	procedure VectorOut (x : in Vector ) is
	begin
		for i in 1..N loop
			put(x(i));		
		end loop;				
		New_line;
	end VectorOut;
---------------------------------------
	procedure MatrixIn (MX : out Matrix) is
	begin
		for i in 1..N loop
			for j in 1..n loop
				MX(i)(j):=2;		
			end loop;
		end loop;
	end MatrixIn;				
---------------------------------------
	procedure MatrixOut (MX : in Matrix) is
	begin
		for i in 1..N loop
			for j in 1..n loop
				put(MX(i)(j));												
				if (j=n) then
					New_line;
				end if;
			end loop;
		end loop;
		New_line;
	end MatrixOut;
---------------------------------------
	--Func1:  C:=A-B+D
	procedure Func1 (A : in Vector;
					 b : in Vector;
					 d : in Vector;
					 c : out Vector) is
	begin
		for i in 1..n loop
			c(i) := a(i)-B(i)+D(i);
		end loop;
	end Func1;
---------------------------------------
		--Func2: MD := MIN(MA)*MB*MC
	procedure Func2 (MA : in Matrix;
					 MB : in Matrix;
					 MC : in Matrix;
					 MD : out Matrix) is
	min:Integer;
	begin
		--MD := (0)
		for i in 1..n loop
			for j in 1..n loop
				MD(i)(j) := 0;
			end loop;
		end loop;
		--MD := MB*MC
		for i in 1..n loop
			for j in 1..n loop
				for k in 1..n loop 
					MD(i)(j) := MD(i)(j)+MB(i)(k)*MC(k)(j);
				end loop;
			end loop;
		end loop;
		--serching	min(MA)
		min := Ma(1)(1);	
		for i in 1..N loop
			for j in 1..n loop
				if MA(i)(j)<min then
 			    	min := MA(i)(j);
			   	end if;
			end loop;
		end loop;
		-- MD := Min(MA)*MB*MC
 		for i in 1..N loop
			for j in 1..n loop
				MD(i)(j) := MD(i)(j)*Min;
			end loop;
		end loop;
	end Func2;
---------------------------------------
	--Func3: D := (A + B)*(MA - MB)
	procedure Func3(A: in Vector;
					B: in Vector;
					MA: in Matrix;
					MB: in Matrix;
					D: out vector) is
	C:Vector;
	MC:Matrix;
	begin
		--C:=A + B
		for i in 1..N loop
			C(i) := A(i) + B(i);
		end loop;
		--MC:=MA - MB
    	for i in 1..N loop
			for j in 1..n loop
				MC(i)(j) := MA(i)(j) - MB(i)(j);
			end loop;
		end loop;
		--D := (0)
		for i in 1..n loop
			d(i) := 0;
		end loop;
		--D := C * MC
		for i in 1..n loop
			for j in 1..n loop
				D(j):= D(j) + C(j)*MC(j)(i);
			end loop;
		end loop;
	end func3;
---------------------------------------	
end Unit;
