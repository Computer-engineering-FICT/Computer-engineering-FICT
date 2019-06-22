With Ada.text_IO, Ada.Integer_text_IO, Ada.Calendar;
use Ada.text_IO, Ada.Integer_text_IO, Ada.Calendar;

procedure fully_connected_structure is
    N: integer := 100;
    P: integer := 4;
    H: integer := N/P; 
    mid: integer := P/2;   
    Tm1, Tm2: Time;
    TT: Duration;
                                  
    type Vector is array (1..N) of Integer;
 
    type Matrix is array (Integer range <>) of Vector;
    		
	procedure Run is

	task type Task1 is
	end Task1;

	type Task1Pointer is access Task1;

	T1: Task1Pointer;	

   	task type Tasks(Tid:integer) is
		entry Data(VMB, VMC: in Matrix);
       	entry Rez(VMA: out Matrix);
	end Tasks;

	type TasksPointer is access Tasks;

	TT: array (2..P) of TasksPointer;	

	task body Task1 is		
	   MB: Matrix(1..N);
	   MC: Matrix(1..N);
	   MA: Matrix(1..N);
       Output_File: Ada.Text_IO.File_type;
	begin		
       Put("Started T");
       Put("          1");
       New_Line;           
       -- Enter MB, MC
       for i in 1..N loop
       		for j in 1..N loop
           		MB(i)(j):=1;
           		MC(i)(j):=1;
       		end loop;
       end loop;	

	   for i in 2..P loop
			TT(i).Data(MB,MC(H+1..2*H));
	   end loop;
		      
	   -- Calc
       for i in 1..H loop
           for j in 1..N loop
               MA(i)(j):=0;
               for q in 1..N loop
                   MA(i)(j):=MA(i)(j)+MC(i)(q)*MB(q)(j);
               end loop;
           end loop;
       end loop;

       for i in 2..P loop
	   	   TT(i).Rez(MA((i-1)*H+1..i*H));
       end loop;
	
       --output
       --Input_Matrix(MA);
       Create(Output_File, Out_File, "output.txt");
       for i in 1..N loop
            for j in 1..N loop
                 put(Output_File,MA(i)(j));
            end loop;
            new_line(Output_File);
       end loop;
       close(Output_File);

       Put("Finished T");
       Put("          1");
       New_Line;
    end Task1;   
    ---------------------------------------------------------------------       		    
    task body Tasks is		
       MB: Matrix(1..N);
	   MC: Matrix(1..H);
	   MA: Matrix(1..H);
    begin		
       Put("Started T");
       Put(Tid);
       New_Line;           

	   accept Data(VMB, VMC: in Matrix) do
		   MB:=VMB;
		   MC:=VMC;
	   end;

	   -- Calc
       for i in 1..H loop
           for j in 1..N loop
               MA(i)(j):=0;
               for q in 1..N loop
                   MA(i)(j):=MA(i)(j)+MC(i)(q)*MB(q)(j);
               end loop;
           end loop;
       end loop;

	   accept Rez(VMA: out Matrix) do
			 VMA:=MA;
	   end;
	   
       Put("Finished T");
       Put(Tid);
       New_Line;
    end Tasks;     
------ Run tasks -------
begin
    -- Create tasks
	for i in 2..P loop
		TT(i):=new Tasks(i);
	end loop;
	T1:=new Task1;	
end Run;
------- MAIN PROGRAMM --------
begin        
    Tm1:=Clock;   
	Run;
	New_Line;
    Tm2:=Clock;
    TT:=Tm2-Tm1;
    Put(Integer(TT));    
end fully_connected_structure;

