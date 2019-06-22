----------------------------
-- Lab2
-- Kushnirenko Alexander
-- IO 81
-- F1: d = MAX(A + B + C)
-- F2: x = MAX(MB)
-- F3: W = SORT(B * MD) * (MA - MB)
----------------------------

with
	Ada.Text_IO,
	Ada.Integer_Text_IO,
	p1,
	p1.p2,
	p1.p2.p3,
	p1.p2.p4;
use
	Ada.Text_IO,
	Ada.Integer_Text_IO,
	p1,
	p1.p2,
	p1.p2.p3,
	p1.p2.p4;

procedure l2 is

	A, B, C: Vector;
	MA, MB, MD: Matrix;
	
	package p1 is

		N: constant integer := 3;

		type Vector is private;
	
		function F1(A, B, C: Vector) return integer;

	private

		type Vector is Array(1..N) of integer;
	
	end p1;
	
	package body p1 is separate;
	
begin
	
	-- F1 --
		new_line;
		put_line("F1: MAX(A + B + C)");
		new_line;
	
		put_line("Input vector A: ");
		inputVectorTo(A);
		new_line;
	
		put_line("Input vector B: ");
		inputVectorTo(B);
		new_line;
	
		put_line("Input vector C: ");
		inputVectorTo(C);
		new_line;
	
		put("MAX(A + B + C) = ");
		put(F1(A, B, C), 3);
		new_line;
	--------
	
	-- F2 --
		new_line(2);
		put_line("F2: MAX(MB)");
		new_line;
		put_line("Input matrix MB: ");
		inputMatrixTo(MB);
		new_line;
	
		put("MAX(MB) = ");
		put(F2(MB), 3);
		new_line;
	--------
	
	-- F3 --
		new_line(2);
		put_line("F3: SORT(B * MD) * (MA - MB)");
		new_line;
		put_line("Input vector B: ");
		inputVectorTo(B);
		new_line;
		put_line("Input matrix MD: ");
		inputMatrixTo(MD);
		new_line;
		put_line("Input matrix MA: ");
		inputMatrixTo(MA);
		new_line;
		put_line("Input matrix MB: ");
		inputMatrixTo(MB);
		new_line;
	
		put("SORT(B * MD) * (MA - MB) = ");
		outputVector(F3(B, MD, MA, MB));
		new_line;
	--------
	
exception

	when others =>
		put_line("F3 has not been calculated");
		
end l2;
