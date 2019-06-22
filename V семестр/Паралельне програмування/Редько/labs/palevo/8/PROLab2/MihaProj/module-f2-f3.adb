with Ada.Text_IO; use Ada.Text_IO;
package body Module.F2.F3 is
   ---p = MAX(SORT(MS) + MA*MB);
   function Func3(MS, MA, MB: Matrix) return integer is
      m: Matrix;
   begin
      m := MS;
      MatrixSort(m);
      return MatrixMax(MatrixSum(m, MatrixMult(MA, MB)));
	   exception
	      when Constraint_Error =>
            Put("Constraint error in Func3");
            return 0;
   end Func3;
end Module.F2.F3;