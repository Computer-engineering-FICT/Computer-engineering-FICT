separate (Vector_F1)
 
-- Umnojenie vektorov
function Vector_Product(A,B: Vector) return Integer is
   C: Integer;
begin
   C:=0;
   for i in 1..N loop
      C:=C+A(i)*B(i);
   end loop;
   return C;
end Vector_Product;