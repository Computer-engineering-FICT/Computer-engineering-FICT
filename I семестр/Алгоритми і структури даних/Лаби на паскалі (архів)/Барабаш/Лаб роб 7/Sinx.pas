unit Sinx;

interface

type
  TMyProc = procedure (x, e: real; var S:real);

var
  x, e, S: real;
  sinus : Tmyproc;

procedure sin(x, e: real; var S:real);
procedure Exec(x, e: real; sinus : TMyProc);

implementation

procedure sin(x, e: real; var S:real);
var
  a, p : real;
  j: integer;
begin
  S := x;
  j := 3;
  p := x;
  a := sqr(x);
  while abs(p) > e do
  begin
    p := -(p * a) / (j * (j - 1));
    S:= S + p;
    j := j + 2;
  end;
end;

procedure Exec(x, e: real; sinus : TMyProc);
begin
  write('¬ведите x:'); read(x);
  write('¬ведите e:'); read(e);
  sinus:=sin;
  sinus(x,e,S);
  write(S);
end;

end.