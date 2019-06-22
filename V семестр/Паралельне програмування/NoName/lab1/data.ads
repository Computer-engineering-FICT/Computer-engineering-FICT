generic
   N : in Integer;

package Data is

   type Vector is array(1..N) of Integer;
   type Matrix is array(1..N) of Vector;
   procedure F1(vectorA, vectorB, vectorC: in Vector; matrixA, matrixE: in Matrix; vectorD: out Vector);
   procedure F2(matrixH, matrixK: in Matrix; integerRes: out Integer);
   procedure F3(matrixR, matrixS: in Matrix; vectorR: in Vector; integerRes: out Integer);

   procedure putVector(vect: in Vector);
   procedure putMatrix(matr: in Matrix);

   procedure randomVector(vect: out Vector);
   procedure randomMatrix(matr: out Matrix);

   procedure fillVector(vect: out Vector);
   procedure fillMatrix(matr: out Matrix);

end Data;
