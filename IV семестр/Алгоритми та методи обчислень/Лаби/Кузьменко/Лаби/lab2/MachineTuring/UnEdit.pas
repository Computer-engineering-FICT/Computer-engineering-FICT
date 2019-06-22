unit UnEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TFEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdit: TFEdit;

implementation

{$R *.dfm}

end.
