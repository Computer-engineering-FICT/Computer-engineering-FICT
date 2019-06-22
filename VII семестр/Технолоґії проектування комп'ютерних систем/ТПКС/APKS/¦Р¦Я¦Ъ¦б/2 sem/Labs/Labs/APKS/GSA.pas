unit GSA;

interface

uses
  Classes,Types;

const
  TEXT_LEN = 5;
  NO = -1;
  MAX_XY = 500;
  MAX_COUNT = 1000;

type
  TText = String[TEXT_LEN];
  TElementKind = (ekCondition0,ekCondition1,ekCondition2,ekCondition3,ekCondition4,
               ekCondition5,ekOperation,ekBegin,ekEnd,ekUpDown,ekDownUp,ekLeftRight,ekRightLeft);
  TPeakKind = ekCondition0..ekEnd;
  TLinkKind = ekUpDown..ekRightLeft;
  TSetKind = set of TElementKind;

const
  PEAKS : TSetKind = [ekCondition0,ekCondition1,ekCondition2,ekCondition3,ekCondition4,
               ekCondition5,ekOperation,ekBegin,ekEnd];
  CONDITIONS : TSetKind = [ekCondition0,ekCondition1,ekCondition2,ekCondition3,ekCondition4,
               ekCondition5];
  EDITTEXT : TSetKind = [ekCondition0,ekCondition1,ekCondition2,ekCondition3,ekCondition4,
               ekCondition5,ekOperation];
  VERLINKS : TSetKind = [ekUpDown,ekDownUp];
  HORLINKS : TSetKind = [ekLeftRight,ekRightLeft];
  LINKS : TSetKind = [ekUpDown,ekDownUp,ekLeftRight,ekRightLeft];
  ALLELEMENTS : TSetKind = [ekCondition0,ekCondition1,ekCondition2,ekCondition3,ekCondition4,
               ekCondition5,ekOperation,ekBegin,ekEnd,ekUpDown,ekDownUp,ekLeftRight,ekRightLeft];

type
  TElement = record
    Kind : TElementKind;
    Rect_ : TRect;
    ID : Integer;           //for links ID = NO;
    Text : TText;           //          Text = '';
  end;

  TGSA = class
  private
    FElements : TList;
    FFreeID : Integer;
    FSearchRect : TRect;
    FSearchKind : TSetKind;
    FLastFoundIdx : Integer;
    FSearchDirection : Integer;
    FModifed : Boolean;
    function GetElementsCount : Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure DeleteElement(AElementIdx : Integer);
    function AddElement(AKind : TElementKind; ARect : TRect) : Integer;
    function GetElement(AElementIdx : Integer) : TElement;
    procedure PutElement(AElementIdx : Integer; AElement : TElement);
    procedure StartFind(ASearchRect : TRect; ASearchKind : TSetKind; ADirection : Integer);
    procedure FindNextElement(var AElementIdx : Integer; var AElement : TElement);
    procedure Index;
    procedure Save(Stream : TStream);
    procedure Load(Stream : TStream);
    property ElementsCount : Integer read GetElementsCount;
    property Modifed : Boolean read FModifed write FModifed;
  end;

implementation

type
  TPtrElement = ^TElement;

//PRIVATE UNIT
function Compare(Item1, Item2: Pointer): Integer;
var
  Element1,Element2 : TElement;
begin
  Element1:= TElement(Item1^);
  Element2:= TElement(Item2^);
  if (Element1.Kind in LINKS) and (Element2.Kind in LINKS) then
  begin
    Result:= 0;
    Exit;
  end;
  if (Element1.Kind in LINKS) and (Element2.Kind in PEAKS) then
  begin
    Result:= 1;
    Exit;
  end;
  if (Element1.Kind in PEAKS) and (Element2.Kind in LINKS) then
  begin
    Result:= -1;
    Exit;
  end;
  if Element1.Rect_.Top > Element2.Rect_.Top then Result:= 1
  else
    if Element1.Rect_.Top < Element2.Rect_.Top then Result:= -1
    else
      if Element1.Rect_.Left > Element2.Rect_.Left then Result:= 1
      else
        if Element1.Rect_.Left < Element2.Rect_.Left then Result:= -1
        else Result:= 0;
end;

//PUBLIC
//constructor & destructor
constructor TGSA.Create;
begin
  FElements:= TList.Create;
  FFreeID:= 0;
  FSearchDirection:= 0;
  FModifed:= False;
end;

destructor TGSA.Destroy;
begin
  Clear;
  FElements.Destroy;
  inherited Destroy;
end;

//clear
procedure TGSA.Clear;
var
  PtrElement : TPtrElement;
begin
  while FElements.Count > 0 do
  begin
    PtrElement:= FElements.Items[0];
    FElements.Delete(0);
    Dispose(PtrElement);
  end;
  FFreeId:= 0;
end;

//delete
procedure TGSA.DeleteElement(AElementIdx : Integer);
var
  PtrElement : TPtrElement;
begin
  PtrElement:= FElements.Items[AElementIdx];
  FElements.Delete(AElementIdx);
  Dispose(PtrElement);
  FModifed:= True;
end;

//add
function TGSA.AddElement(AKind : TElementKind; ARect : TRect) : Integer;
var
  PtrElement : TPtrElement;
begin
  New(PtrElement);
  with PtrElement^ do
  begin
    Kind:= AKind;
    if AKind in PEAKS then
    begin
      ID:= FFreeID;
      Inc(FFreeID);
    end
    else ID:= NO;
    case AKind of
      ekBegin: Text:= 'H';
      ekEnd : Text:= 'K'
      else Text:= '';
    end;
    Rect_:= ARect;
  end;
  Result:= FElements.Count;
  FElements.Add(PtrElement);
  FModifed:= True;
end;

//getting
function TGSA.GetElement(AElementIdx : Integer) : TElement;
var
  PtrElement : TPtrElement;
begin
  PtrElement:= FElements.Items[AElementIdx];
  Result:= PtrElement^;
end;

//putting
procedure TGSA.PutElement(AElementIdx : Integer; AElement : TElement);
var
  PtrElement : TPtrElement;
begin
  PtrElement:= FElements.Items[AElementIdx];
  PtrElement^:= AElement;
  FModifed:= True;
end;

//indexing
procedure TGSA.Index;
var
  I : Integer;
  PtrElement : TPtrElement;
begin
  FElements.Sort(@Compare);
  FFreeID:= 0;
  for I:= 0 to FElements.Count-1 do
  begin
    PtrElement:= TPtrElement(FElements.Items[I]);
    if PtrElement^.Kind in PEAKS then
    begin
      PtrElement^.ID:= FFreeID;
      Inc(FFreeID);
    end;
  end;
  FModifed:= True;
end;

//saveing & loading
procedure TGSA.Save(Stream : TStream);
var
  Count,I : Integer;
  Element : TElement;
begin
  Stream.Position:= 0;
  Count:= FElements.Count;
  Stream.WriteBuffer(Count,SizeOf(Count));
  for I:= 0 to Count-1 do
  begin
    Element:= TElement(FElements.Items[I]^);
    Stream.WriteBuffer(Element,SizeOf(Element));
  end;
  Stream.WriteBuffer(FFreeId,SizeOf(FFreeId));
  Stream.Position:= 0;
end;

procedure TGSA.Load(Stream : TStream);
var
  Count,I : Integer;
  Element : TElement;
  PtrElement : TPtrElement;
begin
  Clear;
  Stream.Position:= 0;
  Stream.ReadBuffer(Count,SizeOf(Count));
  FElements.Capacity:= Count;
  for I:= 0 to Count-1 do
  begin
    Stream.ReadBuffer(Element,SizeOf(Element));
    New(PtrElement);
    PtrElement^:= Element;
    FElements.Add(PtrElement);
  end;
  Stream.ReadBuffer(FFreeId,SizeOf(FFreeId));
  Stream.Position:= 0;
end;

//search
procedure TGSA.StartFind(ASearchRect : TRect; ASearchKind : TSetKind; ADirection : Integer);
//if shape in this range then it will be found
begin
  FSearchRect:= ASearchRect;
  FSearchKind:= ASearchKind;
  FSearchDirection:= ADirection;
  if ADirection = 0 then FLastFoundIdx:= -1
  else FLastFoundIdx:= FElements.Count;
end;

function Intersect(ARect1,ARect2 : TRect) : Boolean;
begin
  with ARect1 do
  Result:= ((Left >= ARect2.Left) and (Left <= ARect2.Right) or
           (Right >= ARect2.Left) and (Right <= ARect2.Right) or
           (Left >= ARect2.Left) and (Right <= ARect2.Right) or
           (Left <= ARect2.Left) and (Right >= ARect2.Right))
           and
           ((Top >= ARect2.Top) and (Top <= ARect2.Bottom) or
           (Bottom >= ARect2.Top) and (Bottom <= ARect2.Bottom) or
           (Top >= ARect2.Top) and (Bottom <= ARect2.Bottom) or
           (Top <= ARect2.Top) and (Bottom >= ARect2.Bottom))
end;

procedure TGSA.FindNextElement(var AElementIdx : Integer; var AElement : TElement);
var
  I,LastIdx : Integer;
  Element : TElement;
begin
  AElementIdx:= NO;
  if FSearchDirection = 0 then
  begin
    LastIdx:= FElements.Count-1;
    for I:= FLastFoundIdx+1 to LastIdx do
    begin
      Element:= TElement(FElements.Items[I]^);
      if Intersect(FSearchRect,Element.Rect_) and (Element.Kind in FSearchKind) then
      begin
        FLastFoundIdx:= I;
        AElementIdx:= I;
        AElement:= Element;
        Break;
      end;
    end;
  end
  else
  begin
    for I:= FLastFoundIdx-1 downto 0 do
    begin
      Element:= TElement(FElements.Items[I]^);
      if Intersect(FSearchRect,Element.Rect_) and (Element.Kind in FSearchKind) then
      begin
        FLastFoundIdx:= I;
        AElementIdx:= I;
        AElement:= Element;
        Break;
      end;
    end;
  end;
end;

//PRIVATE
function TGSA.GetElementsCount : Integer;
begin
  Result:= FElements.Count;
end;

end.

