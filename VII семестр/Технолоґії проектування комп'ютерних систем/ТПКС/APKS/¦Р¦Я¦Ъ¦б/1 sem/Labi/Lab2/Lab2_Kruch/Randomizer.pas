unit Randomizer;
// This unit contains a description of a
// class of an abstract randomizer
interface
type
TRandomizer = class
  public
    Error: integer;
    constructor init(SetA, SetC, SetD: integer; W0: extended); virtual;
    function generate: real; virtual; abstract;
  protected
    A, C, D: integer;
    W: extended;
end;

implementation

constructor TRandomizer.init(SetA, SetC, SetD: integer; W0: extended);
begin
  if (SetA>SetC) and (SetC>SetD) and (W0>0) and (W0<=1)
  then begin
    A:=SetA; C:=SetC; D:=SetD; W:=W0;
  end
  else
    Error:=1;
end;

end.
