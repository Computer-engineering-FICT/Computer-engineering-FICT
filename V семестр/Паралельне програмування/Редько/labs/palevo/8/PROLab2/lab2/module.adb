----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #1                     --
--                   IO-73 Pustovit Michael                   --
----------------------------------------------------------------
--Variant: 1.27, 2.14, 3.18                                   --
--Func1: e = (A*B) + (C*D);                                      --
--Func2: MC = SORT(MA + MB*MO);                                  --
--Func3: p = MAX(SORT(MS) + MA*MB).                              --
------------------------BODY OF MAIN PACKAGE--------------------
----------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
package body Module is
   --Functions description
   ---Vector operations
   ----Multiplication of vectors a*b
   function VectMult(a, b: Vector) return integer is
      sum: integer;
   begin
      sum := 0;
      for i in 1..N loop
         sum := sum + a(i) * b(i);
      end loop;
      return sum;
   end VectMult;

   ----Processing sum of vectors a+b
   function VectSum(a, b: Vector) return Vector is
      c: Vector;
   begin
      for i in 1..N loop
         c(i) := a(i) + b(i);
      end loop;
      return c;
   end VectSum;

   ----Descending sort of vector a
   procedure VectSort(a: in out Vector) is separate;


   --Main Functions (Func1, Func2, Func3)
   ---e = (a*b) + (c*d);
   procedure Func1(a, b, c, d: in Vector; e:out integer) is
   begin
      e := VectMult(a, b) + VectMult(c, d);
      exception
         when Constraint_Error =>
            Put("Constraint error in Func1.");
   end Func1;

end Module;