unit UnLIST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFPanel = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPanel: TFPanel;

implementation

uses UnMain;

{$R *.dfm}

procedure TFPanel.FormResize(Sender: TObject);
begin
//455 126
{FPanel.Height:=455;
FPanel.Width:=126;}
end;

procedure TFPanel.FormCreate(Sender: TObject);
begin
FPanel.top:=20;
FPanel.Left:=FMain.Width-(FPanel.Width+20);
end;

end.
