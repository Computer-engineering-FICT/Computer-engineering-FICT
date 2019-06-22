----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #2                     --
--                   IO-73 Rukavishnikov Gleb                 --
----------------------------------------------------------------
--Variant: 1.12, 2.20, 3.24                                   --
--F1:  A=B+C-D*e                                              --
--F2:  MD=MA+MB-MC*MM                                         --
--F3:  k=min(MA*MB*å)                                         --
------------------------BODY OF MAIN PACKAGE--------------------
----------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
package body Vector_F1 is
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
   procedure VectSort(a: in out Vector) is
  		flag: boolean := true;
   	help: integer;
	begin
   	while flag loop
   	   flag := false;
   	   for i in 2..N loop
   	      if a(i-1) < a(i) then
   	         help := a(i-1);
   	         a(i-1) := a(i);
   	         a(i) := help;
   	         flag := true;
   	      end if;
   	   end loop;
   	end loop;
	end VectSort;
--===================================================--
	function PlusVect (A, B: in Vector) return Vector is
					Rez: Vector;
         	begin
                for i in 1..N loop
   	                   	Rez(i):=A(i)+B(i);
					end loop;
					return Rez;
            end PlusVect;

	function MinusVect (A, B: in Vector) return Vector is
					Rez: Vector;
         	begin
                for i in 1..N loop
   	                   	Rez(i):=A(i)-B(i);
					end loop;
					return Rez;
            end MinusVect;

	 function multiVectNum (A: in Vector; e: in integer) return Vector is
	 		Rez: Vector;
		begin
			for i in 1..N loop
				Rez(i):=A(i)*e;
			end loop;
			return rez;
		end MultiVectNum;

		--===========================================================--

   --Main Functions (Func1, Func2, Func3)
	--A=B+C-D*e; 
   procedure Func1(a: out Vector; b, c, d: in Vector; e:in integer) is
   begin
      A := MinusVect (PlusVect(b,C) , multiVectNum(d,E));
      exception
         when Constraint_Error =>
            Put("Constraint error in Func1.");
   end Func1;

	function  MultiplyStep (A, B: in Vector) return integer is
		Rez: integer := 0;
		begin
			for i in 1..N loop
				Rez := Rez+A(i)*B(i);
			end loop;
		return Rez;
 	end MultiplyStep;

end Vector_F1;
