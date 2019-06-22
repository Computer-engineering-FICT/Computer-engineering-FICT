----------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #4. Ada. Semaphores            --
--                  Func: MA = MB + ALfa * (MC * MZ)          --
--                   IO-83 Gulchenko Vova                     --
--                        27.04.2011                          --
----------------------------------------------------------------

with Package1; use Package1;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lab4 is
   MZ, MA, MB: Matr;

-----------------------------------------------------------
---------------ОПИСАТЕЛЬНАЯ ЧАСТЬ ЗАЩИЩЕННЫХ МОДУЛЕЙ-------
-----------------------------------------------------------

----ЗАЩИЩЕННЫЙ МОДУЛЬ Synchro
	protected Monitor is
		--Синхронизация
		procedure Input;
		procedure EndСount;
		--Общие ресурсы
		procedure SetMC(M: in Matr);
		function GetMC return Matr;
		procedure SetAlfa(M: in Integer);
		function GetAlfa return Integer;
		--Защищённые входы (синхронизация)
		entry InputSynchro;
		entry OutputSynchro;
	--приватная часть защищенного модуля
   	private
		--Синхронизация
		F1: integer := 0;
		F2: integer := 0;
		--Общие ресурсы
		MC: Matr;
		alfa: Integer;
	end Monitor;

-----------------------------------------------------------
------------------ТЕЛА ЗАЩИЩЕННЫХ МОДУЛЕЙ------------------
-----------------------------------------------------------

--ЗАЩИЩЕННЫЙ МОДУЛЬ Synchro
	protected body Monitor is
-- REALIZE Синхронизация
		procedure Input is 
			begin
				F1 := F1 + 1;
    	end Input;

		procedure EndСount is
			begin
				F2 := F2 + 1;
    	end EndСount;
-- REALIZE Общие ресурсы MO
		procedure SetMC(M: in Matr) is
		begin	
			for i in 1 .. N loop
	            for j in 1 .. N loop
	               MC(i)(j) := M(i)(j);
	            end loop;
	         end loop;	
		end SetMC;
		function GetMC return Matr is
		begin
			return MC;
		end;
-- REALIZE Общие ресурсы B		
		procedure SetAlfa(M: in Integer) is
		begin	
			Alfa := M;	
		end SetAlfa;
		function GetAlfa return Integer is
		begin
			return Alfa;
		end;
--Защищённые входы (синхронизация)
		entry InputSynchro when F1 = 3 is --1
		begin
				null;
		end InputSynchro;

		entry OutputSynchro when F2 = P - 1 is --2
		begin
				null;
		end OutputSynchro;
	end Monitor;

-----------------------------------------------------------
------------------------З А Д А Ч И------------------------
-----------------------------------------------------------
	task T1;
	task T2;
	task T3;
	task T4;

-----------------------ЗАДАЧА Т1 --------------------------
	task body T1 is
		Sum1: Integer;
		MC1: Matr; alfa1: Integer;

	begin
		Put_Line("T1 start");
--1.	Ввод MZ
		Matr_Input(MZ);
--2.	Cигнал задачам Т2, Т3, Т4 о завершении ввода
		Monitor.Input;
--3.	Ожидание ввода в задачах Т3, Т4
		Monitor.InputSynchro;
--4.	Копирование Alfa1:=Alfa, MС1:=MС
		Alfa1 := Monitor.GetAlfa;
		MC1 := Monitor.GetMC;
--5.	Счёт MAH = MBH + Alfa1 * (MC1 * MZH)
		 for i in 1.. N loop
            for j in 1 .. H loop
			   sum1 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MZ(Z)(J) * MC1(I)(Z);
               end loop;
			   MA(I)(J) := Sum1 * Alfa1 + MB(I)(J);
			end loop;
         end loop;
--6.	Сигнал задаче Т4 о конце счёта	
		Monitor.EndСount;

		Put_Line("T1 stop");
    end T1;

-----------------------ЗАДАЧА Т2 --------------------------
	task body T2 is
		Sum1: Integer;
		MC2: Matr; alfa2: Integer;
	begin
		Put_Line("T2 start");

--1.	Ожидание ввода в задачах Т1, Т3, Т4
		Monitor.InputSynchro;
--2.	Копирование Alfa2:=Alfa, MС2:=MС 
  		Alfa2 := Monitor.GetAlfa;
		MC2 := Monitor.GetMC;
--3.	Счёт MAH = MBH + Alfa2 * (MC2 * MZH)
		 for i in 1.. N loop
            for j in H+1 .. 2*H loop
			   sum1 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MZ(Z)(J) * MC2(I)(Z);
               end loop;
			   MA(I)(J) := Sum1 * Alfa2 + MB(I)(J);
			end loop;
         end loop;
--4.	Сигнал задаче Т4 о конце счёта	
		Monitor.EndСount;

		Put_Line("T2 stop");
    end T2;

-----------------------ЗАДАЧА Т3 ----------------------------
	task body T3 is
		Sum1: Integer;
		MC3: Matr; alfa3: Integer;
	begin
		Put_Line("T3 start");

--1.	Ввод MС
		Matr_Input(MC3);
		Monitor.SetMC(MC3);
--2.	Cигнал задачам Т1, Т2, Т4 о завершении ввода
		Monitor.Input;
--3.	Ожидание ввода в задачах Т1, Т4
		Monitor.InputSynchro;
--4.	Копирование ?3:=?, MС3:=MС
		Alfa3 := Monitor.GetAlfa;
--5.	Счёт MAH = MBH + ?3 * (MC3 * MZH)
		for i in 1.. N loop
            for j in 2*H+1 .. 3*H loop
			   sum1 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MZ(Z)(J) * MC3(I)(Z);
               end loop;
			   MA(I)(J) := Sum1 * Alfa3 + MB(I)(J);
			end loop;
         end loop;
--6.	Сигнал задаче Т4 о конце счёта                      
		Monitor.EndСount;		

		Put_Line("T3 stop");
    end T3;	

-----------------------ЗАДАЧА Т4 --------------------------
	task body T4 is
		Sum1: Integer;
		MC4: Matr; alfa4: Integer;
	begin
		Put_Line("T4 start");

--1.	Ввод MB, Alfa
		Matr_Input(MB);
		Alfa4 := 1;
		Monitor.setAlfa(Alfa4);
--2.	Cигнал задачам Т1, Т2, Т3 о завершении ввода
		Monitor.Input;
--3.	Ожидание ввода в задачах Т1, Т3
		Monitor.InputSynchro;
--4.	Копирование ?4:=?, MС4:=MС
		MC4 := Monitor.GetMC;
--5.	Счёт MAH = MBH + ?4 * (MC4 * MZH)
		for i in 1.. N loop
            for j in 3*H+1 .. N loop
			   sum1 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MZ(Z)(J) * MC4(I)(Z);
               end loop;
			   MA(I)(J) := Sum1 * Alfa4 + MB(I)(J);
			end loop;
         end loop;
--6.	Ожидание окончания счёта в Т1, Т2, Т3
		Monitor.OutputSynchro;
--7.	Вывод МА
		Put_Line("             ");
		Matr_Print(MA);     
          
		Put_Line("T4 stop");
    end T4;	

begin
   null;
end Lab4;
