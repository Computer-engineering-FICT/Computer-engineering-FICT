unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, ExtCtrls;

Const
VariantArr:array[0..9] of String = (
'Варіант 0.  ASCI код',
'Варіант 1. Цілі числа 0...255',
'Варіант 2. Літери англійського алфавіту',
'Варіант 3. Літери українського алфавіту',
'Варіант 4. Літери російського алфавіту',
'Варіант 5. Цілі числа 0...1023',
'Варіант 6. Парні числа від 0…1023',
'Варіант 7. Непарні числа від 0…1023',
'Варіант 8. Числа від 0…1023, які діляться без остачі на 5',
'Варіант 9. Числа від 0…1023, які діляться без остачі на 3');


type

  { TMainForm }

  TMainForm = class(TForm)
    InfoPanel: TPanel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ZalikButton: TButton;
    ZalikEdit: TEdit;
    Label1: TLabel;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InfoPanelClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure ZalikButtonClick(Sender: TObject);
    procedure ZalikEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { private declarations }
    procedure SaveZalik;
    procedure LoadZalik;
    procedure VariantForming;
  public
    { public declarations }
  end;

var
  MainForm: TMainForm;
  ZalikPath:String;
  Num:Integer;

implementation

uses Unit2,Unit3,Unit4,Unit5,Unit6,Unit7,Unit8,Unit9,Unit10,Unit11,Unit12;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.MenuItem1Click(Sender: TObject);
begin
 OperForm.Show;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 ZalikPath:=ExtractFilePath(Application.ExeName);
 CreateDir(ZalikPath+'DATA\');
end;

procedure TMainForm.InfoPanelClick(Sender: TObject);
begin

end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  LoadZalik;
  VariantForming;
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  Case Num of
  0:Inp0Form.Show;
  1:Inp1Form.Show;
  2:Inp2Form.Show;
  3:Inp3Form.Show;
  4:Inp4Form.Show;
  5:Inp5Form.Show;
  6:Inp6Form.Show;
  7:Inp7Form.Show;
  8:Inp8Form.Show;
  9:Inp9Form.Show;
 end;
end;


procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
  Close;
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
  InfoPanel.Caption:='Невозможно записать в '+ZalikFileName;
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
   InfoPanel.Caption:='Невозможно записать в '+ZalikFileName;
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
 Num:=Num mod 10;
 InfoPanel.Caption:=VariantArr[Num];
 end else InfoPanel.Caption:='Наберіть номер ЗК і натисніть "ВВІД"';
end;



end.

