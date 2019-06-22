var
    A: real;
    B: real;
    C: real;
    K: real;
    X1: real;
    D: real;
    X2: real;
    REX1: real;
    REX2: real;
    IMX1: real;
    IMX2: real;
    F1: real;
    F2: real;
begin
    writeln('input a:');
    readln(A);
    writeln('input b: ');
    readln(B);
    writeln('input c: ');
    readln(C);
    K := 0+2*A;
    If A = 0 then
        begin
            If B = 0 then
                begin
                    If C = 0 then
                        begin
                            writeln('infinite number of roots');
                        end
                    else
                        begin
                            writeln('no roots');
                        end;
                end
            else
                begin
                    X1 := 0-C/B;
                    writeln('x1: ');
                    writeln(X1);
                end;
        end
    else
        begin
            D := B*B-4*A*C;
            If D = 0 then
                begin
                    X1 := 0-B/K;
                    X2 := 0+X1;
                    writeln('x1: ');
                    writeln(X1);
                    writeln('x2: ');
                    writeln(X2);
                end
            else
                begin
                    If D<0 then
                        begin
                            REX1 := 0-B/K;
                            REX2 := REX1;
                            IMX1 := sqrt(abs(D))/K;
                            IMX2 := 0-IMX1;
                            writeln('Output Complex roots(REAL:IMAG)');
                            writeln(REX1);
                            writeln(IMX1);
                            writeln(REX2);
                            writeln(IMX2);
                        end
                    else
                        begin
                            F1 := B+sqrt(D);
                            F2 := B-sqrt(D);
                            X1 := 0-F1/K;
                            X2 := 0-F2/K;
                            writeln('x1: ');
                            writeln(X1);
                            writeln('x2: ');
                            writeln(X2);
                        end;
                end;
        end;
end.