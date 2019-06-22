unit UnMT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TFList = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FList: TFList;

implementation

uses UnMain;

{$R *.dfm}

procedure TFList.FormCreate(Sender: TObject);
begin
FList.Top:=Fmain.height-(Flist.Height+150);
FList.Left:=20;
end;

end.
