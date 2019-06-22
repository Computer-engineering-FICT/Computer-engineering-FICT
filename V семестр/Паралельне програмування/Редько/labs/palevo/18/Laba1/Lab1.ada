-----------------------------
-- Лаб1 1.11: c=MAX(A)*(A*B)
--		2.19: v=MAX(MA+MB*MC)
--		3.23: e=MAX(MA*(B-C))
-----------------------------
--		група ІО-73
--		Сидора Сергій
-----------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

-- Основний пакет --
generic
    N: integer := 3;
package Lab1Realization is    
    type Vector is array (1..N) of integer;
	type Matrix is array (1..N) of Vector;
	A, B, C, D, F : Vector;	
	procedure F1 (A, B: in Vector; d: out integer);
	procedure F2 (MA, MB, MC: in Matrix; v: out integer);
	procedure F3 (MA: in Matrix; B, C: in Vector; e: out integer);
	procedure ShowVect (V: in Vector);
	procedure ShowMatr (Mat: in Matrix);
	procedure InputVector (V: out vector);
    procedure InputMatrix (M: out matrix);
end Lab1Realization;

-- Реалізація об'явлених функцій --

package body Lab1Realization is

-- Реалізація першої функції --

	procedure F1 (A, B: in Vector; d: out integer) is
		Max: integer;
		begin			
			Max := A(1);
			d := 0;
			for i in 1..N loop							
              	if A(i) > Max then
					Max := A(i);
				end if;
				d := d + A(i)*B(i);
			end loop;
			d := d*Max;
		end F1;

-- Реалізація другої функції --

	procedure F2 (MA, MB, MC: in Matrix; v: out integer) is
		MD: Matrix;
		Sum: integer;
		begin
			for i in 1..N loop
				for j in 1..N loop  					
					for k in 1..N loop
      					Sum := Sum + MB(k)(i)*MC(j)(k);
					end loop;					
					MD(i)(j) := Sum + MA(i)(j);
					Sum := 0;					
				end loop;
			end loop;
			v := MD(1)(1);
			for i in 1..N loop
				for j in 1..N loop							
              		if MD(i)(j) > v then
						v := MD(i)(j);
					end if;
				end loop;				
			end loop;						
		end F2;

-- Реалізація третьої функції --

	procedure F3 (MA: in Matrix; B, C: in Vector; e: out integer) is
		A, D: Vector;
		Sum: integer;
		begin
			for i in 1..N loop
				A(i) := B(i) - C(i);
			end loop;			
			for i in 1..N loop
				Sum := 0;
				for j in 1..N loop
					Sum := Sum + MA(j)(i)*A(j);
				end loop;
				D(i) := Sum;
			end loop;
			e := D(1);
			for i in 2..N loop
				if D(i)	> e then
					e := D(i);
				end if;
			end loop;
		end F3;

-- Процедура виводу вектору на екран монітору --

	procedure ShowVect (V: in Vector) is    
		begin
			Put("| ");
	  		for i in 1..N loop
				Put(V(i),3); 	
			end loop;
			Put("|");
		end ShowVect;

-- Процедура виводу матриці на екран монітору --

	procedure ShowMatr (Mat: in Matrix) is
        begin
			for i in 1..N loop
				ShowVect (Mat(i));
				New_Line; 	
			end loop;
		end ShowMatr;    

-- Процедура вводу вектору з клавіатури --

	procedure InputVector (V: out vector) is
		buf: integer;  
    	begin
        	put ("Enter vector - ");
            put (N,3);
            put (" numbers: ");
            	for i in 1..N loop
   	            	Get(buf); 
                    V(i) := buf;   
                    put ("   ");    
				end loop;
    	end InputVector;

-- Процедура вводу матриці з клавіатури --
	
	procedure InputMatrix (M: out matrix) is
		buf: integer;  
        begin
        	put ("Enter matrix ");
            put (N,3);
            put ("x");
            put (N,3);
            put (" : ");
            for i in 1..N loop
            	for j in 1..N loop
   	           		Get(buf); 
                   	M(i)(j) := buf;   
                   	put ("   ");    
                end loop; 
                New_Line;   
			end loop;
		end InputMatrix;

end Lab1Realization;
               
