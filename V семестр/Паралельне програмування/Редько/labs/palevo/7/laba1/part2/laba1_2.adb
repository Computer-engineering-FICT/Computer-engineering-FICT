----------------------------
-- Lab1.2
-- Kushnirenko Alexander
-- IO 81
-- 1.15, 2.4, 3.21
----------------------------

with
	Ada.Text_IO,
	Ada.Integer_Text_IO,
	packageforlaba1_2;
use
	Ada.Text_IO,
	Ada.Integer_Text_IO,
	packageforlaba1_2;

procedure laba1_2 is

	A, B, C: Vector;
	MA, MB, MD: Matrix;
	
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
		new_line;
		new_line;
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
		new_line;
		new_line;
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
	
end laba1_2;
