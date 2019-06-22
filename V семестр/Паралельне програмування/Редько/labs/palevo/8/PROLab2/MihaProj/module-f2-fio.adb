with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;

package body Module.F2.FIO is
   --I/O operations
   ---Output for Vector type
   procedure VectOutput(a: Vector) is
   begin
      for i in 1..n loop
         Put(a(i), 5);
      end loop;
      New_line;
   end VectOutput;

   ---Matrix output
   procedure MatrixOutput(a: Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            Put(a(i)(j), 4);
         end loop;
         New_Line;
      end loop;
   end MatrixOutput;

   ---Vector input
   procedure VectInput(a: in out Vector) is
   begin
      for i in 1..N loop
         loop
            begin
	            Get(a(i));
	            exit;
	            exception
	               when Ada.IO_Exceptions.Data_Error =>
	                  Put("Input error. Please, try again:");
                      Skip_Line;
            end;
         end loop;
      end loop;

   end VectInput;

   ---Matrix input
   procedure MatrixInput(m: in out Matrix) is
   begin
      Put_Line("Input matrix");
      for i in 1..N loop
         VectInput(m(i));
      end loop;
   end;

end Module.F2.FIO;