--Водопьянов Дмитрий Вадимович, группа ИО-91
--Лаб. 1. Подпрограммы. Пакеты
--F1: C=A-B
--F2: MC=SORT(TRANS(MA)*MB)
--F3: D=SORT(A)*(MA+MB)
WITH ADA.TEXT_IO; USE ADA.TEXT_IO;
PACKAGE Func IS

--Спецификация пакета
N : INTEGER := 4;
I, J, K : INTEGER;
TYPE Вектор IS private;
TYPE Матрица IS ARRAY (1..N) OF Вектор; 
PROCEDURE Edit_N;
PROCEDURE File_Output(F: IN File_type);  
PROCEDURE Integer_File_Output(F: IN File_type; Int : IN INTEGER); 
PROCEDURE Vector_File_Output(F: IN File_type; V : IN Вектор);  
PROCEDURE Matrix_File_Output(F: IN File_type; M : IN Матрица);
PROCEDURE set_N (Value: IN INTEGER);    
PROCEDURE Create_Vector (V : OUT Вектор; Value: IN INTEGER);
PROCEDURE Create_Matrix (M : OUT Матрица; Value: IN INTEGER); 
PROCEDURE F1 (A, B : IN Вектор; C : OUT Вектор);
PROCEDURE F2 (MA, MB : IN Матрица; MC : OUT Матрица);
PROCEDURE F3 (MA, MB : IN Матрица; A : IN Вектор; D : OUT Вектор);
PRIVATE 
    TYPE Вектор IS ARRAY (1..N) OF INTEGER;	
end Func;
