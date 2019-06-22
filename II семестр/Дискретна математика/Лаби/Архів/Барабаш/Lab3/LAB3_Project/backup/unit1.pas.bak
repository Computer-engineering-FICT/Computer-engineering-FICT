unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls;

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
    Label9: TLabel;
    MainMenu: TMainMenu;
    MenuOperItem: TMenuItem;
    MenuInputItem: TMenuItem;
    MenuExitItem: TMenuItem;
    ZalikButton: TButton;
    ZalikEdit: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure MenuExitItemClick(Sender: TObject);
    procedure MenuInputItemClick(Sender: TObject);
    procedure MenuOperItemClick(Sender: TObject);
    procedure ZalikButtonClick(Sender: TObject);
    procedure ZalikEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  ZalikPath:String;
implementation
Uses Unit2,Unit3,Unit4,Unit5,Unit6,Unit7,Unit8,Unit9,Unit10,Unit11,Unit12,Unit13,
     Unit14, Unit15;
{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
 ZalikPath:=ExtractFilePath(Application.ExeName);
 CreateDir(ZalikPath+'DATA\');
end;

procedure TMainForm.Label3Click(Sender: TObject);
begin

end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
 LoadZalik;
 VariantForming;
end;

procedure TMainForm.MenuExitItemClick(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.MenuInputItemClick(Sender: TObject);
begin
  Case NumVariant of
  1:Inp1_2Form.Show;
  2:Inp1_2Form.Show;
  3:Inp3Form.Show;
  4:Inp3Form.Show;
  5:Inp5Form.Show;
  6:Inp6Form.Show;
  7:Inp7Form.Show;
  8:Inp8Form.Show;
  9:Inp9Form.Show;
  10:Inp10Form.Show;
  11:Inp11Form.Show;
  12:Inp12Form.Show;
  13:Inp13Form.Show;
  14:Inp14Form.Show;
 end;
end;

procedure TMainForm.MenuOperItemClick(Sender: TObject);
begin
  OperForm.Show;
end;

procedure TMainForm.ZalikButtonClick(Sender: TObject);
begin
 SaveZalik;
 VariantForming;
end;

procedure TMainForm.ZalikEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=13 then  ZalikButtonClick(Sender);
end;





procedure TMainForm.SaveZalik;
Var F : Text;
    ZalikFileName:String;
begin
 ZalikFileName:=ZalikPath+'DATA\zalik.txt';
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
 ZalikFileName:=ZalikPath+'DATA\zalik.txt';
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
 NumVariant:=NZK mod 10;
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

