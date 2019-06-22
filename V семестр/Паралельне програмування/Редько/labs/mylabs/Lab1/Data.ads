------------------------------------------------------------------
--                                                              --
--              Parallel and Distributed Computing              --
--         Laboratory work #1. Subprograms and packages         --
--                                                              --
--  File: data.ads                                              --
--  Task: F1: E = A + B + C + D * (MA * MZ)                     -- 
--        F2: MD = (MA * MB) * TRANS(MC)                        --
--        F3: E = (MA * MM) * B + MB * SORT(A)                  --
--                                                              --
--  Author: Redko Alexander, group IO-01                        --
--  Date: 09.09.2012                                            --
--                                                              --
------------------------------------------------------------------

generic
   
   N: in Natural; -- dimension of Vector and Matrix(N * N)

package Data is 

   type Vector is private;
   type Matrix is private;

   ---------------------------------------
   -- F1: E = A + B + C + D * (MA * MZ) --
   ---------------------------------------

   procedure F1
      (VA, VB, VC, VD : in Vector;
       MA, MZ         : in Matrix;
       VE             : out Vector);

   ------------------------------------
   -- F2: MD = (MA * MB) * TRANS(MC) --
   ------------------------------------

   procedure F2
      (MA, MB, MC : in Matrix;
       MD         : out Matrix);

   ------------------------------------------
   -- F3: E = (MA * MM) * B + MB * SORT(A) --
   ------------------------------------------

   procedure F3
      (VA, VB     : in Vector;
       MA, MB, MM : in Matrix;
       VE         : out Vector);

   ------------------
   -- Input_Vector --
   ------------------

   procedure Input_Vector(V : out Vector);
   
   ------------------
   -- Input_Matrix --
   ------------------

   procedure Input_Matrix(MA : out Matrix);

   -------------------
   -- Output_Vector --
   -------------------

   procedure Output_Vector(V : in Vector);

   -------------------
   -- Output_Matrix --
   -------------------

   procedure Output_Matrix(MA : in Matrix);
   

   --procedure Initialize_Default  (VA, VB, VC, VD     : in out Vector;
                                  --MA, MZ, MB, MC, MM : in out Matrix);
   
   private   
      
      subtype Index is Integer range 1..N;
      type Vector is array (Index) of Integer;
      type Matrix is array (Index) of Vector;

end Data;
