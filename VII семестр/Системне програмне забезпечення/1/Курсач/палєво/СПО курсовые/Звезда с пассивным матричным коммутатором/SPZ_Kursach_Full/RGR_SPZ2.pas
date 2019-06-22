unit RGR_SPZ2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, RGR_SPZ1, ExtCtrls;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
procedure TForm2.Button1Click(Sender: TObject);
var
  i:Integer;
begin
  PreProcessing;
  BuildGrafikGanta;


  i:=0;
  repeat i:=i+1;
  until GrafikGanta[Time,i]<>0;

  CurrentNizKlastera:=GrafikGanta[Time,i];

  ViewGrafikGanta;
end;
//******************************************************************************
procedure TForm2.Button2Click(Sender: TObject);
begin
  OptimizeGrafikGanta;
  BuildGrafikGanta;
  ViewGrafikGanta;

  Form2.Caption:=IntToStr(CurrentNizKlastera);
end;
//******************************************************************************
procedure TForm2.Button3Click(Sender: TObject);
begin
  Minimize_Proc_Count;
  ViewGrafikGanta;
end;
//******************************************************************************
procedure TForm2.Button4Click(Sender: TObject);
begin
  UporjadochitChisloProcessorov;
  BuildGrafikGanta;
  ViewGrafikGanta;
end;
//******************************************************************************
procedure TForm2.Button5Click(Sender: TObject);
begin
  SendKlasterToNewProc(Zadanie[StrToInt(Form2.LabeledEdit1.Text)].Klaster,StrToInt(Form2.LabeledEdit2.Text));
  BuildGrafikGanta;
  ViewGrafikGanta;
end;

end.



