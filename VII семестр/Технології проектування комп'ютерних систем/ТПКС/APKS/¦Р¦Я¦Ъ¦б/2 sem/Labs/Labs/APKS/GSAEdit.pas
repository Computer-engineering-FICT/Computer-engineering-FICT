//READY!!!!!!
unit GSAEdit;

interface

uses
  Classes,ExtCtrls,StdCtrls,Controls,Graphics,Types,GSA,Forms,Windows,GSADraw;

const
  SCALE_COUNT = 8;
  SCALES : array[0..SCALE_COUNT-1] of Integer = (3,5,6,8,9,10,11,12);
  DEFAULT_SCALE_IDX = 3;

type
  TChangeTextEvent = procedure (var AElement : TElement) of object;
  TGSAEdit = class
  protected
    //events
    procedure Click(Sender : TObject); virtual;
    procedure DblClick(Sender : TObject); virtual;
    procedure MouseDown(Sender : TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    procedure MouseMove(Sender : TObject; Shift: TShiftState; X, Y: Integer); virtual;
    procedure MouseUp(Sender : TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    procedure Paint(Sender : TObject);
  private
    FScale,FScaleIdx : Integer;
    FGSADraw : TGSADraw;
    FTool : Integer;
    FSelectedIdx : Integer;
    FSelected : TElement;
    FLastPoint,FOldPoint,FMarkPoint : TPoint;
    FGSA : TGSA;
    FPaintBox : TPaintBox;
    FOnChangeText : TChangeTextEvent;
    procedure SetScale(AScaleIdx : Integer);

    //used by others
    procedure SavePoints(AScreenPoint : TPoint);
    procedure SelectElement(AElementIdx : Integer; AElement : TElement);
    procedure FindElement(var AElementIdx : Integer; var AElement : TElement);

    //independent operations with selected
    procedure SelectOnDown;
    procedure MoveSelectedOnMove;
    procedure ChangeLineOnMove;
    procedure LineOnDown;
    procedure CreateLinkOnUp;
    procedure DeleteOnDown;

    //operations with any
    procedure EditPeak(AElementIdx : Integer; AElement : TElement);
    procedure CreatePeak(APeakKind : TPeakKind; APoint : TPoint);
    procedure CreateLink(APoint1,APoint2 : TPoint);
    procedure GetLinksPoints(AElement : TElement; var APoint1,APoint2 : TPoint);
  public
    constructor Create(APaintBox : TPaintBox; AGSA : TGSA);
    procedure Increase;
    procedure Decrease;
    procedure SelectTool(ATool : Integer);
    procedure Index;
    procedure Select(AElementIdx : Integer);
    property OnChangeText : TChangeTextEvent read FOnChangeText write FOnChangeText;
  end;

implementation

uses
  Math,SysUtils;

//PRIVATE UNIT
function FormRect(APoint1,APoint2 : TPoint) : TRect;
begin
  Result.Left:= Min(APoint1.X,APoint2.X);
  Result.Right:= Max(APoint1.X,APoint2.X);
  Result.Top:= Min(APoint1.Y,APoint2.Y);
  Result.Bottom:= Max(APoint1.Y,APoint2.Y);
end;

//PUBLIC
//init
constructor TGSAEdit.Create;
begin
  FPaintBox:= APaintBox;
  FGSA:= AGSA;
  FGSADraw:= TGSADraw.Create(FPaintBox.Canvas,AGSA);
  FGSADraw.SetColors(clYellow,clLime,clWhite,clHighLight);
  FGSADraw.TempLine:= False;
  FSelectedIdx:= NO;
  FTool:= 0;
  FOnChangeText:= nil;
  with FPaintBox do
  begin
    OnClick:= Click;
    OnDblClick:= DblClick;
    OnMouseDown:= MouseDown;
    OnMouseMove:= MouseMove;
    OnMouseUp:= MouseUp;
    OnPaint:= Paint;
  end;
  SetScale(DEFAULT_SCALE_IDX);
end;

//buttons
procedure TGSAEdit.Increase;
begin
  if FScaleIdx < SCALE_COUNT-1 then SetScale(FScaleIdx+1);
end;

procedure TGSAEdit.Decrease;
begin
  if FScaleIdx > 0 then SetScale(FScaleIdx-1);
end;

procedure TGSAEdit.SelectTool;
begin
  SelectElement(NO,FSelected);
  FTool:= ATool;
end;

procedure TGSAEdit.Index;
begin
  FGSA.Index;
  FSelectedIdx:= NO;
  FPaintBox.Repaint;
end;

//others
procedure TGSAEdit.Select(AElementIdx : Integer);
begin
  if AElementIdx <> NO then
    SelectElement(AElementIdx,FGSA.GetElement(AElementIdx));
end;

//PROTECTED

//EVENTS//////////
procedure TGSAEdit.Paint;
begin
  with FGSADraw do
    DoPaint(ConvertRect(FPaintBox.Canvas.ClipRect),FSelectedIdx);
end;

procedure TGSAEdit.Click;
begin
end;

procedure TGSAEdit.DblClick;
begin
  case FTool of
    0 : EditPeak(FSelectedIdx,FSelected);
  end;
end;

procedure TGSAEdit.MouseDown;
begin
  if ssLeft in Shift then
  begin
    SavePoints(Point(X,Y));
    case FTool of
    0 : SelectOnDown;
    1 : CreatePeak(ekOperation,FLastPoint);
    200 : CreatePeak(ekCondition0,FLastPoint);
    201 : CreatePeak(ekCondition1,FLastPoint);
    202 : CreatePeak(ekCondition2,FLastPoint);
    203 : CreatePeak(ekCondition3,FLastPoint);
    204 : CreatePeak(ekCondition4,FLastPoint);
    205 : CreatePeak(ekCondition5,FLastPoint);
    3 : CreatePeak(ekBegin,FLastPoint);
    4 : CreatePeak(ekEnd,FLastPoint);
    5 : LineOnDown;
    6 : DeleteOnDown;
    end;
  end;
end;

procedure TGSAEdit.MouseMove;
begin
  if ssLeft in Shift then
  begin
    SavePoints(Point(X,Y));
    case FTool of
    0 : MoveSelectedOnMove;
    5,7 : ChangeLineOnMove;
    end;
  end;
end;

procedure TGSAEdit.MouseUp;
begin
  if not (ssLeft in Shift) then
    case FTool of
    5 : CreateLinkOnUp;
    7 :
    begin
      CreateLinkOnUp;
      FTool:= 0;
    end;
    end;
end;

////////////////////

//PRIVATE

////////////
procedure TGSAEdit.SetScale(AScaleIdx : Integer);
begin
  FScaleIdx:= AScaleIdx;
  FScale:= SCALES[FScaleIdx];
  FSelectedIdx:= NO;
  FGSADraw.Square:= FScale;
  with FPaintBox do
  begin
    Width:= (MAX_XY+MAXWIDTH)*FSCALE;
    Height:= (MAX_XY+MAXHIGHT)*FSCALE;
    Repaint;
  end;
end;

//Used by other's
////////////
procedure TGSAEdit.SavePoints(AScreenPoint : TPoint);
begin
  FOldPoint:= FLastPoint;
  FLastPoint:= FGSADraw.ConvertPoint(AScreenPoint);
end;

////////////
procedure TGSAEdit.FindElement(var AElementIdx : Integer; var AElement : TElement);
begin
  with FLastPoint do FGSA.StartFind(Rect(X,Y,X,Y),ALLELEMENTS,1);
  FGSA.FindNextElement(AElementIdx,AElement);
end;

////////////
procedure TGSAEdit.SelectElement(AElementIdx : Integer; AElement : TElement);
begin
  if FSelectedIdx <> NO then
    FGSADraw.DoPaint(FSelected.Rect_,NO);
  FSelectedIdx:= AElementIdx;
  FSelected:= AElement;
  if FSelectedIdx <> NO then
    FGSADraw.DoPaint(FSelected.Rect_,FSelectedIdx);
end;

//independent
////////////
procedure TGSAEdit.SelectOnDown;
var
  Element : TElement;
  ElementIdx : Integer;
begin
//  FMarkPoint:= FLastPoint;
  FindElement(ElementIdx,Element);
  SelectElement(ElementIdx,Element);
end;

///////////
procedure TGSAEdit.MoveSelectedOnMove;
var
  DX,DY : Integer;
  OldRect,NewRect : TRect;
  Point1,Point2 : TPoint;
begin
  if (FSelectedIdx = NO) then Exit;
  if FSelected.Kind in LINKS then GetLinksPoints(FSelected,Point1,Point2);
  if (FSelected.Kind in LINKS) and (FOldPoint.X = Point2.X) and (FOldPoint.Y = Point2.Y) then
                                    //if click on the arrow
  begin
    FMarkPoint:= Point1;
    FGSADraw.SetTempPoints(Point1,Point2);
    FGSADraw.TempLine:= True;
    FGSA.DeleteElement(FSelectedIdx);
    SelectElement(NO,FSelected);
    FTool:= 7;
  end
  else
  begin
    DX:= FLastPoint.X-FOldPoint.X;
    DY:= FLastPoint.Y-FOldPoint.Y;
    OldRect:= FSelected.Rect_;
    NewRect:= OldRect;
    OffsetRect(NewRect,DX,DY);
    if (NewRect.Left >= 0) and (NewRect.Top >= 0) then
    begin
      FSelected.Rect_:= NewRect;
      FGSA.PutElement(FSelectedIdx,FSelected);
      FGSADraw.DoPaint(OldRect,FSelectedIdx);
      FGSADraw.DoPaint(NewRect,FSelectedIdx);
    end;
  end;
end;


//////////
procedure TGSAEdit.ChangeLineOnMove;
var
  Point1,Point2,OldPoint1,OldPoint2 : TPoint;
  OldRect,NewRect : TRect;
begin
  if (FOldPoint.X = FLastPoint.X) and (FOldPoint.Y = FLastPoint.Y) then Exit;
  FGSADraw.GetTempPoints(OldPoint1,OldPoint2);
  Point1:= FMarkPoint;
  if (FOldPoint.X = FMarkPoint.X) and (FOldPoint.Y = FMarkPoint.Y) then
  begin
    if FLastPoint.X <> FMarkPoint.X then
    begin
      Point2.X:= FLastPoint.X;
      Point2.Y:= FMarkPoint.Y;
    end
    else
    begin
      Point2.X:= FMarkPoint.X;
      Point2.Y:= FLastPoint.Y;
    end
  end
  else
  begin
    if OldPoint2.X <> FMarkPoint.X then
    begin
      Point2.X:= FLastPoint.X;
      Point2.Y:= FMarkPoint.Y;
    end
    else
    begin
      Point2.X:= FMarkPoint.X;
      Point2.Y:= FLastPoint.Y;
    end
  end;
  OldRect:= FormRect(OldPoint1,OldPoint2);
  NewRect:= FormRect(Point1,Point2);
  FGSADraw.SetTempPoints(Point1,Point2);
  FGSADraw.DoPaint(OldRect,FSelectedIdx);
  FGSADraw.DoPaint(NewRect,FSelectedIdx);
end;

////////////
procedure TGSAEdit.LineOnDown;
begin
  FMarkPoint:= FLastPoint;
  FGSADraw.SetTempPoints(FMarkPoint,FMarkPoint);
  FGSADraw.TempLine:= True;
end;

///////////
procedure TGSAEdit.CreateLinkOnUp;
var
  Point1,Point2 : TPoint;
begin
  FGSADraw.TempLine:= False;
  FGSADraw.GetTempPoints(Point1,Point2);
  if (Point1.X <> Point2.X) or (Point1.Y <> Point2.Y) then
    CreateLink(Point1,Point2);
end;

////////////
procedure TGSAEdit.DeleteOnDown;
var
  Element : TElement;
  ElementIdx : Integer;
  Rect_ : TRect;
begin
  FindElement(ElementIdx,Element);
  if ElementIdx <> NO then
  begin
    Rect_:= Element.Rect_;
    FGSA.DeleteElement(ElementIdx);
    FGSADraw.DoPaint(Rect_,NO);
  end;
end;

//Operations with any element, don't use selected
////////////
procedure TGSAEdit.EditPeak(AElementIdx : Integer; AElement : TElement);
begin
  if (AElementIdx <> NO) and (AElement.Kind in EDITTEXT) then
  begin
    FOnChangeText(AElement);
    FGSA.PutElement(AElementIdx,AElement);
  end;
end;

/////////////
procedure TGSAEdit.CreatePeak(APeakKind : TPeakKind; APoint : TPoint);
var
  Rect : TRect;
begin
  Rect.Left:= APoint.X-CENTERS_X[APeakKind];
  Rect.Top:= APoint.Y;
  Rect.Right:= Rect.Left+WIDTHS[APeakKind]-1;
  Rect.Bottom:= Rect.Top+HIGHTS[APeakKind]-1;
  FGSA.AddElement(APeakKind,Rect);
  FGSADraw.DoPaint(Rect,NO);
end;

////////////
procedure TGSAEdit.CreateLink(APoint1,APoint2 : TPoint);
var
  Kind : TLinkKind;
  Rect_ : TRect;
begin
  if (APoint1.X = APoint2.X) and (APoint1.Y = APoint2.Y) then Exit;
  if APoint1.X = APoint2.X then
  begin
    if APoint1.Y < APoint2.Y then Kind:= ekUpDown
    else Kind:= ekDownUp
  end
  else
  begin
    if APoint1.X < APoint2.X then Kind:= ekLeftRight
    else Kind:= ekRightLeft;
  end;
  Rect_:= FormRect(APoint1,APoint2);
  FGSA.AddElement(Kind,Rect_);
  FGSADraw.DoPaint(Rect_,NO);
end;

///////////
procedure TGSAEdit.GetLinksPoints(AElement : TElement; var APoint1,APoint2 : TPoint);
begin
  if AElement.Kind in [ekUpDown,ekLeftRight] then
  begin
    APoint1:= AElement.Rect_.TopLeft;
    APoint2:= AElement.Rect_.BottomRight;
  end
  else
  begin
    APoint1:= AElement.Rect_.BottomRight;
    APoint2:= AElement.Rect_.TopLeft;
  end;
end;

end.
