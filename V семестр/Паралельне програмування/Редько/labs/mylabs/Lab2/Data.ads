------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--                  Laboratory work #2. Tasks                   --
--                                                              --
--  File: data.ads                                              --
--  Task: F1: E = A + B + C + D * (MA * MZ)                     -- 
--        F2: MD = (MA * MB) * TRANS(MC)                        --
--        F3: E = (MA * MM) * B + MB * SORT(A)                  --
--                                                              --
--  Author: Redko Alexander, group IO-01                        --
--  Date: 16.09.2012                                            --
--                                                              --
------------------------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

generic
   
   N : in Natural;  -- dimension of Vector and Matrix(N * N)
   
package Data is 

   type Vector is private;
   type Matrix is private;

   procedure F1
      (VA, VB, VC, VD : in Vector;
       MA, MZ         : in Matrix;
       VE             : out Vector);

   procedure F2
      (MA, MB, MC : in Matrix;
       MD         : out Matrix);

   procedure F3
      (VA, VB     : in Vector;
       MA, MB, MM : in Matrix;
       VE         : out Vector);

   procedure Input (Way_To_Fill : in Character;
                    Value : in Integer;
                    V           : out Vector);
   
   procedure Input (Way_To_Fill : in Character;
                    Value : in Integer;
                    MA          : out Matrix);
   
   procedure Output (V : in Vector);

   procedure Output (MA : in Matrix);

   procedure Output (V : in Vector; File : File_Type);

   procedure Output (MA : in Matrix; File : File_Type);
   

   private   
      
      subtype Index is Positive range 1..N;
      type Vector is array (Index) of integer;
      type Matrix is array (Index) of Vector;
      

end Data;
