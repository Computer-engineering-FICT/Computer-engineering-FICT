with Ada.Text_IO;
use Ada.Text_IO;

package body p1 is

	function addVector(a, b: Vector) return Vector is
		c: Vector;
	begin
		for i in 1..N loop
			c(i) := a(i) + b(i);
		end loop;
		return c;
		
	exception
	
		when Numeric_Error =>
			put_line("Error while adding two vectors: values sum overflows range of integer");
			raise;
			
		when others =>
			put_line("Unknown error happens in attempt to calculate F1");
			raise;
			
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
	
	
	-- d = MAX(A + B + C)
	function F1(A, B, C: Vector) return integer is
	begin
	
		return getMaxElement(addVector(addVector(A, B), C));
		
	exception

		when others =>
			return 0;
			
	end F1;
	

end p1;
