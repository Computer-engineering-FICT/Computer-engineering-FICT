----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #2                     --
--                   IO-73 Rukavishnikov Gleb                 --
----------------------------------------------------------------
--Variant: 1.12, 2.20, 3.24                                   --
--F1:  A=B+C-D*e                                              --
--F2:  MD=MA+MB-MC*MM                                         --
--F3:  k=min(MA*MB*å)                                         --
----------------------------------------------------------------
--------------------Vector_F1.Matrix_F2.FIO---------------------
----------------------------------------------------------------

generic
package Vector_F1.Matrix_F2.FIO is
   --I/O operations
   ---Output for Vector type
   procedure VectOutput(a: Vector);

   ---Matrix output
   procedure MatrixOutput(a: Matrix);

   ---Vector input
   procedure VectInput(a: in out Vector);

   ---Matrix input
   procedure MatrixInput(m: in out Matrix);
end Vector_F1.Matrix_F2.FIO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.IO_Exceptions; use Ada.IO_Exceptions;

package body Vector_F1.Matrix_F2.FIO is
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

end Vector_F1.Matrix_F2.FIO;
