                                       -- Chapter 3 - Program 1
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is

   Index : INTEGER;           -- A simple Integer type

begin

   Index := 23;
   Put("The value of Index is");
   Put(Index);                -- The default field width is 11 columns
   New_Line;
   Index := Index + 12;
   Put("The value of Index is");
   Put(Index, 8);
   New_Line;

end Main;




-- Result of execution

-- The value of Index is         23
-- The value of Index is      35
