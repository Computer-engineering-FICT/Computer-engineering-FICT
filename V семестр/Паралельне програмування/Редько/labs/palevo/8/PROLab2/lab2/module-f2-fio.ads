----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #1                     --
--                   IO-73 Pustovit Michael                   --
----------------------------------------------------------------
--                  Variant: 1.27, 2.14, 3.18                 --
----------------------------------------------------------------
---------------------------Module.FIO---------------------------
----------------------------------------------------------------

generic
package Module.F2.FIO is
   --I/O operations
   ---Output for Vector type
   procedure VectOutput(a: Vector);

   ---Matrix output
   procedure MatrixOutput(a: Matrix);

   ---Vector input
   procedure VectInput(a: in out Vector);

   ---Matrix input
   procedure MatrixInput(m: in out Matrix);
end Module.F2.FIO;