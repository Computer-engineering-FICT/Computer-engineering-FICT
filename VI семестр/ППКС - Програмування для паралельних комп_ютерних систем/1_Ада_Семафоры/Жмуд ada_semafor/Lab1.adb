with Ada.Synchronous_Task_Control;   
use  Ada.Synchronous_Task_Control;
With Ada.Text_io,Ada.integer_text_io;   
use  Ada.Text_io,Ada.integer_text_io;
with lab1_package;   
use  lab1_package;

procedure Lab1 is
	a : integer;
	MX,MY,MZ,mE,MF : TMatrix;
	MA,MB,MC : TMatrix;
	SKUA, SKUME, SKUMF, sem1, sem2, sem3, sem4, sem5 : suspension_object;
  
  procedure RunTasks is
 
    Task T1;
    Task T2; 
       
    Task body T1 is
      i, j, k, l : integer;
	  a1 : integer;
	  ME1,MF1 : TMatrix;
    begin
      new_line;
      put(" -= task T1 has been started =- ");
      Input_matrix(ME);
	  Input_Matrix(MY);

      Set_True(sem1);
      Suspend_Until_True(sem3);
      
      Suspend_Until_True(SKUA);
      a1 := a;
      Set_True(SKUA);


 	--calculate MAh1
	for i in 1..n loop
       for j in 1..nd2 loop
          MA(i,j) := a1 * MY(i,j);
       end loop;
 	end loop;

 	Set_True(sem2);
 	Suspend_Until_True(sem4);

 	Suspend_Until_True(SKUME);
      ME1 := ME;
	Set_True(SKUME);

 	--calculate MBh1
 	for i in 1..N loop 
       for j in 1..Nd2 loop
          k := 0;
		  for l in 1..n loop
	   		 k := k + MZ(l,j) * ME1(i,l);
	  	  end loop;
		  MB(i,j) := k;
       end loop;
 	end loop;

	Suspend_Until_True(SKUMF);
      MF1 := MF;
	Set_True(SKUMF);

    --calculate MCh1 
 	for i in 1..N loop 
       for j in 1..Nd2 loop
          k := 0;
		  for l in 1..n loop
	   		 k := k + MB(l,j) * MF1(i,l);
	  	  end loop;
		  MC(i,j) := k;
       end loop;
 	end loop;

    --calculate MXh1
	for i in 1..n loop
       for j in 1..nd2 loop
          MX(i,j) := MA(i,j) * MC(i,j);
       end loop;
 	end loop;

 	Suspend_Until_True(sem5);
   
	--result outputting
      skip_line;
	  new_line;
      put("Result :  MX = ");   
      OutPut_Matrix(MX);
     
      new_line;
      put(" -= task T1 has been finished =- ");
    end T1;



    Task body T2 is
      i, j, k : integer;
	  a2 : integer;
	  ME2,MF2 : TMatrix;
    begin
      new_line;
      Suspend_Until_True(sem1);
	  put(" -= task T2 has been started =- ");
      	  	  
	  Put(" Input a : "); Get(a);
      Input_Matrix(MZ);
	  Input_Matrix(MF);
      
	  Set_True(sem3);
      
      
      Suspend_Until_True(SKUA);
      A2 := A;
      Set_True(SKUA);

 	--calculate MAh2
	for i in 1..n loop
       for j in nd2+1..n loop
          MA(i,j) := a2 * MY(i,j);
       end loop;
 	end loop;

 	Set_True(sem4);
 	Suspend_Until_True(sem2);

 	Suspend_Until_True(SKUME);
      ME2 := ME;
	Set_True(SKUME);

 	--calculate MBh2
 	for i in 1..N loop 
       for j in Nd2+1..n loop
          k := 0;
		  for l in 1..n loop
	   		 k := k + MZ(l,j) * ME2(i,l);
	  	  end loop;
		  MB(i,j) := k;
       end loop;
 	end loop;

	Suspend_Until_True(SKUMF);
      MF2 := MF;
	Set_True(SKUMF);

    --calculate MCh2 
 	for i in 1..N loop 
       for j in Nd2+1..n loop
          k := 0;
		  for l in 1..n loop
	   		 k := k + MB(l,j) * MF2(i,l);
	  	  end loop;
		  MC(i,j) := k;
       end loop;
 	end loop;

    --calculate MXh1
	for i in 1..n loop
       for j in nd2+1..n loop
          MX(i,j) := MA(i,j) * MC(i,j);
       end loop;
 	end loop;

 	  new_line;
      put(" -= task T2 has been finished =- ");
	  Set_True(sem5);
    end T2;
    
  begin
     null;
  end RunTasks;

begin
   new_line;
   put(" -= program's been started =- ");
   Set_True(SKUA);
   Set_True(SKUME); 
   Set_True(SKUMF); 
   RunTasks;
   new_line;
   put(" -= program's been finished =- ");
end Lab1;