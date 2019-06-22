unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    InfoPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MainMenu: TMainMenu;
    MenuOperItem: TMenuItem;
    MenuInputItem: TMenuItem;
    MenuExitItem: TMenuItem;
    ZalikButton: TButton;
    ZalikEdit: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InfoPanelClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure MenuInputItemClick(Sender: TObject);
    procedure MenuOperItemClick(Sender: TObject);
    procedure MenuExitItemClick(Sender: TObject);
    procedure ZalikButtonClick(Sender: TObject);
    procedure ZalikEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZalikEditKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
    procedure LoadZalik;
    procedure VariantForming;
    procedure SaveZalik;
  public
    { public declarations }
  end;

var
  MainForm: TMainForm;

implementation
 Uses Unit2,Unit5,Unit3,Unit4,Unit6,Unit7,Unit8;
{$R *.lfm}

{ TMainForm }

procedure TMainForm.Label4Click(Sender: TObject);
begin

end;

procedure TMainForm.MenuInputItemClick(Sender: TObject);
begin
 Case NumVariant of
 1: Inp1Form.Show;
 2: Inp2Form.Show;
 3: Inp3Form.Show;
 4: Inp4Form.Show;
 5..8: Inp5Form.Show;
 end;
end;

procedure TMainForm.MenuOperItemClick(Sender: TObject);
begin
  OperForm.Show;
end;

procedure TMainForm.MenuExitItemClick(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.ZalikButtonClick(Sender: TObject);
begin
 VariantForming;
 SaveZalik;
end;

procedure TMainForm.ZalikEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=13 then ZalikButtonClick(Sender);
end;

procedure TMainForm.ZalikEditKeyPress(Sender: TObject; var Key: char);
begin
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
DataPath:=ExtractFilePath(Application.ExeName);
CreateDir(DataPath+'DATA\');
end;

procedure TMainForm.InfoPanelClick(Sender: TObject);
begin

end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
 LoadZalik;
 VariantForming;
end;


procedure TMainForm.SaveZalik;
Var F : Text;
    ZalikFileName:String;
begin
 ZalikFileName:=DataPath+'DATA\zalik.txt';
 AssignFile(F,ZalikFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Неможливо прочитати з '+ZalikFileName;
  Exit;
 end;
 Writeln(F,ZalikEdit.Text);
 CloseFile(F);
end;

procedure TMainForm.LoadZalik;
Var F : Text;
    ZalikFileName:String;
    Str:String;
begin
 ZalikFileName:=DataPath+'DATA\zalik.txt';
 If FileExists(ZalikFileName) then
 begin
  AssignFile(F,ZalikFileName);
  {$I-} Reset(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо записати в '+ZalikFileName;
   Exit;
  end;
  Readln(F,str);
  ZalikEdit.Text:=str;
  CloseFile(F);
 end;
end;

procedure TMainForm.VariantForming;
begin
 If ZalikEdit.Text>'' then
 begin
  InfoPanel.Caption:='';
  try
   NZK := StrToInt(ZalikEdit.Text);
 except
   on EConvertError do
   begin
    MessageDlg('Помилка вводу числа.', mtError,[mbOk], 0);
    ZalikEdit.Text:='';
    SaveZalik;
    InfoPanel.Caption:='Наберіть номер ЗК і натисніть "ВВІД"';
    abort;
   end;
  end;
 NumVariant:=NZK mod 8+1;
 InfoPanel.Caption:=VariantArr[NumVariant];
 end else InfoPanel.Caption:='Наберіть номер ЗК і натисніть "ВВІД"';
 If ZalikEdit.Text='' then
 begin
  MenuInputItem.Enabled:=false;
  MenuOperItem.Enabled:=false;
 end else
 begin
  MenuInputItem.Enabled:=true;
  MenuOperItem.Enabled:=true;
 end;
end;




end.

