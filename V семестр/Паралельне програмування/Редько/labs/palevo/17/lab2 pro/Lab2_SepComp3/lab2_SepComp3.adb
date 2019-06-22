----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #2                     --
--                   IO-73 Rukavishnikov Gleb                 --
----------------------------------------------------------------
--Variant: 1.12, 2.20, 3.24                                   --
--F1:  A=B+C-D*e                                              --
--F2:  MD=MA+MB-MC*MM                                         --
--F3:  k=min(MA*MB*å)                                         --
----------------------------PACK PROGRAM------------------------
--This program uses StartPack package                         --
--3rd variant of separate compilation                         --
----------------------------------------------------------------


generic
      N: integer;

package Vector_F1 is

   --N: integer := 3;

   type vector is private;

   ---e = (a*b) + (c*d);
    procedure Func1(a: out Vector; b, c, d: in Vector; e:in integer);

   private
      type Vector is array (1..N) of Integer;

      ---Vector operations
      ----Multiplication of vectors a*b
      function VectMult(a, b: Vector) return integer;

      ----Processing sum of vectors a+b
      function VectSum(a, b: Vector) return Vector;

      ----Descending sort of vector a
      procedure VectSort(a: in out Vector);

		function PlusVect (A, B: in Vector) return Vector;
		function MinusVect (A, B: in Vector) return Vector;
		function multiVectNum (A: in Vector; e: in integer) return Vector;
		function MultiplyStep (A: in Vector; B: in Vector)  return integer;
end Vector_F1;


generic
package Vector_F1.Matrix_F2 is
   --Types description--
   type Matrix is array (1..N) of Vector;

   ---MC = SORT(MA + MB*MD)
   procedure Func2(MA, MB, MC, MM: in Matrix; MD: out Matrix);

   ---Matrix operations
   ----Multiplication of matrix a*b
   function MatrixMult(a, b: Matrix) return Matrix;


   ----Sum of matrix a+b
   function MatrixSum(a, b: Matrix) return Matrix;

   ----Discrepancy of matrix a-b
	function MatrixRizn(a, b: Matrix) return Matrix; 

	function MultiMatrNum (A: in Matrix; e: in integer) return matrix;

   -----Descending sort of strings of matrix m
   procedure MatrixSort(m: in out Matrix);

   ----Searching maximum in matrix m
   function MatrixMax(m: Matrix) return integer;

	----Searching minimum in matrix m
	function MatrixMin(m: Matrix) return integer;

end Vector_F1.Matrix_F2;


generic
package Vector_F1.Matrix_F2.FIO is
   --I/O operations
   ---Output for Vector type
   procedure VectOutput(A: Vector);

   ---Matrix output
   procedure MatrixOutput(a: Matrix);

   ---Vector input
   procedure VectInput(a: in out Vector);

   ---Matrix input
   procedure MatrixInput(m: in out Matrix);
end Vector_F1.Matrix_F2.FIO;


generic
package Vector_F1.Matrix_F2.F3 is
   ---k=min(MA*MB*å)  
    function Func3(MA, MB:in Matrix; E: in integer) return integer;

end Vector_F1.Matrix_F2.F3;


with Vector_F1,
     Vector_F1.Matrix_F2,
     Vector_F1.Matrix_F2.F3,
     Vector_F1.Matrix_F2.FIO,
     Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab2_SepComp3 is
   package Modu is new Vector_F1(3);
   use Modu;

   package Modu_F2 is new Modu.Matrix_F2;
   use Modu_F2;

   package Modu_F3 is new Modu_F2.F3;
   use Modu_F3;

   package Modu_IO is new Modu_F2.FIO;
   use Modu_IO;

   --Main program variables
   A, B, C, D: Vector;
   MA, MB, MC, MD, MM: Matrix;
   e, p:integer;
begin
   --Func1
   Put_Line("Func1");
   Put_Line("Input vector B");
   VectInput(B);
   Put_Line("Input vector C");
   VectInput(C);
   Put_Line("Input vector D");
   VectInput(D);
	Put_Line("Input E");
   Ada.Integer_Text_IO.Get(E);
   Func1(A, B, C, D, e);
   Put_Line("Func1 result");
   VectOutput (A);
   New_Line;

   --Func2
   Put_Line("Func2");
   Put_Line("Input matrix MA");
   MatrixInput(MA);
   Put_Line("Input matrix MB");
   MatrixInput(MB);
   Put_Line("Input matrix MC");
   MatrixInput(MC);
	Put_Line("Input matrix MM");
   MatrixInput(MM);
   Func2(MA, MB, MC, MD, MM);
   Put_Line("Func2 result");
   MatrixOutput(MM);

   --Func3
   Put_Line("Func3");
   Put_Line("Input matrix MA");
   MatrixInput(MA);
	Put_Line("Input matrix MB");
	MatrixInput(MB);
	Put_Line("Input E");
   Ada.Integer_Text_IO.Get(E);
   p := Func3(MA, MB, E);
   Put_Line("Func3 result");
   Ada.Integer_Text_IO.Put(p);
end Lab2_SepComp3;
