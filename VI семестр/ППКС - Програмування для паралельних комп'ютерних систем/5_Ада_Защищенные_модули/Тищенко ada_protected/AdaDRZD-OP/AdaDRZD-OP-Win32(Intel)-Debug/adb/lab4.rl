    -- lab4.mon
    for MON use record
        F1 at 68 range 0 .. 31;
        F2 at 72 range 0 .. 31;
--      MB at 88 range 0..<dynamic-sized>; cannot specify place
--      MZ at <dynamic-offset>; cannot specify place
        alfa at 80 range 0 .. 31;
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

