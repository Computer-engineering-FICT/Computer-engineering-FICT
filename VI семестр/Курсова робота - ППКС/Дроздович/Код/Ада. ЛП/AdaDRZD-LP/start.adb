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
    
            --���� ����������� ��� �������� ������ ����� ��������.
            type vector is array(integer range <>) of integer;
            Subtype Vector_N is Vector(1..N);
            
            type Matrix is array(integer range <>) of Vector_N;
            Subtype Matrix_N is Matrix(1..N);
			Subtype Matrix_4H is Matrix(1..4*H);
			Subtype Matrix_3H is Matrix(1..3*H);
            Subtype Matrix_2H is Matrix(1..2*H);
            Subtype Matrix_H is Matrix(1..H);
            
			procedure START is
					--������������ �����
	            task T1 is
						entry MCH(MC1: in Matrix_H);
						entry MKHAlfa(MK1: in Matrix_H; Alfa1: in Integer);
						entry MZZ(MZ1: in Matrix_N);
						entry REZ(MA1: in Matrix_4H); --������� ������
	            end T1;
	    	
	            task T2 is
	                    entry MBB(MB1: in Matrix_N); --������� ������
						entry MKHAlfa(MK1: in Matrix_2H; Alfa1: in Integer);
						entry MZZ(MZ1: in Matrix_N);
						entry REZ(MA1: in Matrix_3H); --������� ������
	            end T2;
	    
	            task T3 is
						entry MKHAlfa(MK1: in Matrix_3H; Alfa1: in Integer);
						entry MCH(MC1: in Matrix_3H);
						entry MBB(MB1: in Matrix_N);
						entry REZ(MA1: in Matrix_2H); --������� ������
	            end T3;
	    
	            task T4 is
						entry MZZ(MZ1: in Matrix_N);
						entry MCH(MC1: in Matrix_2H);
						entry MBB(MB1: in Matrix_N);
						entry REZ(MA1: in Matrix_H); --������� ������
	            end T4;

				task T5 is
						entry MKHAlfa(MK1: in Matrix_H; Alfa1: in Integer);
						entry MZZ(MZ1: in Matrix_N);
						entry MCH(MC1: in Matrix_H);
						entry MBB(MB1: in Matrix_N);
	            end T5;
	    
	            --���������� �����
	            task body T1 is
	                    Sum1: Integer := 0;
						Alfa: Integer;
						MB, MZ, MA: Matrix_N;
						MC, MK: Matrix_H;

						MTx: Matrix_H;
	        	begin
	                    put_Line("T1 started!");
--1.	���� ��
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MB(i)(j) := 1;
			end loop;
		end loop;  
--2.	�������� �� ������ �2
		T2.MBB(MB);
--3.	������� M�� �� ������ �2
		accept MCH(MC1: in Matrix_H) do
	    	MC := MC1;
	    end MCH;
--4.	������� ?, M�� �� ������ �2
		accept MKHAlfa(MK1: in Matrix_H; Alfa1: in Integer) do
	    	MK := MK1;
			Alfa := Alfa1;
	    end MKHAlfa;
--5.	������� �Z �� ������ �2
		accept MZZ(MZ1: in Matrix_N) do
	    	MZ := MZ1;
	    end MZZ;
--6.	C��� �AH = MB * (M�H + ? * MZ * MKH)
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
--7.	������� MA4� �� ������ �3
		accept REZ(MA1: in Matrix_4H) do
	    	MA(H+1 .. N) := MA1;
	    end REZ;
--8.	����� ��
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
	          
--1.	���� ��
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MC(i)(j) := 1;
			end loop;
		end loop; 
--2.	������� �� �� ������ �1
		accept MBB(MB1: in Matrix_N) do
			MB := MB1;
		end MBB;
--3.	�������� M�� ������ �1
		T1.MCH(MC(H+1 .. 2*H));
--4.	������� ?, M�2� �� ������ �3
		accept MKHAlfa(MK1: in Matrix_2H; Alfa1: in Integer) do
	    	MK := MK1;
			Alfa := Alfa1;
	    end MKHAlfa;
--5.	�������� ?, M�� ������ �1
		T1.MKHAlfa(MK(H+1..2*H), Alfa);
--6.	�������� M�3� ������ �3
		T3.MCH(MC(2*H+1 .. N));
--7.	�������� �� ������ �3
		T3.MBB(MB);
--8.	������� �Z �� ������ �3
		accept MZZ(MZ1: in Matrix_N) do
	    	MZ := MZ1;
	    end MZZ;
--9.	�������� �Z ������ �1
		T1.MZZ(MZ);	
--10.	C��� �AH = MB * (M�H + ? * MZ * MKH)
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
--11.	������� MA3� �� ������ �3
		accept REZ(MA1: in Matrix_3H) do
	    	MA(H+1 .. 4*H) := MA1;
	    end REZ;
--12.	�������� MA4� ������ �1
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
      
--1.	���� MZ
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MZ(i)(j) := 1;
			end loop;
		end loop; 
--2.	������� ?, M�3� �� ������ �4
		accept MKHAlfa(MK1: in Matrix_3H; Alfa1: in Integer) do
	    	MK := MK1;
			Alfa := Alfa1;
	    end MKHAlfa;
--3.	�������� ?, M�2� ������ �2
		T2.MKHAlfa(MK(H+1 .. 3*H), Alfa);
--4.	�������� �Z ������ �4
		T4.MZZ(MZ);
--5.	������� M�3� �� ������ �2
		accept MCH(MC1: in Matrix_3H) do
	    	MC := MC1;
	    end MCH;
--6.	������� �� �� ������ �2
		accept MBB(MB1: in Matrix_N) do
			MB := MB1;
		end MBB;
--7.	�������� �Z ������ �2
		T2.MZZ(MZ);
--8.	�������� M�2� ������ �4
		T4.MCH(MC(H+1..3*H));
--9.	�������� �� ������ �4
		T4.MBB(MB);
--10.	C��� �AH = MB * (M�H + ? * MZ * MKH)
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
--11.	������� MA2� �� ������ �4
		accept REZ(MA1: in Matrix_2H) do
	    	MA(H+1 .. 3*H) := MA1;
	    end REZ;
--12.	�������� MA3� ������ �2
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
	   
--1.	���� ?, M�
		Alfa := 1;
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MK(i)(j) := 1;
			end loop;
		end loop; 
--2.	�������� ?, M�� ������ �5
		T5.MKHAlfa(MK(4*H+1..N), Alfa);
--3.	�������� ?, M�3� ������ �3
		T3.MKHAlfa(MK(H+1..4*H), Alfa);
--4.	������� �Z �� ������ �3
		accept MZZ(MZ1: in Matrix_N) do
	    	MZ := MZ1;
	    end MZZ;
--5.	������� M�2� �� ������ �3
		accept MCH(MC1: in Matrix_2H) do
	    	MC := MC1;
	    end MCH;
--6.	������� �� �� ������ �3
		accept MBB(MB1: in Matrix_N) do
	    	MB := MB1;
	    end MBB;

--7.	�������� �Z ������ �5
		T5.MZZ(MZ);

--8.	�������� M�� ������ �5
		T5.MCH(MC(H+1..2*H));

--9.	�������� �� ������ �5
		T5.MBB(MB);

--10.	C��� �AH = MB * (M�H + ? * MZ * MKH)
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
--11.	������� MA� �� ������ �5
		accept REZ(MA1: in Matrix_H) do
	    	MA(H+1 .. 2*H) := MA1;
	    end REZ;
--12.	�������� MA2� ������ �3
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
	   
--1.	������� MKH, ? �� ������ �4
		accept MKHAlfa(MK1: in Matrix_H; Alfa1: in Integer) do
	    	MK := MK1;
			Alfa := Alfa1;
	    end MKHAlfa;
--2.	������� �Z �� ������ �4
		accept MZZ(MZ1: in Matrix_N) do
	    	MZ := MZ1;
	    end MZZ;
--3.	������� M�� �� ������ �4
		accept MCH(MC1: in Matrix_H) do
	    	MC := MC1;
	    end MCH;
--4.	������� �� �� ������ �4
		accept MBB(MB1: in Matrix_N) do
	    	MB := MB1;
	    end MBB;
--5.	C��� �AH = MB * (M�H + ? * MZ * MKH)
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
--6.	�������� MA� ������ �4
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

