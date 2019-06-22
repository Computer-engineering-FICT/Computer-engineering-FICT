unit UnPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls;

type
  TFMT = class(TForm)
    StringGrid1: TStringGrid;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMT: TFMT;

implementation

uses UnMain;

{$R *.dfm}

procedure TFMT.FormResize(Sender: TObject);
begin
 //165   579
 FMT.Height:=165;
 FMT.Width:=579;

end;

procedure TFMT.FormCreate(Sender: TObject);
begin
FMT.Left:=20;
FMT.Top:=20;
end;

end.
