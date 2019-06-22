package body p is

	procedure inputVectorTo(A: out Vector) is
	begin
		for i in 1..N loop
			get(A(i));
		end loop;
	end inputVectorTo;

	function addVector(A, B: Vector) return Vector is
		C: Vector;
	begin
		for i in 1..N loop
			C(i) := A(i) + B(i);
		end loop;
		return C;
	end addVector;

	function getMaxElement(A: Vector) return integer is
		b: integer := A(1);
	begin
		for i in 2..N loop
			if b < A(i) then
				b := A(i);
			end if;
		end loop;
		return b;
	end getMaxElement;
	
	procedure inputMatrixTo(MA: out Matrix) is
	begin
		for i in 1..N loop
			for j in 1..N loop
				get(MA(i)(j));
			end loop;
		end loop;
	end inputMatrixTo;
	
	function getMaxElement(MA: Matrix) return integer is
		b: integer := MA(1)(1);
	begin
		for i in 1..N loop
			for j in 1..N loop
				if b < MA(i)(j) then
					b := MA(i)(j);
				end if;
			end loop;
		end loop;
		return b;
	end getMaxElement;
	
	procedure sortVectorInAscendingOrder(A: in out Vector) is
		tempMin,
		tempMinPos,
		buffer: integer;
	begin
		for i in 1..N - 1 loop
			tempMin := A(i);
			tempMinPos := i;
			for j in i..N loop
				if tempMin > A(j) then
					tempMin := A(j);
					tempMinPos := j;
				end if;
			end loop;
			buffer := A(i);
			A(i) := A(tempMinPos);
			A(tempMinPos) := buffer;
		end loop;
	end sortVectorInAscendingOrder;
	
	function multiplyVectorByMatrix(A: Vector; MB: Matrix) return Vector is
		C: Vector;
	begin
		for i in 1..N loop
			C(i) := 0;
			for j in 1..N loop
				C(i) := C(i) + A(i) * MB(i)(j);
			end loop;
		end loop;
		return C;
	end multiplyVectorByMatrix;
	
	function multiplyMatrices(MA, MB: Matrix) return Matrix is
		MC: Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				MC(i)(j) := 0;
				for k in 1..N loop
					MC(i)(j) := MC(i)(j) + MA(i)(k) * MB(k)(j);
				end loop;
			end loop;
		end loop;
		return MC;
	end multiplyMatrices;
	
	function subtractMatrix(MA, MB: Matrix) return Matrix is
		MC: Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				MC(i)(j) := MA(i)(j) - MB(i)(j);
			end loop;
		end loop;
		return MC;
	end subtractMatrix;
	
	procedure outputVector(A: in Vector) is
	begin
		put("(");
		put(A(1), 3);
		for i in 2..N loop
			put(", ");
			put(A(i), 3);
		end loop;
		put_line(")");
	end outputVector;
	
	procedure outputMatrix(MA: in Matrix) is
	begin
		for i in 1..N loop
			put(MA(i)(1));
			for j in 2..N loop
				put(", ");
				put(MA(i)(j), 3);
			end loop;
			new_line;
		end loop;
	end outputMatrix;
	
	--d = MAX(A + B + C)
	function F1(A, B, C: Vector) return integer is
	begin
		return getMaxElement(addVector(addVector(A, B), C));
	end F1;
	
	--x = MAX(MB)
	function F2(MB: Matrix) return integer is
	begin
		return getMaxElement(MB);
	end F2;
	
	--W = SORT(B * MD) * (MA - MB)
	function F3(B: Vector; MD, MA, MB: Matrix) return Vector is
		W: Vector;
	begin
		W := multiplyVectorByMatrix(B, MD);
		sortVectorInAscendingOrder(W);
		return multiplyVectorByMatrix(W, subtractMatrix(MA, MB));
	end F3;
	
end p;
