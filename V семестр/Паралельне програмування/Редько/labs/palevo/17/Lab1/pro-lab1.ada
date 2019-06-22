

 ------------------
 --Laba 1
 --F1:  A=B+C-D*e
 --F2:  MD=MA+MB-MC*MM
 --F3:  k=min(MA*MB*E)
 --
 --Rukavishnikov Gleb
 --
 ------------------------
 with Ada.Text_IO, Ada.Integer_Text_IO, GlebVector;
 use Ada.Text_IO, Ada.Integer_Text_IO;
      
  
 procedure Lab1 is
          N: integer :=3;
          package CurVector is new GlebVector (N);
          use CurVector;
  
 	 	  A: Vector;
          B: Vector; -- := (4,2,2);
          C: Vector;-- := (1,3,1);
          D: Vector;-- := (3,1,0);
   
          E: integer := 2;
          k: integer;
  
          Md: Matrix;
          Ma: Matrix;-- := ((1,1,1),(1,1,1),(1,1,1));
          Mb: Matrix;-- := ((1,1,2),(0,1,0),(1,0,2));
          Mc: Matrix;-- := ((2,1,1),(1,2,1),(1,1,2));
          Mm: Matrix;-- := ((3,2,1),(3,2,1),(3,2,1));
          begin
            InputVector (B);
            InputVector (C);
            InputVector (D);
            
            InputMatrix (MA);
            InputMatrix (MB);
            InputMatrix (MC);
            InputMatrix (MM);
            F1 (A,B,C,D,e);
            F2 (MD,MA,MB,MC,MM);
            F3 (k,MA,MB,e);       
           end Lab1;
