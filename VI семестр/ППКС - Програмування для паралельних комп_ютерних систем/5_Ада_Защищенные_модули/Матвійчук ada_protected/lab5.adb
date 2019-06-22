----------------------------------
----------------------------------
-- Matviychyk B. IO - 91.
-- Lab5.
-- A=B*(MO*MX)*l+Z(MR*MT)
-- OR: MX,B,l,Z,MT
-- 25,04,2012
----------------------------------
-- A=l*B+C*MO+D*(MK*MR)
-- OR: l,C,D,MK
----------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control, Ada.Calendar;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control, Ada.Calendar;

package Lab5 is
	N:integer:=6;
	P:integer:=6;
	h:Integer:=N/p;
	type Vector is array (1..n) of integer;
	type Matrix is array (1..n) of Vector;
	Lo:Integer;
	MO,MR:Matrix;
	a:Vector;
--Procedures
	procedure VectorInput (v: out Vector);
	procedure MatrixInput (M: out Matrix);
	procedure VectorOutput (V: in Vector);
	procedure MatrixOutput (M: in Matrix);
	procedure NumbVectorMnozh (One,Two,Q: in Integer; V: in Vector; VR: out Vector);
	procedure MatrixMnozh (One,Two: in Integer; M1,M2: in Matrix; MR2: out Matrix);
	procedure VectorMatrixMnozh (One,Two: in Integer; v: in Vector; M: in Matrix; VR: out Vector);
	procedure VecSlozh (One,Two: in Integer; v1,v2: in Vector; VR: out Vector);
end Lab5;

package body Lab5 is
procedure VectorInput (v: out Vector) is
	i: integer;
begin
	for I in 1..n loop
		V(i):=1;
	end loop;
end VectorInput;

procedure MatrixInput (M: out Matrix) is
	i,j:integer;
begin
	for I in 1..n loop
		for J in 1..n loop
			M(I)(J):=1;
		end loop;
	end loop;
end MatrixInput;

procedure VectorOutput (V: in Vector) is
	I: integer;
begin
	if n<=12 then
		for I in 1..n loop
			put(v(i));
		end loop;
	end if;
	new_line;
end VectorOutput;

procedure MatrixOutput (M: in Matrix) is
	I,J: integer;
begin
	if n<=12 then
		for I in 1..n loop
			for J in 1..n loop
				put(M(i)(j));
				Put (" ");
			end loop;
			new_line;
		end loop;
	end if;
end MatrixOutput;

function FindMaxMatrix (One,Two,MIN: in Integer; M: in Matrix) return integer is
	q: Integer;
begin
	Q:= M(1)(1);
	for i in One..Two loop
		for J in 1..n loop
			if Q < M(i)(J) then
				Q:= M(I)(J);
			end if;
		end loop;
	end loop;
	return Q;
end FindMaxMatrix;

procedure NumbVectorMnozh (One,Two,Q: in Integer; V: in Vector; VR: out Vector) is
begin
	for i in One..Two loop
		vR(I):= Q * V(I);--OP*H
	end loop;
end NumbVectorMnozh;

procedure MatrixMnozh (One,Two: in Integer; M1,M2: in Matrix; MR2: out Matrix) is
	I,j,k: integer;
begin
	for i in One..Two loop
		for j in 1..n loop
			MR2(i)(j):=0;
			for k in 1..n loop
				MR2(i)(j):=MR2(i)(j) + M1(K)(J) * M2(i)(k);--OP*H
			end loop;
		end loop;
	end loop;
end MatrixMnozh;

procedure VectorMatrixMnozh (One,Two: in Integer; v: in Vector; M: in Matrix; VR: out Vector) is
	I,j: integer;
begin
	for i in One..Two loop
		VR(I):=0;
		for j in 1..n loop
			VR(I):=VR(I) + V(J) * M(I)(J);--OP*H
		end loop;
	end loop;
end VectorMatrixMnozh;

procedure VecSlozh (One,Two: in Integer; v1,v2: in Vector; VR: out Vector) is
begin
	for i in One..Two loop
		VR(I):=V1(I) + V2(I);--H+H
	end loop;
end VecSlozh;

end Lab5;

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control, Lab5, Ada.Calendar;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control, Lab5, Ada.Calendar;

procedure Lab05 is
--monitor spec
protected Monitor is
	procedure SetL(QI: in Integer);	  
	procedure SetB (CI: in Vector);
	procedure SetZ (CI: in Vector);
	procedure SetMX(MI: in Matrix);
	procedure SetMT(MI: in Matrix);
	function CopyL return Integer;
	function CopyB return Vector;
	function CopyMX return Matrix;
	function CopyZ return Vector;
	function CopyMT return Matrix;
	procedure SignalInput;  
	procedure SignalCalc;
	entry WaitInput;
	entry WaitCalc;
	private
		MX:Matrix;
		B:Vector;
		MT:Matrix;
		Z:Vector;
		L:Integer;
		F1:integer:=0;
		F2:integer:=0;
end Monitor;
--monitor body
protected body Monitor is
	procedure SetL (QI: in Integer) is
	begin
		L:=QI;
	end SetL;
	procedure SetB (CI: in Vector) is
	begin	
		for I in 1..N loop
			B(I):=CI(I);
		end loop;
	end SetB;
	procedure SetZ (CI: in Vector) is
	begin	
		for I in 1..N loop
			Z(I):=CI(I);
		end loop;
	end SetZ;
	procedure SetMX(MI: in Matrix) is
	begin
		for I in 1..N loop
			for J in 1..N loop
				MX(I)(J):=MI(I)(J);
	   		end loop;
		end loop;
	end SetMX;
	procedure SetMT(MI: in Matrix) is
	begin
		for I in 1..N loop
			for J in 1..N loop
				MT(I)(J):=MI(I)(J);
	   		end loop;
		end loop;
	end SetMT;
	function CopyL return Integer is
	begin
		return L;
	end CopyL;
	function CopyB return Vector is
	begin
		return B;
	end CopyB;
	function CopyZ return Vector is
	begin
		return Z;
	end CopyZ;
	function CopyMX return Matrix is
	begin
		return MX;
	end CopyMX;
	function CopyMT return Matrix is
	begin
		return MT;
	end CopyMT;
	procedure SignalInput is
	begin
		F1:=F1+1;
	end SignalInput;
	procedure SignalCalc is
	begin
		F2:=F2+1;
	end SignalCalc;
	entry WaitInput when F1=3 is
	begin	
		null;
	end WaitInput;
	entry WaitCalc when F2=6 is
	begin	
		null;		
	end WaitCalc;
end Monitor;

--1 TASK
	task t1;
	task body t1 is
		L1,Lo:Integer;
		B1:Vector;
		Z1:Vector;
		MX1,MXo:Matrix;
		MT1,MTo:Matrix;
		S1:Vector;
		S2:Vector;
		S3:Vector;
		MB1:Matrix;
		MB2:Matrix;
		One:Integer:=1;
		Two:Integer:=H;
	begin	
		put_Line("T1 started");
		MatrixInput(MTo);
		MatrixInput(MXo);
		Monitor.SetMX(MXo);
		Monitor.SetMT(MTo);
		Monitor.SignalInput;
		Monitor.WaitInput;
		l1:=Monitor.CopyL;
		B1:=Monitor.CopyB;
		Z1:=Monitor.CopyZ;
		MX1:=Monitor.CopyMX;
		MT1:=Monitor.CopyMT;
		MatrixMnozh(One,Two,MT1,MR,MB1);
		VectorMatrixMnozh(One,Two,Z1,MB1,S1);
		MatrixMnozh(One,Two,MX1,MO,MB2);
		VectorMatrixMnozh(One,Two,B1,MB2,S2);
		NumbVectorMnozh(One,Two,L1,S2,S3);
		VecSlozh(One,Two,S1,S3,A);
		Monitor.SignalCalc;
		put_Line("T1 finished.");
	end T1;
--2 TASK
	task t2;
	task body t2 is
		L2:Integer;
		B2:Vector;
		Z2:Vector;
		MX2:Matrix;
		MT2:Matrix;
		S1:Vector;
		S2:Vector;
		S3:Vector;
		MB1:Matrix;
		MB2:Matrix;
		One:Integer:=H+1;
		Two:Integer:=2*H;
	begin	
		put_Line("T2 started");
		MatrixInput(MR);
		MatrixInput(MO);
		Monitor.SignalInput;
		Monitor.WaitInput;
		l2:=Monitor.CopyL;
		B2:=Monitor.CopyB;
		Z2:=Monitor.CopyZ;
		MX2:=Monitor.CopyMX;
		MT2:=Monitor.CopyMT;
		MatrixMnozh(One,Two,MT2,MR,MB1);
		VectorMatrixMnozh(One,Two,Z2,MB1,S1);
		MatrixMnozh(One,Two,MX2,MO,MB2);
		VectorMatrixMnozh(One,Two,B2,MB2,S2);
		NumbVectorMnozh(One,Two,L2,S2,S3);
		VecSlozh(One,Two,S1,S3,A);
		Monitor.SignalCalc;
		put_Line("T2 finished.");		
	end T2;
--3 TASK
	task t3;
	task body t3 is
		L3:Integer;
		B3:Vector;
		Z3:Vector;
		MX3:Matrix;
		MT3:Matrix;
		S1:Vector;
		S2:Vector;
		S3:Vector;
		MB1:Matrix;
		MB2:Matrix;
		One:Integer:=2*H+1;
		Two:Integer:=3*H;
	begin	
		put_Line("T3 started");	   
		Monitor.WaitInput;
		l3:=Monitor.CopyL;
		B3:=Monitor.CopyB;
		Z3:=Monitor.CopyZ;
		MX3:=Monitor.CopyMX;
		MT3:=Monitor.CopyMT;
		MatrixMnozh(One,Two,MT3,MR,MB1);
		VectorMatrixMnozh(One,Two,Z3,MB1,S1);
		MatrixMnozh(One,Two,MX3,MO,MB2);
		VectorMatrixMnozh(One,Two,B3,MB2,S2);
		NumbVectorMnozh(One,Two,L3,S2,S3);
		VecSlozh(One,Two,S1,S3,A);
		Monitor.SignalCalc;
		put_Line("T3 finished.");		
	end T3;
--4 TASK
	task t4;
	task body t4 is
		L4:Integer;
		B4:Vector;
		Z4:Vector;
		MX4:Matrix;
		MT4:Matrix;
		S1:Vector;
		S2:Vector;
		S3:Vector;
		MB1:Matrix;
		MB2:Matrix;
		One:Integer:=3*H+1;
		Two:Integer:=4*H;
	begin	
		put_Line("T4 started");
		Monitor.WaitInput;
		l4:=Monitor.CopyL;
		B4:=Monitor.CopyB;
		Z4:=Monitor.CopyZ;
		MX4:=Monitor.CopyMX;
		MT4:=Monitor.CopyMT;
		MatrixMnozh(One,Two,MT4,MR,MB1);
		VectorMatrixMnozh(One,Two,Z4,MB1,S1);
		MatrixMnozh(One,Two,MX4,MO,MB2);
		VectorMatrixMnozh(One,Two,B4,MB2,S2);
		NumbVectorMnozh(One,Two,L4,S2,S3);
		VecSlozh(One,Two,S1,S3,A);
		Monitor.SignalCalc;
		put_Line("T4 finished.");	
	end T4;
--5 TASK
	task t5;
	task body t5 is
		L5:Integer;
		B5:Vector;
		Z5:Vector;
		MX5:Matrix;
		MT5:Matrix;
		S1:Vector;
		S2:Vector;
		S3:Vector;
		MB1:Matrix;
		MB2:Matrix;
		One:Integer:=4*H+1;
		Two:Integer:=5*H;
	begin	
		put_Line("T5 started"); 
		Monitor.WaitInput;
		l5:=Monitor.CopyL;
		B5:=Monitor.CopyB;
		Z5:=Monitor.CopyZ;
		MX5:=Monitor.CopyMX;
		MT5:=Monitor.CopyMT;	
		MatrixMnozh(One,Two,MT5,MR,MB1);
		VectorMatrixMnozh(One,Two,Z5,MB1,S1);
		MatrixMnozh(One,Two,MX5,MO,MB2);
		VectorMatrixMnozh(One,Two,B5,MB2,S2);
		NumbVectorMnozh(One,Two,L5,S2,S3);
		VecSlozh(One,Two,S1,S3,A);
		Monitor.SignalCalc;
		put_Line("T5 finished.");
	end T5;
--6 TASK
	task t6;
	task body t6 is
		L6,Lo:Integer;
		B6,Bo:Vector;
		Z6,Zo:Vector;
		MX6:Matrix;
		MT6:Matrix;
		S1:Vector;
		S2:Vector;
		S3:Vector;
		MB1:Matrix;
		MB2:Matrix;
		One:Integer:=5*H+1;
		Two:Integer:=6*H;
		start, stop : time;
begin
		start := Clock;
		put_Line("T6 started");
		VectorInput(Bo);
		VectorInput(Zo);
		Monitor.SetB(Bo);
		Monitor.SetZ(Zo);
		lo:=1;
		Monitor.SetL(Lo);
		Monitor.SignalInput;
		Monitor.WaitInput;
		l6:=Monitor.CopyL;
		B6:=Monitor.CopyB;
		Z6:=Monitor.CopyZ;
		MX6:=Monitor.CopyMX;
		MT6:=Monitor.CopyMT;
		MatrixMnozh(One,Two,MT6,MR,MB1);
		VectorMatrixMnozh(One,Two,Z6,MB1,S1);
		MatrixMnozh(One,Two,MX6,MO,MB2);
		VectorMatrixMnozh(One,Two,B6,MB2,S2);
		NumbVectorMnozh(One,Two,L6,S2,S3);
		VecSlozh(One,Two,S1,S3,A); 
		Monitor.SignalCalc;
		Monitor.WaitCalc;
		VectorOutput(a);
		put_Line("T6 finished.");
		stop := Clock;
		 Put_Line ("finished " & Duration'Image (stop-start));
	end T6;
begin
	null;
end Lab05;
