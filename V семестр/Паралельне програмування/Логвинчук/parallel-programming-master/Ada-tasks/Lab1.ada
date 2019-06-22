-----------------------------------------------
--              Assignment #1                --
--              Tasks in Ada                 --
--                                           --
--        Student:    Andrew Logvinchuk      --
--        Group:      IO-41                  --
--        Date:       12/09/2016             --
--                                           --
--        F1 = ((A + B)*(C*(MA*ME)))         --
--        F2 = SORT(TRANS(MF)*MK)            --
--        F3 = MAX((MO*MP)*R + MS*S)         --
-----------------------------------------------
with Data, Ada.Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;
use Ada.Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;

procedure Lab1 is
    
    CPU_1 :  CPU_Range := 0;
    CPU_2 :  CPU_Range := 1;
    
    package Int_Data is new Data(50);
    use Int_Data;
    
    task T1 is
      pragma Task_Name("Task 1");
      pragma Priority(4);
      pragma Storage_Size(1000000000);
      pragma CPU(CPU_1);
    end T1;
    
    task T2 is
      pragma Task_Name("Task 2");
      pragma Priority(5);
      pragma Storage_Size(1000000000);
      pragma CPU(CPU_2);
    end T2;
    
    task T3 is
      pragma Task_Name ("Task 3");
      pragma Priority (6);
      pragma Storage_Size(1000000000);
      pragma CPU (CPU_1);
    end T3;
    
    
    task body T1 is
        A, B, C : Vector;
        MA, ME : Matrix;
        d : Integer;
    begin
        Put_Line("Task T1 started!");
        Input_Random_Vector(A);
        Input_Random_Vector(B);
        Input_Random_Vector(C);
        Input_Random_Matrix(MA);
        Input_Random_Matrix(ME);
        delay 1.0;
        d := F1(A, B, C, MA, ME);
        Put("F1 =");
        Put(d);
        New_Line;
        Put_Line("Task T1 finished!");
    end T1;
    
    task body T2 is
        MF, MK, ML : Matrix;
    begin
        Put_Line("Task T2 started!");
        Input_Random_Matrix(MF);
        Input_Random_Matrix(MK);
        delay 3.0;
        ML := F2(MF, MK);
        Put_Line("F2 = ");
        Output_Matrix(ML);
        Put_Line("Task T2 finished!");
    end T2;
    
    task body T3 is
        R, S : Vector;
        MO, MP, MS : Matrix;
        t: Integer;
    begin
        Put_Line("Task T3 started!");
        Input_Random_Vector(R);
        Input_Random_Vector(S);
        Input_Random_Matrix(MO);
        Input_Random_Matrix(MP);
        Input_Random_Matrix(MS);
        delay 2.0;
        t := F3(MO, MP, MS, R, S);
        Put("F3 = ");
        Put(t);
        New_Line;
        Put_Line("Task T3 finished!");
    end T3;
     
begin
    Put_Line("Executing parallel computations...");
end Lab1;