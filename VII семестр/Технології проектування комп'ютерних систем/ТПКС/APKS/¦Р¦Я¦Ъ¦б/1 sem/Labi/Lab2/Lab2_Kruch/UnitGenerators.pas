unit UnitGenerators;

interface
uses dialogs;
const
  DistCongruent = 0;
  DistErlango = 1;
  DistPuasson = 2;
  DistHyperExp = 3;

//  g = 2;
  K = 10;
type
  TGenerator = class
  Public
    Distribution: integer;
    procedure SetDistribution(NewDistribution: integer; NewLambda: real);
    function Generate: real;
  Private
    W: real;
    Lambda: real;
    function Congruent: real;
    function Erlango: real;
    function Puasson: real;
    function HyperExp: real;
  end;

var
  Generator: TGenerator;
implementation

procedure TGenerator.SetDistribution(NewDistribution: integer; NewLambda: real);
begin
  Distribution := NewDistribution;
  Lambda := NewLambda;
  W := Random(High(Integer)) / High(Integer);
end;

function TGenerator.Generate: real;
begin
  case Distribution of
    DistCongruent: Result := Congruent;
    DistErlango: Result := Erlango;
    DistPuasson: Result := Puasson;
    DistHyperExp: Result := HyperExp;
    else Result := 1/0;
  end;
end;

function TGenerator.Congruent: real;
begin
  W := Random(High(Integer)) / High(Integer);//Frac((101 * W + 53) / 47);
  Result := W;
end;

function TGenerator.Erlango: real;
var
  i: integer;
begin
  Result := 0;
  for i := 1 to K do Result := Result + Ln(Congruent);

  Result := - (K/Lambda) * Result;
end;

function TGenerator.Puasson: real;
begin
  Result := - (1/Lambda) * Ln(1-Congruent);
end;

function TGenerator.HyperExp: real;
var
  Fi, Alpha, g: real;
begin
  g := 1/Lambda;
  if g < 1 then ShowMessage('Интенсивность гиперэкспоненциального потока не может быть больше 1.');
  Fi := 1/2 - Sqrt(1/4 - 1/(2*g + 2));


  if Fi <= Congruent then Alpha := 2*Fi*Lambda else Alpha := -2*(1 - Fi)*Lambda;

  Result := Abs((1/Alpha)*Ln(W));
end;

begin
  Generator := TGenerator.Create;
end.
