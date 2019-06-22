 generic
         N: integer;
 package GlebVector is
 
         type Vector is private;
         type Matrix is array (1..N) of vector;
         
         procedure InputVector (V: out vector);
         procedure InputMatrix (M: out matrix);
         
         procedure F1 (A: out vector; B,C,D: in vector; e: in integer);
         procedure F2 (MD: out matrix; MA,MB,MC,MM: in matrix);
         procedure F3 (k: out integer; MA,MB: in matrix; e: in integer);
                    
         
     private
         type Vector is array (1..N) of integer;
 end GlebVector;
  
 with Ada.Integer_Text_IO, Ada.Text_IO;
 use Ada.Integer_Text_IO, Ada.Text_IO;
  
 package body GlebVector is 
     	 
     	 procedure InputVector (V: out vector) is 
            buf: integer;  
          	begin
                put ("Enter vector - ");
                put (N,3);
                put (" numbers: ");
            	for i in 1..N loop
   	            	Get(buf); 
                    V(i) := buf;   
                    put ("   ");    
				end loop;
          	end InputVector;
          
         procedure InputMatrix (M: out matrix) is 
            buf: integer;  
          	begin
                put ("Enter matrix ");
                put (N,3);
                put ("x");
                put (N,3);
                put (" : ");
                for i in 1..N loop
                    for j in 1..N loop
   	            		Get(buf); 
                    	M(i)(j) := buf;   
                    	put ("   ");    
                    end loop; 
                    New_Line;   
				end loop;
            end InputMatrix;        
       	      
         procedure PlusVect (A: out Vector; B: in Vector) is
         	begin
                for i in 1..N loop
   	                   	A(i):=A(i)+B(i);
				end loop;
            end PlusVect;
  
         procedure MinusVect (A: out Vector; B: in Vector) is
		begin
			for i in 1..N loop
				A(i):=A(i)-B(i);
			end loop;
		end MinusVect;

	 procedure MultiVectVect (A: out Vector; B: in Vector) is
		begin
			for i in 1..N loop
				A(i):=A(i)*B(i);
			end loop;
		end MultiVectVect;

	 procedure multiVectNum (A: out Vector; e: in integer) is
		begin
			for i in 1..N loop
				A(i):=A(i)*e;
			end loop;
		end MultiVectNum;

     procedure PutVect (V: in Vector) is    
		begin
			Ada.Text_IO.Put("(");
				for i in 1..N loop
					Ada.Integer_Text_IO.Put(V(i),2);        
				end loop;
			Ada.Text_IO.Put(")");
		end PutVect;

	 function  MultiplyStep (A: in Vector; B: in Vector) return integer is
		Rez: integer := 0;
		begin
			for i in 1..N loop
				Rez := Rez+A(i)*B(i);
			end loop;

			return Rez;
 		end MultiplyStep;
          
   --=====================================================--
   
  
	 procedure PlusMatr (A: out Matrix; B: in Matrix) is
		begin
			for i in 1..N loop
				PlusVect (A(i),B(i));
			end loop;
		end PlusMatr;

         procedure MinusMatr (A: out Matrix; B: in Matrix) is
		begin
			for i in 1..N loop
				MinusVect (A(i),B(i));
			end loop;
		end MinusMatr;

	 procedure MultiMatrMatr (A: out Matrix; B: in Matrix) is
		RezMatr: Matrix;
		v: Vector;
		begin
			for i in 1..N loop      -- счетчик вертикалей
				for j in 1..N loop    -- формирует вертикальный
					v(j) := B(j)(i);  -- вектор второй матрицы 
				end loop;             -- из номера вертикали
				for k in 1..N loop      -- счетчик горизонталей
  					RezMatr(k)(i) := MultiplyStep (A(k),v);
				end loop;
			end loop;
			A := RezMatr; 
		end MultiMatrMatr;

         procedure MultiMatrNum (A: out Matrix; e: in integer) is
		begin
			for i in 1..N loop
				multiVectNum (A(i),e);
			end loop;
		end MultiMatrNum;
  
         procedure PutMatr (Mat: in Matrix) is
		begin
			for i in 1..N loop
				PutVect (Mat(i));
				Ada.Text_IO.New_Line;   
			end loop;
		end PutMatr;

	 function minOfMatr (Mat: in Matrix) return integer is
		Rez: integer;
		begin
			Rez := Mat (1)(1);
			for i in 1..N loop
				for j in 1..N loop
					if Mat(i)(j) < Rez then
						Rez := Mat(i)(j);
					end if;
				end loop;               
			end loop;
			return Rez;             
		end minOfMatr;

        
  		procedure F1 (A: out vector; B,C,D: in vector; e: in integer) is
            v: vector;  
			begin
  		       Put("F1 - vectors "); 
               New_Line;
               A := B;
               PutVect(A);
 	           Put(" + "); 
               PutVect(C);
               Put(" = "); 
               PlusVect (A,C);        -- A=B+C
               PutVect(A);
               New_Line;
               
               v := D;
               PutVect(v); 
               Put(" * "); 
               Put(E,8); 
               Put(" = "); 
               MultiVectNum (v,e); 		--D*e
               PutVect(v);
               New_Line;
                            
               PutVect(A);
 	           Put(" - "); 
               PutVect(v);
               Put(" = "); 
               MinusVect (A, v);      -- A=B+C-D*e
               PutVect(A); 
               New_Line;
               New_Line;
        	end F1;
          
		procedure F2 (MD: out matrix; MA,MB,MC,MM: in matrix) is
            BufM: matrix;
        	begin
         		Put("F2 - matrix ");
                New_Line;
                MD := MA;
                PutMatr(MD);
                Put("    +");
                New_Line;
                PutMatr(MB);
                Put("    =");
                New_Line;
                PlusMatr (MD,MB);               -- MD=MA + MB
                PutMatr(MD);
                New_Line;
                
                BufM := MC;
                PutMatr(BufM);
                Put("    x");
                New_Line;
                PutMatr(MM);
                Put("    =");
                New_Line;
                MultiMatrMatr (BufM, MM);   	    --BufM = MC x MM
                PutMatr(BufM);
                New_Line;
                
                PutMatr(MD);
                Put("    -");
                New_Line;
                PutMatr(BufM);
                Put("    =");
                New_Line;
                MinusMatr (MD,BufM);              -- MD = MA + MB - MCxMM
                PutMatr(MD);
                New_Line;
             end F2;   
                  
	procedure F3 (k: out integer; MA,MB: in matrix; e: in integer) is
 		BufM: matrix; 
 		begin
   			Put("F3 - min in matrix ");  
            New_Line;
   			BufM := MA;
            PutMatr(BufM);
            Put("    x");
            New_Line;
            PutMatr(MB);
            Put("    =");
            New_Line;       
            MultiMatrMatr (BufM,MB);         -- MA x MB       
            
            PutMatr(BufM);
            Put("    x");
            New_Line;
            Put(E,8); 
            New_Line;
            Put("    =");
            New_Line; 
            MultiMatrNum (BufM,e);             -- MA x MB * e  
            PutMatr(BufM);
            
            k := minOfMatr(BufM);
            Put(k);              --min (MA x MB * e)       
            Put(" is minimum "); 
  	end F3;             
               
                   
                 
            
 end GlebVector;
