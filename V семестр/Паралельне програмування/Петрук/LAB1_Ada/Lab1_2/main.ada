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
	
	A:Vector;
	b:Vector;
	c:Vector;
	D:Vector;
	MA:Matrix;
	MB:Matrix;
	MC:Matrix;
	MD:Matrix;

task Task1;
task body Task2 is
	begin 
		VectorIn(A);
		VectorIn(b);
		VectorIn(d);
		Func1(A,B,D,C);
		put_Line("Func1: C:=A-B+D ");
		VectorOut(c);
	end Task1;				
begin	
	
--------------------------
	matrixIn(MA);
	MatrixIn(MB);
	MatrixIn(MC);
	func2(MA,MB,MC,MD);
	put_Line("Func2: MD := MIN(MA)*MB*MC");
	MatrixOut(MD);
--------------------------
	VectorIn(A);
	VectorIn(b);
	MatrixIn(MA);
	MatrixIn(MB);
	func3(a,b,MA,MB,d);
	put_Line("Func3: D := (A + B)*(MA - MB)");
	vectorOut(d);
--------------------------
end Main;
