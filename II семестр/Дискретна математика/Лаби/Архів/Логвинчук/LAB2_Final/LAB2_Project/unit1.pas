unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls;
Const
 VariantArr:array[0..19] of String = (
 'Варіант 0. "aSb, якщо a сестра b. aRb, якщо a дружина b"',
 'Варіант 1. "aSb, якщо a мати b. aRb, якщо a внучка b"',
 'Варіант 2. "aSb, якщо a дружина b. aRb, якщо a мати b"',
 'Варіант 3. "aSb, якщо а сестра b. aRb, якщо a мати b"',
 'Варіант 4. "aSb, якщо a свекруха b. aRb, якщо a батько b"',
 'Варіант 5. "aSb, якщо a сестра b. aRb, якщо a чоловік b"',
 'Варіант 6. "aSb, якщо a батько b. aRb, якщо a внук b"',
 'Варіант 7. "aSb, якщо a дружина b. aRb, якщо a мати b"',
 'Варіант 8. "aSb, якщо a сестра b. aRb, якщо a мати b"',
 'Варіант 9. "aSb, якщо a свекруха b. aRb, якщо a батько b"',
 'Варіант 10. "aSb, якщо a брат b. aRb, якщо a чоловік b"',
 'Варіант 11. "aSb, якщо a чоловік b. aRb, якщо a батько b"',
 'Варіант 12. "aSb, якщо a тесть b. aRb, якщо a батько b"',
 'Варіант 13. "aSb, якщо a брат b. aRb, якщо a мати b"',
 'Варіант 14. "aSb, якщо a син b. aRb, якщо a свекор b"',
 'Варіант 15. "aSb, якщо a брат b. aRb, якщо a дружина b"',
 'Варіант 16. "aSb, якщо a чоловік b. aRb, якщо a батько b"',
 'Варіант 17. "aSb, якщо a тесть b. aRb, якщо a батько b"',
 'Варіант 18. "aSb, якщо a брат b. aRb, якщо a мати b"',
 'Варіант 19. "aSb, якщо a син b. aRb, якщо a свекор b"');

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
  Num:Integer;
implementation
Uses Unit2,Unit3;
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
 InpForm.Show;
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
 If Key=13 then ZalikButtonClick(Sender);
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
  InfoPanel.Caption:='Неможливо записати в '+ZalikFileName;
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
   Num := StrToInt(ZalikEdit.Text);
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
 Num:=Num mod 20;
 InfoPanel.Caption:=VariantArr[Num];
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

