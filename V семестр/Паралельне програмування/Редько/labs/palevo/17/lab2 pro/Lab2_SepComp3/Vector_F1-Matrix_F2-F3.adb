with Ada.Text_IO; use Ada.Text_IO;
package body Vector_F1.Matrix_F2.F3 is
	
	--k=min(MA*MB*å)  
   function Func3(MA, MB:in Matrix; E: in integer) return integer is
      k: Integer;
	begin
		K := MatrixMin(MatrixMult(MA, MultiMatrNum (MB,E)));
		
	   exception
	      when Constraint_Error =>
            Put("Constraint error in Func3");
		return K;
	end Func3;

end Vector_F1.Matrix_F2.F3;
