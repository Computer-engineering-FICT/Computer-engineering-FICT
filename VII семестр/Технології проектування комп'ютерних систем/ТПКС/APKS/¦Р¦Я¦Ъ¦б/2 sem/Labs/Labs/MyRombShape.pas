unit MyRombShape;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ExtCtrls, Graphics;

type
  TPerem = Array [1..10] of integer;
  TCompStyle = (csBegin, csEnd, csUslovie, csOperator);
  TMyRombShape = class(TGraphicControl)
  private
    FPen: TPen;
    FPerem : TPerem;
    FSvjaz1 : integer;
    FSvjaz2 : integer;
    FBrush: TBrush;
    FStyle: TCompStyle;
    FText: string;
    procedure SetBrush(Value: TBrush);
    procedure SetPen(Value: TPen);
    procedure SetShape(Value: TCompStyle);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    procedure SetPerem( Value: integer; index : integer);
    procedure GetPerem(var Value : integer; index : integer);
    property PopupMenu;
    procedure StyleChanged(Sender: TObject);
    property Align;
    property Anchors;
    property Brush: TBrush read FBrush write SetBrush;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Constraints;
    property ParentShowHint;
    property Svjaz1 : integer read FSvjaz1 write FSvjaz1 default 0;
    property Svjaz2 : integer read FSvjaz2 write FSvjaz2 default 0;
    property Text: string read FText write FText;
    property Pen: TPen read FPen write SetPen;
    property ShowHint;
    property Visible;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property Style : TCompStyle read FStyle write SetShape default csOperator;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TMyRombShape]);
end;
constructor TMyRombShape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  Width := 65;
  Height := 65;
  FPen := TPen.Create;
  FPen.OnChange := StyleChanged;
  FBrush := TBrush.Create;
  FBrush.OnChange := StyleChanged;
end;

destructor TMyRombShape.Destroy;
begin
  FPen.Free;
  FBrush.Free;
  inherited Destroy;
end;


procedure TMyRombShape.GetPerem(var Value :integer; index : integer);
begin
  Value := FPerem[index];
end;  


procedure TMyRombShape.SetPerem(Value : integer; index : integer);
begin
  FPerem[index] := Value;
end;

procedure TMyRombShape.Paint;
var
  X, Y, W, H, S: Integer;
begin
  with Canvas do
  begin
    Pen := FPen;
    Brush := FBrush;
    X := Pen.Width div 2;
    Y := X;
    W := Width - Pen.Width + 1;
    H := Height - Pen.Width + 1;
    if Pen.Width = 0 then
    begin
      Dec(W);
      Dec(H);
    end;
    if W < H then S := W else S := H;
    case FStyle of
      csUslovie:
      begin
        MoveTo( X + (W div 2),  Y);
        LineTo( X,              Y + (H div 2));
        LineTo( X + (W div 2 ), Y +  H);
        LineTo( X +  W,         Y + (H div 2));
        LineTo( X + (W div 2),  Y);
//        FText := '';
        TextOut(X + (W div 6),  Y + (H div 2 - 5), FText);
      end;
      csOperator:
      begin
        Rectangle(X, Y, X + W, Y + H);
//        FText := '';
        TextOut( X + ( W div 10 ), Y + ( H div 2 ), FText );
      end;
      csBegin:
      begin
        RoundRect(X, Y, X + W, Y + H, S div 4, S div 4);
//        FText := 'Начало';
        TextOut( X + ( W div 10 ), Y + ( H div 2 ), FText );
      end;
      csEnd:
      begin
        RoundRect(X, Y, X + W, Y + H, S div 4, S div 4);
//        FText := 'Конец';
        TextOut( X + ( W div 10 ), Y + ( H div 2 ), FText );
      end;
    end;
  end;
end;

procedure TMyRombShape.StyleChanged(Sender: TObject);
begin
  Invalidate;
end;

procedure TMyRombShape.SetBrush(Value: TBrush);
begin
  FBrush.Assign(Value);
end;

procedure TMyRombShape.SetPen(Value: TPen);
begin
  FPen.Assign(Value);
end;

procedure TMyRombShape.SetShape(Value: TCompStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Invalidate;
  end;
end;

end.
