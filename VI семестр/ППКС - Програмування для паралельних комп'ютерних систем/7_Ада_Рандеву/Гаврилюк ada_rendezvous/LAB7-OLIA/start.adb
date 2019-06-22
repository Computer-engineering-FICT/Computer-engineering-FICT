----------------------------------------------------------------

with Package1; use Package1;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;
with ada.float_text_io; use ada.float_text_io;

procedure CoursePRO is
            N: integer := 6;   --size of structures
            P: integer := 6;   --count of processors
			H: Integer := N / P;
    
            --���� ����������� ��� �������� ������ ����� ��������.
            type vector is array(integer range <>) of integer;
            Subtype Vector_N is Vector(1..N);
			Subtype Vector_5H is Vector(1..5*H);
			Subtype Vector_4H is Vector(1..4*H);
			Subtype Vector_3H is Vector(1..3*H);
            Subtype Vector_2H is Vector(1..2*H);
            Subtype Vector_H is Vector(1..H);
            
            type Matrix is array(integer range <>) of Vector_N;
            Subtype Matrix_N is Matrix(1..N);
			Subtype Matrix_5H is Matrix(1..5*H);
			Subtype Matrix_4H is Matrix(1..4*H);
			Subtype Matrix_3H is Matrix(1..3*H);
            Subtype Matrix_2H is Matrix(1..2*H);
            Subtype Matrix_H is Matrix(1..H);

				--������������ �����
	            task T1 is
						entry allother(MOc: in Matrix_N; BH: in Vector_H; Cx: in Vector_N);
	            end T1;
	    	
	            task T2 is
						entry MZ5H(MZx: in Matrix_5H);
						entry B2HC(Bx: in Vector_2H; Cx: in Vector_N);
						entry REZ(AA: in Vector_H); --������� ������
	            end T2;
	    
	            task T3 is
						entry MOMZ4H(MOX: in Matrix_N; MZX: in Matrix_4H);
						entry B3HC(Bx: in Vector_3H; Cx: in Vector_N);

						entry REZ(AA: in Vector_2H); --������� ������
	            end T3;
	    
	            task T4 is
						entry B5HC(Bx: in Vector_5H; Cx: in Vector_N);
						entry MOMZ3H(MOx: in Matrix_N; MZx: in Matrix_3H);
						entry REZ5(AA: in Vector_H); --������� ������
						entry REZ3(AA: in Vector_3H);
	            end T4;

				task T5 is
						entry BHC(Bx: in Vector_H; Cx: in Vector_N);
						entry MOMZH(MOx: in Matrix_N; MZx: in Matrix_H);
	            end T5;

				task T6 is
						entry MOMZH(MOx: in Matrix_N; MZx: in Matrix_H);
						entry REZ(AA: in Vector_5H);
	            end T6;
	    
	            --���������� �����
	            task body T1 is
	                    Sum1: Integer := 0;
						MO, MZ: Matrix_N;
						C: Vector_N;
						B: Vector_H;
						
						A: Vector_H;
						MTx: Matrix_H;
	        	begin
	            put_Line("T1 started!");
--1.	���� MZ
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MZ(i)(j) := 1;
			end loop;
		end loop;  
--2.	�������� MZ5H ������ �2
		T2.MZ5H(MZ(1 .. 5*H));
--3.	������� MO, BH, C �� ������ �2
		accept allother(MOc: in Matrix_N; BH: in Vector_H; Cx: in Vector_N) do
			MO := MOc;
			B := BH;
			C := Cx;
		end allother;
--4.	���� AH = BH + � * (MO  * MZH)
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MZ(J)(Z) * MO(Z)(I);
		    end loop;
			MTx(J)(I) := Sum1;
		  end loop;
		end loop;
		for i in 1.. H loop
		  Sum1 := 0;
		  for j in 1 .. N loop
    		Sum1 := sum1 + C(J) * MTx(I)(J);
		  end loop;
		  A(I) := Sum1 + B(I);
		end loop;
--5.	�������� AH ������ �2
		T2.REZ(A);

		put_Line("T1 end!");
	 end T1;
	   
	           task body T2 is
	                    Sum1: Integer := 0;
						MO: Matrix_N;
						MZ: Matrix_5H;
						C: Vector_N;
						B: Vector_2H;

						A: Vector_2H;
						MTx: Matrix_H;
	           begin
	                  put_Line("T2 started!");
	          
--1.	���� MO
		for i in 1 .. N loop
			for j in 1 .. N loop
				 MO(i)(j) := 1;
			end loop;
		end loop;  
--2.	������� MZ5H �� ������ �1
		accept MZ5H(MZx: in Matrix_5H) do
			MZ := MZx;		
		end MZ5h;

--3.	�������� MO, MZ4H ������ �3
		T3.MOMZ4H(MO, MZ(H+1 .. 5*H));
--4.	������� B2H, C �� ������ �3

		accept B2HC(Bx: in Vector_2H; Cx: in Vector_N) do
			B := Bx;
			C := Cx;
		end B2HC;
--5.	�������� MO, BH, C ������ �1
		T1.allother(MO, B(1 .. H), C);
--6.	���� AH = BH + � * (MO  * MZH)
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MZ(J)(Z) * MO(Z)(I);
		    end loop;
			MTx(J)(I) := Sum1;
		  end loop;
		end loop;
		for i in 1.. H loop
		  Sum1 := 0;
		  for j in 1 .. N loop
    		Sum1 := sum1 + C(J) * MTx(I)(J);
		  end loop;
		  A(I + H) := Sum1 + B(I + H);
		end loop;
--7.	������� AH  �� ������ �1
		accept REZ(AA: in Vector_H) do
			A(1 .. H) := AA;
		end REZ;
--8.	�������� A2H ������ �3
		T3.REZ(A);


	                  Put_Line("T2 ended");
	           end T2;
	   
	           task body T3 is
	                    Sum1: Integer := 0;
						MO: Matrix_N;
						MZ: Matrix_4H;
						C: Vector_N;
						B: Vector_3H;

						A: Vector_3H;
						MTx: Matrix_H;
	           begin
	                   put_Line("T3 started!");

--1.	������� MO, MZ4H �� ������ �2
	accept MOMZ4H(MOX: in Matrix_N; MZX: in Matrix_4H) do
		MO := MOX;
		MZ := MZX;
	end MOMZ4H;

--2.	������� B3H, C �� ������ �4
	accept B3HC(Bx: in Vector_3H; Cx: in Vector_N) do
		B := Bx;
		C := Cx;
	end B3HC;
--3.	�������� MO, MZ3H ������ �4
	T4.MOMZ3H(MO, MZ(H+1 .. 4*h));
--4.	�������� B2H, C �� ������ �2
	T2.B2HC(B(1 .. 2*H), C);
--5.	���� AH = BH + � * (MO  * MZH)
	for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MZ(J)(Z) * MO(Z)(I);
		    end loop;
			MTx(J)(I) := Sum1;
		  end loop;
		end loop;
		for i in 1.. H loop
		  Sum1 := 0;
		  for j in 1 .. N loop
    		Sum1 := sum1 + C(J) * MTx(I)(J);
		  end loop;
		  A(I + 2*H) := Sum1 + B(I + 2*H);
		end loop;
--6.	������� A2H  �� ������ �2
	accept REZ(AA: in Vector_2H) do
		A(1 .. 2*H) := AA;
	end REZ;

--7.	�������� A3H ������ �4
	T4.REZ3(A);
	
	Put_Line("T3 ended");
 end T3;
	   
	           task body T4 is
	                    Sum1: Integer := 0;
						MO: Matrix_N;
						MZ: Matrix_3H;
						C: Vector_N;
						B: Vector_5H;

						A: Vector_5H;
						MTx: Matrix_H;
	           begin
	                   put_Line("T4 started!");
	   
--1.	������� B5H, C �� ������ �6
	accept B5HC(Bx: in Vector_5H; Cx: in Vector_N) do
		B := Bx;
		C := Cx;
	end B5HC;
--2.	�������� BH, C �� ������ �5
	T5.BHC(B(4*H+1 .. 5*H), C);
--3.	�������� B3H, C �� ������ �3
	T3.B3HC(B(1 .. 3*H), C);
--4.	������� MO, MZ3H �� ������ �3
	accept MOMZ3H(MOx: in Matrix_N; MZx: in Matrix_3H) do
		MO := MOx;
		MZ := MZx;
	end MOMZ3H;
--5.	�������� MO, MZH ������ �5
	T5.MOMZH(MO, MZ(H+1 .. 2*H));
--6.	�������� MO, MZH ������ �6
	T6.MOMZH(MO, MZ(2*H+1 .. 3*H));
--7.	���� AH = BH + � * (MO  * MZH)
	for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MZ(J)(Z) * MO(Z)(I);
		    end loop;
			MTx(J)(I) := Sum1;
		  end loop;
		end loop;
		for i in 1.. H loop
		  Sum1 := 0;
		  for j in 1 .. N loop
    		Sum1 := sum1 + C(J) * MTx(I)(J);
		  end loop;
		  A(I + 3*H) := Sum1 + B(I + 3*H);
		end loop;
--8.	������� AH  �� ������ �5
	accept REZ5(AA: in Vector_H) do
		A(4*H+1 .. 5*H) := AA;
	end REZ5;
--9.	���5���� A3H  �� ������ �3
	accept REZ3(AA: in Vector_3H) do
		A(1 .. 3*H) := AA;
	end REZ3;
--10.	�������� A5H ������ �6
	T6.REZ(A);

	  Put_Line("T4 ended");
end T4;

	           task body T5 is
	                    Sum1: Integer := 0;
						MO: Matrix_N;
						MZ: Matrix_H;
						C: Vector_N;
						B: Vector_H;

						A: Vector_H;
						MTx: Matrix_H;
	           begin
	                   put_Line("T5 started!");

--1.	������� BH, C �� ������ �4
	accept BHC(Bx: in Vector_H; Cx: in Vector_N) do
		B := Bx;
		C := Cx;
	end BHC;
--2.	������� MO, MZH �� ������ �4
	accept MOMZH(MOx: in Matrix_N; MZx: in Matrix_H) do
		MO := MOx;
		MZ := MZx;
	end MOMZH;
--3.	���� AH = BH + � * (MO  * MZH)
	for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MZ(J)(Z) * MO(Z)(I);
		    end loop;
			MTx(J)(I) := Sum1;
		  end loop;
		end loop;
		for i in 1.. H loop
		  Sum1 := 0;
		  for j in 1 .. N loop
    		Sum1 := sum1 + C(J) * MTx(I)(J);
		  end loop;
		  A(I) := Sum1 + B(I);
		end loop;

--4.	�������� AH  ������ �4
	T4.REZ5(A);

 	Put_Line("T5 ended");
   end T5;

			   task body T6 is
	                    Sum1: Integer := 0;
						MO: Matrix_N;
						MZ: Matrix_H;
						C: Vector_N;
						B: Vector_N;

						A: Vector_N;
						MTx: Matrix_H;
	           begin
	                   put_Line("T6 started!");

--1.	���� B, C
		for i in 1 .. N loop
			B(i) := 1;
			C(I) := 1;
		end loop;  
--2.	�������� B5H, C ������ �4
		T4.B5HC(B(1 .. 5*H), C);
--3.	������� MO, MZH �� ������ �4
	accept MOMZH(MOx: in Matrix_N; MZx: in Matrix_H) do
		MO := MOx;
		MZ := MZx;
	end MOMZH;
--4.	���� AH = BH + � * (MO  * MZH)
	for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MZ(J)(Z) * MO(Z)(I);
		    end loop;
			MTx(J)(I) := Sum1;
		  end loop;
		end loop;
		for i in 1.. H loop
		  Sum1 := 0;
		  for j in 1 .. N loop
    		Sum1 := sum1 + C(J) * MTx(I)(J);
		  end loop;
		  A(I + 5*H) := Sum1 + B(I + 5*H);
		end loop;
--5.	������� A5H �� ������ �4
	accept REZ(AA: in Vector_5H) do
		A(1 .. 5*H) := AA;
	end REZ;
--6.	����� �.
	--if N < 36 then
		for i in 1 .. N loop
	        Put(A(i), 4);
		end loop;
	--end if;
	   
 	Put_Line("T6 ended");
   end T6;

begin
	null;
end CoursePRO;

