With Ada.text_IO, Ada.Integer_text_IO, Ada.Calendar;
use Ada.text_IO, Ada.Integer_text_IO, Ada.Calendar;

procedure Cycle_structure is
    N: integer := 100;
    P: integer := 4;
    H: integer := N/P; 
    mid: integer := P/2;   
    Tm1, Tm2: Time;
    TT: Duration;
                                  
    type Vector is array (1..N) of Integer;
 
    type Matrix is array (Integer range <>) of Vector;
    		
	procedure Run is

	task type TLeft(Tid:integer) is
		entry Data(VMB, VMC: in Matrix);
       	entry Rez(VMA: out Matrix);
	end TLeft;

	type TLeftPointer is access TLeft;

	TL: array (1..P-mid) of TLeftPointer;	

   	task type TRight(TId:integer) is
			entry Data(VMB, VMC: in Matrix);
        	entry Rez(VMA: out Matrix);
	    	entry GetMBMC(VMB: in Matrix; VMC: in Matrix);
	end TRight;

	type TRightPointer is access TRight;

	TR: array (mid..P) of TRightPointer;	

	task body TLeft is		
	   MB: Matrix(1..N);
	   MCFull: Matrix(1..N);
	   MAFull: Matrix(1..N);
	   K: integer:=(P-mid-Tid+1)*H;
	   MC: Matrix(1..K);
	   MA: Matrix(1..K);
       Output_File: Ada.Text_IO.File_type;
	begin		
       Put("Started T");
       Put(Tid);
       New_Line;           
       if Tid = 1 then
   		   -- Enter MB, MC
           for i in 1..N loop
           		for j in 1..N loop
               		MB(i)(j):=1;
               		MCFull(i)(j):=1;
           		end loop;
       	   end loop;	
	 	   for i in 1..K loop
   		       	for j in 1..N loop
     	        	MC(i)(j):=MCFull(i)(j);
        	   	end loop;
           end loop;	
		   TR(p).GetMBMC(MB, MCFull((P-mid)*H+1..P*H));
	   else
	 	   accept Data(VMB, VMC: in Matrix) do
				MB:=VMB;
				MC:=VMC;
	 	   end;
	   end if;

	   if TId /= p-mid then
			TL(Tid+1).Data(MB,MC(H+1..K));
	   end if;
		      
	   -- Calc
       for i in 1..H loop
           for j in 1..N loop
               MA(i)(j):=0;
               for q in 1..N loop
                   MA(i)(j):=MA(i)(j)+MC(i)(q)*MB(q)(j);
               end loop;
           end loop;
       end loop;

       if Tid /= P-mid then
	   	   TL(Tid+1).Rez(MA(H+1..K));
       end if;

	   if Tid = 1 then
	   	   TR(P).Rez(MAFull((p-mid)*H+1..P*H));
		   MAFull(1..(P-mid)*H):=MA;
           --output
           --Input_Matrix(MA);
           Create(Output_File, Out_File, "output.txt");
           for i in 1..N loop
                for j in 1..N loop
                     put(Output_File,MAFull(i)(j));
                end loop;
                new_line(Output_File);
           end loop;
           close(Output_File);
       else
   	       accept Rez(VMA: out Matrix) do
		  	   VMA:=MA;
	       end;
	   end if;
           Put("Finished T");
       	   Put(Tid);
       	   New_Line;
    end TLeft;   
    ---------------------------------------------------------------------       		    
    task body TRight is		
       MB: Matrix(1..N);
	   K: integer:=(Tid-mid)*H;
	   MC: Matrix(1..K);
	   MA: Matrix(1..K);
    begin		
       Put("Started T");
       Put(Tid);
       New_Line;           
       if Tid = P then			
       	   accept GetMBMC(VMB: in Matrix; VMC: in Matrix) do
			   MB:=VMB;
			   MC:=VMC;
		   end; 
	   else
		   accept Data(VMB, VMC: in Matrix) do
			   MB:=VMB;
			   MC:=VMC;
	       end;
	   end if;

	   if Tid /= P-mid+1 then
		   TR(Tid-1).Data(MB,MC(H+1..K));
       end if;

	   -- Calc
       for i in 1..H loop
           for j in 1..N loop
               MA(i)(j):=0;
               for q in 1..N loop
                   MA(i)(j):=MA(i)(j)+MC(i)(q)*MB(q)(j);
               end loop;
           end loop;
       end loop;

       if Tid /= P-mid+1 then
	   	   TR(Tid-1).Rez(MA(H+1..K));
       end if;

	   if Tid = P then
	   	   accept Rez(VMA: out Matrix) do
			    VMA:=MA;
	       end;
	   else
   	       accept Rez(VMA: out Matrix) do
		  	    VMA:=MA;
	       end;
	   end if;
           Put("Finished T");
       	   Put(Tid);
       	   New_Line;
    end TRight;     
------ Run tasks -------
begin
    -- Create tasks
	for i in 2..P-mid loop
		TL(i):=new TLeft(i);
	end loop;
	for i in P-mid+1..P loop
		TR(i):=new TRight(i);
	end loop;
	TL(1):=new TLeft(1);	
end Run;


------- MAIN PROGRAMM --------
begin        
    Tm1:=Clock;   
	Run;
	New_Line;
    Tm2:=Clock;
    TT:=Tm2-Tm1;
    Put(Integer(TT));    
end Cycle_structure;


