package body packageforlaba1_2 is

	procedure inputVectorTo(a: out Vector) is
	begin
		for i in 1..N loop
			get(a(i));
		end loop;
	end inputVectorTo;

	function addVector(a, b: Vector) return Vector is
		c: Vector;
	begin
		for i in 1..N loop
			c(i) := a(i) + b(i);
		end loop;
		return c;
	end addVector;

	function getMaxElement(a: Vector) return integer is
		b: integer := a(1);
	begin
		for i in 2..N loop
			if b < a(i) then
				b := a(i);
			end if;
		end loop;
		return b;
	end getMaxElement;
	
	procedure inputMatrixTo(a: out Matrix) is
	begin
		for i in 1..N loop
			for j in 1..N loop
				get(a(i)(j));
			end loop;
		end loop;
	end inputMatrixTo;
	
	function getMaxElement(a: Matrix) return integer is
		b: integer := a(1)(1);
	begin
		for i in 1..N loop
			for j in 1..N loop
				if b < a(i)(j) then
					b := a(i)(j);
				end if;
			end loop;
		end loop;
		return b;
	end getMaxElement;
	
	procedure sortVectorInAscendingOrder(a: in out Vector) is
		tempMin,
		tempMinPos,
		buffer: integer;
	begin
		for i in 1..N - 1 loop
			tempMin := a(i);
			tempMinPos := i;
			for j in i..N loop
				if tempMin > a(j) then
					tempMin := a(j);
					tempMinPos := j;
				end if;
			end loop;
			buffer := a(i);
			a(i) := a(tempMinPos);
			a(tempMinPos) := buffer;
		end loop;
	end sortVectorInAscendingOrder;
	
	function multiplyVectorByMatrix(a: Vector; b: Matrix) return Vector is
		c: Vector;
	begin
		for i in 1..N loop
			c(i) := 0;
			for j in 1..N loop
				c(i) := c(i) + a(i) * b(i)(j);
			end loop;
		end loop;
		return c;
	end multiplyVectorByMatrix;
	
	function multiplyMatrices(a, b: Matrix) return Matrix is
		c: Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				c(i)(j) := 0;
				for k in 1..N loop
					c(i)(j) := c(i)(j) + a(i)(k) * b(k)(j);
				end loop;
			end loop;
		end loop;
		return c;
	end multiplyMatrices;
	
	function subtractMatrix(a, b: Matrix) return Matrix is
		c: Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				c(i)(j) := a(i)(j) - b(i)(j);
			end loop;
		end loop;
		return c;
	end subtractMatrix;
	
	procedure outputVector(a: in Vector) is
	begin
		put("(");
		put(a(1), 3);
		for i in 2..N loop
			put(", ");
			put(a(i), 3);
		end loop;
		put_line(")");
	end outputVector;
	
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
	
end packageforlaba1_2;
