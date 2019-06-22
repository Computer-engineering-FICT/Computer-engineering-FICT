----------------------------
-- Lab3
-- Kushnirenko Alexander
-- IO 81
-- 1.15, 2.4, 3.21
-- F1: MAX(A + B + C)
-- F2: MAX(MB)
-- F3: SORT(B * MD) * (MA - MB)
----------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, p;
use Ada.Text_IO, Ada.Integer_Text_IO, p;

procedure laba3 is

	A1, B1, C1: Vector;
	MB2: Matrix;
	
	B3: Vector;
	
	MA3, MB3, MD3: Matrix;

	procedure Start_Tasks is
		task Task_F1 is
			pragma Priority(5);
		end Task_F1;
		
		task body Task_F1 is
		begin
			put("F1: MAX(A + B + C) = ");
			put(F1(A1, B1, C1), 3);
			new_line;
		end Task_F1;
	
		task Task_F2 is
			pragma Priority(3);
		end Task_F2;
		task body Task_F2 is
		begin
			delay 0.000001;
			put("F2: MAX(MB) = ");
			put(F2(MB2), 3);
			new_line;
		end Task_F2;
	
		task Task_F3 is
			pragma Priority(4);
		end Task_F3;
		task body Task_F3 is
		begin
			put("F3: SORT(B * MD) * (MA - MB) = ");
			outputVector(F3(B3, MD3, MA3, MB3));
		end Task_F3;
	begin
		null;
	end Start_Tasks;
	
begin
	-- Инициализация данных для F1
	new_line;
	put_line("init F1: ");
	
	A1(1) := 1; A1(2) := 2; A1(3) := 3;
	put("A = ");
	outputVector(A1);

	B1(1) := 3; B1(2) := 1; B1(3) := 2;
	put("B = ");
	outputVector(B1);

	C1(1) := 3; C1(2) := 2; C1(3) := 1;
	put("C = ");
	outputVector(C1);
	
	-- Инициализация данных для F2
	new_line;
	put_line("init F2: ");
	
	MB2(1)(1) := 3; MB2(1)(2) := 4; MB2(1)(3) := 5;
	MB2(2)(1) := 4; MB2(2)(2) := 3; MB2(2)(3) := 2;
	MB2(3)(1) := 1; MB2(3)(2) := 2; MB2(3)(3) := 3;
	put_line("MB = ");
	outputMatrix(MB2);
	
	-- Инициализация данных для F3
	new_line;
	put_line("init F3: ");
	
	B3(1) := 1; B3(2) := 2; B3(3) := 3;
	put("B = ");
	outputVector(B3);
	
	MD3(1)(1) := 1; MD3(1)(2) := 2; MD3(1)(3) := 3;
	MD3(2)(1) := 4; MD3(2)(2) := 5; MD3(2)(3) := 4;
	MD3(3)(1) := 3; MD3(3)(2) := 2; MD3(3)(3) := 1;
	put_line("MD = ");
	outputMatrix(MD3);
	
	MA3(1)(1) := 5; MA3(1)(2) := 4; MA3(1)(3) := 3;
	MA3(2)(1) := 2; MA3(2)(2) := 1; MA3(2)(3) := 2;
	MA3(3)(1) := 3; MA3(3)(2) := 4; MA3(3)(3) := 5;
	put_line("MA = ");
	outputMatrix(MA3);
	
	MB3(1)(1) := 1; MB3(1)(2) := 2; MB3(1)(3) := 3;
	MB3(2)(1) := 2; MB3(2)(2) := 1; MB3(2)(3) := 2;
	MB3(3)(1) := 3; MB3(3)(2) := 2; MB3(3)(3) := 1;
	put_line("MB = ");
	outputMatrix(MB3);
	
	-- Запуск задач
	Start_Tasks;
end laba3;
