with Ada.Text_IO;
use Ada.Text_IO;

package p1.p2.p3 is

	function F3(B: Vector; MD, MA, MB: Matrix) return Vector;
	
end p1.p2.p3;

package body p1.p2.p3 is	
	
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
		
	exception
	
		when Numeric_Error =>
			put_line("Error while multiplying vector by matrix: overflow reached");
			raise;
			
		when others =>
			raise;
			
	end multiplyVectorByMatrix;
	
	
	
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
	
	
	
	function subtractMatrix(a, b: Matrix) return Matrix is
		c: Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				c(i)(j) := a(i)(j) - b(i)(j);
			end loop;
		end loop;
		return c;
		
	exception
	
		when Numeric_Error =>
			put_line("Error while subtracting matrices");
			raise;
			
		when others =>
			raise;
			
	end subtractMatrix;
	
	
	
	-- W = SORT(B * MD) * (MA - MB)
	function F3(B: Vector; MD, MA, MB: Matrix) return Vector is
		W: Vector;
	begin
		W := multiplyVectorByMatrix(B, MD);
		sortVectorInAscendingOrder(W);
		return multiplyVectorByMatrix(W, subtractMatrix(MA, MB));
	end F3;
	
end p1.p2.p3;
