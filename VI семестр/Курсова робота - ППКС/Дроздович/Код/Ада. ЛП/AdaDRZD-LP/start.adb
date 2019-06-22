----------------------------------------------------------------

with Package1; use Package1;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;
with ada.float_text_io; use ada.float_text_io;

procedure CoursePRO is
            N: integer := 1000;   --size of structures
            P: integer := 5;   --count of processors
            H: integer := N/P; --size of piece
			time_all: duration;
			time1,time2:  time;
			A: Integer;
    
            --типы оптимальные для рассылки данных между задачами.
            type vector is array(integer range <>) of integer;
            Subtype Vector_N is Vector(1..N);
            
            type Matrix is array(integer range <>) of Vector_N;
            Subtype Matrix_N is Matrix(1..N);
			Subtype Matrix_4H is Matrix(1..4*H);
			Subtype Matrix_3H is Matrix(1..3*H);
            Subtype Matrix_2H is Matrix(1..2*H);
            Subtype Matrix_H is Matrix(1..H);
            
			procedure START is
					--Спецификация задач
	            task T1 is
						entry MCH(MC1: in Matrix_H);
						entry MKHAlfa(MK1: in Matrix_H; Alfa1: in Integer);
						entry MZZ(MZ1: in Matrix_N);
						entry REZ(MA1: in Matrix_4H); --кусочки данных
	            end T1;
	    	
	            task T2 is
	                    entry MBB(MB1: in Matrix_N); --кусочки данных
						entry MKHAlfa(MK1: in Matrix_2H; Alfa1: in Integer);
						entry MZZ(MZ1: in Matrix_N);
						entry REZ(MA1: in Matrix_3H); --кусочки данных
	            end T2;
	    
	            task T3 is
						entry MKHAlfa(MK1: in Matrix_3H; Alfa1: in Integer);
						entry MCH(MC1: in Matrix_3H);
						entry MBB(MB1: in Matrix_N);
						entry REZ(MA1: in Matrix_2H); --кусочки данных
	            end T3;
	    
	            task T4 is
						entry MZZ(MZ1: in Matrix_N);
						entry MCH(MC1: in Matrix_2H);
						entry MBB(MB1: in Matrix_N);
						entry REZ(MA1: in Matrix_H); --кусочки данных
	            end T4;

				task T5 is
						entry MKHAlfa(MK1: in Matrix_H; Alfa1: in Integer);
						entry MZZ(MZ1: in Matrix_N);
						entry MCH(MC1: in Matrix_H);
						entry MBB(MB1: in Matrix_N);
	            end T5;
	    
	            --Реализация задач
	            task body T1 is
	                    Sum1: Integer := 0;
						Alfa: Integer;
						MB, MZ, MA: Matrix_N;
						MC, MK: Matrix_H;

						MTx: Matrix_H;
	        	begin
	                    put_Line("T1 started!");
--1.	Ввод МВ
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MB(i)(j) := 1;
			end loop;
		end loop;  
--2.	Передать МВ задаче Т2
		T2.MBB(MB);
--3.	Принять MСН от задачи Т2
		accept MCH(MC1: in Matrix_H) do
	    	MC := MC1;
	    end MCH;
--4.	Принять ?, MКН от задачи Т2
		accept MKHAlfa(MK1: in Matrix_H; Alfa1: in Integer) do
	    	MK := MK1;
			Alfa := Alfa1;
	    end MKHAlfa;
--5.	Принять МZ от задачи Т2
		accept MZZ(MZ1: in Matrix_N) do
	    	MZ := MZ1;
	    end MZZ;
--6.	Cчёт МAH = MB * (MСH + ? * MZ * MKH)
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(J)(Z) * MZ(Z)(I);
		    end loop;
			MTx(J)(I) := MC(J)(I) + Alfa * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MTx(J)(Z) * MB(Z)(I);
		    end loop;
			MA(J)(I) := Sum1;
		  end loop;
		end loop;
--7.	Принять MA4Н от задачи Т3
		accept REZ(MA1: in Matrix_4H) do
	    	MA(H+1 .. N) := MA1;
	    end REZ;
--8.	Вывод МА
						if N < 30 then
							for i in 1 .. N loop
								for j in 1 .. N loop
	            					Put(MA(i)(j), 4);
								end loop;
								put_Line(" ");
							end loop;
						end if;

					    time2:=clock;
	      				time_all:=time2-time1;
						Put(Integer(time_all));

	           end T1;
	   
	           task body T2 is
	                    Sum1: Integer := 0;
						Alfa: Integer;
						MC, MB, MZ: Matrix_N;
						MK: Matrix_2H;
						MA: Matrix_4H;

						MTx: Matrix_H;
	           begin
	                  put_Line("T2 started!");
	          
--1.	Ввод МС
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MC(i)(j) := 1;
			end loop;
		end loop; 
--2.	Принять МВ от задачи Т1
		accept MBB(MB1: in Matrix_N) do
			MB := MB1;
		end MBB;
--3.	Передать MСН задаче Т1
		T1.MCH(MC(H+1 .. 2*H));
--4.	Принять ?, MК2Н от задачи Т3
		accept MKHAlfa(MK1: in Matrix_2H; Alfa1: in Integer) do
	    	MK := MK1;
			Alfa := Alfa1;
	    end MKHAlfa;
--5.	Передать ?, MКН задаче Т1
		T1.MKHAlfa(MK(H+1..2*H), Alfa);
--6.	Передать MС3Н задаче Т3
		T3.MCH(MC(2*H+1 .. N));
--7.	Передать МВ задаче Т3
		T3.MBB(MB);
--8.	Принять МZ от задачи Т3
		accept MZZ(MZ1: in Matrix_N) do
	    	MZ := MZ1;
	    end MZZ;
--9.	Передать МZ задаче Т1
		T1.MZZ(MZ);	
--10.	Cчёт МAH = MB * (MСH + ? * MZ * MKH)
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(J)(Z) * MZ(Z)(I);
		    end loop;
			MTx(J)(I) := MC(J)(I) + Alfa * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MTx(J)(Z) * MB(Z)(I);
		    end loop;
			MA(J)(I) := Sum1;
		  end loop;
		end loop;
--11.	Принять MA3Н от задачи Т3
		accept REZ(MA1: in Matrix_3H) do
	    	MA(H+1 .. 4*H) := MA1;
	    end REZ;
--12.	Передать MA4Н задаче Т1
		T1.REZ(MA);

	                  Put_Line("T2 ended");
	           end T2;
	   
	           task body T3 is
	                    Sum1: Integer := 0;
						Alfa: Integer;
						MB, MZ: Matrix_N;
						MC, MA, MK: Matrix_3H;

						MTx: Matrix_H;
	           begin
	                   put_Line("T3 started!");
      
--1.	Ввод MZ
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MZ(i)(j) := 1;
			end loop;
		end loop; 
--2.	Принять ?, MК3Н от задачи Т4
		accept MKHAlfa(MK1: in Matrix_3H; Alfa1: in Integer) do
	    	MK := MK1;
			Alfa := Alfa1;
	    end MKHAlfa;
--3.	Передать ?, MК2Н задаче Т2
		T2.MKHAlfa(MK(H+1 .. 3*H), Alfa);
--4.	Передать МZ задаче Т4
		T4.MZZ(MZ);
--5.	Принять MС3Н от задачи Т2
		accept MCH(MC1: in Matrix_3H) do
	    	MC := MC1;
	    end MCH;
--6.	Принять МВ от задачи Т2
		accept MBB(MB1: in Matrix_N) do
			MB := MB1;
		end MBB;
--7.	Передать МZ задаче Т2
		T2.MZZ(MZ);
--8.	Передать MС2Н задаче Т4
		T4.MCH(MC(H+1..3*H));
--9.	Передать МВ задаче Т4
		T4.MBB(MB);
--10.	Cчёт МAH = MB * (MСH + ? * MZ * MKH)
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(J)(Z) * MZ(Z)(I);
		    end loop;
			MTx(J)(I) := MC(J)(I) + Alfa * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MTx(J)(Z) * MB(Z)(I);
		    end loop;
			MA(J)(I) := Sum1;
		  end loop;
		end loop;
--11.	Принять MA2Н от задачи Т4
		accept REZ(MA1: in Matrix_2H) do
	    	MA(H+1 .. 3*H) := MA1;
	    end REZ;
--12.	Передать MA3Н задаче Т2
		T2.REZ(MA);

	                   Put_Line("T3 ended");
	           end T3;
	   
	           task body T4 is
	                    Sum1: Integer := 0;
						Alfa: Integer;
						MB, MZ, MK: Matrix_N;
						MC, MA: Matrix_2H;

						MTx: Matrix_H;
	           begin
	                   put_Line("T4 started!");
	   
--1.	Ввод ?, MК
		Alfa := 1;
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MK(i)(j) := 1;
			end loop;
		end loop; 
--2.	Передать ?, MКН задаче Т5
		T5.MKHAlfa(MK(4*H+1..N), Alfa);
--3.	Передать ?, MК3Н задаче Т3
		T3.MKHAlfa(MK(H+1..4*H), Alfa);
--4.	Принять МZ от задачи Т3
		accept MZZ(MZ1: in Matrix_N) do
	    	MZ := MZ1;
	    end MZZ;
--5.	Принять MС2Н от задачи Т3
		accept MCH(MC1: in Matrix_2H) do
	    	MC := MC1;
	    end MCH;
--6.	Принять МВ от задачи Т3
		accept MBB(MB1: in Matrix_N) do
	    	MB := MB1;
	    end MBB;

--7.	Передать МZ задаче Т5
		T5.MZZ(MZ);

--8.	Передать MСН задаче Т5
		T5.MCH(MC(H+1..2*H));

--9.	Передать МВ задаче Т5
		T5.MBB(MB);

--10.	Cчёт МAH = MB * (MСH + ? * MZ * MKH)
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(J)(Z) * MZ(Z)(I);
		    end loop;
			MTx(J)(I) := MC(J)(I) + Alfa * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MTx(J)(Z) * MB(Z)(I);
		    end loop;
			MA(J)(I) := Sum1;
		  end loop;
		end loop;
--11.	Принять MAН от задачи Т5
		accept REZ(MA1: in Matrix_H) do
	    	MA(H+1 .. 2*H) := MA1;
	    end REZ;
--12.	Передать MA2Н задаче Т3
		T3.REZ(MA);
	   
	                   Put_Line("T4 ended");
	           end T4;

	           task body T5 is
	                    Sum1: Integer := 0;
						Alfa: Integer;
						MB, MZ: Matrix_N;
						MC, MA, MK: Matrix_H;

						MTx: Matrix_H;
	           begin
	                   put_Line("T5 started!");
	   
--1.	Принять MKH, ? от задачи Т4
		accept MKHAlfa(MK1: in Matrix_H; Alfa1: in Integer) do
	    	MK := MK1;
			Alfa := Alfa1;
	    end MKHAlfa;
--2.	Принять МZ от задачи Т4
		accept MZZ(MZ1: in Matrix_N) do
	    	MZ := MZ1;
	    end MZZ;
--3.	Принять MСН от задачи Т4
		accept MCH(MC1: in Matrix_H) do
	    	MC := MC1;
	    end MCH;
--4.	Принять МВ от задачи Т4
		accept MBB(MB1: in Matrix_N) do
	    	MB := MB1;
	    end MBB;
--5.	Cчёт МAH = MB * (MСH + ? * MZ * MKH)
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(J)(Z) * MZ(Z)(I);
		    end loop;
			MTx(J)(I) := MC(J)(I) + Alfa * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MTx(J)(Z) * MB(Z)(I);
		    end loop;
			MA(J)(I) := Sum1;
		  end loop;
		end loop;
--6.	Передать MAН задаче Т4
		T4.REZ(MA);
	   
	                   Put_Line("T5 ended");
	           end T5;

		   begin
		   	null;
		end START;

begin
	Put_Line("N == ");
	Put(N);
	Get(A);
	time1:=clock;
	START;
end CoursePRO;

