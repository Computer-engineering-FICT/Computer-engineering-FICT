generic

package Vector_F1.Matrix_F2 is

   -- Matrica razryadnosti N*N
   type Matrix is private;

   -- Funkciya2
   function Fun2(MA,MB: Matrix) return Matrix;

private

   type Matrix is array (1..N) of Vector;

end Vector_F1.Matrix_F2;

