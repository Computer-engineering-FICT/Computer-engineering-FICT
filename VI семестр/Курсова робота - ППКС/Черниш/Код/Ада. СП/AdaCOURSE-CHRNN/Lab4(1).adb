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
with Ada.Calendar; use Ada.Calendar;
with ada.float_text_io; use ada.float_text_io;

procedure Lab4 is
   MT: Matr;
   A: vec;
   C: Vec;
   Time_all: duration;
   time1,time2:  time;
   T: Integer;
	
-----------------------------------------------------------
---------------ОПИСАТЕЛЬНАЯ ЧАСТЬ ЗАЩИЩЕННЫХ МОДУЛЕЙ-------
-----------------------------------------------------------

----ЗАЩИЩЕННЫЙ МОДУЛЬ MON
	protected MON is
		--Синхронизация
		procedure DataSignal;
		procedure AhT2;
		procedure A2hT4;
		procedure AhT3;
		--Общие ресурсы
		procedure SetMO(M: in Matr);
		procedure SetAlfa(M: in Integer);
		procedure SetD(M: in Vec);
		function GetMO return Matr;
		function GetAlfa return Integer;
		function GetD return Vec;
		--Защищённые входы (синхронизация)
		entry Inputed;
		entry SortedT2;
		entry SortedT3;
		entry SortedT4;
	--приватная часть защищенного модуля
   	private
		--Синхронизация
		F1: integer := 0;
		F2: integer := 0;
		SortT2: integer := 0;
		SortT3: integer := 0;
		SortT4: integer := 0;
		--Общие ресурсы
		MO: Matr;
		D: Vec;
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

		procedure AhT2 is
			begin
				SortT2 := 1;
		end AhT2;
		procedure A2hT4 is
			begin
				SortT4 := 1;
		end A2hT4;
		procedure AhT3 is
			begin
				SortT3 := 1;
		end AhT3;
-- REALIZE Общие ресурсы
		procedure SetMO(M: in Matr) is
		begin	
			for i in 1 .. N loop
	            for j in 1 .. N loop
	               MO(i)(j) := M(i)(j);
	            end loop;
	         end loop;	
		end SetMO;
		procedure SetAlfa(M: in Integer) is
		begin	
			alfa := M;	
		end SetAlfa;
		procedure SetD(M: in Vec) is
		begin	
			for i in 1 .. N loop
				D(i) := M(i);		
			end loop;
		end SetD;
		function GetMO return Matr is
		begin
			return MO;
		end;
		function GetAlfa return Integer is
		begin
			return alfa;
		end;
		function GetD return Vec is
		begin
			return D;
		end;
--Защищённые входы (синхронизация)
		entry Inputed when F1 = 3 is --1
		begin
				null;
		end Inputed;

		entry SortedT2 when SortT2 = 1 is --2
		begin
				null;
		end SortedT2;
		entry SortedT3 when SortT3 = 1 is --2
		begin
				null;
		end SortedT3;
		entry SortedT4 when SortT4 = 1 is --2
		begin
				null;
		end SortedT4;
	end MON;

	procedure START is
		-----------------------------------------------------------
		------------------------З А Д А Ч И------------------------
		-----------------------------------------------------------
			task T1;
			task T2;
			task T3;
			task T4;
		
		-----------------------ЗАДАЧА Т1 --------------------------
			task body T1 is
				Sum1, Temp: Integer;
				MO1: Matr; alfa1: Integer; D1: Vec;
				MTF: Matr;
				Uk1, Uk2: Integer;
				Tv: Vec;
			begin
				Put_Line("T1 start");

--1.	Ввод C, ?
		Alfa1 := 1;
		MON.SetAlfa(Alfa1);
		Vec_Input(C);
--2.	Сигнал задачам Т2, Т3, Т4 о завершении ввода C, ?
		MON.DataSignal;
--3.	Ждать введения в T2, T3	
		MON.Inputed;
--4.	Копирование MO1 := MO, ?1 := ?, D1 := D
		MO1 := MON.GetMO;
		D1 := MON.GetD;
--5.	Cчёт AH = sort(СH * ?1 - D1 * (MO1 * MTH)
				for i in 1.. N loop
		            for j in 1 .. H loop
					   sum1 := 0;
		               for z in 1 .. N loop
		                  sum1 := sum1 + MT(Z)(J) * MO1(I)(Z);
		               end loop;
					   MTF(I)(J) := Sum1;
					end loop;
		         end loop;
				 Sum1 := 0;
				 for i in 1.. H loop
		            for j in 1 .. N loop
					  	sum1 := sum1 + D1(J) * MTF(j)(I);
					end loop;
					A(I) := C(I) * Alfa1 + Sum1;
					Sum1 := 0;
				 end loop;
				 for Count1 in 1 .. H loop
          			for Count2 in 1 .. H loop
             			if (A(Count1) > A(Count2)) then
		                	begin		
			                   Temp      := A(Count1);
			                   A(Count1) := A(Count2);
			                   A(Count2) := Temp;
			                end;
			            end if;
			        end loop;
			     end loop;
--6.	Ждать завершение счёта AH в задаче Т2	 			    	  		W1.2
		MON.SortedT2;
--7.	Слияние A2H = sort(AH, AH)
            uk1 := 1;
            uk2 := H+1;
            
			 for Count1 in 1 .. 2 * H loop
			 	if ((uk2 >= 2 * H) or ((A(uk1) <= A(uk2)) and (uk1 < H))) then
					begin
						Tv(Count1) := A(Uk1);
						Uk1 := Uk1 + 1;
					end;
				else
					begin
						Tv(Count1) := A(Uk2);
						Uk2 := Uk2 + 1;
					end;	
				end if;
		 	 end loop;
           for Count1 in 1 .. 2 * H loop
                A(Count1) := Tv(Count1);
		   end loop;
--8.	Ждать завершение счёта A2Н в задаче Т4	 			    	  		W4.3
		MON.SortedT4;	
--9.	Слияние A = sort(A2Н, A2Н)
			uk1 := 1;
            uk2 := 2 * H + 1;
            
			 for Count1 in 1 .. N loop
			 	if ((uk2 >= N) or ((A(uk1) <= A(uk2)) and (uk1 < 2 * H))) then
					begin
						Tv(Count1) := A(Uk1);
						Uk1 := Uk1 + 1;
					end;
				else
					begin
						Tv(Count1) := A(Uk2);
						Uk2 := Uk2 + 1;
					end;	
				end if;
		 	 end loop;

           for Count1 in 1 .. N loop
                A(Count1) := Tv(Count1);
		   end loop;
--10.	Вывод А.
		if N < 24 then
			Vec_Print(A);
		end if;

		time2:=clock;
	    time_all:=time2-time1;
		Put(Integer(time_all));		
		
				Put_Line("T1 stop");
		    end T1;
		
		-----------------------ЗАДАЧА Т2 --------------------------
			task body T2 is
				Sum1, Temp, Uk1, Uk2: Integer;
				MO2: Matr; alfa2: Integer; D2: Vec;
				MTF: Matr;
				Tv: Vec;
			begin
				Put_Line("T2 start");

--1.	Ввод MT, D
		Matr_Input(MT);
		Vec_Input(D2);
		MON.SetD(D2);
--2.	Сигнал задачам Т1, Т3, Т4 о завершении ввода МT, D
		MON.DataSignal;
--3.	Ждать введения в T1, T3	
		MON.Inputed;
--4.	Копирование MO2 := MO, ?2 := ?, D2 := D
		MO2 := MON.GetMO;
		Alfa2 := MON.GetAlfa;
--5.	Cчёт AH = sort(СH * ?2 - D2 * (MO2 * MTH)	
				for i in 1.. N loop
		            for j in H + 1 .. 2*H loop
					   sum1 := 0;
		               for z in 1 .. N loop
		                  sum1 := sum1 + MT(Z)(J) * MO2(I)(Z);
		               end loop;
					   MTF(I)(J) := Sum1;
					end loop;
		         end loop;
				 Sum1 := 0;
				 for i in H + 1 .. 2*H loop
		            for j in 1 .. N loop
					   sum1 := sum1 + D2(J) * MTF(j)(I);
					end loop;
					A(I) := C(I) * Alfa2 + Sum1;
					Sum1 := 0;
				 end loop;
				 for Count1 in H + 1 .. 2*H loop
          			for Count2 in H + 1 .. 2*H loop
             			if (A(Count1) > A(Count2)) then
		                	begin		
			                   Temp      := A(Count1);
			                   A(Count1) := A(Count2);
			                   A(Count2) := Temp;
			                end;
			            end if;
			        end loop;
			     end loop;					
--6.	Сигнал задаче Т1 о завершении счёта A2H		
		MON.AhT2;

				Put_Line("T2 stop");
		    end T2;
		
		-----------------------ЗАДАЧА Т3 ----------------------------
			task body T3 is
				Sum1, Temp: Integer;
				MO3: Matr; alfa3, Uk1, Uk2, Count1: Integer; D3: Vec;
				MTF: Matr; Tv:Vec;
			begin
				Put_Line("T3 start");
	
--1.	Ввод МО
		Matr_Input(MO3);
		MON.SetMO(MO3);
--2.	Сигнал задачам Т1, Т2, Т4 о завершении ввода МО	
		MON.DataSignal;
--3.	Ждать введения в T2, T3	
		MON.Inputed;
--4.	Копирование MO4 := MO, ?4 := ?, D4 := D
		Alfa3 := MON.GetAlfa;
		D3 := MON.GetD;
--5.	Cчёт AH = sort(СH * ?2 - D2 * (MO2 * MTH)	
				 for i in 1.. N loop
		            for j in 2*H + 1 .. 3*H loop
					   sum1 := 0;
		               for z in 1 .. N loop
		                  sum1 := sum1 + MT(Z)(J) * MO3(I)(Z);
		               end loop;
					   MTF(I)(J) := Sum1;
					end loop;
		         end loop;
				 Sum1 := 0;
				 for i in 2*H + 1 .. 3*H loop
		            for j in 1 .. N loop
					   sum1 := sum1 + D3(J) * MTF(j)(I);
					end loop;
					A(I) := C(I) * Alfa3 + Sum1;
					Sum1 := 0;
				 end loop;
				 for Count1 in 2*H + 1 .. 3*H loop
          			for Count2 in 2*H + 1 .. 3*H loop
             			if (A(Count1) > A(Count2)) then
		                	begin		
			                   Temp      := A(Count1);
			                   A(Count1) := A(Count2);
			                   A(Count2) := Temp;
			                end;
			            end if;
			        end loop;
			     end loop;	
--6.	Сигнал задаче Т4 о завершении счёта AH 			    	  			S4.2
		MON.AhT3;

				Put_Line("T3 stop");
		    end T3;	
		
		-----------------------ЗАДАЧА Т4 --------------------------
			task body T4 is
				Sum1, Temp: Integer;
				MO4: Matr; alfa4: Integer; D4: Vec;
				MTF: Matr;
				Uk1, Uk2: Integer;
				Tv: Vec;
			begin
				Put_Line("T4 start");

--1.	Ждать введения в Т1, T2, T3
		MON.Inputed;
--2.	Копирование MO4 := MO, ?4 := ?, D4 := D
		Alfa4 := MON.GetAlfa;
		D4 := MON.GetD;
		MO4 := MON.GetMO;
--3.	Cчёт AH = sort(СH * ?4 - D4 * (MO4 * MTH)
				 for i in 1.. N loop
		            for j in 3*H + 1 .. n loop
					   sum1 := 0;
		               for z in 1 .. N loop
		                  sum1 := sum1 + MT(Z)(J) * MO4(I)(Z);
		               end loop;
					   MTF(I)(J) := Sum1;
					end loop;
		         end loop;
				 Sum1 := 0;
				 for i in 3*H + 1 .. n loop
		            for j in 1 .. N loop
					   sum1 := sum1 + D4(J) * MTF(j)(I);
					end loop;
					A(I) := C(I) * Alfa4 + Sum1;
					Sum1 := 0;
				 end loop;
				 for Count1 in 3*H + 1 .. n loop
          			for Count2 in 3*H + 1 .. n loop
             			if (A(Count1) > A(Count2)) then
		                	begin		
			                   Temp      := A(Count1);
			                   A(Count1) := A(Count2);
			                   A(Count2) := Temp;
			                end;
			            end if;
			        end loop;
			     end loop;
--4.	Ждать завершение счёта AH в задаче Т3	 			    	  		W3.2
				MON.SortedT3;
--5.	Слияние A2H = sort(AH, AH)
			uk1 := 2 * H + 1;
            uk2 := 3 * H + 1;
            
			 for Count1 in 2 * H + 1 .. n loop
			 	if ((uk2 >= N) or ((A(uk1) <= A(uk2)) and (uk1 < 3 * H))) then
					begin
						Tv(Count1) := A(Uk1);
						Uk1 := Uk1 + 1;
					end;
				else
					begin
						Tv(Count1) := A(Uk2);
						Uk2 := Uk2 + 1;
					end;	
				end if;
		 	 end loop;

           for Count1 in 2 * H + 1 .. N loop
                A(Count1) := Tv(Count1);
		   end loop;
--6.	Сигнал задаче Т1 о завершении счёта A2H		    	  			S1.1
			MON.A2hT4;
		
				Put_Line("T4 stop");
		    end T4;	

	begin	
		null;
	end START;


begin
	Put_Line("N == ");
	Put(N);
	Get(T);
	time1:=clock;
	START;
end Lab4;
