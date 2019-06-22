with Ada.Text_IO;
     use Ada.Text_IO;

     generic
        N: in Natural;

     package Data is
        type Vector is array (1..N) of Integer;
        type Matrix is array (1..N) of Vector;
        procedure Input (Value : in Integer; V : out Vector);
        procedure Input (Value : in Integer;  MA : out Matrix);
        procedure Output (V : in Vector);
        procedure Output (MA : in Matrix);
     end Data;
