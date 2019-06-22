unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, inifiles;

type
  TForm5 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

  Path, Lab1, Lab2, Lab3, Lab4: string;

implementation

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
var
  FIni: TIniFile;
begin
  // Path
  Path := ExtractFilePath(ParamStr(0));
  if Path[Length(Path)] <> '\' then Path := Path + '\';
  // Load options
  FIni := TIniFile.Create(Path + 'Manager.ini');
  Lab1 := Path + FIni.ReadString('Manager', 'Lab1_1' ,'Lab1.exe');
  Lab2 := Path + FIni.ReadString('Manager', 'Lab1_2' ,'Lab2.exe');
  Lab3 := Path + FIni.ReadString('Manager', 'Lab1_3' ,'Lab3.exe');
  Lab4 := Path + FIni.ReadString('Manager', 'Lab1_4' ,'Lab4.exe');
  FIni.Free;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  WinExec(PChar(Lab1), SW_SHOW);
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  WinExec(PChar(Lab2), SW_SHOW);
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
  WinExec(PChar(Lab3), SW_SHOW);
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
  WinExec(PChar(Lab4), SW_SHOW);
end;

end.
