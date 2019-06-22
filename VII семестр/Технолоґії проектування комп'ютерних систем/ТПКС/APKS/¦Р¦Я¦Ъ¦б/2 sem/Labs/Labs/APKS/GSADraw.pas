//READY !!!
unit GSADraw;

interface

uses
  Graphics,Types,Windows,SysUtils,GSA;

type
  TPeakParam = array [TPeakKind] of Integer;

const
  WIDTHS : TPeakParam =         (7,7,7,7,7,7,6,6,6);
  HIGHTS : TPeakParam =         (7,7,7,7,7,7,5,5,5);
  CENTERS_X : TPeakParam =      (3,3,3,3,3,3,2,2,2);
  CENTERS_Y : TPeakParam =      (3,3,3,3,3,3,2,2,2);

  IN_Y : TPeakParam =           (0,0,0,0,0,0,0,MAX_XY,0);
  IN_X : TPeakParam =           (3,3,3,3,3,3,2,MAX_XY,2);

  OUT1_X : TPeakParam =         (3,6,6,0,0,3,2,2,MAX_XY); //OnTrue;
  OUT1_Y : TPeakParam =         (6,3,3,3,3,6,4,4,MAX_XY);
  OUT2_X : TPeakParam =         (0,0,3,3,6,6,2,2,MAX_XY);
  OUT2_Y : TPeakParam =         (3,3,6,6,3,3,4,4,MAX_XY);
  MAXHIGHT = 7;
  MAXWIDTH = 7;

type
  TGSADraw = class
  protected
    FCanvas : TCanvas;
    procedure DrawLink(AElementIdx : Integer; AElement : TElement; ASelected : Boolean); virtual;
    procedure DrawPeak(AElementIdx : Integer; AElement : TElement; ASelected : Boolean); virtual;
    function Mul(APoint : TPoint) : TPoint;
  private
    FSquare : Integer;
    FGSA : TGSA;
    FColor,FSelColor,FNumColor,FGroundColor : TColor;
    FTempLine : Boolean;
    FTempPoint1,FTempPoint2 : TPoint;
    procedure ClearScreen(AElementRect : TRect);
    procedure DrawElement(AElementIdx : Integer; AElement : TElement; ASelected : Boolean);
    procedure DrawTempLine;
  public
    constructor Create(ACanvas : TCanvas; AGSA : TGSA); virtual;
    procedure SetColors(AColor,ASelColor,ANumColor,AGroundColor : TColor);
    function ConvertPoint(AScreenPoint : TPoint) : TPoint;
    function ConvertRect(AScreenRect : TRect) : TRect;
    procedure DoPaint(AElementRect : TRect; ASelectedIdx : Integer);
    procedure SetTempPoints(APoint1,APoint2 : TPoint);
    procedure GetTempPoints(var APoint1,APoint2 : TPoint);
    property Square : Integer write FSquare;
    property TempLine : Boolean read FTempLine write FTempLine;
  end;

implementation

//PRIVATE UNIT
function Divide(AScale : Integer; APoint : TPoint) : TPoint;
begin
  Result.X:= APoint.X div AScale;
  Result.Y:= APoint.Y div AScale;
end;

//PUBLIC
constructor TGSADraw.Create(ACanvas : TCanvas; AGSA : TGSA);
begin
  FCanvas:= ACanvas;
  FGSA:= AGSA;
  FColor:= clWhite;
  FSelColor:= clBlue;
  FNumColor:= clWhite;
  FGroundColor:= clBlack;
  FSquare:= 10;
end;

procedure TGSADraw.SetColors(AColor,ASelColor,ANumColor,AGroundColor : TColor);
begin
  FColor:= AColor;
  FSelColor:= ASelColor;
  FNumColor:= ANumColor;
  FGroundColor:= AGroundColor;
end;

function TGSADraw.ConvertPoint(AScreenPoint : TPoint) : TPoint;
begin
  Result:= Divide(FSquare,AScreenPoint);
end;

function TGSADraw.ConvertRect(AScreenRect : TRect) : TRect;
begin
  Result.TopLeft:= Divide(FSquare,AScreenRect.TopLeft);
  Result.BottomRight:= Divide(FSquare,AScreenRect.BottomRight);
end;

procedure TGSADraw.DoPaint(AElementRect : TRect; ASelectedIdx : Integer);
var
  ElementIdx : Integer;
  Element : TElement;
begin
  AElementRect.Right:= AElementRect.Right+2;
  ClearScreen(AElementRect);
  FGSA.StartFind(AElementRect,ALLELEMENTS,0);
  FGSA.FindNextElement(ElementIdx,Element);
  while ElementIdx <> NO do
  begin
    DrawElement(ElementIdx,Element,(ElementIdx = ASelectedIdx));
    FGSA.FindNextElement(ElementIdx,Element);
  end;
  if FTempLine then DrawTempLine;
end;

//PRIVATE
procedure TGSADraw.ClearScreen(AElementRect : TRect);
var
  ScreenRect : TRect;
begin
  Inc(AElementRect.Right);
  Inc(AElementRect.Bottom);
  ScreenRect.TopLeft:= Mul(AElementRect.TopLeft);
  ScreenRect.BottomRight:= Mul(AElementRect.BottomRight);
  Inc(ScreenRect.Right);
  Inc(ScreenRect.Bottom);
  SelectClipRgn(FCanvas.Handle,hrgn(nil));
  with ScreenRect do IntersectClipRect(FCanvas.Handle,Left,Top,Right,Bottom);
  with FCanvas do
  begin
    Pen.Style:= psSolid;
    Pen.Width:= 1;
    Pen.Mode:= pmCopy;
    Brush.Style:= bsClear;
    Brush.Color:= FGroundColor;
    if FSquare <= 6 then Font.Name:= 'Small Fonts'
    else Font.Name:= 'MS Serif';
    Font.Size:= FSquare;
    FillRect(ScreenRect);
  end;
end;

procedure TGSADraw.DrawElement(AElementIdx : Integer; AElement : TElement; ASelected : Boolean);
begin
  with FCanvas.Pen do
    if ASelected then Color:= FSelColor
    else Color:= FColor;
  if AElement.Kind in LINKS then DrawLink(AElementIdx,AElement,ASelected)
  else DrawPeak(AElementIdx,AElement,ASelected);
end;

procedure TGSADraw.DrawLink(AElementIdx : Integer; AElement : TElement; ASelected : Boolean);
var
  Point1,Point2 : TPoint;
  FSquare_div2 : Integer;
begin
  FSquare_div2:= FSquare div 2;
  with FCanvas,AElement do
  begin
    Point1:= Mul(Rect_.TopLeft);
    Point2:= Mul(Rect_.BottomRight);
    Point1.X:= Point1.X+FSquare_div2;
    Point1.Y:= Point1.Y+FSquare_div2;
    Point2.X:= Point2.X+FSquare_div2;
    Point2.Y:= Point2.Y+FSquare_div2;
    MoveTo(Point1.X,Point1.Y);
    LineTo(Point2.X,Point2.Y);
    case Kind of
    ekUpDown :
    with Point2 do
    begin
      MoveTo(X,Y);
      LineTo(X+FSquare_div2,Y-FSquare_div2);
      LineTo(X-FSquare_div2,Y-FSquare_div2);
      LineTo(X-1,Y-1);
    end;
    ekDownUp :
    with Point1 do
    begin
      MoveTo(X,Y);
      LineTo(X+FSquare_div2,Y+FSquare_div2);
      LineTo(X-FSquare_div2,Y+FSquare_div2);
      LineTo(X+1,Y+1);
    end;
    ekLeftRight :
    with Point2 do
    begin
      MoveTo(X,Y);
      LineTo(X-FSquare_div2,Y-FSquare_div2);
      LineTo(X-FSquare_div2,Y+FSquare_div2);
      LineTo(X,Y);
    end;
    ekRightLeft :
    with Point1 do
    begin
      MoveTo(X,Y);
      LineTo(X+FSquare_div2,Y+FSquare_div2);
      LineTo(X+FSquare_div2,Y-FSquare_div2);
      LineTo(X,Y);
    end;
    end;
  end;
end;

procedure TGSADraw.DrawPeak(AElementIdx : Integer; AElement : TElement; ASelected : Boolean);
var
  XBase,YBase,W,H : Integer;
  S : TText;
begin
  with FCanvas,AElement,AElement.Rect_ do
  begin
    XBase:= FSquare*Left+FSquare div 2;
    YBase:= FSquare*Top+FSquare div 2;
    if Kind in [ekCondition0,ekCondition1,ekCondition2,ekCondition3,ekCondition4,ekCondition5] then
    begin
      Polygon([Point(XBase+FSquare,YBase+3*FSquare),Point(XBase+3*FSquare,YBase+FSquare),
              Point(XBase+5*FSquare,YBase+3*FSquare),Point(XBase+3*FSquare,YBase+5*FSquare)]);
      MoveTo(XBase+3*FSquare,YBase);
      LineTo(XBase+3*FSquare,YBase+FSquare);
      if Kind in [ekCondition0,ekCondition1,ekCondition3,ekCondition4] then
      begin
        MoveTo(XBase,YBase+3*FSquare);
        LineTo(XBase+FSquare,YBase+3*FSquare);
      end;
      if Kind in [ekCondition1,ekCondition2,ekCondition4,ekCondition5] then
      begin
        MoveTo(XBase+5*FSquare,YBase+3*FSquare);
        LineTo(XBase+6*FSquare,YBase+3*FSquare);
      end;
      if Kind in [ekCondition0,ekCondition2,ekCondition3,ekCondition5] then
      begin
        MoveTo(XBase+3*FSquare,YBase+5*FSquare);
        LineTo(XBase+3*FSquare,YBase+6*FSquare);
      end;
      case Kind of
        ekCondition0,ekCondition5 :
        begin
          MoveTo(XBase+4*FSquare,YBase+5*FSquare);
          LineTo(XBase+4*FSquare,YBase+6*FSquare);
        end;
        ekCondition1,ekCondition2 :
        begin
          MoveTo(XBase+5*FSquare,YBase+FSquare);
          LineTo(XBase+5*FSquare,YBase+2*FSquare);
        end;
        ekCondition3,ekCondition4 :
        begin
          MoveTo(XBase+FSquare,YBase+FSquare);
          LineTo(XBase+FSquare,YBase+2*FSquare);
        end;
      end;
    end;
    if Kind = ekOperation then
      Rectangle(XBase,YBase+FSquare,XBase+4*FSquare,YBase+FSquare*3);
    if Kind in [ekOperation,ekEnd] then
    begin
      MoveTo(XBase+2*FSquare,YBase);
      LineTo(XBase+2*FSquare,YBase+FSquare);
    end;
    if Kind in [ekOperation,ekBegin] then
    begin
      MoveTo(XBase+2*FSquare,YBase+3*FSquare);
      LineTo(XBase+2*FSquare,YBase+4*FSquare);
    end;
    if Kind in [ekBegin,ekEnd] then
    begin
      MoveTo(XBase+FSquare,YBase+FSquare);
      LineTo(XBase+3*FSquare,YBase+FSquare);
      MoveTo(XBase+FSquare,YBase+3*FSquare);
      LineTo(XBase+3*FSquare,YBase+3*FSquare);
      Arc(XBase,YBase+FSquare,XBase+2*FSquare,YBase+3*FSquare,
          XBase+FSquare,YBase+FSquare,XBase+FSquare,YBase+3*FSquare);
      Arc(XBase+2*FSquare,YBase+FSquare,XBase+4*FSquare,YBase+3*FSquare,
          XBase+3*FSquare,YBase+3*FSquare,XBase+3*FSquare,YBase+FSquare);
    end;
    Font.Color:= FColor;
    W:= TextWidth(Text);
    H:= TextHeight(Text);
    TextOut(XBase+FSquare*CENTERS_X[Kind]-W div 2,YBase+FSquare*CENTERS_Y[Kind]-H div 2,Text);
    if ASelected then Font.Color:= FSelColor
    else Font.Color:= FNumColor;
    S:= IntToStr(ID);
    TextOut(XBase+(CENTERS_X[Kind]+1)*FSquare,YBase,S);
  end;
end;

procedure TGSADraw.DrawTempLine;
var
  Point1,Point2 : TPoint;
begin
  if (FTempPoint1.X <> FTempPoint2.X) or (FTempPoint1.Y <> FTempPoint2.Y) then
  with FCanvas do
  begin
    Pen.Style:= psSolid;
    Pen.Width:= 1;
    Pen.Mode:= pmCopy;
    Pen.Color:= FSelColor;
    Brush.Style:= bsClear;
    Brush.Color:= FGroundColor;
    Point1:= Mul(FTempPoint1);
    Point2:= Mul(FTempPoint2);
    Point1.X:= Point1.X+FSquare div 2;
    Point1.Y:= Point1.Y+FSquare div 2;
    Point2.X:= Point2.X+FSquare div 2;
    Point2.Y:= Point2.Y+FSquare div 2;
    MoveTo(Point1.X,Point1.Y);
    LineTo(Point2.X,Point2.Y);
  end;
end;

procedure TGSADraw.SetTempPoints(APoint1,APoint2 : TPoint);
begin
  FTempPoint1:= APoint1;
  FTempPoint2:= APoint2;
end;

procedure TGSADraw.GetTempPoints(var APoint1,APoint2 : TPoint);
begin
  APoint1:= FTempPoint1;
  APoint2:= FTempPoint2;
end;

//Protected
function TGSADraw.Mul(APoint : TPoint) : TPoint;
begin
  Result.X:= APoint.X*FSquare;
  Result.Y:= APoint.Y*FSquare;
end;
end.
