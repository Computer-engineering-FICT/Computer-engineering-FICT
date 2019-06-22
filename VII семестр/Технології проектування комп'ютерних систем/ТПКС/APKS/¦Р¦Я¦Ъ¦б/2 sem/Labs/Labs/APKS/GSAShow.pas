unit GSAShow;

interface

uses
  Classes,ExtCtrls,StdCtrls,Controls,Graphics,Types,GSA,Forms,Windows,GSADraw,GSADrawConst;

type
  TGSAShow = class
  protected
    procedure Paint(Sender : TObject);
  private
    FScale,FScaleIdx : Integer;
    FGSADraw : TGSADrawConst;
    FGSA : TGSA;
    FPaintBox : TPaintBox;
    procedure SetScale(AScaleIdx : Integer);
  public
    constructor Create(APaintBox : TPaintBox; AGSA : TGSA);
    procedure Increase;
    procedure Decrease;
    procedure PutCond(ACond : array of TText);
  end;

implementation

uses
  Math,SysUtils;

//PRIVATE UNIT
const
  SCALE_COUNT = 8;
  SCALES : array[0..SCALE_COUNT-1] of Integer = (3,5,6,8,9,10,11,12);
  DEFAULT_SCALE_IDX = 3;

function FormRect(APoint1,APoint2 : TPoint) : TRect;
begin
  Result.Left:= Min(APoint1.X,APoint2.X);
  Result.Right:= Max(APoint1.X,APoint2.X);
  Result.Top:= Min(APoint1.Y,APoint2.Y);
  Result.Bottom:= Max(APoint1.Y,APoint2.Y);
end;

//PUBLIC
//init
constructor TGSAShow.Create;
begin
  FPaintBox:= APaintBox;
  FGSA:= AGSA;
  FGSADraw:= TGSADrawConst.Create(APaintBox.Canvas,AGSA);
  FGSADraw.SetColors(clYellow,clLime,clWhite,clBlack);
  FGSADraw.SetConColor(clLime);
  SetScale(DEFAULT_SCALE_IDX);
  FPaintBox.OnPaint:= Paint;
end;

//buttons
procedure TGSAShow.Increase;
begin
  if FScaleIdx < SCALE_COUNT-1 then SetScale(FScaleIdx+1);
end;

procedure TGSAShow.Decrease;
begin
  if FScaleIdx > 0 then SetScale(FScaleIdx-1);
end;


//PROTECTED

//EVENTS//////////
procedure TGSAShow.Paint;
begin
  with FGSADraw do
    DoPaint(ConvertRect(FPaintBox.Canvas.ClipRect),NO);
end;

//PRIVATE

////////////
procedure TGSAShow.SetScale(AScaleIdx : Integer);
begin
  FScaleIdx:= AScaleIdx;
  FScale:= SCALES[FScaleIdx];
  FGSADraw.Square:= FScale;
  with FPaintBox do
  begin
    Width:= (MAX_XY+MAXWIDTH)*FSCALE;
    Height:= (MAX_XY+MAXHIGHT)*FSCALE;
    Repaint;
  end;
end;

procedure TGSAShow.PutCond(ACond: array of TText);
var
  I : Integer;
begin
  for I:= 0 to MAX_COUNT-1 do
    FGSADraw.PutCondition(I,ACond[I]);
end;

end.
