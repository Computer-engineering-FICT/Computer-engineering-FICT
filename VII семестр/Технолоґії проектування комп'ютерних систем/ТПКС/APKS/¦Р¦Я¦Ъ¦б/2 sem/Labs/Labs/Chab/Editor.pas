unit Editor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids,lab1_1, StdCtrls, Buttons, ComCtrls;

type
  TEditForm = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MMura: TStringGrid;
    MMili: TStringGrid;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;
  E:TNode;
implementation


{$R *.DFM}

procedure TEditForm.FormCreate(Sender: TObject);
begin
     MMura.cells[0,0]:='��';
     MMura.cells[1,0]:='���';
     MMura.cells[2,0]:='��';
     MMura.cells[3,0]:='���';
     MMili.cells[0,0]:='��';
     MMili.cells[1,0]:='���';
     MMili.cells[2,0]:='��';
     MMili.cells[3,0]:='���';


end;

procedure TEditForm.BitBtn1Click(Sender: TObject);
begin
Editform.MMura.Refresh;
Editform.MMili.Refresh;
EditForm.close;
end;

end.

