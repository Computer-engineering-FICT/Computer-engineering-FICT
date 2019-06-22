unit Check1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ComCtrls;

type
  TfmCheck1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Label3: TLabel;
    Memo3: TMemo;
    Panel4: TPanel;
    Label4: TLabel;
    Memo4: TMemo;
    Splitter3: TSplitter;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Splitter4: TSplitter;
    Memo5: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCheck1: TfmCheck1;

implementation

{$R *.dfm}

procedure TfmCheck1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:= '+';
  StringGrid2.Cells[0,0]:= '-';
end;

end.
