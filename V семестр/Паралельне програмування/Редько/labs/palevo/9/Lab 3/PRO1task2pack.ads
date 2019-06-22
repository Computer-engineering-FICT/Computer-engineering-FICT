with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package PRO1task2pack is
  N : Integer := 3; 

  type Vector is array(1..N) of Integer;
  type Matrix is array(1..N) of Vector;
 
  procedure Func1(A, B, D : in out Vector; C : out Vector);
  procedure Func2(MA, MB, MC : in Matrix; MD : out Matrix);
  procedure Func3(A, B, C : in Vector; MA, MB : in Matrix; E : out Vector);
  procedure Vector_Input(A : out Vector);
  procedure Vector_Output(A : in Vector);
  procedure Matrix_Input(MA : out Matrix);
  procedure Matrix_Output(MA : in Matrix);
 
end PRO1task2pack;
