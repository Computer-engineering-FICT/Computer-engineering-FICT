----------------------------------------------
-- data.ads                                 --
-- F1 : d = MAX(B + C) + MIN(A + B*(MA*MK)) --
-- F2 : q = MAX(MA * MB - MC)               --
-- F3 : D = SORT(A)*(MA * MB)               --
-- Chekanskiy Evgeniy Anatoliyovich, IO-01  --
-- 08.09.2012                               --
----------------------------------------------
generic
   N:Integer;
package Data is
   type Vector is private;
   type Matrix is private;
   procedure Vector_Input ( Result : out Vector ) ;
   procedure Vector_Output ( Source : in Vector ) ;
   procedure Matrix_Input ( Result : out Matrix ) ;
   procedure Matrix_Output ( Source : in Matrix ) ;
   function Func1(A,B,C: in Vector; MA,MK: in Matrix) return Integer;
   function Func2(MA,MB,MC: in Matrix) return Integer;
   function Func3(A: in Vector;MA,MB : Matrix) return Vector;

private
   type Vector is array (1..N) of Integer;
   type Matrix is array (1..N) of Vector;
end Data;
