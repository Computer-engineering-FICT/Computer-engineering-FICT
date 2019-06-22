with Ada.text_iO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package Unit is
	
	n:constant := 5;

	type Vector is private;
	type Matrix is private;

	procedure VectorIn (x : out Vector);
	procedure VectorOut (x : in Vector );
	procedure MatrixIn (MX : out Matrix);
	procedure MatrixOut (MX : in Matrix);
	procedure Func1 (A, b, d : in Vector; c : out Vector);
	procedure Func2 (MA, MB, MC: in Matrix; MD : out Matrix);
	procedure Func3(A, B: in Vector; MA, MB: in Matrix; D: out vector);

	private
		type Vector is array (1..n) of Integer;
		type Matrix is array (1..n) of Vector;

end Unit;
