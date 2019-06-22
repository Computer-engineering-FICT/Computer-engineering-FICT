----------------------------------------------------
-- Kursovaya rabota                               --
-- Avtor: Katasonova Olesya                       --
-- studentka gr. IV-41                            --
-- Ada95. Randevu. Lineyka                        --
-- Data sozdaniya:   18.05.07                     --
----------------------------------------------------
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Calendar;
Use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Calendar;

Procedure KursP is
	-- consts
	N: Integer:=16;
    p: Integer:=8;
    H: Integer:=N/p;  
    -- types
	TYPE Vector is ARRAY (Integer range<>) OF Integer;
	Type Matrix is array (Integer range<>) of Vector(1..N);
	-- variables
    Tbeg,Tend: Time;
    Tsum: Duration;

procedure StartTasks is

   Task type TT(Tid:Integer) is
		entry Data(MXy: in Matrix; MZy: in Matrix; By: in Vector);
		entry DataP(MYy: in Matrix;  Cy: in Vector);
		entry Result(ay: in Vector);
   end TT;
   
type TTP is access TT;		
Tarray: array (1..P) of TTP;

   -------------------------------------------Task TT----------------------------
   Task body TT is
       MX, MZ: Matrix(1..(N+1-Tid)*H);
	   MY: Matrix(1..N);
	   B,C: Vector(1..N);
	   A: Vector(1..Tid*H);
	   Cur: Matrix(1..H);
   begin  
   	   Put("Started T");
       Put(Tid);
       New_Line;           
       delay(0.5);
	   -- 1. Vvod B, MX, MZ
       if Tid=1 then
		   for i in 1..N loop
	   	       for j in 1..n loop
			       MX(i)(j):=1;
			       MZ(i)(j):=1;
		       end loop;
	 	       B(i):=1;
           end loop;
	   end if;
	   -- 2. Vvod C, MY
       if Tid=P then
		   for i in 1..N loop
	   	       for j in 1..n loop
			       MY(i)(j):=1;
		       end loop;
	 	       C(i):=1;
           end loop;
	   end if;
	   -- 3. Prinyat' MX(N+1-Tid)h, MZ(N+1-Tid)h, B ot TT(Tid-1)
	   if Tid/=1 then
		   accept Data(MXy: in Matrix; MZy: in Matrix; By: in Vector) do
			   MX:=MXy;
			   MZ:=MZy;
			   B:=By;
		   end;
	   end if;
       -- 4. Peredat' MX(N-Tid)h, MZ(N-Tid)h, B v TT(Tid+1)
	   if Tid/=P then
		   Tarray(Tid+1).Data(MX(h+1..(N+1-Tid)*H),MZ(h+1..(N+1-Tid)*H),B(1..N));
	   end if;
	   -- 5. Prinyat' MY, C ot TT(Tid+1)
	   if Tid/=P then
	   	   accept DataP(MYy: in Matrix;  Cy: in Vector) do
		   	  MY:=MYy;
 			  C:=Cy;
	   	   end;
       end if;
	   -- 6. Peredat' MY, C v TT(Tid-1)
	   if Tid/=1 then
	   	   Tarray(Tid-1).DataP(MY,C);
   	   end if;
	   -- 7. Schet A = (B+C)*(MX+MY*MZ)
       For i in 1..H loop
           For j in 1..N loop
               Cur(i)(j):=0;
               For l in 1..N loop
                   Cur(i)(j):=Cur(i)(j)+MZ(i)(l)*MY(l)(j);
               end loop;
               Cur(I)(J):=Cur(I)(J)+MX(I)(J);
           end loop;
       end loop;
       For i in 1..H loop
		   A(I):=0;
           For j in 1..N loop
			   A(i) := A(i) + (B(I)+C(I))*Cur(I)(J);
		   end loop;
	   end loop;
       -- 8. Prinyat' A ot TT(Tid-1)
	   if Tid/=1 then
		   accept Result(Ay: in Vector) do
			   A(H+1..Tid*H):=Ay;
		   end;
 	   end if;
       -- 9. Peredat' A v TT(Tid+1) 
	   if Tid /= P then 
	       Tarray(Tid+1).Result(A(1..Tid*H));
	   END IF;
       -- 10. Vyvod rezul'tata
	   if Tid=P then	
		   New_Line;
		   put("Value A:");
           New_Line;
		   for i in 1..n loop 
		       put ("A(");
               put (i,width=>2);
               put (")");
               put (A(i));
               new_line;
           end loop;
           Tend:=Clock;
	       Tsum:=Tend-Tbeg;
	       New_Line;
	       put("Execution Time:");
	       put(integer(Tsum));
	   end if;
	   Put("Finished TT");
       Put(Tid);
       New_Line;
end TT; 

Begin   
	 -- inicializaciya zadach
	 for i in 1..P loop
     	Tarray(i) := new TT(i);
	 end loop; 
 end StartTasks;
-------------------------------------------Main Task----------------------------
begin
    Tbeg:=Clock;
	put("Main process started");
	New_Line;
	StartTasks;
    Put("Main process finished");
end KursP;
