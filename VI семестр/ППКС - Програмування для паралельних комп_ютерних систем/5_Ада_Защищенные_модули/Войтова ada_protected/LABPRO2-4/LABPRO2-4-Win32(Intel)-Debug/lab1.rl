    -- lab4.synchro
    for Synchro use record
        F1 at 68 range 0 .. 31;
        F2 at 72 range 0 .. 31;
    end record;

    -- lab4.op_mz
    for OP_MZ use record
--      MZ at 48 range 0..<dynamic-sized>; cannot specify place
    end record;

    -- lab4.op_alfa
    for OP_alfa use record
        Alf at 48 range 0 .. 31;
    end record;

    -- lab4.op_mr
    for OP_MR use record
--      MR at 48 range 0..<dynamic-sized>; cannot specify place
    end record;

    -- lab4.t1
    for T1 use record
    end record;

    -- lab4.t2
    for T2 use record
    end record;

    -- lab4.t3
    for T3 use record
    end record;

    -- lab4.t4
    for T4 use record
    end record;

