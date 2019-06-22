with Ada.Text_IO, Ada.IO_Exceptions; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Vector_F1.Matrix_F2.IO is

   -- Vyvod vektora
   procedure Vector_Output(V: in Vector) is
   begin
      for i in 1..N loop
         put(" V("); put(i,2); put(")="); put(V(i),3);
      end loop;
      new_line;
   end Vector_Output;

   -- Vvod vektora
   function Vector_Input return Vector is
      V: Vector;
   begin
      for i in 1..N loop
         loop
            begin
               put(" V("); put(i,2); put(")=");
               get(V(i)); new_line;
               exit;
            exception
               when Ada.IO_Exceptions.Data_Error =>
                  put("Error! Data is uncorrect. Try again: ");
                  Skip_Line;
            end;
         end loop;
      end loop;
      return V;
   end Vector_Input;

   -- Vyvod matricy
   procedure Matrix_Output(M: in Matrix) is
   begin
        for i in 1..N loop
         for j in 1..N loop
            loop
               begin
                  put(" M("); put(i,2); put(","); put(j,2);
                  put(")="); put(M(i)(j),3);
                  exit;
               exception
                  when Ada.IO_Exceptions.Data_Error =>
                     put("Error! Data is uncorrect. Try again: ");
                     Skip_Line;
               end;
            end loop;
         end loop;
         new_line;
      end loop;
   end Matrix_Output;

   -- Vvod matricy
   function Matrix_Input return Matrix is
      M: Matrix;
   begin
        for i in 1..N loop
         for j in 1..N loop
            put(" M("); put(i,2); put(",");
            put(j,2); put(")="); get(M(i)(j));
            new_line;
         end loop;
         new_line;
      end loop;
      return M;
   end Matrix_Input;

end Vector_F1.Matrix_F2.IO;
