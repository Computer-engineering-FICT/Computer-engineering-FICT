unit OptimFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TOptimForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    T: TTimer;
    procedure FormShow(Sender: TObject);
    procedure TTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptimForm: TOptimForm;

implementation

uses GraphWin;

{$R *.DFM}


procedure TOptimForm.FormShow(Sender: TObject);
begin
  Label3.Caption:='?';
  Label4.Caption:='?';
  T.enabled:=true
end;

procedure TOptimForm.TTimer(Sender: TObject);
begin
 T.enabled:=false;
 MainForm.SubMerger.OptimizeAuto(self,Label3,Label4);
 MainForm.SubMerger.ShowSubMerging(MainForm.MainSG);
 MainForm.UpdateStatus;
 Close
end;

end.
