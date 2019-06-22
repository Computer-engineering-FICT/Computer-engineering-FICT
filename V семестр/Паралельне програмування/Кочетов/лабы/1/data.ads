with Ada.Text_IO, Ada.Long_Integer_Text_IO, System.Multiprocessors, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Long_Integer_Text_IO, System.Multiprocessors; 

generic N: Long_Integer;
package Data is
	type Vector is private;
	type Matrix is private;

	procedure Read_Vector(A: out Vector);
	procedure Read_Matrix(MA: out Matrix);
	procedure Fill_Vector_1(A: in out Vector);
	procedure Fill_Matrix_1(MA: in out Matrix);
	function Multiply_Matrices(MA, MB: in Matrix) return Matrix;
	function Multiply_Vector_Matrix(A: in Vector; MB: in Matrix) return Vector;
	function Multiply_Scalar_Matrix(A: in Long_Integer; MB: in Matrix) return Matrix;
	function Sum_Vectors(A, B: in Vector) return Vector;
	function Sum_Matrices(MA, MB: in Matrix) return Matrix;
	function Min_Vector(A: in Vector) return Long_Integer;
	function Min_Matrix(MA: in Matrix) return Long_Integer;
	function Max_Vector(A: in Vector) return Long_Integer;
	function Max_Matrix(MA: in Matrix) return Long_Integer;
	function Sort_Vector(A: in Vector) return Vector;
	procedure Print_Vector(A: in Vector);
	procedure Print_Matrix(MA: in Matrix);
	procedure Funcs(C: out Vector; A: in Vector; MA, ME: in Matrix; B, D: in Vector; ML: out Matrix; MF, MG, MH, MK: in Matrix; T: out Vector; MO, MP: in Matrix; S: in Vector; MR: in Matrix);

private
	type Vector is array(1..N) of Long_Integer;
	type Matrix is array(1..N, 1..N) of Long_Integer;
end Data;