unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TMatrix = array[1..10, 1..10] of Integer;

  TForm1 = class(TForm)
    btnStart: TButton;
    sgMatrix: TStringGrid;
    edM: TEdit;
    edN: TEdit;
    lbX: TLabel;
    lbM: TLabel;
    lbN: TLabel;
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure InitMatrix(var AMatrix: TMatrix; m: Integer; n: Integer);
var
  i, j, k, MinDim: Integer;
  delta, dir, steps: Integer;
begin
  delta := 0;
  dir := 1;
  i := 1;
  j := 0;
  k := 1;

  if n < m then
    MinDim := n
  else
    MinDim := m;

  while delta < MinDim do
  begin
    j := j + dir;
    steps := (m - delta);

    while steps > 0 do
    begin
      AMatrix[i, j] := k;
      k := k + 1;

      j := j + dir;
      steps := steps - 1;
    end;
    j := j - dir;

    delta := delta + 1;

    i := i + dir;
    steps := (n - delta);

    while steps > 0 do
    begin
      AMatrix[i, j] := k;
      k := k + 1;

      i := i + dir;
      steps := steps - 1;
    end;
    i := i - dir;

    dir := dir * -1;
  end;
end;




procedure TForm1.btnStartClick(Sender: TObject);
var
  i, j, m, n: Integer;
  Matrix: TMatrix;
begin
  m := StrToIntDef(edM.Text, 10);
  n := StrToIntDef(edN.Text, 10);
  edM.Text := IntToStr(m);
  edN.Text := IntToStr(n);

  InitMatrix(Matrix, m, n);

  with sgMatrix do
  begin
    ColCount := m;
    RowCount := n;
    for i := 0 to RowCount - 1 do
      for j:= 0 to ColCount - 1 do
        Cells[j, i] :=  IntToStr(Matrix[i + 1, j + 1]);
  end;
end;

end.
