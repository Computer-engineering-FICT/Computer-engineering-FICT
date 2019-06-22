--���������� ������� ���������, ������ ��-91
--���. 1. ������������. ������
--F1: C=A-B
--F2: MC=SORT(TRANS(MA)*MB)
--F3: D=SORT(A)*(MA+MB)
WITH ADA.TEXT_IO; USE ADA.TEXT_IO;
PACKAGE Func IS

--������������ ������
N : INTEGER := 4;
I, J, K : INTEGER;
TYPE ������ IS private;
TYPE ������� IS ARRAY (1..N) OF ������; 
PROCEDURE Edit_N;
PROCEDURE File_Output(F: IN File_type);  
PROCEDURE Integer_File_Output(F: IN File_type; Int : IN INTEGER); 
PROCEDURE Vector_File_Output(F: IN File_type; V : IN ������);  
PROCEDURE Matrix_File_Output(F: IN File_type; M : IN �������);
PROCEDURE set_N (Value: IN INTEGER);    
PROCEDURE Create_Vector (V : OUT ������; Value: IN INTEGER);
PROCEDURE Create_Matrix (M : OUT �������; Value: IN INTEGER); 
PROCEDURE F1 (A, B : IN ������; C : OUT ������);
PROCEDURE F2 (MA, MB : IN �������; MC : OUT �������);
PROCEDURE F3 (MA, MB : IN �������; A : IN ������; D : OUT ������);
PRIVATE 
    TYPE ������ IS ARRAY (1..N) OF INTEGER;	
end Func;
