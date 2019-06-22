with Ada.Text_IO; use Ada.Text_IO;
package body Module.F2 is
   ---MC = SORT(MA + MB*MD)
   procedure Func2(MA, MB, MD: in Matrix; MC: out Matrix) is
   begin
      MC := MatrixSum(MA, MatrixMult(MB, MD));
      MatrixSort(MC);
	   exception
	      when Constraint_Error =>
	         Put("Constraint error in Func2");
    end Func2;

   ---Matrix operations
   ----Multiplication of matrix a*b
   function MatrixMult(a, b: Matrix) return Matrix is
      c: Matrix;
      sum: Integer;
   begin
      for i in 1..N loop
         for j in 1..N loop
            sum := 0;
            for z in 1..n loop
               sum := sum + a(i)(z) * b(z)(j);
            end loop;
            c(i)(j) := sum;
         end loop;
      end loop;
      return c;
   end MatrixMult;

   ----Sum of matrix a+b
   function MatrixSum(a, b: Matrix) return Matrix is
      c: Matrix;
   begin
      for i in 1..N loop
         for j in 1..N loop
            c(i)(j) := a(i)(j) + b(i)(j);
         end loop;
      end loop;
      return c;
   end;

   -----Descending sort of strings of matrix m
   procedure MatrixSort(m: in out Matrix) is
   begin
      for i in 1..n loop
         VectSort(m(i));
      end loop;
   end MatrixSort;

   ----Searching maximum in matrix m
   function MatrixMax(m: Matrix) return integer is
      max: integer;
   begin
      max := m(1)(1);
      for i in 1..N loop
         for j in 1..N loop
            if max < m(i)(j) then
               max := m(i)(j);
            end if;
         end loop;
      end loop;
      return max;
   end;
end Module.F2;