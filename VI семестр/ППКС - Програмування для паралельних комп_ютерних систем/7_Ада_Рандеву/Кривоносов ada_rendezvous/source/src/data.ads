 -------------------------------------------------------------------------------
   --                                                                           --
   --                   Parallel and Distributed Computing                      --
   --                   Laboratory work #7. Ada. Rendezvous                     --
   --                                                                           --
   --  File: data.ads                                                          --

   --                                                                           --
  --  Author: Kryvonosov Oleksii, group IO-34                                   --
   --  Date: 30.04.2015                                                         --
   --                                                                           --
   -------------------------------------------------------------------------------


   with Ada.Text_IO;
   use Ada.Text_IO;

   generic

    N, H : in Natural;

   package Data is

    type Vector is array(Integer range <>) of Integer;
    Subtype VectorN is Vector(1..N);
   Subtype Vector6h is Vector(1..6 * H);
   Subtype Vector5H is Vector(1..5*H);
    Subtype Vector4H is Vector(1..4*H);
    Subtype Vector3h is Vector(1..3 * H);
    Subtype Vector2H is Vector(1..2 * H);
    Subtype VectorH is Vector(1..H);

    type Matrix is array(Integer range <>) of VectorN;
    Subtype MatrixN is Matrix(1..N);
   Subtype Matrix6H is Matrix(1..6 * H);
   Subtype Matrix5H is Matrix(1..5*H);
   Subtype Matrix4H is Matrix(1..4*H);
    Subtype Matrix3H is Matrix(1..3 * H);
    Subtype Matrix2H is Matrix(1..2 * H);
    Subtype MatrixH is Matrix(1..H);


    procedure Input ( V : out Vector;
    Value : in Integer);

   procedure Input ( MA : out Matrix;
    Value : in Integer);

    procedure Output (V : in Vector);

    procedure Output (MA : in Matrix);

    procedure FindMaxZ (V : in VectorH; maxZi : out Integer);

    function Max (A, B: Integer) return Integer;

    procedure Calculation( alfa : in Integer;
    maxZ : in Integer;
    B : in VectorH;
    T : in VectorN;
    MO : in MatrixH;
    MK : in MatrixN;
    A : out VectorH);


   end Data;
