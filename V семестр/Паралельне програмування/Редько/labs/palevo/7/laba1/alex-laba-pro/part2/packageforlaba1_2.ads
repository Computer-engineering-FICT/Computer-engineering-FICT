with Ada.Text_IO,
	Ada.Integer_Text_IO;
use Ada.Text_IO,
	Ada.Integer_Text_IO;

package packageforlaba1_2 is

    N: constant integer := 3;
	type Vector is private;
	type Matrix is private;
	
	procedure inputVectorTo(a: out Vector);
	procedure inputMatrixTo(a: out Matrix);
	procedure outputVector(a: in Vector);
	
	function F1(A, B, C: Vector) return integer;
	function F2(MB: Matrix) return integer;
	function F3(B: Vector; MD, MA, MB: Matrix) return Vector;

private

	type Vector is Array(1..N) of integer;
	type Matrix is Array(1..N) of Vector;
	
end packageforlaba1_2;
