With Ada.Synchronous_Task_Control, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Calendar;
Use Ada.Synchronous_Task_Control, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Calendar;
Procedure hast2 is
    N: Integer:=840;
    P: Integer:=8;
    H: Integer:=N/P;
    Tm1,Tm2:Time;
    TT:Duration;
	Type Vector is array (1..N) of Integer;
	Type Matrix is array (Integer range<>) of Vector;
	SubType Matrix_8h is Matrix(1..N);
	SubType Matrix_7h is Matrix(1..7*h);
	SubType Matrix_6h is Matrix(1..6*h);
	SubType Matrix_5h is Matrix(1..5*h);
	SubType Matrix_4h is Matrix(1..4*h);
	SubType Matrix_3h is Matrix(1..3*h);
	SubType Matrix_2h is Matrix(1..2*h);
	SubType Matrix_h is Matrix(1..h);
	Procedure Start is
	task t1 is
		entry PutData(MC: in Matrix_h);
	end;
	task t2 is
		entry PutData(MC: in Matrix_2h);
		entry PutData2(MB: in Matrix_8h);
		entry GetRes(MA: out Matrix_7h);
	end t2;
	task t3 is
		entry PutData(MC: in Matrix_3h);
		entry PutData2(MB: in Matrix_8h);
		entry GetRes(MA: out Matrix_6h);
	end t3;
	TASK T4 IS
		entry PutData(MC: in Matrix_4h);
		entry PutData2(MB: in Matrix_8h);
		entry GetRes(MA: out Matrix_5h);
	END T4;
	TASK T5 IS
		entry PutData(MC: in Matrix_5h);
		entry PutData2(MB: in Matrix_8h);
		entry GetRes(MA: out Matrix_4h);
	END T5;
	TASK T6 IS
		entry PutData(MC: in Matrix_6h);
		entry PutData2(MB: in Matrix_8h);
		entry GetRes(MA: out Matrix_3h);
	END T6;
	TASK T7 IS
		entry PutData(MC: in Matrix_7h);
		entry PutData2(MB: in Matrix_8h);
		entry GetRes(MA: out Matrix_2h);
	END T7;
	TASK T8 IS
		entry PutData2(MB: in Matrix_8h);
		entry GetRes(MA: out Matrix_h);
	end t8;

	task body t1 is
		MA1,MB1:Matrix_8h;
		MC1:matrix_h;
	begin
		Put_Line("Process T1 started");
		for i in 1..n loop
			for j in 1..n loop
				MB1(i)(j):=1;
			END LOOP;
		END LOOP;
		T2.PutData2(MB1);
		accept PutData(MC: in Matrix_h) do
					MC1:=mC;
		end;
			For i in 1..H loop
			For j in 1..N loop
				MA1(i)(j):=0;
				For k in 1..N loop
					MA1(i)(j):=MA1(i)(j)+MC1(i)(k)*MB1(k)(j);
				end loop;
			end loop;
		end loop;
		T2.GetRes(MA1(H+1..N));
		--for i in 1..n loop
			--for j in 1..n loop
				Put(MA1(N)(N));
			--end loop;
		--end loop;
		Put_Line("T1 finished!");
	end t1;

	task body t2 is
		MB2: Matrix_8h;
		MA2: Matrix_7h;
		MC2: Matrix_2h;
	begin
		Put_Line("Process T2 started");
				accept PutData2(MB: in Matrix_8h) do
					MB2:=MB;
				end;
				T3.PutData2(MB2);
				accept PutData(MC: in Matrix_2h) do
					MC2:=mC;
				end;
		t1.putData(MC2(h+1..2*h));
		For i in 1..H loop
			For j in 1..N loop
				MA2(i)(j):=0;
				For k in 1..N loop
					MA2(i)(j):=MA2(i)(j)+MC2(i)(k)*MB2(k)(j);
				end loop;
			end loop;
		end loop;
		T3.GetRes(MA2(H+1..7*H));
		accept GetRes(MA: out Matrix_7h) do
			MA:=MA2;
		end;
		Put_Line("T2 finished!");
	end t2;

	task body t3 is
		MB3: Matrix_8h;
		MA3: Matrix_6h;
		MC3: Matrix_3h;
	begin
		Put_Line("Process T3 started");
		accept PutData2(MB: in Matrix_8h) do
					MB3:=MB;
				end;
				T4.PutData2(MB3);
				accept PutData(MC: in Matrix_3h) do
					MC3:=MC;
				end;
		T2.PutData(MC3(H+1..3*H));
		For i in 1..H loop
			For j in 1..N loop
				MA3(i)(j):=0;
				For k in 1..N loop
					MA3(i)(j):=MA3(i)(j)+MC3(i)(k)*MB3(k)(j);
				end loop;
			end loop;
		end loop;
		T4.GetRes(MA3(H+1..6*H));
		accept GetRes(MA: out Matrix_6h) do
			MA:=MA3;
		end;
		Put_Line("T3 finished!");
	end t3;

	task body t4 is
		MB4: Matrix_8h;
		MA4: Matrix_5h;
		MC4: Matrix_4h;
	begin
		Put_Line("Process T4 started");
				accept PutData2(MB: in Matrix_8h) do
					MB4:=MB;
				end;
				T5.PutData2(MB4);
				accept PutData(MC: in Matrix_4h) do
					MC4:=MC;
				end;
		T3.PutData(MC4(H+1..4*H));
		For i in 1..H loop
			For j in 1..N loop
				MA4(i)(j):=0;
				For k in 1..N loop
					MA4(i)(j):=MA4(i)(j)+MC4(i)(k)*MB4(k)(j);
				end loop;
			end loop;
		end loop;
		T5.GetRes(MA4(H+1..5*H));
		accept GetRes(MA: out Matrix_5h) do
			MA:=MA4;
		end;
		Put_Line("T4 finished!");
	end t4;

	task body t5 is
		MB5: Matrix_8h;
		MA5: Matrix_4h;
		MC5: Matrix_5h;
	begin
		Put_Line("Process T5 started");
				accept PutData2(MB: in Matrix_8h) do
					MB5:=MB;
				end;
				T6.PutData2(MB5);
				accept PutData(MC: in Matrix_5h) do
					MC5:=MC;
				end;
		T4.PutData(MC5(H+1..5*H));
		For i in 1..H loop
			For j in 1..N loop
				MA5(i)(j):=0;
				For k in 1..N loop
					MA5(i)(j):=MA5(i)(j)+MC5(i)(k)*MB5(k)(j);
				end loop;
			end loop;
		end loop;
		T6.GetRes(MA5(H+1..4*H));
		accept GetRes(MA: out Matrix_4h) do
			MA:=MA5;
		end;
		Put_Line("T5 finished!");
	end t5;

	task body t6 is
		MB6: Matrix_8h;
		MA6: Matrix_3h;
		MC6: Matrix_6h;
	begin
		Put_Line("Process T6 started");
				accept PutData2(MB: in Matrix_8h) do
					MB6:=MB;
				end;
				T7.PutData2(MB6);
				accept PutData(MC: in Matrix_6h) do
					MC6:=MC;
				end;
		T5.PutData(MC6(H+1..6*H));
		For i in 1..H loop
			For j in 1..N loop
				MA6(i)(j):=0;
				For k in 1..N loop
					MA6(i)(j):=MA6(i)(j)+MC6(i)(k)*MB6(k)(j);
				end loop;
			end loop;
		end loop;
		T7.GetRes(MA6(H+1..3*H));
		accept GetRes(MA: out Matrix_3h) do
			MA:=MA6;
		end;
		Put_Line("T6 finished!");
	end t6;

	task body t7 is
		MB7: Matrix_8h;
		MA7: Matrix_2h;
		MC7: Matrix_7h;
	begin
		Put_Line("Process T7 started");
				accept PutData2(MB: in Matrix_8h) do
					MB7:=MB;
				end;
				T8.PutData2(MB7);
				accept PutData(MC: in Matrix_7h) do
					MC7:=MC;
				end;
		T6.PutData(MC7(H+1..7*H));
		For i in 1..H loop
			For j in 1..N loop
				MA7(i)(j):=0;
				For k in 1..N loop
					MA7(i)(j):=MA7(i)(j)+MC7(i)(k)*MB7(k)(j);
				end loop;
			end loop;
		end loop;
		T8.GetRes(MA7(H+1..2*H));
		accept GetRes(MA: out Matrix_2h) do
			MA:=MA7;
		end;
		Put_Line("T7 finished!");
	end t7;

	task body t8 is
		MB8: Matrix_8h;
		MA8: Matrix_h;
		MC8: Matrix_8h;
	begin
		Put_Line("Process T8 started");
		for i in 1..n loop
			for j in 1..n loop
				MC8(i)(j):=1;
			end loop;
		end loop;
		accept PutData2(MB: in Matrix_8h) do
					MB8:=mB;
		end;
		T7.PutData(MC8(H+1..8*H));
		For i in 1..H loop
			For j in 1..N loop
				MA8(i)(j):=0;
				For k in 1..N loop
					MA8(i)(j):=MA8(i)(j)+MC8(i)(k)*MB8(k)(j);
				end loop;
			end loop;
		end loop;
		accept GetRes(MA: out Matrix_h) do
			MA:=MA8;
		end;
		Put_Line("T8 finished!");
	end t8;

begin
	null;
end Start;
begin
	Tm1:=Clock;
	Start;
	Tm2:=Clock;
	TT:=Tm2-Tm1;
	New_Line;
	Put(Integer(TT));
	New_line;
end hast2;




		
		



				

		



		
		





		
		






		
		






			

				
				

		



		






		




		

		
		

		

		

		

		


