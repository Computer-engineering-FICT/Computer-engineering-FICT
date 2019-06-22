----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #1                     --
--                   IO-73 Pustovit Michael                   --
----------------------------------------------------------------
--                  Variant: 1.27, 2.14, 3.18                 --
----------------------------------------------------------------
----------------------------Module.F2---------------------------
----------------------------------------------------------------
generic
package Module.F2 is
   --Types description--
   type Matrix is array (1..N) of Vector;

   ---MC = SORT(MA + MB*MD)
   procedure Func2(MA, MB, MD: in Matrix; MC: out Matrix);

   ---Matrix operations
   ----Multiplication of matrix a*b
   function MatrixMult(a, b: Matrix) return Matrix;

   ----Sum of matrix a+b
   function MatrixSum(a, b: Matrix) return Matrix;

   -----Descending sort of strings of matrix m
   procedure MatrixSort(m: in out Matrix);

   ----Searching maximum in matrix m
   function MatrixMax(m: Matrix) return integer;

end Module.F2;