unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, mtrx;

type
  TMatrixView = class(TForm)
    Grid: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Matrix: TMatrix;
    Size: Integer;
    constructor CreateParented(ParentWindow: HWnd; Size: Integer);
    procedure Synhronize(Save: Boolean);
  end;

implementation
{$R *.DFM}
procedure TMatrixView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Matrix.Free( );
end;

procedure TMatrixView.GridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if (ACol = ARow) then
    Grid.Cells[ACol, ARow] := '0'
  else
    if Grid.Cells[ACol, ARow] = '0' then
      Grid.Cells[ACol, ARow] := '1'
    else
      Grid.Cells[ACol, ARow] := '0';
end;

constructor TMatrixView.CreateParented(ParentWindow: HWnd; Size: Integer);
begin
  inherited CreateParented(ParentWindow);
  Matrix := TMatrix.Create(Size, Size);
  Grid.ColCount := Size;
  Grid.RowCount := Grid.ColCount;
  Width := (Grid.ColCount + 1)  * Grid.DefaultColWidth;
  Height := (Grid.RowCount + 1) * Grid.DefaultRowHeight + 27;
  Synhronize(false);
end;

procedure TMatrixView.Synhronize(Save: Boolean);
var
  j, i: Integer;
begin
  if Save then
    for j := 0 to Grid.RowCount-1 do
      for i := 0 to Grid.ColCount-1 do
        Matrix.Values[j, i] := StrToInt(Grid.Cells[i, j])
  else
    for j := 0 to Grid.RowCount-1 do
      for i := 0 to Grid.ColCount-1 do
        Grid.Cells[i, j] := IntToStr(Matrix.Values[j, i]);
end;

end.
