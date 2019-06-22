unit GSADrawConst;

interface

uses
  GSA,GSADraw,Graphics,Types;

type
  TGSADrawConst = class(TGSADraw)
  protected
    procedure DrawPeak(AElementIdx : Integer; AElement : TElement; ASelected : Boolean); override;
  private
    FConditions : array[0..MAX_COUNT-1] of TText;
    FConColor : TColor;
  public
    constructor Create(ACanvas : TCanvas; AGSA : TGSA); override;
    procedure SetConColor(AConColor : TColor);
    procedure PutCondition(AIndex : Integer; ACondition : TText);
    function GetCondition(AIndex : Integer) : TText;
  end;

implementation

procedure TGSADrawConst.SetConColor(AConColor : TColor);
begin
  FConColor:= AConColor;
end;

procedure TGSADrawConst.DrawPeak(AElementIdx : Integer; AElement : TElement; ASelected : Boolean);
var
  Base : TPoint;
  H : Integer;
begin
  inherited DrawPeak(AElementIdx,AElement,ASelected);
  with AElement do
  if Kind in PEAKS then
  begin
    Rect_.Left:= Rect_.Left+WIDTHS[AElement.Kind]-1;
    Rect_.Top:= Rect_.Top+1+CENTERS_Y[AElement.Kind] div 2;
    Base:= Mul(Rect_.TopLeft);
    FCanvas.Font.Color:= FConColor;
    H:= FCanvas.TextHeight(Text);
    FCanvas.TextOut(Base.X,Base.Y-H div 2,FConditions[AElementIdx]);
  end;
end;

constructor TGSADrawConst.Create(ACanvas : TCanvas; AGSA : TGSA);
var
  I : Integer;
begin
  inherited Create(ACanvas,AGSA);
  FConColor:= clWhite;
  for I:= 0 to MAX_COUNT-1 do
    FConditions[I]:= '';
end;

function TGSADrawConst.GetCondition(AIndex: Integer): TText;
begin
  Result:= FConditions[AIndex];
end;

procedure TGSADrawConst.PutCondition(AIndex: Integer; ACondition: TText);
begin
  FConditions[AIndex]:= ACondition;
end;

end.
