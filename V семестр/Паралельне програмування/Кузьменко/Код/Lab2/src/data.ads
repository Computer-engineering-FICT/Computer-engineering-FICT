
------------------------
-- File data.ads
-- group IO-21
-- Kuzmenko Vladimir Z.
--------------------------

generic
   n : Integer;
package data is

   type Vector is private;
   type Matrix is private;

   -- input vector
   procedure Vector_Input (A:out Vector);
   -- output vector
   procedure Vector_Output (A:in Vector);
   -- input matrix
   procedure Matrix_Input (MA:out Matrix);
   -- output matrix
   procedure Matrix_Output (MA:in Matrix);

   --F1: 1.24 E = A + C * (MA * MZ) + B
   procedure Func1(A,B,C:in Vector;MA,MZ: in Matrix; E:out Vector);

   --F2: 2.14 MC = SORT(MA + MB * MM)
   procedure Func2(MA,MB,MM:in Matrix; MC:out Matrix);

   --F3: 3.18 p = MAX(SORT(MS) + MA* MM)
   procedure Func3(MA,MM,MS: in Matrix; p: out Integer);

private
   type Vector is array (1..n) of Integer;
   type Matrix is array (1..n) of Vector;

end data;
