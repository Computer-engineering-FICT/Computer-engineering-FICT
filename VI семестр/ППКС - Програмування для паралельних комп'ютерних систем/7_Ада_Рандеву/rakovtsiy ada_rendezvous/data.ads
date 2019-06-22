generic
   -- Vector & Matrix dimensions
   N: integer;

package Data is
   type VectorBase is array(Integer range <>) of Integer;
   subtype Vector is VectorBase(1..N);
   type MatrixBase is array(Integer range <>) of Vector;
   subtype Matrix is MatrixBase(1..N);

   procedure generate(A: out Vector);

   procedure generate(MA: out Matrix);

   procedure output(A: in Vector);

   procedure output(MA: in Matrix);
end Data;


