unit PeresUnit;
//==============================================================================
interface
uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 StdCtrls, ExtCtrls;
const
 pWidth = 25;
type
//==============================================================================
 TPeres = class(TCustomControl)
  FPanel:TPanel;
  FLabel:TLabel;
  constructor Create(tactCol,xPos,yPos:Integer;AOwner:TComponent);
 end;
//==============================================================================
implementation
 uses MainUnit;
//==============================================================================
constructor TPeres.Create(tactCol,xPos,yPos:Integer;AOwner:TComponent);
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
 FLabel.Caption:='1';
 FLabel.Left:=0;
 FLabel.Top:=0;
//==============================================================================
end;
//==============================================================================
end.

