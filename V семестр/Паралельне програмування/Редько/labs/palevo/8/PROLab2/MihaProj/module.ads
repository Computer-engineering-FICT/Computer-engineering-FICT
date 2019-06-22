----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #1                     --
--                   IO-73 Pustovit Michael                   --
----------------------------------------------------------------
--Variant: 1.27, 2.14, 3.18                                   --
--Func1: e = (A*B) + (C*D);                                      --
--Func2: MC = SORT(MA + MB*MO);                                  --
--Func3: p = MAX(SORT(MS) + MA*MB).                              --
-------------------SPECIFICATION OF MAIN PACKAGE----------------
----------------------------------------------------------------

generic
      N: integer;

package Module is

   --N: integer := 3;

   type vector is private;

   ---e = (a*b) + (c*d);
   procedure Func1(a, b, c, d: in Vector; e:out integer);

   private
      type Vector is array (1..N) of Integer;

      ---Vector operations
      ----Multiplication of vectors a*b
      function VectMult(a, b: Vector) return integer;

      ----Processing sum of vectors a+b
      function VectSum(a, b: Vector) return Vector;

      ----Descending sort of vector a
      procedure VectSort(a: in out Vector);
end Module;