with Ada.Text_IO; use Ada.Text_IO;
package body Vector_F1.Matrix_F2 is

   -- Proizvedenie matricy na skalyar
   function Scalar_Matrix_Product(MA: in Matrix; S:
                         in Integer) return Matrix is
      MC: Matrix;
   begin
      for i in 1..N loop
           for j in 1..N loop
            MC(i)(j):=MA(i)(j)*S;
         end loop;
      end loop;
      return MC;
   end Scalar_Matrix_Product;

   -- Summa matric
   function Matrix_Sum(MA,MB: Matrix) return Matrix is
      MC: Matrix;
   begin
      for i in 1..N loop
           for j in 1..N loop
            MC(i)(j):=MA(i)(j)+MB(i)(j);
         end loop;
      end loop;
      return MC;
   end Matrix_Sum;

   -- Nahojdenie minimal'nogo elementa matricy
   function Matrix_Min(A: in Matrix) return Integer is
      min: Integer;
   begin
      min:=A(1)(1);
      for i in 1..N loop
         for j in 1..N loop
            if A(i)(j)<min then
               min:=A(i)(j);
            end if;
         end loop;
      end loop;
      return min;
   end Matrix_Min;

   -- Maksimal'nyi element matricy
   function Matrix_Max(A: in Matrix) return Integer is
      max: Integer;
   begin
      max:=A(1)(1);
      for i in 1..N loop
         for j in 1..N loop
            if A(i)(j)>max then
               max:=A(i)(j);
            end if;
         end loop;
      end loop;
      return max;
   end Matrix_Max;

   -- Funkciya2
   function Fun2(MA,MB: Matrix) return Matrix is
      M: Matrix;
   begin
      M:=Matrix_Sum(Scalar_Matrix_Product(MB,Matrix_Min(MA)),
                    Scalar_Matrix_Product(MA,Matrix_Max(MB)));
      return M;
   exception
      when Constraint_Error =>
         put("Constraint error at Func2. Result is uncorrect:");
      return M;
   end Fun2;

end Vector_F1.Matrix_F2;
