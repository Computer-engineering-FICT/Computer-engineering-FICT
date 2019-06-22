unit Unit12;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids;

type

  { TOperForm }

  TOperForm = class(TForm)
    ExitBtn: TButton;
    InfoPanel: TPanel;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure ExitBtnClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;

implementation

{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.Memo1Change(Sender: TObject);
begin

end;

end.

