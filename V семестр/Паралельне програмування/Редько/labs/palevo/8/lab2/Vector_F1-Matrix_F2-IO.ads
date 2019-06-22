generic

package Vector_F1.Matrix_F2.IO is


   -- Vvod vektora
   function Vector_Input return Vector;

   -- Vyvod vektora
   procedure Vector_Output(V: in Vector);

   -- Vvod matricy
   function Matrix_Input return Matrix;

   -- Vyvod matricy
   procedure Matrix_Output(M: in Matrix);

end Vector_F1.Matrix_F2.IO;
