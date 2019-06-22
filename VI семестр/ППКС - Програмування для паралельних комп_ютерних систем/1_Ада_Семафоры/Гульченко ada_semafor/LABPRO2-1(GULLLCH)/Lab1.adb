----------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #1. Ada. Semaphores            --
--                  Func: a = MIN(MB-alfa*MO*MT)              --
--                   IO-83                     --
----------------------------------------------------------------

with Package1; use Package1;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure Lab1 is


   MB, MO, MT: Matr;
   a:          integer := 500000; --min - shared variable
   Alfa:	   Integer;

   --semaphores
   S1, S2, SKD1, SKD2: Suspension_Object; 

   procedure Task_start is
      task T1;
      task body T1 is
         alfa1: integer;
		 Sum: Integer := 0;
		 A1: Integer := 530000;
         MO1: Matr;
	begin	
         Put_Line("T1 start");
--ENTERING MB, MO, MT, alfa (1)
         Matr_Input(MB);
		 Matr_Input(MO);
		 Matr_Input(MT);
		 alfa := 1;
--Signal to T2 about end of input (2)
         Set_True(S1);			 --S2-1

-- KY -- Copying of OP (3)
		 Suspend_Until_True(SKD1);
         alfa1 := alfa;
         MO1 := MO;
         Set_True(SKD1);
-- Calculation a1 = min(MBH - Alfa1 * MO1  * MRH (4)
		 for i in 1.. N loop
            for j in 1 .. H loop
			   sum := 0;
               for z in 1 .. N loop
                  sum := sum + MO1(i)(z) * MT(Z)(J);
               end loop;
			   Sum := MB(I)(J) - Alfa1 * Sum;
			   if (A1 > Sum) then
			   	  A1 := Sum;
		   	   end if;
			   Sum := 0;
			end loop;
         end loop;
		 Sum := 0;
-- KY -- Calculation a = min(a, a1) (5)
         Suspend_until_true(SKD2);
         if (a > a1) then
            a := a1;
         end if;
         Set_True(SKD2);
--Waiting to end of calculation	(6)							   
		 Suspend_Until_True(S2); --W2.1 
--Out a. (7)
		 Constant_Out(a);
         Put_Line("T1 stop");
      end T1;

      task T2;
      task body T2 is
         alfa2: integer;
		 A2: Integer := 540000;
		 Sum: Integer := 0;
         MO2: Matr;
      begin
         Put_Line("T2 start");

-- Waiting to the end of the input Data in T1 (1)      
		 Suspend_until_true(S1); --W1-1

-- KY -- Copying of OP (2)
		 Suspend_until_true(SKD1);
         alfa2 := alfa;
         MO2 := MO;
         Set_True(SKD1);

-- Calculation a2 = min(MBH - Alfa2 * MO2  * MRH (3)
		 for i in 1.. N loop
            for j in H+1 .. n loop
			   sum := 0;
               for z in 1 .. N loop
                  sum := sum + MO2(i)(z) * MT(Z)(J);
               end loop;
			   Sum := MB(I)(J) - Alfa2 * Sum;
			   if (A2 > Sum) then
			   	  A2 := Sum;
		   	   end if;
			   Sum := 0;
			end loop;
         end loop;
		 Sum := 0;

-- KY -- Calculation a = min(a, a2) (4)
         Suspend_until_true(SKD2);
         if (a > a2) then
            a := a2;
         end if;
         Set_True(SKD2);
        
--Waiting to end of calculation	(6)	
		 Set_True(S2);

         Put_Line("T2 stop");
      end T2;

   begin
      null;
   end Task_start;

begin
   Set_True(SKD1);
   Set_True(SKD2);
   Task_start;
end Lab1;