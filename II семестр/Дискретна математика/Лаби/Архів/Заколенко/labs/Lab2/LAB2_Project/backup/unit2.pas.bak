unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ValEdit,
  ExtCtrls, StdCtrls, types;

type

  { TInpForm }

  TInpForm = class(TForm)
     BClearButton: TButton;
     AClearButton: TButton;
     BLoadButton: TButton;
     ALoadButton: TButton;
     BSaveButton: TButton;
     ASaveButton: TButton;
     BListBox: TListBox;
    ExitButton: TButton;
    APanel: TPanel;
    BPanel: TPanel;
    AListBox: TListBox;
    ARadioButton: TRadioButton;
    BRadioButton: TRadioButton;
    WListBox: TListBox;
    MTitleLabel: TLabel;
    InfoPanel: TPanel;
    WTitleLabel: TLabel;
    MListBox: TListBox;
    MPanel: TPanel;
    WPanel: TPanel;
    procedure AClearButtonClick(Sender: TObject);
    procedure ALoadButtonChangeBounds(Sender: TObject);
    procedure ALoadButtonClick(Sender: TObject);
    procedure APanelClick(Sender: TObject);
    procedure ASaveButtonClick(Sender: TObject);
    procedure BClearButtonClick(Sender: TObject);
    procedure BLoadButtonClick(Sender: TObject);
    procedure BSaveButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MListBoxClick(Sender: TObject);
    procedure WListBoxClick(Sender: TObject);
   private
    { private declarations }
     function CheckDbl(M:Byte;Elem:String):Boolean;
  public
    { public declarations }
  end;

var
  InpForm: TInpForm;

implementation
Var LocalPath:String;

{$R *.lfm}

{ TInpForm }

function TInpForm.CheckDbl(M:Byte;Elem:String):Boolean;
 var i:Integer;
begin
  Result:=false;
  Case M of
  0: begin
      For i:=0 to AListBox.Items.Count-1 do
      If AListBox.Items.Strings[i]=Elem then
      begin
       Result:=true;
       InfoPanel.Caption:='Елемент "'+Elem+'" вже є в списку';
       Break;
      end;
     end;
   1:begin
       For i:=0 to BListBox.Items.Count-1 do
       If BListBox.Items.Strings[i]=Elem then
       begin
        Result:=true;
        InfoPanel.Caption:='Елемент "'+Elem+'" вже є в списку';
        Break;
       end;
     end;
  end;
end;

procedure TInpForm.FormCreate(Sender: TObject);
begin
  LocalPath:=ExtractFilePath(Application.ExeName);
end;


procedure TInpForm.MListBoxClick(Sender: TObject);
Var NewElem:String;
begin
  InfoPanel.Caption:='Вибрано чоловіче ім''я '+MListBox.Items.Strings[MListBox.ItemIndex];
  NewElem:='Ч: '+MListBox.Items.Strings[MListBox.ItemIndex];
  If ARadioButton.Checked then
  If Not CheckDbl(0,NewElem) then AListBox.Items.Add(NewElem);
  If BRadioButton.Checked then
  If Not CheckDbl(1,NewElem) then BListBox.Items.Add(NewElem);
end;

procedure TInpForm.WListBoxClick(Sender: TObject);
Var NewElem:String;
begin
  InfoPanel.Caption:='Вибрано жіноче ім''я '+WListBox.Items.Strings[WListBox.ItemIndex];
  NewElem:='Ж: '+WListBox.Items.Strings[WListBox.ItemIndex];
  If ARadioButton.Checked then
  If N     function CheckDbl(M:Byte;Elem:String):Boolean;
ot CheckDbl(0,NewElem) then AListBox.Items.Add(NewElem);
  If BRadioButton.Checked then
  If Not CheckDbl(1,NewElem) then BListBox.Items.Add(NewElem);
end;

procedure TInpForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInpForm.AClearButtonClick(Sender: TObject);
begin
  AListBox.Items.Clear;
end;

procedure TInpForm.ALoadButtonChangeBounds(Sender: TObject);
begin

end;

procedure TInpForm.ALoadButtonClick(Sender: TObject);
begin
    AListBox.Items.LoadFromFile(LocalPath+'DATA\A.TXT');
end;

procedure TInpForm.APanelClick(Sender: TObject);
begin

end;

procedure TInpForm.ASaveButtonClick(Sender: TObject);
begin
 AListBox.Items.SaveToFile(LocalPath+'DATA\A.TXT');
end;

procedure TInpForm.BClearButtonClick(Sender: TObject);
begin
 BListBox.Items.Clear;
end;

procedure TInpForm.BLoadButtonClick(Sender: TObject);
begin
  BListBox.Items.LoadFromFile(LocalPath+'DATA\B.TXT');
end;

procedure TInpForm.BSaveButtonClick(Sender: TObject);
begin
 BListBox.Items.SaveToFile(LocalPath+'DATA\B.TXT');
end;

end.

