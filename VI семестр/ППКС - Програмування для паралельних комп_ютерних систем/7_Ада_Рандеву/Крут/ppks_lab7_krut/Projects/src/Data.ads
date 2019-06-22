
-------------------------------------------------------------------------------
--                                                                           --
--                   Parallel and Distributed Computing                      --
--                   Laboratory work #7. Ada. Rendezvous                     --
--                                                                           --
--  File: main.adb                                                           --
--  Task: MA = max(Z)*MO + d * (MX * MS)                                     --
--                                                                           --
--  Author: Krut Vladyslav, group IO-43                                      --
--  Date: 08.06.2017                                                         --
--                                                                           --
-------------------------------------------------------------------------------


with Ada.Text_IO;
use Ada.Text_IO;

generic

   N, H : in Natural;

package Data is

   type Vector is array(Integer range <>) of Integer;
   Subtype VectorN is Vector(1..N);
   Subtype Vector7H is Vector(1..7 * H);
   Subtype Vector6H is Vector(1..6 * H);
   Subtype Vector5H is Vector(1..5 * H);
   Subtype Vector4H is Vector(1..4 * H);
   Subtype Vector3H is Vector(1..3 * H);
   Subtype Vector2H is Vector(1..2 * H);
   Subtype Vector1H is Vector(1..1 * H);

   type Matrix is array(Integer range <>) of VectorN;
   Subtype MatrixN is Matrix(1..N);
   Subtype Matrix7H is Matrix(1..7 * H);
   Subtype Matrix6H is Matrix(1..6 * H);
   Subtype Matrix5H is Matrix(1..5 * H);
   Subtype Matrix4H is Matrix(1..4 * H);
   Subtype Matrix3H is Matrix(1..3 * H);
   Subtype Matrix2H is Matrix(1..2 * H);
   Subtype Matrix1H is Matrix(1..1 * H);


   procedure Input ( V : out Vector; Value : in Integer);

   procedure Input ( MA : out Matrix; Value : in Integer);

   procedure Output (V : in Vector);

   procedure Output (MA : in Matrix);

   procedure FindMaxZ (V : in Vector; maxZi : out Integer);

   function Max (A, B: Integer) return Integer;

   procedure Calculation(d : in Integer;
                         maxZ : in Integer;
                         MO : in MatrixN;
                         MX : in MatrixN;
                         MS : in MatrixN;
                         MA : out MatrixN);


end Data;
