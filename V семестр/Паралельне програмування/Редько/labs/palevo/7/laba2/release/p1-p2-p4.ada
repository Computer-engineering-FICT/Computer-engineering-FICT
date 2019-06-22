with Ada.Text_IO,
	Ada.Integer_Text_IO;
use Ada.Text_IO,
	Ada.Integer_Text_IO;

package p1.p2.p4 is
	
	procedure inputVectorTo(a: out Vector);
	procedure inputMatrixTo(a: out Matrix);
	procedure outputVector(a: in Vector);
	
end p1.p2.p4;

package body p1.p2.p4 is
	
	procedure inputVectorTo(a: out Vector) is
	begin
		for i in 1..N loop
			loop 
				begin
					get(a(i));
					exit;
				exception
					when Data_Error =>
						put_line("Error: illegal value entered. Please, enter integer value");
						Ada.Text_IO.Skip_Line;
					when others =>
						put_line("Unknown error");
						raise;
				end;
			end loop;
		end loop;
	end inputVectorTo;
	
	
	procedure inputMatrixTo(a: out Matrix) is
	begin
		for i in 1..N loop
			inputVectorTo(a(i));
		end loop;
	end inputMatrixTo;
	
	
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
	
end p1.p2.p4;
