with Ada.Text_IO,PRO1task2pack; 
use Ada.Text_IO,PRO1task2pack;

package File_IO is

   function Vector_Input(file: in File_Type) return Vector;
   procedure Vector_Output(file: in File_Type; V: in Vector);
   function Matrix_Input(file: in File_Type) return Matrix;
   procedure Matrix_Output(file: in File_Type; M: in Matrix);

end File_IO;
