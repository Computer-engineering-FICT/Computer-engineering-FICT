unit mMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, MyRombShape;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;


implementation

uses mGraphRedaktor, mStructura;

{$R *.dfm}

procedure TfrmMain.N1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  frmGraphRedaktor.Show;
  frmGraphRedaktor.WindowState := wsMaximized;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  frmStructura.Show;
  frmStructura.WindowState := wsMaximized;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  frmGraphRedaktor.Show;
  frmGraphRedaktor.WindowState := wsMaximized;
end;

end.
