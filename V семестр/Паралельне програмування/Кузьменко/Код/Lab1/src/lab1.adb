-----------------------------------------------------
--                                                 --
--    Parallel and distributed computing           --
--      Lab 1. Routines and packages               --
--                                                 --
--                                                 --
--    F1: 1.24 E = A + C * (MA * MZ) + B           --
--    F2: 2.14 MC = SORT(MA + MB * MM)             --
--    F3: 3.18 p = MAX(SORT(MS) + MA* MM)          --
--                                                 --
--    Author Kuzmenko Vladimir Z.                  --
--    Group IO-21                                  --
--    Date 10.09.2014                              --
--                                                 --
-----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
with data;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab1 is
   package data3 is new data (1000);
   use data3;

   p                      : Integer;
   A, B, C, E             : Vector;
   MA, MB, MC, MM, MS, MZ : Matrix;
begin
   --------------
   --Input Data--
   --------------

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
   Matrix_Input (MB);
   Matrix_Output (MB);
   New_Line;

   Put_Line ("Input matrix MM");
   Matrix_Input (MM);
   Matrix_Output (MM);
   New_Line;

   Put_Line ("Input matrix MS");
   Matrix_Input (MS);
   Matrix_Output (MS);
   New_Line;

   Put_Line ("Input matrix MZ");
   Matrix_Input (MZ);
   Matrix_Output (MZ);
   New_Line;

   ---------------
   --Calculation--
   ---------------
   Func1 (A, B, C, MA, MZ, E);
   Func2 (MA, MB, MM, MC);
   Func3 (MA, MM, MS, p);

   ---------------
   --Output data--
   ---------------
   Put ("Function 1, vector E");
   Vector_Output (E);
   New_Line;

   Put ("Function 2, matrix MC");
   Matrix_Output (MC);
   New_Line;

   Put ("Function 3, value p");
   Put (p);
   New_Line;

   ----------------------
   --Use "private" type--
   ----------------------

   --OK--
   --appropriation--
   B := A;
   Put_Line ("It's ok");
   --compare--
   if A = B then
      Put_Line ("It's ok");
   end if;

   --error--
   --B(1):=A(1)+2;

end Lab1;
