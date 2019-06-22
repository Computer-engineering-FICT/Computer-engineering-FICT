----------------------------------------------------------------
--              Paralel and distributed computing             --
--             Laboratory work #1. Ada. Semaphores            --
--                  Func: MA = (MB*MZ*Alfa) + ME*MR           --
--                   IO-83 Vorobyev Vitaliy                   --
--                        28.03.2011                           --
----------------------------------------------------------------

with Package1; use Package1;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lab4 is
   MX, MZ: Matr;
   A: Vec;

-----------------------------------------------------------
---------------������������ ����� ���������� �������-------
-----------------------------------------------------------

----���������� ������ Synchro
	protected SynchroAndOP is
		--�������������
		procedure Input;
		procedure CSignal;
		procedure EndSignal;
		--����� �������
		procedure SetMO(M: in Matr);
		function GetMO return Matr;
		procedure SetC(M: in Vec);
		function GetC return Vec;
		procedure SetB(M: in Vec);
		function GetB return Vec;
		--���������� ����� (�������������)
		entry InputSync;
		entry CSync;
		entry EndSync;
	--��������� ����� ����������� ������
   	private
		--�������������
		F1: integer := 0;
		F2: integer := 0;
		F3: Integer := 0;
		--����� �������
		B: Vec;
		MO: Matr;
		C: Vec;
	end SynchroAndOP;

-----------------------------------------------------------
------------------���� ���������� �������------------------
-----------------------------------------------------------

--���������� ������ Synchro
	protected body SynchroAndOP is
-- REALIZE �������������
		procedure Input is 
			begin
				F1 := F1 + 1;
    	end Input;

		procedure CSignal is
			begin
				F2 := F2 + 1;
    	end CSignal;

		procedure EndSignal is
			begin
				F3 := F3 + 1;
    	end EndSignal;
-- REALIZE ����� ������� MO
		procedure SetMO(M: in Matr) is
		begin	
			for i in 1 .. N loop
	            for j in 1 .. N loop
	               MO(i)(j) := M(i)(j);
	            end loop;
	         end loop;	
		end SetMO;
		function GetMO return Matr is
		begin
			return MO;
		end;
-- REALIZE ����� ������� C		
		procedure SetC(M: in Vec) is
		begin	
			for i in 1 .. N loop
	               C(i) := C(i) + M(i);
	         end loop;	
		end SetC;
		function GetC return Vec is
		begin
			return C;
		end;
-- REALIZE ����� ������� B		
		procedure SetB(M: in Vec) is
		begin	
			for i in 1 .. N loop
	            for j in 1 .. N loop
	               B(i) := M(i);
	            end loop;
	         end loop;	
		end SetB;
		function GetB return Vec is
		begin
			return B;
		end;
--���������� ����� (�������������)
		entry InputSync when F1 = 3 is --1
		begin
				null;
		end InputSync;

		entry CSync when F2 = P is --2
		begin
				null;
		end CSync;

		entry EndSync when F2 = P - 1 is --3
		begin
				null;
		end EndSync;
	end SynchroAndOP;

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
		MC, MO1 : Matr;
		B1, C1: Vec;
	begin
		Put_Line("T1 start");

--1.	���� ��
		Matr_Input(MX);
--2.	������ ������� �2, �3, �4 � ���������� ����� ��  S2.1, S3.1, S4.1
		SynchroAndOP.Input;
--3.	����� �������� � �3, �4
		SynchroAndOP.InputSync;
--4.	����������� B1 := B 
		B1 := SynchroAndOP.GetB;
--5.	C��� CH = B1 * MZH
		for i in 1 .. H loop
			sum1 := 0;
            for j in 1 .. N loop
               sum1 := sum1 + B1(J) * MZ(I)(J);
			end loop;
			C1(I) := Sum1;
         end loop;
		SynchroAndOP.SetC(C1);
--6.	������ ������� �2, �3, �4 � ���������� ����� �
		SynchroAndOP.CSignal;
--7.	����������� ��1 := MO 
		MO1 := SynchroAndOP.GetMO;
--8.	���� MCH = MO1 * MXH
		 for i in 1.. N loop
            for j in 1 .. H loop
			   sum1 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MX(Z)(J) * MO1(I)(Z);
               end loop;
			   MC(I)(J) := Sum1;
			end loop;
         end loop;
--9.	����� ���������� ����� � � �����a� �2, �3, �4
		SynchroAndOP.CSync;
--10.	����������� �1 := C
		C1 := SynchroAndOP.GetC;
--11.	���� AH = C1 * MCH
		for i in 1 .. H loop
			sum1 := 0;
            for j in 1 .. N loop
               sum1 := sum1 + C1(J) * MC(J)(I);
			end loop;
			A(I) := Sum1;
         end loop;
--12.	������ ������ �4 � ���������� �����.       				    	           S4.3
		SynchroAndOP.EndSync;
           
		Put_Line("T1 stop");
    end T1;

-----------------------������ �2 --------------------------
	task body T2 is
		Sum1: Integer;
		MC, MO2 : Matr;
		B2, C2: Vec;
	begin
		Put_Line("T2 start");

--1.	����� �������� � �1, �3, �4
		SynchroAndOP.InputSync;
--2.	����������� B2 := B 
		B2 := SynchroAndOP.GetB;
--3.	C��� CH = B1 * MZH
		for i in H+1 .. 2*H loop
			sum1 := 0;
            for j in 1 .. N loop
               sum1 := sum1 + B2(J) * MZ(I)(J);
			end loop;
			C2(I) := Sum1;
         end loop;
		SynchroAndOP.SetC(C2);
--4.	������ ������� �1, �3, �4 � ���������� ����� � 				    S1.2, S3.2, S4.2
		SynchroAndOP.CSignal;
--5.	����������� ��2 := MO 
		MO2 := SynchroAndOP.GetMO;
--6.	���� MCH = MO2 * MXH
		 for i in 1.. N loop
            for j in H+1 .. 2*H loop
			   sum1 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MX(Z)(J) * MO2(I)(Z);
               end loop;
			   MC(I)(J) := Sum1;
			end loop;
         end loop;
--7.	����� ���������� ����� � � �����a� �1, �3, �4
		SynchroAndOP.CSync;
--8.	����������� �2 := C
		C2 := SynchroAndOP.GetC;
--9.	���� AH = C1 * MCH
		for i in H+1 .. 2*H loop
			sum1 := 0;
            for j in 1 .. N loop
               sum1 := sum1 + C2(J) * MC(J)(I);
			end loop;
			A(I) := Sum1;
         end loop;
--10.	������ ������ �4 � ���������� �����.       				    	           S4.3
		SynchroAndOP.EndSignal;

		Put_Line("T2 stop");
    end T2;

-----------------------������ �3 ----------------------------
	task body T3 is
		Sum1: Integer;
		MC, MO3 : Matr;
		B3, C3: Vec;
	begin
		Put_Line("T3 start");

--1.	���� �Z
		Matr_Input(MZ);		
--2.	������ ������� �1, �2, �4 � ���������� ����� �Z
		SynchroAndOP.Input;
--3.	����� �������� � �1, �4
		SynchroAndOP.InputSync;
--4.	����������� B3 := B 
		B3 := SynchroAndOP.GetB;
--5.	C��� CH = B3 * MZH
		for i in 2*H+1 .. 3*H loop
			sum1 := 0;
            for j in 1 .. N loop
               sum1 := sum1 + B3(J) * MZ(I)(J);
			end loop;
			C3(I) := Sum1;
         end loop;
		SynchroAndOP.SetC(C3);
--6.	������ ������� �1, �2, �4 � ���������� ����� �
		SynchroAndOP.CSignal;
--7.	����������� ��3 := MO 
		MO3 := SynchroAndOP.GetMO;
--8.	���� MCH = MO3 * MXH
		 for i in 1.. N loop
            for j in 2*H+1 .. 3*H loop
			   sum1 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MX(Z)(J) * MO3(I)(Z);
               end loop;
			   MC(I)(J) := Sum1;
			end loop;
         end loop;
--9.	����� ���������� ����� � � �����a� �1, �3, �4
		SynchroAndOP.CSync;
--10.	����������� �3 := C
		C3 := SynchroAndOP.GetC;
--11.	���� AH = C3 * MCH
		for i in 2*H+1 .. 3*H loop
			sum1 := 0;
            for j in 1 .. N loop
               sum1 := sum1 + C3(J) * MC(J)(I);
			end loop;
			A(I) := Sum1;
         end loop;
--12.	������ ������ �4 � ���������� �����.       				    	           S4.3
		SynchroAndOP.EndSignal;
		Put_Line("T3 stop");
    end T3;	

-----------------------������ �4 --------------------------
	task body T4 is
		Sum1: Integer;
		MC, MO4 : Matr;
		B4, C4: Vec;
	begin
		Put_Line("T4 start");

--1.	����  B, MO
		Matr_Input(MO4);	
		Vec_Input(B4);
		SynchroAndOP.SetB(B4);
		SynchroAndOP.SetMO(MO4);
--2.	������ ������� �2, �3, �1 � ���������� �����
		SynchroAndOP.Input;
--3.	����� �������� � �1, �3
		SynchroAndOP.InputSync;
--4.	����������� B4 := B 
		B4 := SynchroAndOP.GetB;
--5.	C��� CH = B4 * MZH
		for i in 3*H+1 .. N loop
			sum1 := 0;
            for j in 1 .. N loop
               sum1 := sum1 + B4(J) * MZ(I)(J);
			end loop;
			C4(I) := Sum1;
         end loop;
		SynchroAndOP.SetC(C4);
--6.	������ ������� �2, �3, �1 � ���������� ����� �
		SynchroAndOP.CSignal;
--7.	����������� ��4 := MO 
		MO4 := SynchroAndOP.GetMO;
--8.	���� MCH = MO4 * MXH
		 for i in 1.. N loop
            for j in 3*H+1 .. N loop
			   sum1 := 0;
               for z in 1 .. N loop
                  sum1 := sum1 + MX(Z)(J) * MO4(I)(Z);
               end loop;
			   MC(I)(J) := Sum1;
			end loop;
         end loop;
--9.	����� ���������� ����� � � �����a� �2, �3, �1
		SynchroAndOP.CSync;
--10.	����������� �4 := C
		C4 := SynchroAndOP.GetC;
--11.	���� AH = C4 * MCH
		for i in 3*H+1 .. N loop
			sum1 := 0;
            for j in 1 .. N loop
               sum1 := sum1 + C4(J) * MC(J)(I);
			end loop;
			A(I) := Sum1;
         end loop;
--12.	������ ������ �4 � ���������� �����.       				    	           S4.3
		SynchroAndOP.EndSignal;
--13.	����� A
		Put_Line("             ");
		Vec_Print(A);     
          
		Put_Line("T4 stop");
    end T4;	

begin
   null;
end Lab4;
