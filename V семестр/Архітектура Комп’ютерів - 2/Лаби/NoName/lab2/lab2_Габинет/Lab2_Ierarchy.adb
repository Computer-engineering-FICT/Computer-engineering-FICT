-----------------------------
--IV-91, FIVT
--Tserkus Andrey 
--Lab 2 Parent Package 
--9/10/01
--
--Variant: 1)05 2)05 3)26
--
--Kiev, 2001
-----------------------------
package User_Main_Package is

   --Types
   subtype T_Index is Positive;
   subtype T_Element is Integer;   
   
   --Variables
    
   --Private types
   type T_Vector is private;
   type T_Matrix is private;
   
   --Misc procedures
   procedure Set_Internal_Size(New_N:T_Index);

   
private

	--Variables
	N : T_Index := 100;

   --Types
   type T_Vector is array (1..N) of T_Element;
   type T_Matrix is array (1..N) of T_Vector;

   --Constants
   Operation_Add : constant Integer := 1;
   Operation_Subtract : constant Integer := -1;

   --Procedures
   procedure Sort_Vector (Vector : in out T_Vector);
   procedure Add_Or_Subtract(Operation: in Integer; A, B : in T_Vector; C : out T_Vector); 
   procedure Max_Vector(Vector: in T_Vector; Max: out T_Element);
   procedure Sort_Matrix(Matrix : in out T_Matrix);
   procedure Vector_2_Matrix_Column(Vector: in T_Vector; Matrix: out T_Matrix);
   procedure Matrix_2_Vector_Column(Index: in T_Index; Matrix: in T_Matrix; Vector: out T_Vector);
   procedure Multiply_Matrixes(Matrix1,Matrix2: in T_Matrix; Matrix_Result: out T_Matrix);
   	
end User_Main_Package;

package body User_Main_Package is

   --Invisible declarations
   
  
   --Procedures

   --Sets size of vectors and matrixes - N
   procedure Set_Internal_Size(New_N:T_Index) is
   begin
      N:= New_N;
   end;
   
   --Finds maximal element of vector------------------------------
   procedure Max_Vector(Vector: in T_Vector; Max: out T_Element) is
   begin
      Max := Vector(1);
      for I in 2..N loop
         if Vector(I) > Max then
            Max := Vector(I);
         end if;
      end loop;
   end Max_Vector;
   
   --Sorts vector in increasing order by straight inserting------------------------------
   procedure Sort_Vector (Vector : in out T_Vector) is
      Current_Index : T_Index;
      Temp : T_Element;
   begin
      for I in 1..N-1 loop
         Current_Index := I;
         for J in I+1..N loop
            if Vector(Current_Index) < Vector(J) then
               Current_Index := J;
            end if;
         end loop;
         if Current_Index /= I then
            Temp := Vector(I);
            Vector(I) := Vector(Current_Index);
            Vector(Current_Index) :=  Temp;
         end if;
      end loop;
   end Sort_Vector;
   
   --Sorts matrix (strings in increasing order)------------------------------
   procedure Sort_Matrix(Matrix : in out T_Matrix) is
   begin
      for I in 1..N loop
         Sort_Vector(Matrix(I));
      end loop;
   end Sort_Matrix;
   
   --Perfom + or - on vectors------------------------------
   procedure Add_Or_Subtract(Operation: in Integer; A, B : in T_Vector; C : out T_Vector) is
   begin
      for I in 1..N loop
         C(I) := A(I) + Operation*B(I);
      end loop;
   end Add_Or_Subtract;
   
   --Turns vector to matrix making it a column------------------------------
   procedure Vector_2_Matrix_Column(Vector: in T_Vector; Matrix: out T_Matrix) is
   begin
      for I in 1..N loop
         for J in 1..N loop
            Matrix(I)(J):=0;         
         end loop;
      end loop;
      for I in 1..N loop
         Matrix(I)(1):=Vector(I);         
      end loop;
   end Vector_2_Matrix_Column;
   
   --Turns column N from matrix into a vector------------------------------
   procedure Matrix_2_Vector_Column(Index: in T_Index; Matrix: in T_Matrix; 
         Vector: out T_Vector) is
   begin
      for I in 1..N loop
         Vector(I) := Matrix(I)(Index);         
      end loop;
   end Matrix_2_Vector_Column;
   
   --Mutliplies Matrix1 on Matrix2 returning result in Matrix_Result---------------------------
   procedure Multiply_Matrixes(Matrix1,Matrix2: in T_Matrix; Matrix_Result: out T_Matrix) is
      Sum : T_Element;
   begin
      for I in 1..N loop      
         for J in 1..N loop
            --Construct sum for current element
            Sum := 0;
            for K in 1..N loop
               Sum := Sum + Matrix1(I)(K)*Matrix2(K)(J);
            end loop;
            --End of sum construction
            Matrix_Result(I)(J) := Sum;
         end loop;
      end loop;
   end;
   
   begin
   null;
end User_Main_Package;

-----------------------------
--IV-91, FIVT
--Tserkus Andrey 
--Lab 2 IO Child Level 1 Package 
--9/10/01
--
--Variant: 1)05 2)05 3)26
--
--Kiev, 2001
-----------------------------
package User_Main_Package.Io is

   procedure Get_Vector(Vector : out T_Vector);
   procedure Put_Vector(Vector : in T_Vector);
   procedure Get_Matrix(Matrix : out T_Matrix);
   procedure Put_Matrix(Matrix : in T_Matrix);
   
end User_Main_Package.Io;

--Used units   
with Ada.Text_Io; use Ada.Text_Io;      
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;      
with Ada.Numerics.Discrete_Random;

package body User_Main_Package.Io is

   --Types
   subtype T_Random_Element is T_Element range -12..12;

   --New random package
   package Random_Pack is new Ada.Numerics.Discrete_Random (T_Random_Element);
   use Random_Pack;
   
   --Variables
   G: Generator;
 
   --Gets vector of values from user------------------------------
   procedure Get_Vector(Vector : out T_Vector) is
   begin
      for I in 1..N loop
         --Get(Vector(I));
         --Skip_Line;
         Vector(I) := Random(G);
      end loop;
   end Get_Vector;

   --Puts vector of values to screen------------------------------
   procedure Put_Vector(Vector : in T_Vector) is
   begin
      for I in 1..N loop
         Put(Item=>Vector(I),Width=>3);
         Put(" ");
      end loop;
      New_Line(1);
   end;
   
   --Gets Matrix of values from user------------------------------
   procedure Get_Matrix(Matrix : out T_Matrix) is
   begin
      for I in 1..N loop
         Put("Enter string(vector) #");
         Put(Item=>I, Width=>1);
         Put(":");
         New_Line(1);
         Get_Vector(Matrix(I));
      end loop;
   end Get_Matrix;
   
   --Puts matrix of values to screen------------------------------
   procedure Put_Matrix(Matrix : in T_Matrix) is
   begin
      for I in 1..N loop
         Put_Vector(Matrix(I));
      end loop;
   end Put_Matrix;

begin
   Reset(G);   
end User_Main_Package.Io;

-----------------------------
--IV-91, FIVT
--Tserkus Andrey 
--Lab 2 F1 Child Level 2 Package 
--9/10/01
--
--Variant: 1)05 2)05 3)26
--
--Kiev, 2001
-----------------------------
package User_Main_Package.Io.F1_Pack is

   procedure F1(A,B : in T_Vector; C: out T_Vector; Log: in Boolean);
   
end User_Main_Package.Io.F1_Pack;

with Ada.Text_Io; use Ada.Text_Io;      
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;      

package body User_Main_Package.Io.F1_Pack is
  
   --F1: C = SORT(A) + SORT(B)------------------------------
   procedure F1(A,B : in T_Vector; C: out T_Vector; Log: in Boolean) is
      Sorted_A,Sorted_B: T_Vector;
   begin
      Sorted_A := A;
      Sort_Vector(Sorted_A);
      Sorted_B := B;
      Sort_Vector(Sorted_B);
      Add_Or_Subtract(Operation_Subtract,A,B,C);
      if Log then 
         Put ("Vector A:              ");
         Put_Vector(A);
         Put ("Vector B:              ");
         Put_Vector(B);
         Put ("SORT(A):               ");
         Put_Vector(Sorted_A);
         Put ("SORT(B):               ");
         Put_Vector(Sorted_B);
         Put ("C = SORT(A) - SORT(B): ");
         Put_Vector(C);
         Put ("Press ENTER...");
         Skip_Line;
         New_Line(1);      
      end if;
   end;

begin
	null;
end User_Main_Package.Io.F1_Pack;

-----------------------------
--IV-91, FIVT
--Tserkus Andrey 
--Lab 2 F2 Child Level 2 Package 
--9/10/01
--
--Variant: 1)05 2)05 3)26
--
--Kiev, 2001
-----------------------------
package User_Main_Package.Io.F2_Pack is

   procedure F2(M_A : in T_Matrix; M_X: out T_Matrix; Log: Boolean);

end User_Main_Package.Io.F2_Pack;

with Ada.Text_Io; use Ada.Text_Io;      
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;      

package body User_Main_Package.Io.F2_Pack is   
	
   --F2: MX = SORT(MA)------------------------------
   procedure F2(M_A : in T_Matrix; M_X: out T_Matrix; Log: Boolean) is
   begin
      M_X := M_A;
      Sort_Matrix(M_X);
      if Log then 
         Put("MA: ");
         New_Line(1);
         Put_Matrix(M_A);
         Put ("MX = SORT(MA): ");
         New_Line(1);
         Put_Matrix(M_X);
         Put ("Press ENTER...");
         Skip_Line;
         New_Line(1);
      end if;   
   end;

begin
	null;
end User_Main_Package.Io.F2_Pack;

-----------------------------
--IV-91, FIVT
--Tserkus Andrey 
--Lab 2 F3 Child Level 2 Package 
--9/10/01
--
--Variant: 1)05 2)05 3)26
--
--Kiev, 2001
-----------------------------
package User_Main_Package.Io.F3_Pack is

   procedure F3(M_A,M_B : in T_Matrix; B,C,R: in T_Vector; S: out T_Element; Log: Boolean);

end User_Main_Package.IO.F3_Pack;

with Ada.Text_Io; use Ada.Text_Io;      
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;      

package body User_Main_Package.IO.F3_Pack is   
	
   --F3: s = Max(MA*B + MB*C - R)------------------------------
   procedure F3(M_A,M_B : in T_Matrix; B,C,R: in T_Vector; S: out T_Element; Log: Boolean) is
      M_Vector_B, M_Vector_C, M_Y, M_Z : T_Matrix;
      A1, A2, A_12, A_R12: T_Vector;
   
   begin
      Vector_2_Matrix_Column(B,M_Vector_B);
      Multiply_Matrixes(M_A,M_Vector_B,M_Y);
      Vector_2_Matrix_Column(C,M_Vector_C);
      Multiply_Matrixes(M_B,M_Vector_C,M_Z);
      Matrix_2_Vector_Column(1,M_Y,A1);
      Matrix_2_Vector_Column(1,M_Z,A2);
      -- s = MAX(A1 + A2 - R);
      Add_Or_Subtract(Operation_Add,A1,A2,A_12);
      Add_Or_Subtract(Operation_Add,A_12,R,A_R12);
      Max_Vector(A_R12,S);
      if Log then
         Put("Matrix MA: ");
         New_Line(1);
         Put_Matrix(M_A);
         Put("Vector B: ");
         New_Line(1);
         Put_Matrix(M_Vector_B);
         Put("Matrix MY = MA*B: ");
         New_Line(1);
         Put_Matrix(M_Y);
         Put ("Press ENTER...");
         Skip_Line;
         Put("Matrix MB: ");
         New_Line(1);
         Put_Matrix(M_B);
         Put("Vector C: ");
         New_Line(1);
         Put_Matrix(M_Vector_C);
         Put("Matrix MZ = MB*C: ");
         New_Line(1);
         Put_Matrix(M_Z);
         Put ("Press ENTER...");
         Skip_Line;
         Put("Vector A_12 = MY + MZ: ");
         New_Line(1);
         Put_Vector(A_12);
         Put("Vector R: ");
         New_Line(1);
         Put_Vector(R);
         Put("Vector A_R12 = MY + MZ - R: ");
         New_Line(1);
         Put_Vector(A_R12);
         Put("S = MAX(MY + MZ - R): ");
         Put(Item=>S, Width=>1);
         New_Line(1);
      end if;
   end;

begin
	null;
end User_Main_Package.Io.F3_Pack; 

-----------------------------
--IV-91, FIVT
--Tserkus Andrey 
--Lab 2 Ierarchy program
--21/10/01
--
--Variant: 1)05 2)05 3)26
--Part 1) C = SORT(A) + SORT(B);
--Part 2) MX = SORT(MA);
--Part 3) s = Max(MA*B + MB*C - R)
--
--Kiev, 2001
-----------------------------

with Ada.Text_Io; use Ada.Text_Io;      
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;      
with User_Main_Package; use User_Main_Package;
with User_Main_Package.Io; use User_Main_Package.Io;
with User_Main_Package.Io.F1_Pack; use User_Main_Package.Io.F1_Pack;
with User_Main_Package.IO.F2_Pack; use User_Main_Package.IO.F2_Pack;
with User_Main_Package.IO.F3_Pack; use User_Main_Package.IO.F3_Pack;

procedure Lab2_Ierarchy is 
   --Global definitions
   N_Here: T_Index;
      
   A, B, C, R : T_Vector;
   M_A, M_B, M_X: T_Matrix;
   S: T_Element;
  
   --Program------------------------------
begin       
 
   --Global part
   Put ("Enter number of elements in vector (");      
   Put (Item =>T_Index'First, Width=>1);   
   Put ("..");   
   Put (Item =>T_Index'Last, Width=>1);
   Put ("): ");
   Get (N_Here);
   Skip_Line;
   Set_Internal_Size(N_Here);
   
   --Getting all values
   --Getting vectors
   Put ("Enter vector A:");
   New_Line(1);
   Get_Vector(A);
   Put ("Enter vector B:");
   New_Line(1);
   Get_Vector(B);
   Put ("Enter vector R:");
   New_Line(1);
   Get_Vector(R);
   --Getting matrixes
   Put ("Enter matrix MA:");
   New_Line(1);
   Get_Matrix(M_A);   
   Put ("Enter matrix MB:");
   New_Line(1);
   Get_Matrix(M_B);
   
   --Performing operations
   F1(A,B,C,True);
   F2(M_A,M_X,True);
   F3(M_A,M_B,B,C,R,S,True);
  
   --Putting results
   --Part 1) C = SORT(A) + SORT(B)------------------------------
   New_Line(1);   
   New_Line(1);   
   Put("-----------------------------------------");
   New_Line(1);   
   Put ("Part 1: C = SORT(A) + SORT(B): ");
   Put_Vector(C);
   Put ("Press ENTER...");
   Skip_Line;
   New_Line(1);
   New_Line(1);
   --Part 2) MX = SORT(MA)------------------------------
   Put("-----------------------------------------");
   New_Line(1);
   Put ("Part 2: MX = SORT(MA):");
   New_Line(1);
   Put_Matrix(M_X);
   Put ("Press ENTER...");
   Skip_Line;
   New_Line(1);
   New_Line(1);   
   --Part 3) s = Max(MA*B + MB*C - R)------------------------------
   Put("-----------------------------------------");   
   New_Line(1);
   Put ("Part 3: s = MAX(MA*B + MB*C - R): ");
   Put(Item=>S, Width=>1);
   New_Line(1);
   Put ("Press ENTER...");
   Skip_Line;
   
end Lab2_Ierarchy;
