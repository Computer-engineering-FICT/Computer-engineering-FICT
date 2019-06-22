------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--         Laboratory work #1. Subprograms and packages         --
--                                                              --
--  File: lab1.ada                                              --
--  Task: F1: E = A + B + C + D * (MA * MZ)                     -- 
--        F2: MD = (MA * MB) * TRANS(MC)                        --
--        F3: E = (MA * MM) * B + MB * SORT(A)                  --
--                                                              --
--  Author: Redko Alexander, group IO-01                        --
--  Date: 09.09.2012                                            --
--                                                              --
------------------------------------------------------------------

with Ada.Text_IO, Data;
use Ada.Text_IO;

procedure Lab1 is
   package Data3 is new data(3);
   use Data3;
   A, B, C, D, E, E1 : Vector;
   MA, MB, MC, MD, MM, MR, MZ : Matrix;

   begin
   
   ----------------
   -- Input data --
   ----------------   
   
   --Initialize_default (a, b, c, d, mA, MZ, MB, MC, MM);
   Put ("Input vector A: ");
   Input_Vector (A);
   Output_Vector (A);
   New_Line;

   Put ("Input vector B: ");
   Input_Vector (B);
   
   Output_Vector (B);
   New_Line;
   
   Put ("Input vector C: ");
   Input_Vector (C);
   Output_Vector (C);
   New_Line;

   Put ("Input vector D: ");
   Input_Vector (D);
   Output_Vector (D);
   New_Line;

   Put ("Input matrix MA: ");
   Input_Matrix (MA);
   Output_Matrix (MA);
   New_Line;

   Put ("Input matrix MB: ");
   Input_Matrix (MB);
   Output_Matrix (MB);
   New_Line;

   Put ("Input matrix MC: ");
   Input_Matrix (MC);
   Output_Matrix (MC);
   New_Line;

   Put ("Input matrix MM: ");
   Input_Matrix (MM);
   Output_Matrix (MM);
   New_Line;

   Put ("Input matrix MZ: ");
   Input_Matrix (MZ);
   Output_Matrix (MZ);
   New_Line;

   -----------------
   -- Calculation --
   -----------------

   F1 (A, B, C, D, MA, MZ, E1);
   F2 (MA, MB, MC, MD);
   E := E1;
   F3 (A, B, MA, MB, MM, E);

   -----------------
   -- Output data --
   -----------------

   Put ("Function F1, vector E: ");
   Output_Vector (E1);
   New_Line;

   Put ("Function F2, matrix MD: ");
   Output_Matrix (MD);
   New_Line;

   Put ("Function F3, vector E: ");
   Output_Vector (E);
   New_Line;

end Lab1;
