unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ComCtrls, ArrowCha, TeEngine, Series, BubbleCh,
  ExtCtrls, TeeProcs, Chart,unit17,maintype, Spin;

type
  TForm4 = class(TForm)
    TaskChart: TChart;
    Series1: TBubbleSeries;
    Series2: TArrowSeries;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    TabSheet2: TTabSheet;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    SpinEdit2: TSpinEdit;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    Label3: TLabel;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    TabSheet5: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton5: TSpeedButton;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    TabSheet6: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SpeedButton6: TSpeedButton;
    SpinEdit10: TSpinEdit;
    SpinEdit11: TSpinEdit;
    SpinEdit12: TSpinEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure OnActivate(Sender: TObject);
    procedure OnResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
creategraph:integer;
graph:Tsystemobj;
implementation
uses unit1;
{$R *.DFM}

procedure TForm4.OnActivate(Sender: TObject);
begin
Form4.WindowState:=wsMaximized;
if creategraph=0 then
begin
creategraph:=1;
graph:=Tsystemobj.create(Series1,Series2);
end;
end;

procedure TForm4.OnResize(Sender: TObject);
begin
TaskChart.Width:=Form4.clientWidth;
TaskChart.Height:=Form4.clientHeight-125;

PageControl1.Top:=TaskChart.Top+TaskChart.Height;
PageControl2.Left:=PageControl1.Width;
PageControl2.Top:=PageControl1.Top;

end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
graph.AddTop(SpinEdit1.Value);
graph.show;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
graph.RemTop(SpinEdit2.Value);
graph.show;
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
begin
graph.ChengeTop(SpinEdit3.Value,SpinEdit4.Value);
graph.show;
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
var i:inttype;
begin
i:=0;
if CheckBox1.Checked=true then
i:=1;
graph.AddLink(spinedit5.Value,spinedit6.Value,spinedit7.Value,i);
graph.show;
end;

procedure TForm4.SpeedButton5Click(Sender: TObject);
begin
graph.RemLink(spinedit8.Value,spinedit9.Value);
graph.show;
end;

procedure TForm4.SpeedButton6Click(Sender: TObject);
var i:inttype;
begin
i:=0;
if CheckBox2.Checked=true then
i:=1;
graph.ChengeLink(spinedit10.Value,spinedit11.Value,
spinedit12.Value,i);
graph.show;
end;

end.
