----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #2                     --
--                   IO-73 Rukavishnikov Gleb                 --
----------------------------------------------------------------
--Variant: 1.12, 2.20, 3.24                                   --
--F1:  A=B+C-D*e                                              --
--F2:  MD=MA+MB-MC*MM                                         --
--F3:  k=min(MA*MB*å)                                         --
-------------------SPECIFICATION OF MAIN PACKAGE----------------
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
