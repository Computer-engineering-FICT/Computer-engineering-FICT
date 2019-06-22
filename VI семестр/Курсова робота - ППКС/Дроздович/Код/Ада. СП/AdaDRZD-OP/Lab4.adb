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
   MA, MC, MK: Matr;
   Time_all: duration;
   time1,time2:  time;
   A: Integer;

-----------------------------------------------------------
---------------������������ ����� ���������� �������-------
-----------------------------------------------------------

----���������� ������ MON
	protected MON is
		--�������������
		procedure DataSignal;
		procedure CalculationSignal;
		--����� �������
		procedure SetMB(M: in Matr);
		procedure SetAlfa(M: in Integer);
		procedure SetMZ(M: in Matr);
		function GetMB return Matr;
		function GetAlfa return Integer;
		function GetMZ return Matr;
		--���������� ����� (�������������)
		entry Inputed;
		entry Finish;
	--��������� ����� ����������� ������
   	private
		--�������������
		F1: integer := 0;
		F2: integer := 0;
		--����� �������
		MB, MZ: Matr;
		alfa: Integer;
	end MON;

-----------------------------------------------------------
------------------���� ���������� �������------------------
-----------------------------------------------------------

--���������� ������ Synchro
	protected body MON is
-- REALIZE �������������
		procedure DataSignal is 
			begin
				F1 := F1 + 1;
    	end DataSignal;

		procedure CalculationSignal is
			begin
				F2 := F2 + 1;
    	end CalculationSignal;
-- REALIZE ����� �������
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
		procedure SetMZ(M: in Matr) is
		begin	
			for i in 1 .. N loop
	            for j in 1 .. N loop
	               MZ(i)(j) := M(i)(j);
	            end loop;
	         end loop;	
		end SetMZ;
		function GetMB return Matr is
		begin
			return MB;
		end;
		function GetAlfa return Integer is
		begin
			return alfa;
		end;
		function GetMZ return Matr is
		begin
			return MZ;
		end;
--���������� ����� (�������������)
		entry Inputed when F1 = P is --1
		begin
				null;
		end Inputed;

		entry Finish when F2 = P - 1 is --2
		begin
				null;
		end Finish;
	end MON;

	procedure START is
		-----------------------------------------------------------
		------------------------� � � � � �------------------------
		-----------------------------------------------------------
			task T1;
			task T2;
			task T3;
			task T4;
		
		-----------------------������ �1 --------------------------
			task body T1 is
				Sum1: Integer;
				MB1, MZ1, MT1: Matr; alfa1: Integer;
		
			begin
				Put_Line("T1 start");
--1.	���� MB, MA
		Matr_Input(MB1);
		MON.SetMB(MB1);
		Matr_Input(MA);
--2.	������ ������� �2, �3, �4 � ���������� ����� MB, MA
		MON.DataSignal;
--3.	����� �������� � T2, T3, T4
		MON.Inputed;
--4.	����������� MB1 := MB, ?1 := ?, MZ1 := M
		MZ1 := MON.GetMZ;
		MB1 := MON.GetMB;
		Alfa1 := MON.GetAlfa;
--5.	C��� �AH = MB1 * (M�H + ?1 * MZ1 * MKH)
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(Z)(J) * MZ1(I)(Z);
		    end loop;
			MT1(I)(J) := MC(I)(J) + Alfa1 * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in 1 .. H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MT1(Z)(J) * MB1(I)(Z);
		    end loop;
			MA(I)(J) := Sum1;
		  end loop;
		end loop;
--6.	����� ���������� ����� MAH � ������� �2, �3, �4	 	    	  	    W2.2, W2.2, W2.2
		MON.Finish;
--7.	����� ��.
		if N < 24 then
			Matr_print(MA);
		end if;
	
		time2:=clock;
	    time_all:=time2-time1;
		Put(Integer(time_all));
	
		Put_Line("T1 stop");
	end T1;
		
		-----------------------������ �2 --------------------------
			task body T2 is
				Sum1: Integer;
				MB2, MZ2, MT2: Matr; alfa2: Integer;

			begin
				Put_Line("T2 start");
--1.	���� ��
		Matr_Input(MC);
--2.	������ ������� �1, �3, �4 � ���������� ����� ��	
		MON.DataSignal;
		MON.Inputed;
--4.	����������� MB1 := MB, ?1 := ?, MZ1 := M
		MZ2 := MON.GetMZ;
		MB2 := MON.GetMB;
		Alfa2 := MON.GetAlfa;
--5.	C��� �AH = MB2 * (M�H + ?2 * MZ2 * MKH)	
		for i in 1.. N loop
		  for j in H+1 .. 2*H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(Z)(J) * MZ2(I)(Z);
		    end loop;
			MT2(I)(J) := MC(I)(J) + Alfa2 * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in H+1 .. 2*H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MT2(Z)(J) * MB2(I)(Z);
		    end loop;
			MA(I)(J) := Sum1;
		  end loop;
		end loop;
--6.	������ 	������ �1 � ���������� ����� �AH	
		MON.CalculationSignal;
		
		Put_Line("T2 stop");
	end T2;
		
		-----------------------������ �3 ----------------------------
			task body T3 is
				Sum1: Integer;
				MB3, MZ3, MT3: Matr; alfa3: Integer;

			begin
				Put_Line("T3 start");
--1.	���� ��
		Matr_Input(MZ3);
		MON.SetMZ(MZ3);
--2.	������ ������� �1, �3, �4 � ���������� ����� ��	
		MON.DataSignal;
		MON.Inputed;
--4.	����������� MB1 := MB, ?1 := ?, MZ1 := M
		MZ3 := MON.GetMZ;
		MB3 := MON.GetMB;
		Alfa3 := MON.GetAlfa;
--5.	C��� �AH = MB2 * (M�H + ?2 * MZ2 * MKH)	
		for i in 1.. N loop
		  for j in 2*H+1 .. 3*H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(Z)(J) * MZ3(I)(Z);
		    end loop;
			MT3(I)(J) := MC(I)(J) + Alfa3 * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in 2*H+1 .. 3*H loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MT3(Z)(J) * MB3(I)(Z);
		    end loop;
			MA(I)(J) := Sum1;
		  end loop;
		end loop;
--6.	������ 	������ �1 � ���������� ����� �AH	
		MON.CalculationSignal;
		
				Put_Line("T3 stop");
		    end T3;	
		
		-----------------------������ �4 --------------------------
			task body T4 is
				Sum1: Integer;
				MB4, MZ4, MT4: Matr; alfa4: Integer;

			begin
				Put_Line("T4 start");
--1.	���� ��
		Matr_Input(MK);
		Alfa4 := 1;
		MON.SetAlfa(Alfa4);
--2.	������ ������� �1, �3, �4 � ���������� ����� ��	
		MON.DataSignal;
		MON.Inputed;
--4.	����������� MB1 := MB, ?1 := ?, MZ1 := M
		MZ4 := MON.GetMZ;
		MB4 := MON.GetMB;
		Alfa4 := MON.GetAlfa;
--5.	C��� �AH = MB2 * (M�H + ?2 * MZ2 * MKH)	
		for i in 1.. N loop
		  for j in 3*H+1 .. N loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MK(Z)(J) * MZ4(I)(Z);
		    end loop;
			MT4(I)(J) := MC(I)(J) + Alfa4 * Sum1;
		  end loop;
		end loop;
		for i in 1.. N loop
		  for j in 3*H+1 .. N loop
			sum1 := 0;
		    for z in 1 .. N loop
		       Sum1 := sum1 + MT4(Z)(J) * MB4(I)(Z);
		    end loop;
			MA(I)(J) := Sum1;
		  end loop;
		end loop;
--6.	������ 	������ �1 � ���������� ����� �AH	
		MON.CalculationSignal;
		
				Put_Line("T4 stop");
		    end T4;	

	begin	
		null;
	end START;


begin
	Put_Line("N == ");
	Put(N);
	--Get(A);
	time1:=clock;
	START;
end Lab4;
