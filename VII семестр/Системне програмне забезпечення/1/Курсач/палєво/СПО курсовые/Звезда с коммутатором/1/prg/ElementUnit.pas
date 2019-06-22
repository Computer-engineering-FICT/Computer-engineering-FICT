unit ElementUnit;
//==============================================================================
interface
//==============================================================================
uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 StdCtrls, ExtCtrls;
//==============================================================================
const
 pHeigth = 40;
 pWidth = 40;
//==============================================================================
type
 TSVVElement = class(TCustomControl)
  FPanel:TPanel;
  FImage:TImage;
  FEdit:TEdit;
  FLabel:TLabel;
 public
  procNum:Integer;
  isLoaded:Boolean;
  isFinished:Boolean;
  execTime:Integer;
 private
  initExecTime:Integer;
  xOffset,yOffset:Integer;
  SVMouseDown:TMouseEvent;
  SVMouseUp:TMouseEvent;
  procedure prcOnMouseDown(Sender: TObject; Button: TMouseButton;
                                            Shift: TShiftState; X, Y: Integer);
  procedure prcOnMouseUp(Sender: TObject; Button: TMouseButton;
                                            Shift: TShiftState; X, Y: Integer);
  procedure prcSetNumber(num:Integer);
  function  fncGetNumber:Integer;
  procedure prcSetText(text:String);
  function  fncGetText:String;
 published
  property onSVMouseDown:TMouseEvent read SVMouseDown write SVMouseDown;
  property onSVMouseUp:TMouseEvent read SVMouseUp write SVMouseUp;
  property PointNum:Integer read fncGetNumber write prcSetNumber;
  property PointText:String read fncGetText write prcSetText;
 public
  constructor Create(xPos,yPos:Integer;AOwner:TComponent);
  procedure setNum(value:integer);
  function  getValue:string;
  function  getNum:integer;
  procedure reset;
 end;
//==============================================================================
var
 isLinkAStarted,isLinkDStarted:Boolean;
 prior:TSVVElement;
//==============================================================================
implementation
 uses MainUnit;
//==============================================================================
constructor TSVVElement.Create(xPos,yPos:Integer;AOwner:TComponent);
begin
 inherited Create(AOwner);
 FPanel:=TPanel.Create(Self);
 FPanel.Parent:=Self;
 FPanel.Left:=xPos-round(pWidth/2)-MainForm.Image1.Left-MainForm.Left;
 FPanel.Top:=yPos-round(pHeigth/2)-MainForm.TabSheet1.Top-MainForm.Top
                                                -MainForm.PageControl1.Top-40;
 FPanel.Width:=pWidth;
 FPanel.Height:=pHeigth;
 FPanel.Color:=clWhite;
 FPanel.BevelInner:=bvNone;
 FPanel.BevelOuter:=bvNone;
 FPanel.BorderStyle:=bsNone;
 FPanel.Show;
//==============================================================================
 FImage:=TImage.Create(Self);
 FImage.Parent:=FPanel;
 FImage.Align:=alClient;
 FImage.Canvas.Ellipse(0,0,pWidth,pHeigth);
 FImage.Canvas.Brush.Color:=clWhite;
 FImage.Canvas.FloodFill(20,20,clBlack,fsBorder);
//==============================================================================
 FLabel:=TLabel.Create(Self);
 FLabel.Parent:=FPanel;
 FLabel.Caption:='1';
 FLabel.Left:=0;
 FLabel.Top:=0;
//==============================================================================
 FEdit:=TEdit.Create(Self);
 FEdit.Parent:=FPanel;
 FEdit.Text:='5';
 FEdit.BorderStyle:=bsNone;
 FEdit.Width:=pWidth-15;
 FEdit.Top:=pHeigth-30;
 FEdit.Left:=pWidth-30;
 FEdit.Color:=clWhite;
 FEdit.Enabled:=false;
//==============================================================================
 xOffset:=0;
 yOffset:=0;
//==============================================================================
 SVMouseDown:=prcOnMouseDown;
 SVMouseUp:=prcOnMouseUp;
 FImage.OnMouseDown:=onSVMouseDown;
 FImage.OnMouseUp:=onSVMouseUp
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
function TSVVElement.fncGetText: String;
begin
 result:=FEdit.Text
end;
//==============================================================================
procedure TSVVElement.prcSetText(text: String);
begin
 FEdit.Text:=text;
 execTime:=StrToInt(FEdit.Text);
 initExecTime:=execTime
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
//==============================================================================
procedure TSVVElement.prcOnMouseDown(Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
begin
 xOffset:=x;
 yOffset:=y;
 FEdit.Enabled:=false;
//********************* right button - enabling edit ***************************
 if(button=mbRight)then FEdit.Enabled:=true;
//********************* left button - deleting point ***************************
 if(button=mbLeft)and(isDelPoint)then
  MainForm.delPoint(StrToInt(FLabel.Caption));
//***************** left button - preparing for linking ************************
 if(button=mbLeft)and(isAddLink)and(not isLinkAStarted)then
  begin
   FImage.Canvas.Brush.Color:=clLime;
   FImage.Canvas.FloodFill(20,20,clBlack,fsBorder);
   FEdit.Color:=clLime;
   FImage.Repaint;
   prior:=self;
   isLinkAStarted:=true;
   exit
  end;
//************************ left button - linking *******************************
 if(button=mbLeft)and(isAddLink)and(isLinkAStarted)then
  begin
   prior.FImage.Canvas.Brush.Color:=clWhite;
   prior.FImage.Canvas.FloodFill(20,20,clBlack,fsBorder);
   prior.FEdit.Color:=clWhite;
   prior.FImage.Repaint;
   MainForm.addLink(StrToInt(prior.FLabel.Caption),StrToInt(FLabel.Caption),-1);
   prior:=nil;
   isLinkAStarted:=false;
   exit
  end;
//**************** left button - preparing for unlinking ***********************
 if(button=mbLeft)and(isDelLink)and(not isLinkDStarted)then
  begin
   FImage.Canvas.Brush.Color:=clRed;
   FImage.Canvas.FloodFill(20,20,clBlack,fsBorder);
   FEdit.Color:=clRed;
   FImage.Repaint;
   prior:=self;
   isLinkDStarted:=true;
   exit
  end;
//*********************** left button - unlinking ******************************
 if(button=mbLeft)and(isDelLink)and(isLinkDStarted)then
  begin
   prior.FImage.Canvas.Brush.Color:=clWhite;
   prior.FImage.Canvas.FloodFill(20,20,clBlack,fsBorder);
   prior.FEdit.Color:=clWhite;
   prior.FImage.Repaint;
   MainForm.delLink(StrToInt(prior.FLabel.Caption),StrToInt(FLabel.Caption));
   prior:=nil;
   isLinkDStarted:=false;
   exit
  end
end;
//==============================================================================
procedure TSVVElement.prcOnMouseUp(Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
begin
 FPanel.Top:=FPanel.Top+y-yOffset;
 FPanel.Left:=FPanel.Left+x-xOffset;
 execTime:=StrToInt(FEdit.Text);
 MainForm.Repaint
end;
//==============================================================================
procedure TSVVElement.reset;
begin
 execTime:=initExecTime;
 isLoaded:=false;
 isFinished:=false
end;
//==============================================================================
end.
