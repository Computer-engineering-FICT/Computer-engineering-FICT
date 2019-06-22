generic

   -- Parametr paketa - razmernost' (po umolchaniyu 5)
   N:Integer:=5;

package Vector_F1 is

   -- Vektor razryadnosti N
   type Vector is private;

   -- Funkciya1
   function Fun1(A,B,C: Vector) return Integer;

private

   function Vector_Sort(A: in Vector; des: in Boolean)
                        return Vector;

   type Vector is array (1..N) of Integer;

end Vector_F1;
