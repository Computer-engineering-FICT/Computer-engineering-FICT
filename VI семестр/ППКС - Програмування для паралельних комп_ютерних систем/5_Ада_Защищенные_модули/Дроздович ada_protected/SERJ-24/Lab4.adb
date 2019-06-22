----------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #4. Ada. Semaphores            --
--                  Func: MA = MB +  a * (MC * MO)          --
--                   IO-83 Maks Ryabko                     --
--                        27.04.2011                          --
----------------------------------------------------------------

with Package1; use Package1;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lab4 is
   MX, MA, MC: Matr;

-----------------------------------------------------------
---------------ОПИСАТЕЛЬНАЯ ЧАСТЬ ЗАЩИЩЕННЫХ МОДУЛЕЙ-------
-----------------------------------------------------------

----ЗАЩИЩЕННЫЙ МОДУЛЬ Synchro
	protected MON is
		--Синхронизация
		procedure DataSignal;
		procedure CalculationSignal;
		--Общие ресурсы
		procedure SetMO(M: in Matr);
		procedure SetMB(M: in Matr);
		procedure SetAlfa(M: in Integer);
		function GetMO return Matr;
		function GetMB return Matr;
		function GetAlfa return Integer;
		--Защищённые входы (синхронизация)
		entry Inputed;
		entry Finish;
	--приватная часть защищенного модуля
   	private
		--Синхронизация
		F1: integer := 0;
		F2: integer := 0;
		--Общие ресурсы
		MO, MB: Matr;
		alfa: Integer;
	end MON;

-----------------------------------------------------------
------------------ТЕЛА ЗАЩИЩЕННЫХ МОДУЛЕЙ------------------
-----------------------------------------------------------

--ЗАЩИЩЕННЫЙ МОДУЛЬ Synchro
	protected body MON is
-- REALIZE Синхронизация
		procedure DataSignal is 
			begin
				F1 := F1 + 1;
    	end DataSignal;

		procedure CalculationSignal is
			begin
				F2 := F2 + 1;
    	end CalculationSignal;
-- REALIZE Общие ресурсы
		procedure SetMO(M: in Matr) is
		begin	
			for i in 1 .. N loop
	            for j in 1 .. N loop
	               MO(i)(j) := M(i)(j);
	            end loop;
	         end loop;	
		end SetMO;
		procedure SetMB(M: in Matr) is
		begin	
			for i in 1 .. N loop
	            for j in 1 .. N loop
	               MB(i)(j) := M(i)(j);
	            end loop;
	         end loop;	
		end SetMB;
		procedure SetAlfa(M: in Integer) is
		begin	
			alfa := M;	
		end SetAlfa;
		function GetMO return Matr is
		begin
			return MO;
		end;
		function GetMB return Matr is
		begin
			return MO;
		end;
		function GetAlfa return Integer is
		begin
			return alfa;
		end;
--Защищённые входы (синхронизация)
		entry Inputed when F1 = 3 is --1
		begin
				null;
		end Inputed;

		entry Finish when F2 = P - 1 is --2
		begin
				null;
		end Finish;
	end MON;

-----------------------------------------------------------
------------------------З А Д А Ч И------------------------
-----------------------------------------------------------
	task T1;
	task T2;
	task T3;
	task T4;

-----------------------ЗАДАЧА Т1 --------------------------
	task body T1 is
		Sum1, Sum2: Integer;
		MO1, MB1: Matr; alfa1: Integer;

	begin
		Put_Line("T1 start");
--1.	Ввод МB, MX
		Matr_Input(MB1);
		MON.SetMB(MB1);
		Matr_Input(MX);
--2.	Сигнал задачам Т2, Т3, Т4 о завершении ввода МB, MX
		MON.DataSignal;
--3.	Ждать введения в T3, T4
		MON.Inputed;
--4.	Копирование MO1 := MO, ?1 := ?, MB1 := MB
		Alfa1 := MON.GetAlfa;
		MO1 := MON.GetMO;
--5.	Cчёт MAH = MB1 * MCH + ?1 * MO1 * MXH
		for i in 1.. N loop
            for j in 1 .. H loop
			   sum1 := 0;
			   Sum2 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MO1(Z)(J) * MX(I)(Z);
				  Sum2 := Sum2 + MB1(Z)(J) * MC(I)(Z);
               end loop;
			   MA(I)(J) := Sum2 + Alfa1 * Sum1;
			end loop;
         end loop;
--6.	Сигнал задаче Т3 о завершении счёта MА 	
		MON.CalculationSignal;

		Put_Line("T1 stop");
    end T1;

-----------------------ЗАДАЧА Т2 --------------------------
	task body T2 is
		Sum1, Sum2: Integer;
		MO2, MB2: Matr; alfa2: Integer;
	begin
		Put_Line("T2 start");
--1.	Ждать введения в Т1, Т3, T4		
		MON.Inputed;
--2.	Копирование MO2 := MO, ?2 := ?, MB2 := MB
		Alfa2 := MON.GetAlfa;
		MO2 := MON.GetMO;
		MB2 := MON.GetMB;
--3.	Cчёт MAH = MB2 * MCH + ?2 * MO2 * MXH
		for i in 1.. N loop
            for j in H+1 .. 2*H loop
			   sum1 := 0;
			   Sum2 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MO2(Z)(J) * MX(I)(Z);
				  Sum2 := Sum2 + MB2(Z)(J) * MC(I)(Z);
               end loop;
			   MA(I)(J) := Sum2 + Alfa2 * Sum1;
			end loop;
         end loop;
--4.	Сигнал задаче Т3 о завершении счёта MА 
		MON.CalculationSignal;

		Put_Line("T2 stop");
    end T2;

-----------------------ЗАДАЧА Т3 ----------------------------
	task body T3 is
		Sum1, Sum2: Integer;
		MO3, MB3: Matr; alfa3: Integer;
	begin
		Put_Line("T3 start");
--1.	Ввод МC
		Matr_Input(MC);
--2.	Сигнал задачам Т1, Т2, Т4 о завершении ввода МC
		MON.DataSignal;
--3.	Ждать введения в Т1, T4
		MON.Inputed;
--4.	Копирование MO3 := MO, ?3 := ?, MB3 := MB
		Alfa3 := MON.GetAlfa;
		MO3 := MON.GetMO;
		MB3 := MON.GetMB;
--5.	Cчёт MAH = MB3 * MCH + ?3 * MO3 * MXH
		for i in 1.. N loop
            for j in 2*H+1 .. 3*H loop
			   sum1 := 0;
			   Sum2 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MO3(Z)(J) * MX(I)(Z);
				  Sum2 := Sum2 + MB3(Z)(J) * MC(I)(Z);
               end loop;
			   MA(I)(J) := Sum2 + Alfa3 * Sum1;
			end loop;
         end loop;
--6.	Ждать завершение счёта MA в задачах Т1, Т2, Т4
		MON.Finish;
--7.	Вывод MА.
		Put_Line("             ");
		Matr_Print(MA);    

		Put_Line("T3 stop");
    end T3;	

-----------------------ЗАДАЧА Т4 --------------------------
	task body T4 is
		Sum1, Sum2: Integer;
		MO4, MB4: Matr; alfa4: Integer;
	begin
		Put_Line("T4 start");

--1.	Ввод МO, ?
		Alfa4 := 1;
		MON.SetAlfa(Alfa4);
		Matr_Input(MO4);
		MON.SetMO(MO4);
--2.	Сигнал задачам Т1, Т2, Т3 о завершении ввода МO, ?
		MON.DataSignal;
--3.	Ждать введения в T1, T3
		MON.Inputed;
--4.	Копирование MO4 := MO, ?4 := ?, MB4 := MB
		MB4 := MON.GetMB;
--5.	Cчёт MAH = MB4 * MCH + ?4 * MO4 * MXH
		for i in 1.. N loop
            for j in 3*H+1 .. N loop
			   sum1 := 0;
			   Sum2 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MO4(Z)(J) * MX(I)(Z);
				  Sum2 := Sum2 + MB4(Z)(J) * MC(I)(Z);
               end loop;
			   MA(I)(J) := Sum2 + Alfa4 * Sum1;
			end loop;
         end loop;
--6.	Сигнал задаче Т3 о завершении счёта MА 				    
		MON.CalculationSignal;

		Put_Line("T4 stop");
    end T4;	

begin
   null;
end Lab4;
