----------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #1. Ada. Semaphores            --
--                  Func: a = B*Alfa - C(MX * MY)             --
--                   IO-83                   --
--                        9.02.2011                           --
----------------------------------------------------------------

with Package1; use Package1;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure Lab1 is


   MX, MY: Matr;
   A, B, C: Vec;
   Alfa: Integer;

   --semaphores
   S1, S2, S3, var1: Suspension_Object; 

   procedure Task_start is
      task T1;
      task body T1 is
		 Sum: Integer := 0;
		 Alfa1: Integer := 0;
         MX1, MBUF: Matr;
		 C1: Vec;
  begin
        Put_Line("T1 start");
         --1.	Ввод C, B, MX
         Matr_Input(MX);
		 Vec_Input(C);
		 Vec_Input(B);
		 --2.	Сигнал задаче Т2 о завершении ввода
         Set_True(S1);			 --S2-1
		 --3.   Ждать введения Alfa и MY в Т2
		 Suspend_until_true(S2); --W2-1

		 --4.	Копирование Alfa1 := Alfa, МX1 := MX, C1 := C
		 --КРИТИЧЕСКАЯ СЕКЦИЯ
		 Suspend_Until_True(Var1);
         alfa1 := alfa;
         MX1 := MX;
		 C1 := C;
         Set_True(Var1);
			
		 --5.	Счёт AH = BH * Alfa1 - C1 * (MX1 * MYH)
		 for i in 1.. N loop
            for j in 1 .. H loop
			   sum := 0;
               for z in 1 .. N loop
                  sum := sum + MX1(i)(z) * MY(Z)(J);
               end loop;
			   MBUF(I)(J) := Sum; --(MX1 * MYH)
			   Sum := 0;
			end loop;
         end loop;
		 --C1 * (MX1 * MYH)
		 for J in 1.. H loop
		 	sum := 0;
            for I in 1 .. N loop
               sum := sum + C1(i) * MBUF(I)(J);
			end loop;
			A(J) := B(J) * Alfa1 - Sum;
         end loop;
		 --6.	Сигнал задаче Т2 о завершении счёта
         Set_True(S3);  --S2-2

         Put_Line("T1 stop");
      end T1;

      task T2;
      task body T2 is
		 Sum: Integer := 0;
		 Alfa2: Integer := 0;
         MX2, MBUF: Matr;
		 C2: Vec;
  begin
         Put_Line("T2 start");
         --1.	Ввод MY, Alfa
         Matr_Input(MY);
		 alfa := 1;
		 --3.	Сигнал задаче Т1 о завершении ввода
		 Set_True(S2);			 --S1-1
		 --2.	Ждать введения C, B, MX в Т1
		 Suspend_until_true(S1); --W1-1

		 --4.	Копирование Alfa1 := Alfa, МX1 := MX, C1 := C
		 --КРИТИЧЕСКАЯ СЕКЦИЯ
		 Suspend_Until_True(Var1);
         alfa2 := alfa;
         MX2 := MX;
		 C2 := C;
         Set_True(Var1);
			
		 --5.	Счёт AH = BH * Alfa2 - C2 * (MX2 * MYH)
		 for i in 1.. N loop
            for j in H+1 .. N loop
			   sum := 0;
               for z in 1 .. N loop
                  sum := sum + MX2(i)(z) * MY(Z)(J);
               end loop;
			   MBUF(I)(J) := Sum; --(MX2 * MYH)
			   Sum := 0;
			end loop;
         end loop;
		 --C2 * (MX2 * MYH)
		 for J in H+1 .. N loop
		 	sum := 0;
            for I in 1 .. N loop
               sum := sum + C2(i) * MBUF(I)(J);
			end loop;
			A(J) := B(J) * Alfa2 - Sum;
         end loop;
		
		 --6.	Ждать завершения счёта в Т1
         Suspend_until_true(S3); --W1-2
		
		 --7.	Вывод A
		 New_Line;
		 Vec_print(A);
		 New_Line;
         Put_Line("T2 stop");
      end T2;

   begin
      null;
   end Task_start;

begin
   Set_True(Var1);
   Task_start;
end Lab1;