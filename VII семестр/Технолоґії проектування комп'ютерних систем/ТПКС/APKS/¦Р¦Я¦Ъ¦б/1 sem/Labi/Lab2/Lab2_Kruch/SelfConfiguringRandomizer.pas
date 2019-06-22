unit SelfConfiguringRandomizer;
{$Apptype console}
interface
uses SysUtils,ConhruentRandomizer;
type
  TSelfConfiguringRandomizer = class (TConhruentRandomizer)
  public
    procedure configure(SetStepMax, SetStepMin: real);
  private
    Step: real;
  end;

implementation

procedure TSelfConfiguringRandomizer.configure(SetStepMax, SetStepMin: real);
const
   Length = 1000;
type
  TSelection = array[1..Length] of extended;
  TDeltaArray = array[1..50] of integer;
var
  A0, C0, D0:integer;
  W0: real;
  W: TSelection;
  DeltaArray: TDeltaArray;
  FProgress, FDeltaMin: text;
  Delta, i, DeltaMin, Limit: integer;
function getDelta(var W: TSelection): integer;
var
  i: integer;
begin
end;
begin
  if (SetStepMax>0) and (SetStepMin>0) and (SetStepMin<1) then Step:=SetStepMax else Step:=0.1;
  W0:=SetStepMin;
  assign(FProgress,'Progress');
  reset(FProgress);
  while not eof(FProgress) do readln(FProgress, Limit);
  close(FProgress);
  inc(Limit);
  assign(FDeltaMin, 'delta.min');
  reset(FDeltaMin);
  while not eof(FDeltaMin) do readln(FDeltaMin, DeltaMin);
  close(FDeltaMin);
  for A0:=Limit to 1000000 do
  begin
    for C0:=2 to A0-1 do
      for D0:=1 to C0-1 do
      begin
        init(A0, C0, D0, W0);
        for i:=1 to 1000 do W[i]:=generate();
        Delta:=0;
        for i:=1 to 1000 do inc(DeltaArray[round(int(50*W[i]))]);
        for i:=1 to 50 do Delta:=Delta+abs(20-DeltaArray[i]);
        if DeltaMin>Delta then
        begin
          DeltaMin:=Delta;
          writeln('Delta minimal value: ', DeltaMin);
          append(FDeltaMin);
          writeln(FDeltaMin, Delta, A0, C0, D0);
          close(FDeltaMin);
        end;
      end;

    writeln(A0);
    append(FProgress);
    writeln(FProgress, A0);
    close(FProgress);
  end;
end;

end.
