unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, ArrowCha,
  Series, BubbleCh, Mask, Buttons,unit16,maintype, Spin;

type
  TForm3 = class(TForm)
    TaskChart: TChart;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Series1: TBubbleSeries;
    Series2: TArrowSeries;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label3: TLabel;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    Label10: TLabel;
    SpinEdit10: TSpinEdit;
    SpinEdit11: TSpinEdit;
    Label11: TLabel;
    Label12: TLabel;
    SpinEdit12: TSpinEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
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
  Form3: TForm3;
creategraph:integer;
graph:Tgraphobj;
implementation
uses unit1;
{$R *.DFM}

procedure TForm3.OnActivate(Sender: TObject);
begin
Form3.WindowState:=wsMaximized;
if creategraph=0 then
begin
creategraph:=1;
graph:=Tgraphobj.create(Series1,Series2);
end;
end;

procedure TForm3.OnResize(Sender: TObject);
begin
TaskChart.Width:=Form3.clientWidth;
TaskChart.Height:=Form3.clientHeight-125;

PageControl1.Top:=TaskChart.Top+TaskChart.Height;
PageControl2.Left:=PageControl1.Width;
PageControl2.Top:=PageControl1.Top;

end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
graph.AddTop(SpinEdit1.Value);
graph.show;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
graph.RemTop(SpinEdit2.Value);
graph.show;
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
graph.ChengeTop(SpinEdit3.Value,SpinEdit4.Value);
graph.show;
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
graph.AddLink(spinedit5.Value,spinedit6.Value,spinedit7.Value);
graph.show;
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
graph.RemLink(spinedit8.Value,spinedit9.Value);
graph.show;
end;

procedure TForm3.SpeedButton6Click(Sender: TObject);
begin
graph.ChengeLink(spinedit10.Value,spinedit11.Value,
spinedit12.Value);
graph.show;
end;

end.
