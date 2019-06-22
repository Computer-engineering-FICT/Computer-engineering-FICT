with Ada.Text_IO; use Ada.Text_IO;
package body Vector_F1.Matrix_F2.F3 is

   -- Nahojdenie minimal'nogo elementa vektora
   function Vector_Min(A: in Vector) return Integer is
      min: Integer;
   begin
      min:=A(1);
      for i in 1..N loop
         if A(i)<min then
            min:=A(i);
         end if;
      end loop;
      return min;
   end Vector_Min;


   -- Raznost' vektorov
   function Vector_Difference(A,B: Vector) return Vector is
      C: Vector;
   begin
      for i in 1..N loop
            C(i):=A(i)-B(i);
      end loop;
      return C;
   end Vector_Difference;

   -- Umnojenie maricy na vektor
   function Vector_Matrix_Product(MA: Matrix; A: Vector)
                                  return Vector is
      V: Vector;
      Sum: Integer;
   begin
      for i in 1..N loop
         Sum:=0;
         for j in 1..N loop
            Sum:=Sum+A(j)*MA(j)(i);
         end loop;
         V(i):=Sum;
      end loop;
      return V;
   end Vector_Matrix_Product;

   -- Transponirovanie matricy
   function Matrix_Trans(MA: Matrix) return Matrix is
      M: Matrix;
   begin
      for i in 1..N loop
         for j in 1..N loop
            M(i)(j):=MA(j)(i);
         end loop;
      end loop;
      return M;
   end Matrix_Trans;

   -- Funkciya3
   function Fun3(MB: Matrix; A,C: Vector) return Integer is
      d: Integer;
   begin
      d:=Vector_Min(Vector_Difference((Vector_Matrix_Product(
        Matrix_Trans(MB),
        A)),Vector_Matrix_Product(MB,Vector_Sort(C,False))));
      return d;
   exception
      when Constraint_Error =>
         put("Constraint error at Func3. Result is uncorrect:");
      return d;
   end Fun3;

end Vector_F1.Matrix_F2.F3;

