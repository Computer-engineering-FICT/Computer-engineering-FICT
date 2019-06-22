with Ada.Text_IO,
	Ada.Integer_Text_IO;
use Ada.Text_IO,
	Ada.Integer_Text_IO;

package p is

	N: constant integer := 3;

	type Vector is Array(1..N) of integer;
	type Matrix is Array(1..N) of Vector;
	
	--procedure inputVectorTo(A: out Vector);
	--procedure inputMatrixTo(A: out Matrix);
	procedure outputVector(A: in Vector);
	procedure outputMatrix(MA: in Matrix);
	
	function F1(A, B, C: Vector) return integer;
	function F2(MB: Matrix) return integer;
	function F3(B: Vector; MD, MA, MB: Matrix) return Vector;

end p;
