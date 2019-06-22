-------------------------------------------------------------------------------
--                                                                           --
--                   Parallel and Distributed Computing                      --
--                        Lab7. Ada. Rendezvous                              --
--                                                                           --
--  File: data.ads                                                           --
--  Task: A = max(MO)*B + alpha*C*(MO*MK)                                    --
--                                                                           --
--  Author: Dremov Andrey, group IO-01                                       --
--  Date: 30.05.2013                                                         --
--                                                                           --
-------------------------------------------------------------------------------

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

   procedure Calculation (
      Alpha  : in Integer;
      M  : in Integer;
      B : in Vector;
      C : in Vector_N;
        MK : in Matrix_N;
        MO : in Matrix;
      First : in Integer;
      Last  : in Integer;
      A : out Vector);
                           
    procedure Transpose (MO : in out Matrix);
    
end Data;
