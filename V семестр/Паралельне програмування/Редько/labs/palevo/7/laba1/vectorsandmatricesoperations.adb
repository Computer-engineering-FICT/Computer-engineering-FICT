with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body vectorsAndMatricesOperations is
	
	procedure inputVectorTo(a: out Vector) is
	begin
		for i in 1..N loop
			get(a(i));
		end loop;
	end inputVectorTo;
	
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
	
	function addMatrix(a, b: Matrix) return Matrix is
		c: Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				c(i)(j) := a(i)(j) + b(i)(j);
			end loop;
		end loop;
		return c;
	end addMatrix;
	
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
	
	function addVector(a, b: Vector) return Vector is
		c: Vector;
	begin
		for i in 1..N loop
			c(i) := a(i) + b(i);
		end loop;
		return c;
	end addVector;
	
	function subtractVector(a, b: Vector) return Vector is
		c: Vector;
	begin
		for i in 1..N loop
			c(i) := a(i) - b (i);
		end loop;
		return c;
	end subtractVector;
	
	function multiplyVectorByInteger(a: Vector; b: integer) return Vector is
		c: Vector;
	begin
		for i in 1..N loop
			c(i) := a(i) * b;
		end loop;
		return c;
	end multiplyVectorByInteger;
	
	function multiplyVectors(a, b: Vector) return integer is
		c: integer := 0;
	begin
		for i in 1..N loop
			c := c + a(i) * b(i);
		end loop;
		return c;
	end multiplyVectors;
	
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
	
	function getMinElement(a: Vector) return integer is
		b: integer := a(1);
	begin
		for i in 2..N loop
			if b > a(i) then
				b := a(i);
			end if;
		end loop;
		return b;
	end getMinElement;
	
	function multiplyIntegerByVector(a: integer; b: Vector) return Vector is
		c: Vector;
	begin
		for i in 1..N loop
			c(i) := a * b(i);
		end loop;
		return c;
	end multiplyIntegerByVector;
	
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
	
	procedure sortVectorInDescendingOrder(a: in out Vector) is
		tempMax,
		tempMaxPos,
		buffer: integer;
	begin
		for i in 1..N - 1 loop
			tempMax := a(i);
			tempMaxPos := i;
			for j in i..N loop
				if tempMax < a(j) then
					tempMax := a(j);
					tempMaxPos := j;
				end if;
			end loop;
			buffer := a(i);
			a(i) := a(tempMaxPos);
			a(tempMaxPos) := buffer;
		end loop;
	end sortVectorInDescendingOrder;
	
	

	procedure inputMatrixTo(a: out Matrix) is
	begin
		for i in 1..N loop
			for j in 1..N loop
				get(a(i)(j));
			end loop;
		end loop;
	end inputMatrixTo;
	
	procedure outputMatrix(a: in Matrix) is
	begin
		for i in 1..N loop
			put(a(i)(1));
			for j in 2..N loop
				put(", ");
				put(a(i)(j), 3);
			end loop;
			new_line;
		end loop;
	end outputMatrix;
	
	function multiplyIntegerByMatrix(a: integer; b: Matrix) return Matrix is
		c: Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				c(i)(j) := a * b(i)(j);
			end loop;
		end loop;
		return c;
	end multiplyIntegerByMatrix;
	
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
	
	function transposeMatrix(a: Matrix) return Matrix is
		b: Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				b(i)(j) := a(j)(i);
			end loop;
		end loop;
		return b;
	end transposeMatrix;
	
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

	function getMinElement(a: Matrix) return integer is
		b: integer := a(1)(1);
	begin
		for i in 1..N loop
			for j in 1..N loop
				if b > a(i)(j) then
					b := a(i)(j);
				end if;
			end loop;
		end loop;
		return b;
	end getMinElement;
	
	procedure sortMatrix(a: in out Matrix) is
	begin
		for i in 1..N loop
			sortVectorInDescendingOrder(a(i));
		end loop;
	end sortMatrix;

end vectorsAndMatricesOperations;
