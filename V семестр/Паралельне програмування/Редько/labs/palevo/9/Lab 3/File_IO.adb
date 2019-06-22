with Ada.Integer_Text_IO,PRO1task2pack; 
use Ada.Integer_Text_IO,PRO1task2pack;

package body File_IO is    
   procedure Vector_Output(file: in File_Type; V: in Vector) is
   	i:integer; 
   begin
        for i in 1..N loop
         put(file, " V("); put(file, i,2);
         put(file, ")="); put(file, V(i),3);
      end loop;
      new_line(file);
   end Vector_Output;

   function Vector_Input(file: in File_Type) return Vector is
      V: Vector;
   begin
        for i in 1..N loop
         get(file, V(i));
      end loop;
      return V;
   end Vector_Input;

   procedure Matrix_Output(file: in File_Type; M: in Matrix) is
   begin
        for i in 1..N loop
         for j in 1..N loop
            put(file, " M("); put(file, i,2);
            put(file, ","); put(file, j,2);
            put(file, ")="); put(file, M(i)(j),3);
         end loop;
         new_line(file);
      end loop;
   end Matrix_Output;

   function Matrix_Input(file: in File_Type) return Matrix is
      M: Matrix;
   begin
        for i in 1..N loop
         for j in 1..N loop
            get(file, M(i)(j));
         end loop;
      end loop;
      return M;
   end Matrix_Input;
    
end File_IO;
