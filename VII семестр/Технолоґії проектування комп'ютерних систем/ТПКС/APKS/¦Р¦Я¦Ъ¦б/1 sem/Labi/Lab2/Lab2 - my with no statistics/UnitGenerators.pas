unit UnitGenerators;

interface
uses dialogs;
const
  DistCongruent = 0;
  DistExp = 1;
  DistErlango = 2;

  Variation = 1/5;	{ Коэффициент вариации  }
  N = 5000;		{ Количество событий    }
  M = 64;		{ Количество интервалов }

type
  TGenerator = class
  public
    constructor Create();
    function Generate : Extended;
    procedure Setup(Distribution: integer; Intensive: real);
  private
    Intensive: real;	{ Интенсивность потока  }
    Distribution: integer;
  end;

implementation
constructor TGenerator.Create();
begin
  Intensive := 0.5;
  Distribution := DistCongruent;
end;

procedure TGenerator.Setup(Distribution: integer; Intensive: real);
begin
  self.Distribution := Distribution;
  self.Intensive := Intensive;
end;

function TGenerator.Generate(): Extended;
  var
    R: Extended;
    i: Longint;
  begin
    case Distribution of
      DistCongruent: Result := 2 * Random / Intensive / 4;
      DistErlango:
        begin
          R := 0;
          for i := 1 to Round(Int(1 / Variation)) do R := R + Ln(Random);
          Result := - Variation / Intensive * R / 5;
        end;
      DistExp: Result := - Ln(1 - Random) / Intensive/ 14;
    end;
end;

end.
