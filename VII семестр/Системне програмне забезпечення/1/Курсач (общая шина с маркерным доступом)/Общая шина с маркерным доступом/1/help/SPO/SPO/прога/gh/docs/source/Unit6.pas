unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Buttons,unit3,unit4,unit15,maintype, StdCtrls, TeEngine, Series,
  GanttCh, ExtCtrls, TeeProcs, Chart, Spin;

type
  TForm6 = class(TForm)
    SpeedButton1: TSpeedButton;
    Chart1: TChart;
    Series1: TGanttSeries;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    SpinEdit1: TSpinEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure OnResize(Sender: TObject);
    procedure OnActivate(Sender: TObject);
    procedure graphshow(N:integer);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
var gen:Tgenetic;

implementation

{$R *.DFM}

procedure TForm6.graphshow(N:integer);
var i,j,k,y,size:inttype;
BB:Toutmsg;
begin
if gen<>nil then
begin

gen.getevent(n,BB);
gen.getsize(i,size);

label1.Caption:='Критическое время='+
Format('%d',[BB.tkrit])+' Время= '+Format('%d',[BB.time]);
Series1.Clear;
Y:=0;
for i:=1 to size do
begin
if BB.proc[i].N<>0 then
begin
inc(Y);
Series1.AddGanttColor(-10,-10,y,'',clNone);
Series1.AddGanttColor(-5,-5,y,'P('+Format('%d',[i])+')',clGreen);
for j:=1 to BB.proc[i].N  do
Series1.AddGanttColor(BB.proc[i].event[j].timebegin,
BB.proc[i].event[j].timeend,y,
Format('%d',[BB.proc[i].event[j].process]),
clGreen);
end;

for j:=1 to size do
if BB.links[i,j].N<>0 then
begin
inc(Y);
Series1.AddGanttColor(-10,-10,Y,'',clNone);
Series1.AddGanttColor(-5,-5,y,'Lnk('+
Format('%d',[i])+'-'+Format('%d',[j])+')',clBlue);
for k:=1 to BB.links[i,j].N do
Series1.AddGanttColor(BB.links[i,j].Event[k].timebegin,
BB.links[i,j].Event[k].timeend,Y,Format('(%d-%d)',
[BB.links[i,j].Event[k].from,BB.links[i,j].Event[k].into]),
clBlue);
end;
end;

end;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
var i,j:inttype;
s:Tsystemgenetic;
g:Tgraphgenetic;
begin
if gen<>nil then
begin
gen.Free;
gen:=nil;
end;

s:=unit4.graph.getsystem;
g:=unit3.graph.getgraph;
i:=100;j:=5;
SpinEdit1.MaxValue:=j;
gen:=Tgenetic.Create(i,j,20,g,s,0.3);
j:=10;
for i:=1 to 50 do
gen.epoha(j);

j:=1;
gen.epoha(j);

graphshow(1);
end;

procedure TForm6.OnResize(Sender: TObject);
begin
Chart1.Width:=Form6.clientWidth;
Chart1.Height:=Form6.clientHeight-25;

SpeedButton1.Top:=Chart1.top+Form6.clientHeight-25;
SpeedButton3.Top:=Chart1.top+Form6.clientHeight-25;
SpinEdit1.Top:=Chart1.top+Form6.clientHeight-25;
Label1.Top:=Chart1.top+Form6.clientHeight-21;
end;

procedure TForm6.OnActivate(Sender: TObject);
begin
form6.WindowState:=wsMaximized;
end;

procedure TForm6.SpeedButton3Click(Sender: TObject);
begin
graphshow(SpinEdit1.Value);
end;

end.
