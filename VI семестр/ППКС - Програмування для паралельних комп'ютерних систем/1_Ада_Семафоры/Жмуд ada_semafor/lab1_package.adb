with ada.text_IO;
use ada.text_IO;
with ada.integer_text_io;
use ada.integer_text_io;

package body lab1_package is
------------------------------------------------------
   procedure Input_Matrix( Matrix_p : out TMatrix ) is
   begin
   	  new_line;	
      Put( "Input Matrix : " );
      for i in 1..N loop
         for j in 1..N loop
            get( Matrix_p(i,j) );
         end loop;
      end loop;
   end;
------------------------------------------------------
   procedure Output_Matrix( Matrix_p : in TMatrix ) is
   begin
	  new_line;		
      for i in 1..N loop
         for j in 1..N loop
            put( Matrix_p(i,j) , 10);
         end loop;
         put_line( " " );
      end loop;
   end;
------------------------------------------------------
end lab1_package;
