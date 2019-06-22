unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TOperForm }

  TOperForm = class(TForm)
    ExitButton: TButton;
    InfoPanel: TPanel;
    procedure ExitButtonClick(Sender: TObject);
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

procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

end.

