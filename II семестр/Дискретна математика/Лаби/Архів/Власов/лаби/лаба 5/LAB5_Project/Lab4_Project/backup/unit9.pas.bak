unit Unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TStartForm }

  TStartForm = class(TForm)
    ScipButton: TButton;
    EGenerButton: TButton;
    EdgHandRBtn: TRadioButton;
    EdgRandRBtn: TRadioButton;
    EdgesEdit: TEdit;
    ExitBtn: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdgesLabel: TLabel;
    NodesLabel: TLabel;
    NGenerButton: TButton;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    NodesEdit: TEdit;
    NodHandRBtn: TRadioButton;
    NodRandRBtn: TRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure EdgesEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdgRandRBtnClick(Sender: TObject);
    procedure EGenerButtonClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure NGenerButtonClick(Sender: TObject);
    procedure NodesEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NodesLabelClick(Sender: TObject);
    procedure NodHandRBtnClick(Sender: TObject);
    procedure NodRandRBtnClick(Sender: TObject);
    procedure ScipButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  StartForm: TStartForm;

implementation
 Uses Unit3,Unit5;
{$R *.lfm}

{ TStartForm }

procedure TStartForm.ExitBtnClick(Sender: TObject);
begin
 Inp1Form.Show;
 Close;
end;

procedure TStartForm.FormActivate(Sender: TObject);
begin
 NumNodes:=NZK mod 25 +10;
 NodesEdit.Text:=IntToStr(NumNodes);
 NumEdges:=Random(Round(NumNodes*NumNodes/2));
 If NumEdges<=NumNodes then NumEdges:=NumNodes*10;
 EdgesEdit.Text:=IntToStr(NumEdges);
 NodesLabel.Caption:=NodesEdit.Text;
 EdgesLabel.Caption:=EdgesEdit.Text;
end;

procedure TStartForm.EdgRandRBtnClick(Sender: TObject);
begin
 Randomize;
 NumEdges:=Random(Round(NumNodes*NumNodes/2));
 If NumEdges<=NumNodes then NumEdges:=Round(NumNodes*NumNodes/2)-NumNodes;
 If EdgRandRBtn.Checked then EdgesEdit.Text:=IntToStr(NumEdges);
end;

procedure TStartForm.EdgesEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=13 then EGenerButtonClick(Sender);
end;

procedure TStartForm.EGenerButtonClick(Sender: TObject);
begin
 If EdgRandRBtn.Checked then EdgRandRBtnClick(Sender);
 try
   NumEdges:=StrToInt(EdgesEdit.Text);
 except
  on EConvertError do
  begin
   MessageDlg('Помилка вводу числа.', mtError,[mbOk], 0);
   EdgesEdit.Text:='';
   abort;
  end;
 end;
 EdgesLabel.Caption:=EdgesEdit.Text;
end;

procedure TStartForm.NGenerButtonClick(Sender: TObject);
begin
 If NodRandRBtn.Checked then NodRandRBtnClick(Sender);
 try
   NumNodes := StrToInt(NodesEdit.Text);
 except
  on EConvertError do
  begin
   MessageDlg('Помилка вводу числа.', mtError,[mbOk], 0);
   NodesEdit.Text:='';
   abort;
  end;
 end;
 NodesLabel.Caption:=NodesEdit.Text;
end;

procedure TStartForm.NodesEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key=13 then NGenerButtonClick(Sender);
end;

procedure TStartForm.NodesLabelClick(Sender: TObject);
begin

end;

procedure TStartForm.NodHandRBtnClick(Sender: TObject);
begin
 If NodHandRBtn.Checked then  NodesEdit.Enabled:=true else NodesEdit.Enabled:=false;
end;

procedure TStartForm.NodRandRBtnClick(Sender: TObject);
begin
  Randomize;
  If NodRandRBtn.Checked then NodesEdit.Text:=IntToStr(Random(25)+10);
  NumNodes:=StrToInt(NodesEdit.Text);
end;

procedure TStartForm.ScipButtonClick(Sender: TObject);
begin
 NumNodes:=0;
 NumEdges:=0;
Inp1Form.Show;
 Close;
end;

end.

