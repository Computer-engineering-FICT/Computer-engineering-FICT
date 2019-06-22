-----------------------------
-- Лаб1 1.11: c=MAX(A)*(A*B)
--		2.19: v=MAX(MA+MB*MC)
--		3.23: e=MAX(MA*(B-C))
-----------------------------
--		група ІО-73
--		Сидора Сергій
-----------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Lab1Realization;
use Ada.Text_IO, Ada.Integer_Text_IO;
      
  
procedure Lab1 is
	N: integer :=3;
	package Lab1Run is new Lab1Realization (N);
	use Lab1Run;
  
	A: Vector;-- := (7,1,3);
	B: Vector;-- := (4,2,2);
	C: Vector;-- := (1,3,1);         
  
	d: integer;
	v: integer; 
	e: integer;
	            
	MA: Matrix;-- := ((1,1,1),(1,1,1),(1,1,1));
 	MB: Matrix;-- := ((1,1,2),(0,1,0),(1,0,2));
  	MC: Matrix;-- := ((2,1,1),(1,2,1),(1,1,2));   	
    	begin
     		InputVector (A);
            InputVector (B);
            InputVector (C);
            
            InputMatrix (MA);
            InputMatrix (MB);
            InputMatrix (MC);
            
            F1 (A, B, d);
            F2 (MA, MB, MC, v);
            F3 (MA, B, C, e);       

			put("c= ");
			put(d);
			put("v= ");
			put(v);
			put("e= ");
			put(e);
end Lab1;
