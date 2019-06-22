with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings;

package body Data is

    function F1(A, B, C : in Vector; MA, ME : in Matrix) return Integer  is
        begin
            return ((A + B) * ((MA * ME) * C));
        end F1;
    
    function F2(MF, MK : in Matrix) return Matrix is
        res : Matrix;
        begin
            res := Transpose(MF) * MK;
            return Sort_Matrix(res);
        end F2;
        
    function F3(MO, MP, MS : in Matrix; R, S : in Vector) return Integer is
        begin
            return Max((MO * MP) * R + MS * S);
        end F3;
	
    procedure Input_Random_Vector(A : out Vector) is
        subtype Rand_Range is Integer range 1..100;
        package Random_Gen is new Ada.Numerics.Discrete_Random (Rand_Range);
        use Random_Gen;
        G : Generator;
        begin
            Reset(G);
            for i in 1..N loop
                A(i) := Random(G);
            end loop;
        end Input_Random_Vector;
    
    procedure Input_Random_Matrix(MA : out Matrix) is 
        begin
            for i in 1..N loop
                Input_Random_Vector(MA(i));
            end loop;
        end Input_Random_Matrix;
    
    procedure Input_Vector(Name: in string; A: out Vector) is
        begin
            Put("Enter vector ");
            Put(Name);
            Put_Line(":");
            for i in 1..N loop
                Get(A(i));
            end loop;
        end Input_Vector;
        
    procedure Input_Matrix(Name: in String; MA: out Matrix) is
        A : Vector;
        begin
            Put("Enter matrix ");
            Put(Name);
            Put_Line(":");
            for i in 1..N loop
                for j in 1..N loop
                    Get(A(j));
                end loop;
                MA(i) := A;
            end loop;
        end Input_Matrix;
        
    procedure Output_Vector(A: in Vector) is
        begin
            for i in 1..N loop
                Put(A(i));
            end loop;
            New_Line;
        end Output_Vector;
        
    procedure Output_Matrix(MA: in Matrix) is
        begin
            for i in 1..N loop
                Output_Vector(MA(i));
            end loop;
        end Output_Matrix;

    function "+"(L, R : in Vector) return Vector is
        S : Vector;
        begin
            for i in 1..N loop
                S(i) := L(i) + R(i);
            end loop;
            return S;
        end "+";
        
    function "+"(ML, MR : in Matrix) return Matrix is
        MC : Matrix;
        begin
            for i in 1..N loop
                for j in 1..N loop
                    MC(i)(j) := ML(i)(j) + MR(i)(j);
                end loop;
            end loop;
            return MC;
        end "+";

    function "*"(L, R : in Vector) return Integer is
        p : Integer;
        begin
            p := 0;
            for i in 1..N loop
                p := p + L(i) * R(i);
            end loop;
            return p;
        end "*";

    function "*"(ML, MR : in Matrix) return Matrix is
        MP : Matrix;
        begin
            for i in 1..N loop
                for j in 1..N loop
                    MP(i)(j) := 0;
                    for k in 1..N loop
                        MP(i)(j) := MP(i)(j) + ML(i)(k) * MR(k)(j);
                    end loop;
                end loop;
            end loop;
            return MP;
        end "*";

    function "*"(ML : in Matrix; R : in Vector) return Vector is
        P : Vector;
        begin
            for i in 1..N loop
                P(i) := 0;
                for j in 1..N loop
                    P(i) := P(i) + ML(i)(j) * R(i);
                end loop;
            end loop;
            return P;
        end "*";

    function Transpose(MM : in Matrix) return Matrix is
        MT : Matrix;
        tmp : Integer;
        begin
            for i in 1..N loop
                for j in 1..N loop
                    if i > j then
                        tmp := MT(i)(j);
                        MT(i)(j) := MM(j)(i);
                        MT(j)(i) : = tmp;
                    end if;
                end loop;
            end loop;
            return MT;
        end Transpose;
    
    function Max(V : in Vector) return Integer is
        max : Integer;
        begin
            max := 0;
            for i in 1..N loop
                if V(i) > max then
                    max := V(i);
                end if;
            end loop;
            return max;
        end Max;
    
    function Swap_Rows(MM : in out Matrix; i, j : in Integer) return Matrix is
        tmp : Vector;
        begin
            tmp := MM(i);
            MM(i) := MM(j);
            MM(j) := tmp;
            return MM;
        end Swap_Rows;
        
    function Sort_Vector(V : in out Vector) return Vector is
        k : Integer;
        tmp : Integer;
        begin
            for i in 1..N loop
                k := N - i;
                for j in 2..k loop
                    if (V(j-1) > V(j)) then
                        tmp := V(j);
                        V(j) := V(j-1);
                        V(j-1) := tmp;
                    end if;
                end loop;
            end loop;
            return V;
        end Sort_Vector;

    function Sort_Matrix(MM : in out Matrix) return Matrix is
        k : Integer;
        begin
            for i in 1..N loop
                MM(i) := Sort_Vector(MM(i));
            end loop;
            for i in 1..N loop
                k := N - i;
                for j in 2..k loop
                    if (MM(j-1)(1) > MM(j)(1)) then
                        MM := Swap_Rows(MM, j, j-1);
                    end if;
                end loop;
            end loop;
            return MM;
        end Sort_Matrix;
end Data;