unit FormAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,
  Lang;

type
  TAboutForm = class(TForm)
    Panel: TPanel;
    Image: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnClose: TButton;
    Label9: TLabel;
    Label11: TLabel;
    pDivider1: TPanel;
    Label3: TLabel;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.DFM}

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  Caption := Title + Divider + About;
end;

end.
