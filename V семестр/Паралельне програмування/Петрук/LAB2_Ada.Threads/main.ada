-- Laboratorna robota 1
-- Petruk Vadim, IO-92
-- Variant: 1.13  C = A - B + D
--			2.28  MD = MIN(MA)*MB*MC
--			3.14  D = (A + B)*(MA - MB)
---------------------------------------
with Ada.Integer_Text_IO, Ada.Text_iO, Unit;
use Ada.Integer_Text_IO, Ada.Text_IO, Unit;
--------------------------------------- 
procedure main is

task Task1 is 
	pragma Priority(15);
end Task1;
task body Task1 is
    A:Vector;
	B:Vector;
	C:Vector;
	D:Vector;
	begin     
		VectorIn(A);
		VectorIn(B);
		VectorIn(D);
		Func1(A,B,D,C);
		delay 0.3;
		put_Line("Func1: C:=A-B+D ");
		VectorOut(C);
	end Task1;		
--------------------------------------
task Task2 is 
	pragma Priority(3);
end Task2;
task body Task2 is
	MA:Matrix;
	MB:Matrix;
	MC:Matrix;
	MD:Matrix;
	begin 
		matrixIn(MA);
		MatrixIn(MB);
		MatrixIn(MC);
		func2(MA,MB,MC,MD);
		delay 0.1;
		put_Line("Func2: MD := MIN(MA)*MB*MC");
		MatrixOut(MD);
	end Task2;				
--------------------------------------
task Task3 is 
	pragma Priority(10);
end Task3;
task body Task3 is
	A:Vector;
	B:Vector;
	D:Vector;
    MA:Matrix;
	MB:Matrix;
	MD:Matrix;
	begin 
		VectorIn(A);
		VectorIn(B);
		MatrixIn(MA);
		MatrixIn(MB);
		func3(A,B,MA,MB,D);
		delay 0.2;
		put_Line("Func3: D := (A + B)*(MA - MB)");
		vectorOut(D);
	end Task3;				
--------------------------------------		
begin	
	null;
end Main;
