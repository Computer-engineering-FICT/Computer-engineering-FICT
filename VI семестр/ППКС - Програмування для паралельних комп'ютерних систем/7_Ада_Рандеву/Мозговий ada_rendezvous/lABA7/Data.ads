with Ada.Text_IO;
use Ada.Text_IO;

generic
   
   N: in Natural;
   
package Data is 

   type    Vector    is array(Integer range <>) of Integer;
   Subtype Vector_N  is Vector(1..N);

   type    Matrix   is array(Integer range <>) of Vector_N;
   Subtype Matrix_N  is Matrix(1..N);
 

   procedure Input ( V    : out Vector;
                     Value : in Integer); 

   procedure Input ( MA    : out Matrix;
                     Value : in Integer);

    procedure Output (V : in Vector);
   procedure Output (MA : in Matrix);

   function Maximum_Of_Matrix (MO : in Matrix) return Integer;

   procedure Calculation (d  : in Integer;
   						  MO : in Matrix; 
						  C : in Integer;
						  MX : in Matrix; 
						  MK : in Matrix_N; 
						  First : in Integer; 
						  Last  : in Integer;
 						  Start : in Integer;
						  MA : out matrix);
                           
    procedure Transpose (MO : in out Matrix);
    
end Data;
