unit lab8;   
interface
    type
        tI = 1..10000;
        tM = array[tI,tI] of real;
        tV = array[tI] of real;     
    procedure ReceiveM(n : tI; var m : tM);
    procedure ReceiveV(n : tI; sm : tM; var v : tV);
    procedure FoutM(n : tI; m : tM; s : string);
    procedure FinCoutM(n : tI; m : tM; s : string);
    procedure ExecV(n : tI; var v : tV);
    procedure FoutV(n : tI; v : tV; s : string);
    procedure FinCoutV(n : tI; v : tV; s : string);
    
implementation
    procedure ReceiveM(n : tI; var m : tM);
    var
        i, j : tI;
    begin
        for i := 1 to n do
            for j := 1 to n do
                m[i,j] := 16 * i * i - 7.8 * j * j + 125 * sin(j - i);
    end;    
    procedure FoutM(n : tI; m : tM; s : string);
    var
        i, j : tI;
        f1 : text;
    begin
        assign(f1,s);
        rewrite(f1);
        for i := 1 to n do
            begin
                for j := 1 to n do
                    write(f1, m[i,j],' ');
                writeln(f1);
            end;
        close(f1);
    end;
    procedure FinCoutM(n : tI; m : tM; s : string);
    var
        i, j : tI;
        t : real;
        f1 : text;
    begin
        assign(f1,s);
        reset(f1);
        for i := 1 to n do
            begin
                for j := 1 to n do
                    begin
                        read(f1,t);
                        write(t,' ');
                    end;
                 writeln();
            end;
         close(f1);
    end;
    procedure ReceiveV(n : tI; sm : tM; var v : tV);
    var
        i, j : tI;
        m : tM;
        t : real;
    begin
        m := sm;
        for i := 1 to n do
            begin
                for j := 1 to n-1 do
                    if m[1,j] < m[1,j+1] then
                        begin
                            t := m[1,j];
                            m[1,j] := m[1,j+1];
                            m[1,j+1] := t;
                        end;
            end;    
         for i := 1 to n do
            v[n-i+1] := m[1,i];
    end;   
    procedure ExecV(n : tI; var v : tV);
    var
        i : tI;
    begin
        for i := 2 to n do
            v[i] := v[i-1] + v[i];
    end;
    procedure FoutV(n : tI; v : tV; s : string);
    var
        i : tI;
        f1 : text;
    begin
        assign(f1,s);
        rewrite(f1);
        for i := 1 to n do
            write(f1, v[i], ' ');
        close(f1);
    end;
    procedure FinCoutV(n : tI; v : tV; s : string);
    var
        i : tI;
        t : real;
        f1 : text;
    begin
        assign(f1,s);
        reset(f1);
        for i := 1 to n do
            begin
                read(f1, t);
                write(t, ' ');
            end;
         close(f1);
    end;
begin

end.