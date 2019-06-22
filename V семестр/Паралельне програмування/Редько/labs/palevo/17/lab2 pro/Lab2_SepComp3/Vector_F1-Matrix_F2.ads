----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #2                     --
--                   IO-73 Rukavishnikov Gleb                 --
----------------------------------------------------------------
--Variant: 1.12, 2.20, 3.24                                   --
--F1:  A=B+C-D*e                                              --
--F2:  MD=MA+MB-MC*MM                                         --
--F3:  k=min(MA*MB*å)                                         --
----------------------Vector_F1.Matrix_F2-----------------------
----------------------------------------------------------------
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
