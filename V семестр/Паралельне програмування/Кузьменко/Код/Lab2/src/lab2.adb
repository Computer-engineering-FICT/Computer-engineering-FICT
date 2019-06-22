-----------------------------------------------------
--                                                 --
--    Parallel and distributed computing           --
--      Lab 2. Processes in language Ada. Tasks    --
--                                                 --
--                                                 --
--    F1: 1.24 E = A + C * (MA * MZ) + B           --
--    F2: 2.14 MC = SORT(MA + MB * MM)             --
--    F3: 3.18 p = MAX(SORT(MS) + MA* MM)          --
--                                                 --
--    Author Kuzmenko Vladimir Z.                  --
--    Group IO-21                                  --
--    Date 17.09.2014                              --
--                                                 --
-----------------------------------------------------


with Ada.Text_IO, Ada.Integer_Text_IO,System.Multiprocessors;
use Ada.Text_IO, Ada.Integer_Text_IO,System.Multiprocessors;
with data;

procedure Lab2 is

   CPU_1 :  CPU_Range:=0;
   CPU_2 :  CPU_Range:=1;


   package Data3 is new Data(3);
     use data3;

   ---------------------------
   --Tasks cpecifications   --
   ---------------------------

   --task for calculation F1
   task T1 is
      pragma Task_Name ("Task 1");
      pragma Priority(4);
      pragma Storage_Size(1000);
      pragma CPU (CPU_1);
   end T1;

   --task for calculation F2
   task T2 is
      pragma Task_Name ("Task 2");
      pragma Priority (5);
      pragma Storage_Size(2000);
      pragma CPU (CPU_2);
   end T2;

   --task for calculation F3
   task T3 is
      pragma Task_Name ("Task 3");
      pragma Priority (6);
      pragma Storage_Size(3000);
      pragma CPU (CPU_1);
   end T3;

   ---------------------------
   --Task bodies            --
   ---------------------------

   task body T1 is
      A,B,C,E:Vector;
      MA,MZ:Matrix;
   begin
      Put_Line("Task T1 started");
      --Input Data
      Put_Line ("Input vector A");
      Vector_Input (A);
      Vector_Output (A);
      New_Line;

      Put_Line ("Input vector B");
      Vector_Input (B);
      Vector_Output (B);
      New_Line;

      Put_Line ("Input vector C");
      Vector_Input (C);
      Vector_Output (C);
      New_Line;

      Put_Line ("Input matrix MA");
      Matrix_Input (MA);
      Matrix_Output (MA);
      New_Line;

      Put_Line ("Input matrix MB");
      Matrix_Input (MZ);
      Matrix_Output (MZ);
      New_Line;

      delay(5.7);

      --calculation

      Func1 (A, B, C, MA, MZ, E);

      --output data
      Put ("Function 1, vector E");
      Vector_Output (E);
      New_Line;

      Put_Line("Task T1 finished");
   end T1;

   task body T2 is
      MA,MB,MC,MM:Matrix;
   begin
      Put_Line("Task T2 started");
      --input data
      Put_Line ("Input matrix MA");
      Matrix_Input (MA);
      Matrix_Output (MA);
      New_Line;

      Put_Line ("Input matrix MB");
      Matrix_Input (MB);
      Matrix_Output (MB);
      New_Line;

      Put_Line ("Input matrix MM");
      Matrix_Input (MM);
      Matrix_Output (MM);
      New_Line;

      delay(6.7);
      --calculation
      Func2 (MA, MB, MM, MC);

      --data output
      Put ("Function 2, matrix MC");
      Matrix_Output (MC);
      New_Line;


      Put_Line("Task T2 finished");
   end T2;

   task body T3 is
      MS,MA,MM:Matrix;
      p:Integer;
   begin
      Put_Line("Task T3 started");

      --input data
      Put_Line ("Input matrix MA");
      Matrix_Input (MA);
      Matrix_Output (MA);
      New_Line;

      Put_Line ("Input matrix MM");
      Matrix_Input (MM);
      Matrix_Output (MM);
      New_Line;

      Put_Line ("Input matrix MS");
      Matrix_Input (MS);
      Matrix_Output (MS);
      New_Line;

       delay(7.7);
      --calculation
      Func3 (MA, MM, MS, p);

      --output data
      Put ("Function 3, value p");
      Put (p);
      New_Line;

      Put_Line("Task T3 finished");
   end T3;
begin
  null;
end Lab2;
