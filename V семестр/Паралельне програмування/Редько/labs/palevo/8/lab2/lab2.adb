with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Vector_F1,
     Vector_F1.Matrix_F2,
     Vector_F1.Matrix_F2.F3,
     Vector_F1.Matrix_F2.IO;
use Ada.Integer_Text_IO;

--------------------------------------------------------
-- Laboratornaya rabota ¹ 2                           --
-- vypolnil student 3 kursa Ashaev Yurii gruppa IV-73 --
-- Funkciya1: 1.26 e=((A+SORT(B))*(C+SORT(C))         --
-- Funkciya2: 2.13 MZ=MIN(MA)*MB+MAX(MB)*MA           --
-- Funkciya3: 3.17 d=MIN(A*TRANS(MB)-MB*SORT(C))      --
--------------------------------------------------------

-- Tochka vhoda v prilojenie
procedure Lab2 is

   package V_F1 is new Vector_F1(2);
   use V_F1;

   package F1_F2 is new V_F1.Matrix_F2;
   use F1_F2;

   package F1_F2_F3 is new F1_F2.F3;
   use F1_F2_F3;

   package F1_F2_IO is new F1_F2.IO;
   use F1_F2_IO;

   MA,MB,MZ: Matrix;
   A,B,C: Vector;

begin
   -- Vectors
   put("Vector A"); new_line;
   A:=Vector_Input;
   put("Vector B"); new_line;
   B:=Vector_Input;
   put("Vector C"); new_line;
   C:=Vector_Input;
   put("Function1: e=((A+SORT(B))*(C+SORT(C))"); new_line;
   put(Fun1(A,B,C),3); new_line;

   -- Matrixs
   put("Matrix MA"); new_line;
   MA:=Matrix_Input;
   put("Matrix MB"); new_line;
   MB:=Matrix_Input;
   put("Function2: MZ=MIN(MA)*MB+MAX(MB)*MA"); new_line;
   MZ:=Fun2(MA,MB);
   Matrix_Output(MZ);

   -- Func3
   put("Function3: d=MIN(A*TRANS(MB)-MB*SORT(C))"); new_line;
   put(Fun3(MB,A,C),2); new_line;
end Lab2;


