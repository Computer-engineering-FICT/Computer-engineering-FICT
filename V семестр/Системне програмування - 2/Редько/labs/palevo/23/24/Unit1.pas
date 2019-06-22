unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, Unit2, Unit3, mtrx, grph;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    N5: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N7Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    Matrix: TMatrixView;
    Graph: TGraphView;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Matrix.Free( );
  Graph.Free( );
end;

procedure TMainForm.N7Click(Sender: TObject);
var
  tmpGraphObj: TGraph;
begin
  Graph.Free( );
  if Matrix <> Nil then
  begin
    Matrix.Synhronize(true);
    tmpGraphObj := TGraph.Create(Matrix.Matrix);
    if tmpGraphObj.Rows <> Nil then
    begin
      Graph := TGraphView.CreateParented(Handle, tmpGraphObj);
      Graph.Show( );
      Graph.DrawGraph;
    end
    else
      Application.MessageBox('Неверная матрица', 'Ошибка', MB_OK);
  end;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  Close( );
end;

procedure TMainForm.N4Click(Sender: TObject);
const
  minSize = 1;
  maxSize = 99;
var
  strSize: String;
  Size: Integer;
begin
  Matrix.Free;
  if InputQuery('Создание матрицы', 'Введите размер матрицы', strSize) then
  begin
    try
      Size := StrToInt(strSize);
    except
      on EConvertError do Size := minSize;
    end;
    if Size < minSize then
      Size := minSize;
    if Size > maxSize then
      Size := maxSize;
    Matrix := TMatrixView.CreateParented(Handle, Size);
  end;
end;

procedure TMainForm.N5Click(Sender: TObject);
var
  j, i: Integer;
begin
  for j := 0 to Matrix.Grid.RowCount-1 do
    for i := 0 to Matrix.Grid.ColCount-1 do
      Matrix.Grid.Cells[i, j] := '0';
  Matrix.Synhronize(true);
end;

end.
