unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids;

type

  { TColorForm }

  TColorForm = class(TForm)
    ColorGrid: TStringGrid;
    procedure ColorGridClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ColorGridDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ColorForm: TColorForm;

implementation
Var StartColor:Boolean;

{$R *.lfm}

procedure TColorForm.ColorGridDrawCell(Sender: TObject; ACol, ARow: Integer; aRect: TRect; aState: TGridDrawState);
const
  clPaleGreen = TColor($CCFFCC);
  clPaleRed = TColor($CCCCFF);
begin
  if (gdFocused in aState) then
  begin
    ColorGrid.Canvas.Brush.Color := clBlack;
    ColorGrid.Canvas.Font.Color := clWhite;
  end
  else If StartColor then
  begin
   if Odd(ACol + ARow)  then
   ColorGrid.Canvas.Brush.color := clPaleGreen
   else ColorGrid.canvas.brush.Color := clPaleRed
  end else ColorGrid.Canvas.Brush.color := clWhite;

  if (ACol > 0) and (ARow > 0) then
  begin
   ColorGrid.Canvas.FillRect(aRect);
   ColorGrid.Canvas.TextOut(aRect.Left, aRect.Top, ColorGrid.Cells[ACol, ARow]);
  end;

end;

procedure TColorForm.FormActivate(Sender: TObject);
begin
  ColorGrid.Cells[2,3]:='123';
  StartColor:=true;
end;

procedure TColorForm.ColorGridClick(Sender: TObject);
begin
 StartColor:=false;
end;

end.

