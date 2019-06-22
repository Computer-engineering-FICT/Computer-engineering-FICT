package lab1_package is

   N : constant integer := 4;
   Nd2 : constant integer :=2;
   type TMatrix is array(1..N,1..n) of integer;
   type TMatrix_half is array(1..n,1..nd2) of integer;
   
   procedure Input_Matrix( Matrix_p : out TMatrix );
   procedure Output_Matrix( Matrix_p : in TMatrix );

end lab1_package;
