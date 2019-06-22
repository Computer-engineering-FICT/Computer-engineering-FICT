with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;


-- Therefore in Ada 83, there existed the restriction that out parameters are write-only.
-- If you wanted to read the value written, you had to declare a local variable, do all
-- calculations with it, and finally assign it to C before return. This was awkward and
-- error prone so the restriction was removed in Ada 95.

package body Data is
   procedure generate(A: out Vector) is
   begin
      for i in A'Range loop
         A(i) := 1;
      end loop;
   end generate;

   procedure generate(MA: out Matrix) is
   begin
      for i in MA'Range loop
         for j in MA'Range loop
            MA(i)(j) := 1;
         end loop;
      end loop;
   end generate;


   procedure output(A: in Vector) is
   begin
      put("[");
      for i in A'Range loop
         put(A(i), Width => 10);

         if i /= A'Last then
            put(", ");
         end if;
      end loop;
      put_line("]");
   end output;

   procedure output(MA: in Matrix) is
   begin
      put_line("[");
      for i in MA'Range loop

         put("   [");
         for j in MA'Range loop

            put(MA(i)(j), Width => 10);

            if j /= MA'Last then
              put(", ");
            end if;
         end loop;
         put("]");

         if i /= MA'Last then
            put_line(", ");
         else
            new_line;
         end if;
      end loop;
      put_line("]");
   end output;
end Data;
