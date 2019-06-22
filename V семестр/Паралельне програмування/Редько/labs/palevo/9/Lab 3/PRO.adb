--------------------------------------
-- Lab 3			                --
-- F1: C := A - B + D;			    --
-- F2: MD := MA + (MB * MC);        --  
-- F3: E := (A + B - C) * (MA -MB); --
-- Выполнил Посунько А.Д.           --
-- Группа ИВ-73                     --
-- 01.10.09                         --
--------------------------------------


with Ada.Text_IO,Ada.Integer_Text_IO,PRO1task2pack,File_IO; 
use Ada.Text_IO,Ada.Integer_Text_IO,PRO1task2pack,File_IO;

procedure PRO3 is
   task type Task1;
   task type Task2;
   task type Task3;

   task body Task1 is
      In_Data_File, Out_Data_File : File_Type;
	  A, B, C, D : Vector;
   begin
      Put("Calculating F1"); New_Line;
      Open(In_Data_File, In_File, "C:\Lab 3\in_f1.txt");
      A:=Vector_Input(In_Data_File);
      B:=Vector_Input(In_Data_File);
      D:=Vector_Input(In_Data_File);
      Create(Out_Data_File, Out_File, "C:\Lab 3\out_f1.txt");
      Func1(A, B, D, C);
      Vector_Output(Out_Data_File,c);	  
      close(In_Data_File);
      close(Out_Data_File);
      Put("Calc of F1 is over"); New_Line;
   end;

   task body Task2 is
      In_Data_File, Out_Data_File : File_Type;
      MA,MB,MC,MD: Matrix;
   begin
      Put("Calculating F2"); New_Line;      
      Open(In_Data_File, In_File, "C:\Lab 3\in_f2.txt");
      MA:=Matrix_Input(In_Data_File);
      MB:=Matrix_Input(In_Data_File);
	  MC:=Matrix_Input(In_Data_File);
      Create(Out_Data_File, Out_File, "C:\Lab 3\out_f2.txt");
      Func2(MA, MB, MC, MD);
      Matrix_Output(Out_Data_File,MD);
      close(In_Data_File);
      close(Out_Data_File);
      Put("Calc of F2 is over"); New_Line;
   end;

   task body Task3 is
      In_Data_File, Out_Data_File : File_Type;
      A,B,C,E: Vector;
      MA,MB: Matrix;
   begin
      Put("Calculating F3"); New_Line;
      Open(In_Data_File, In_File, "C:\Lab 3\in_f3.txt");
      A:=Vector_Input(In_Data_File);
	  B:=Vector_Input(In_Data_File);
      C:=Vector_Input(In_Data_File);
	  MA:=Matrix_Input(In_Data_File);
      MB:=Matrix_Input(In_Data_File);
      Create(Out_Data_File, Out_File, "C:\Lab 3\out_f3.txt");
	  Func3(A, B, C, MA, MB, E);
      Vector_Output(Out_Data_File,E);
      close(In_Data_File);
      close(Out_Data_File);
      Put("Calc of F3 is over"); New_Line;
   end;

   Func1_Task: Task1;
   Func2_Task: Task2;
   Func3_Task: Task3;

begin
   null;
end PRO3;

