----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #2                     --
--                   IO-73 Rukavishnikov Gleb                 --
----------------------------------------------------------------
--Variant: 1.12, 2.20, 3.24                                   --
--F1:  A=B+C-D*e                                              --
--F2:  MD=MA+MB-MC*MM                                         --
--F3:  k=min(MA*MB*å)                                         --
----------------------------------------------------------------
--------------------Vector_F1.Matrix_F2.FIO---------------------
----------------------------------------------------------------

generic
package Vector_F1.Matrix_F2.FIO is
   --I/O operations
   ---Output for Vector type
   procedure VectOutput(A: Vector);

   ---Matrix output
   procedure MatrixOutput(a: Matrix);

   ---Vector input
   procedure VectInput(a: in out Vector);

   ---Matrix input
   procedure MatrixInput(m: in out Matrix);
end Vector_F1.Matrix_F2.FIO;
