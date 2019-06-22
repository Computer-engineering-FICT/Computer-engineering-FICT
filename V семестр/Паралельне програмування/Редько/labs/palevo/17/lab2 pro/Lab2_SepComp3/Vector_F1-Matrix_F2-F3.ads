----------------------------------------------------------------
--              Paralel and distributed computing             --
--                     Laboratory work #2                     --
--                   IO-73 Rukavishnikov Gleb                 --
----------------------------------------------------------------
--Variant: 1.12, 2.20, 3.24                                   --
--F1:  A=B+C-D*e                                              --
--F2:  MD=MA+MB-MC*MM                                         --
--F3:  k=min(MA*MB*å)                                         --
--------------------Vector_F1.Matrix_F2.Proc_F3----------------------
----------------------------------------------------------------

generic
package Vector_F1.Matrix_F2.F3 is
   ---k=min(MA*MB*å)  
    function Func3(MA, MB:in Matrix; E: in integer) return integer;

end Vector_F1.Matrix_F2.F3;
