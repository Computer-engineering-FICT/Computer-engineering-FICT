unit TaskUnit;
//==============================================================================
interface
uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 StdCtrls, ExtCtrls;
const
 pHeigth = 40;
 pWidth = 25;
type
//==============================================================================
 TTask = class(TCustomControl)
  FPanel:TPanel;
  FLabel:TLabel;
 public
  isLoaded:Boolean;
  execTime:Integer;
 private
//==============================================================================
  procNum:Integer;
  timeStart:Integer;
  xOffset,yOffset:Integer;
  SVMouseDown:TMouseEvent;
  SVMouseUp:TMouseEvent;
  procedure prcOnMouseDown(Sender: TObject; Button: TMouseButton;
                                            Shift: TShiftState; X, Y: Integer);
  procedure prcOnMouseUp(Sender: TObject; Button: TMouseButton;
                                            Shift: TShiftState; X, Y: Integer);
//==============================================================================
 published
  property onSVMouseDown:TMouseEvent read SVMouseDown write SVMouseDown;
  property onSVMouseUp:TMouseEvent read SVMouseUp write SVMouseUp;
//==============================================================================
 public
  constructor Create(tactCol,num,xPos,yPos:Integer;AOwner:TComponent);
  procedure setProc(prc:Integer);
  function getProc:Integer;
  procedure setTimeStr(timeStr:Integer);
  function getTimeStr:Integer;
 end;
//==============================================================================
var
 isLinkAStarted,isLinkDStarted:Boolean;
 prior: TTask;
//==============================================================================
implementation
 uses MainUnit;
//==============================================================================
constructor TTask.Create(tactCol,num,xPos,yPos:Integer;AOwner:TComponent);
begin
 inherited Create(AOwner);
 FPanel:=TPanel.Create(Self);
 FPanel.Parent:=Self;
 FPanel.Left:=xPos-round(pWidth/2)-MainForm.sgMain.Left-MainForm.Left;
 FPanel.Top:=yPos;
 FPanel.Width:=pWidth;
 FPanel.Height:=round(tactCol*16/5);
 FPanel.Color:=clAqua;
 FPanel.BevelInner:=bvNone;
 FPanel.BevelOuter:=bvNone;
 FPanel.BorderStyle:=bsSingle;
 FPanel.Show;
//==============================================================================
 FLabel:=TLabel.Create(Self);
 FLabel.Parent:=FPanel;
 FLabel.Caption:=IntToStr(num);
 FLabel.Left:=0;
 FLabel.Top:=0;
//==============================================================================
 xOffset:=0;
 yOffset:=0;
 execTime:=tactCol;
//==============================================================================
 SVMouseDown:=prcOnMouseDown;
 SVMouseUp:=prcOnMouseUp;
 FPanel.OnMouseDown:=onSVMouseDown;
 FPanel.OnMouseUp:=onSVMouseUp
end;
//==============================================================================
procedure  TTask.prcOnMouseDown(Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
begin
 xOffset:=x;
 yOffset:=y;
end;
//==============================================================================
procedure  TTask.prcOnMouseUp(Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
begin
 FPanel.Top:=FPanel.Top+y-yOffset;
 FPanel.Left:=FPanel.Left+x-xOffset;
 MainForm.Repaint;
 MainForm.sgMain.Repaint
end;
//==============================================================================
procedure TTask.setProc(prc:Integer);
begin
 procNum:=prc
end;
//==============================================================================
function TTask.getProc:Integer;
begin
 result:=procNum
end;
//==============================================================================
procedure TTask.setTimeStr(timeStr:Integer);
begin
 timeStart:=timeStr
end;
//==============================================================================
function TTask.getTimeStr:Integer;
begin
 result:=timeStart
end;
//==============================================================================


end.
