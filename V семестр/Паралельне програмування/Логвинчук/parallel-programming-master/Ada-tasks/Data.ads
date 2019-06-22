generic
	N : Integer;

package Data is

    type Vector is private;
    type Matrix is private;

    function F1(A, B, C : in Vector; MA, ME : in Matrix) return Integer;
    function F2(MF, MK : in Matrix) return Matrix;
    function F3(MO, MP, MS : in Matrix; R, S : in Vector) return Integer;
	
    procedure Input_Vector(Name: in string; A: out Vector);
    procedure Input_Matrix(Name: in String; MA: out Matrix);
    
    procedure Input_Random_Vector(A : out Vector);
    procedure Input_Random_Matrix(MA : out Matrix);

    procedure Output_Vector(A: in Vector);
    procedure Output_Matrix(MA: in Matrix);
	
private

    type Vector is array(1..N) of Integer;
    type Matrix is array(1..N) of Vector;

    function "+"(L, R : in Vector) return Vector;
    function "*"(L, R : in Vector) return Integer;

    function "+"(ML, MR : in Matrix) return Matrix;
    function "*"(ML, MR : in Matrix) return Matrix;
	
    function "*"(ML : in Matrix; R : in Vector) return Vector;

    function Transpose(MM : in Matrix) return Matrix;
    
    function Sort_Vector(V : in out Vector) return Vector;

    function Sort_Matrix(MM : in out Matrix) return Matrix;

    function Max(V : in Vector) return Integer;
    
    function Swap_Rows(MM : in out Matrix; i, j : in Integer) return Matrix;
	
end Data;