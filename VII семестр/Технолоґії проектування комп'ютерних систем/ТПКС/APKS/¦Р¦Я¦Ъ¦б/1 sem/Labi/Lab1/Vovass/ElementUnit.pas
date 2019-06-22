unit ElementUnit;
//==============================================================================
interface
uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 StdCtrls, ExtCtrls, ZaprosUnit;
type
//==============================================================================
 TSVVElement = class(TCustomControl)
  FPanel:TPanel;
  FImage:TImage;
  FEdit:TEdit;
  FLabel:TLabel;
 private
  SVClick:TContextPopupEvent;
  SVDrag:TDragOverEvent;
  SVEndDrag:TEndDragEvent;
  procedure prcOnClick(Sender: TObject;MousePos: TPoint; var Handled: Boolean);
  procedure prcOnDrag(Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
  procedure prcOnEndDrag(Sender, Target: TObject; X, Y: Integer);
  procedure prcSetNumber(num:Integer);
  function  fncGetNumber:Integer;
  procedure prcSetText(text:String);
  function  fncGetText:String;
 published
  property onSVClick:TContextPopupEvent read SVClick write SVClick;
  property onSVDrag:TDragOverEvent read SVDrag write SVDrag;
  property onSVEndDrag:TEndDragEvent read SVEndDrag write SVEndDrag;
  property PointNum:Integer read fncGetNumber write prcSetNumber;
  property PointText:String read fncGetText write prcSetText;
 public
  kind:string[2];
  constructor Create(AOwner:TComponent); override;
  procedure setWay(bol:Boolean);virtual;abstract;
  procedure setLab1(value:byte);virtual;abstract;
  procedure setLab2(value:byte);virtual;abstract;
  procedure setNum(value:integer);
  function  getWay:Boolean;virtual;abstract;
  function  getLab1:byte;virtual;abstract;
  function  getLab2:byte;virtual;abstract;
  function  getValue:string;
  function  getNum:integer;
 end;
//==============================================================================
 TBeginPoint = class(TSVVElement)
  constructor Create(AOwner:TComponent); override;
 end;
//==============================================================================
 TEndPoint = class(TSVVElement)
  constructor Create(AOwner:TComponent); override;
 end;
//==============================================================================
 TOperPoint = class(TSVVElement)
  constructor Create(AOwner:TComponent); override;
 end;
//==============================================================================
 TIfPoint = class(TSVVElement)
  FLabel1:TLabel;
  FLabel2:TLabel;
  constructor Create(AOwner:TComponent); override;
  procedure setWay(bol:Boolean);override;
  function  getWay:Boolean;override;
  procedure setLab1(value:byte);override;
  procedure setLab2(value:byte);override;
  function  getLab1:byte;override;
  function  getLab2:byte;override;
 private
  theWay:Boolean;
 end;
//==============================================================================
 TlabArray = array of TLabel;
 TStrArray = array of string;
//==============================================================================
 TLogPoint = class(TCustomControl)
  FPanel:TPanel;
  FImage:TImage;
  FTypeLabel:TLabel;
 private
  labels:TlabArray;
 public
  constructor Create(inCount,xPos,yPos:Integer;ElType:String;ins:TStrArray;
                             AOwner:TComponent);
 end;
//==============================================================================
implementation
 uses MainUnit;
//------------------------ implementation of TSVVElement -----------------------
constructor TSVVElement.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 FPanel:=TPanel.Create(Self);
 FPanel.Parent:=Self;
 FPanel.Left:=10;
 FPanel.Top:=10;
 FPanel.Width:=65;
 FPanel.Height:=65;
 FPanel.Color:=clWhite;
 FPanel.BevelInner:=bvNone;
 FPanel.BevelOuter:=bvNone;
 FPanel.BorderStyle:=bsNone;
 FPanel.Show;
 FPanel.DragMode:=dmAutomatic;
//==============================================================================
 FImage:=TImage.Create(Self);
 FImage.Parent:=FPanel;
 FImage.Align:=alClient;
 FImage.DragMode:=dmAutomatic;
//==============================================================================
 FLabel:=TLabel.Create(Self);
 FLabel.Parent:=FPanel;
 FLabel.Caption:='1';
 FLabel.Left:=5;
 FLabel.Top:=5;
//==============================================================================
 FEdit:=TEdit.Create(Self);
 FEdit.Parent:=FPanel;
 FEdit.Text:='Enter';
 FEdit.BorderStyle:=bsNone;
 FEdit.Width:=30;
 FEdit.Top:=23;
 FEdit.Left:=15;
 FEdit.Enabled:=false;
//==============================================================================
 SVClick:=prcOnClick;
 SVDrag:=prcOnDrag;
 SVEndDrag:=prcOnEndDrag;
 FImage.OnContextPopup:=onSVClick;
 FImage.OnDragOver:=onSVDrag;
 FImage.OnEndDrag:=onSVEndDrag;
 FImage.ShowHint:=true
end;
//==============================================================================
procedure TSVVElement.prcSetNumber(num:Integer);
begin
 FLabel.Caption:=IntToStr(num)
end;
//==============================================================================
function TSVVElement.fncGetNumber: Integer;
begin
 result:=StrToInt(FLabel.Caption)
end;
//==============================================================================
procedure TSVVElement.prcOnClick(Sender: TObject;
 MousePos: TPoint; var Handled: Boolean);
begin
 FEdit.Enabled:=true
end;
//==============================================================================
procedure TSVVElement.prcOnDrag(Sender, Source: TObject; X, Y: Integer;
          State: TDragState; var Accept: Boolean);
begin
 FEdit.Enabled:=false;
 FPanel.Top:=Mouse.CursorPos.Y-FPanel.Height-MainForm.Top-30;
 FPanel.Left:=Mouse.CursorPos.X-Round(FPanel.Width/2)-MainForm.Image1.Left-
                                                                MainForm.Left
end;
//==============================================================================
procedure TSVVElement.prcOnEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
 FEdit.Enabled:=false;
 FPanel.Top:=Mouse.CursorPos.Y-FPanel.Height-MainForm.Top-30;
 FPanel.Left:=Mouse.CursorPos.X-Round(FPanel.Width/2)-MainForm.Image1.Left-
                                                                MainForm.Left;
 MainForm.Repaint
end;
//==============================================================================
function TSVVElement.fncGetText: String;
begin
 result:=FEdit.Text
end;
//==============================================================================
procedure TSVVElement.prcSetText(text: String);
begin
 FEdit.Text:=text
end;
//==============================================================================
function TSVVElement.getValue:String;
begin
 result:=FEdit.Text
end;
//==============================================================================
function TSVVElement.getNum:Integer;
begin
 result:=StrToInt(FLabel.Caption)
end;
//==============================================================================
procedure TSVVElement.setNum(value:Integer);
begin
 FLabel.Caption:=IntToStr(value)
end;
//------------------------ implementation of TIfPoint --------------------------
constructor TIfPoint.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 kind:='if';
 with FImage.Canvas do
  begin
   MoveTo(0,30);
   LineTo(30,0);
   LineTo(60,30);
   LineTo(30,60);
   LineTo(0,30)
  end;
//==============================================================================
 FLabel1:=TLabel.Create(Self);
 FLabel1.Parent:=FPanel;
 FLabel1.Caption:='';
 FLabel1.Left:=0;
 FLabel1.Top:=40;
//==============================================================================
 FLabel2:=TLabel.Create(Self);
 FLabel2.Parent:=FPanel;
 FLabel2.Caption:='';
 FLabel2.Left:=55;
 FLabel2.Top:=40;
//==============================================================================
 theWay:=false;
 Zapros1Form.ShowModal;
 FLabel1.Caption:=Zapros1Form.Edit1.Text;
 FLabel2.Caption:=Zapros1Form.Edit2.Text;
 FEdit.Text:='x Enter';
 FImage.Hint:='Условная вершина.'+
              ' Нажмите правую кнопку мыши для редактирования.'
end;
//------------------------ implementation of TOperPoint ------------------------
constructor TOperPoint.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 kind:='op';
 FImage.Canvas.Rectangle(0,15,60,45);
 FImage.Canvas.MoveTo(30,15);
 FImage.Canvas.LineTo(30,0);
 FImage.Canvas.MoveTo(30,45);
 FImage.Canvas.LineTo(30,65);
 FEdit.Text:='y Enter';
 FEdit.Left:=5;
 FEdit.Width:=53;
 FImage.Hint:='Операторная вершина.'+
              ' Нажмите правую кнопку мыши для редактирования.'
end;
//------------------------ implementation of TBeginPoint -----------------------
constructor TBeginPoint.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 kind:='be';
 FImage.Canvas.RoundRect(0,15,60,45,30,30);
 FImage.Canvas.MoveTo(30,45);
 FImage.Canvas.LineTo(30,65);
 FEdit.Left:=10;
 FEdit.Width:=40;
 FEdit.Text:='Начало';
 FEdit.Enabled:=false;
 FImage.Hint:='Начало.'
end;
//------------------------ implementation of TEndPoint -------------------------
constructor TEndPoint.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 kind:='en';
 FImage.Canvas.RoundRect(0,15,60,45,30,30);
 FImage.Canvas.MoveTo(30,15);
 FImage.Canvas.LineTo(30,0);
 FEdit.Text:='Конец';
 FEdit.Left:=10;
 FEdit.Width:=40;
 FEdit.Enabled:=false;
 FImage.Hint:='Конец'
end;
//==============================================================================
procedure TIfPoint.setWay(bol:boolean);
begin
 theWay:=bol
end;
//==============================================================================
function TIfPoint.getWay:boolean;
begin
 result:=theWay
end;
//==============================================================================
procedure TIfPoint.setLab1(value:byte);
begin
 FLabel1.Caption:=IntToStr(value)
end;
//==============================================================================
procedure TIfPoint.setLab2(value:byte);
begin
 FLabel2.Caption:=IntToStr(value)
end;
//==============================================================================
function  TIfPoint.getLab1:byte;
begin
 result:=StrToInt(FLabel1.Caption)
end;
//==============================================================================
function  TIfPoint.getLab2:byte;
begin
 result:=StrToInt(FLabel2.Caption)
end;
//==============================================================================
constructor TLogPoint.Create(inCount,xPos,yPos:Integer;ElType:String;
                                  ins:TStrArray;AOwner:TComponent);
var
 i,heig:Integer;
begin
 inherited Create(AOwner);
 FPanel:=TPanel.Create(Self);
 FPanel.Parent:=Self;
 FPanel.Left:=xPos;
 FPanel.Top:=yPos;
 FPanel.Width:=65;
 heig:=inCount*20;
 FPanel.Height:=heig;
 FPanel.Color:=clWhite;
 FPanel.BevelInner:=bvSpace;
 FPanel.BevelOuter:=bvSpace;
 FPanel.BorderStyle:=bsSingle;
 FPanel.Show;
 FPanel.DragMode:=dmAutomatic;
//==============================================================================
 FImage:=TImage.Create(Self);
 FImage.Canvas.MoveTo(30,0);
 FImage.Canvas.LineTo(30,heig);
//==============================================================================
 FImage.Parent:=FPanel;
 FImage.Align:=alClient;
 FImage.DragMode:=dmAutomatic;
//==============================================================================
 FTypeLabel:=TLabel.Create(Self);
 FTypeLabel.Parent:=FPanel;
 FTypeLabel.Caption:=ElType;
 FTypeLabel.Left:=40;
 FTypeLabel.Top:=0;
//==============================================================================
 setLength(labels,length(ins));
 for i:=0 to length(ins)-1 do
  begin
   labels[i]:=Tlabel.Create(Self);
   labels[i].Parent:=FPanel;
   labels[i].Caption:=ins[i];
   labels[i].Left:=5;
   labels[i].Top:=i*20
  end;
end;
//==============================================================================
end.
