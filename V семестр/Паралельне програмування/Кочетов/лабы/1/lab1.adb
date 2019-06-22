with Data, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO; 

procedure Lab1 is

	N: constant Long_Integer := 1000;

	package ConcreteData is new Data(N);
	use ConcreteData;

	A, B, C, D, T, S: Vector;
	MA, ME, ML, MF, MG, MH, MK, MO, MP, MR: Matrix;

begin
	Put_Line("Enter vector A:");
	Fill_Vector(A);

	Put_Line("Enter vector B:");
	Fill_Vector(B);

	Put_Line("Enter vector D:");
	Fill_Vector(D);

	Put_Line("Enter maxtrix MA:");
	Fill_Matrix(MA);

	Put_Line("Enter maxtrix ME:");
	Fill_Matrix(ME);

	Put_Line("Enter maxtrix MF:");
	Fill_Matrix(MF);

	Put_Line("Enter maxtrix MG:");
	Fill_Matrix(MG);

	Put_Line("Enter maxtrix MH:");
	Fill_Matrix(MH);

	Put_Line("Enter maxtrix MK:");
	Fill_Matrix(MK);

	Put_Line("Enter maxtrix MO:");
	Fill_Matrix(MO);

	Put_Line("Enter maxtrix MP:");
	Fill_Matrix(MP);

	Put_Line("Enter vector MS:");
	Fill_Vector(S);

	Put_Line("Enter maxtrix MR:");
	Fill_Matrix(MR);

	Funcs(C, A, MA, ME, B, D, ML, MF, MG, MH, MK, T, MO, MP, S, MR);

	Put_Line("F1 =");
	Print_Vector(C);
	Put_Line("F2 =");
	Print_Matrix(ML);
	Put_Line("F3 =");
	Print_Vector(T);
end Lab1;