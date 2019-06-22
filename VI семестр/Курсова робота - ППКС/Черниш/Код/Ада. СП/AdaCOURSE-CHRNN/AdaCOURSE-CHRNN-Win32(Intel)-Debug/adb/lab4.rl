    -- lab4.mon
    for MON use record
        F1 at 76 range 0 .. 31;
        F2 at 80 range 0 .. 31;
        SortT2 at 84 range 0 .. 31;
        SortT3 at 88 range 0 .. 31;
        SortT4 at 92 range 0 .. 31;
--      MO at 104 range 0..<dynamic-sized>; cannot specify place
--      D at <dynamic-offset>; cannot specify place
        alfa at 100 range 0 .. 31;
    end record;

    -- lab4.start.t1
    for T1 use record
    end record;

    -- lab4.start.t2
    for T2 use record
    end record;

    -- lab4.start.t3
    for T3 use record
    end record;

    -- lab4.start.t4
    for T4 use record
    end record;

