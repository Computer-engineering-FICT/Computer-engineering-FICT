Package Matrix_Pack Is
   n : integer := 100*9;
   p : integer := 9;
   h : integer := n / p;

   type All_Vector is array (positive range<>)of integer;
   subtype Vector is All_Vector (1 .. N);
   subtype Vector_H is All_Vector (1 .. H);
   subtype Vector_2H is All_Vector (1 .. 2 * H);
   subtype Vector_3H is All_Vector (1 .. 3 * H);
   subtype Vector_4H is All_Vector (1 .. 4 * H);

   type All_Matrix is array (positive range<>)of Vector;
   subtype Matrix is All_Matrix (1 .. N);
   subtype Matrix_H is All_Matrix (1 .. H);
   subtype Matrix_2H is All_Matrix (1 .. 2 * H);
   subtype Matrix_4H is All_Matrix (1 .. 4 * H);

   function getVector (d : in integer) return Vector;
   function getMatrix (d : in integer) return Matrix;
   procedure putMatrix (MA : in Matrix);
   procedure putVector (A : in Vector);
   procedure mainCalc (Ah : out Vector_H; a : in integer; B : in Vector; MX : in Matrix; MZ : in Matrix_H; ME : in Matrix_H);

End Matrix_Pack;