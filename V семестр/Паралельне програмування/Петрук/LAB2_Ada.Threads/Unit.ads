with Ada.text_iO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package Unit is
	
	N:constant := 3;

	type Vector is private;
	type Matrix is private;

	procedure VectorIn (X : out Vector);
	procedure VectorOut (X : in Vector );
	procedure MatrixIn (MX : out Matrix);
	procedure MatrixOut (MX : in Matrix);
	procedure Func1 (A, B, D : in Vector; C : out Vector);
	procedure Func2 (MA, MB, MC: in Matrix; MD : out Matrix);
	procedure Func3(A, B: in Vector; MA, MB: in Matrix; D: out vector);

	private
		type Vector is array (1..N) of Integer;
		type Matrix is array (1..N) of Vector;

end Unit;
