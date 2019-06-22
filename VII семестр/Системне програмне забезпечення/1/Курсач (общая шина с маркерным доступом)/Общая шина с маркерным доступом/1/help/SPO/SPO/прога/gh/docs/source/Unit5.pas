unit Unit5;

interface

uses
  Classes,unit15,unit16,unit4,math,maintype,unit8,unit9,
  Windows, Messages, SysUtils,Graphics, Controls, Forms, Dialogs,
  Grids;


type Ttimeplain=record
                x,y:inttype;
                time:array of array of record
                                       tkrit:inttype;
                                       time:inttype;
                                       Curtask:inttype;
                                       Curlink:inttype;
                                       end;
                end;
type
  Statistic = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Statistic.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Statistic }

procedure Statistic.Execute;
var
MinTask,MaxTask,StepTask,MinLink,MaxLink,StepLink,
MinLongTask,MaxLongTask,MinLongLink,MaxLongLink,
Ngraph,CurTask,CurLink:inttype;
i,j,k:inttype;
s1:Tsystemgenetic;
s:Tsystemgenetic;
g:Tgraphgenetic;
Timeplain:TTimeplain;
graph:Tgraphobj;
gen:Tgenetic;
r:realtype;
begin
Form9.Show;
Form9.WindowState:=wsMaximized;

s1:=unit4.graph.getsystem;
if s1.n<>0 then
begin

SetLength(s.point,s1.n+1);
SetLength(s.links,s1.n+1,s1.n+1);
SetLength(s.duplex,s1.n+1,s1.n+1);

s.n:=s1.n;
for i:=1 to s1.n do
s.point[i]:=s1.point[i];
for i:=1 to s1.n do
for j:=1 to s1.n do
begin
s.links[i,j]:=s1.links[i,j];
s.duplex[i,j]:=s1.duplex[i,j];
end;

MinTask:=form5.SpinEdit1.Value;
MaxTask:=form5.SpinEdit2.Value;
StepTask:=form5.SpinEdit3.Value;
MinLink:=form5.SpinEdit4.Value;
MaxLink:=form5.SpinEdit5.Value;
StepLink:=form5.SpinEdit6.Value;
MinLongTask:=form5.SpinEdit7.Value;
MaxLongTask:=form5.SpinEdit8.Value;
MinLongLink:=form5.SpinEdit10.Value;
MaxLongLink:=form5.SpinEdit11.Value;
Ngraph:=form5.SpinEdit9.Value;


for i:=0 to form9.StringGrid1.RowCount do
for j:=0 to  form9.StringGrid1.ColCount do
form9.StringGrid1.Cells[j,i]:='';


i:=0;
CurTask:=Mintask;
CurLink:=Minlink;
timeplain.x:=0;
Timeplain.y:=0;
Timeplain.time:=nil;
graph:=Tgraphobj.create;

while Curtask<=Maxtask do
begin
inc(i);
inc(timeplain.x);
form9.StringGrid1.ColCount:=Timeplain.x+1;
form9.StringGrid1.Cells[i,0]:=
format('%d',[Curtask]);
Curtask:=Curtask+Steptask;
end;
i:=0;
while CurLink<=MaxLink do
begin
inc(i);
inc(Timeplain.y);
form9.StringGrid1.RowCount:=Timeplain.y+1;
form9.StringGrid1.Cells[0,i]:=
Format('%d',[100-Curlink])+'/'+
Format('%d',[Curlink]);
CurLink:=CurLink+StepLink;
end;
SetLength(Timeplain.time,Timeplain.y+1,Timeplain.x+1);


timeplain.x:=0;
Timeplain.y:=0;
CurTask:=Mintask;
CurLink:=Minlink;

while Curtask<=Maxtask do
begin
inc(timeplain.x);
CurLink:=Minlink;
Timeplain.y:=0;
while CurLink<=MaxLink do
begin
inc(Timeplain.y);

Timeplain.time[Timeplain.y,Timeplain.x].tkrit:=0;
Timeplain.time[Timeplain.y,Timeplain.x].time:=0;
Timeplain.time[Timeplain.y,Timeplain.x].Curtask:=Curtask;
Timeplain.time[Timeplain.y,Timeplain.x].Curlink:=Curlink;

for k:=1 to Ngraph do
begin

graph.generate(
MinLongTask,MaxLongTask,Curtask,MaxLongLink,MinLongLink,
CurLink/100);
g:=graph.getgraph;

i:=100;j:=5;
gen:=Tgenetic.Create(i,j,20,g,s,0.3);
j:=10;
for i:=1 to 50 do
gen.epoha(j);

Timeplain.time[Timeplain.y,Timeplain.x].tkrit:=
Timeplain.time[Timeplain.y,Timeplain.x].tkrit+
gen.getkrittime;
Timeplain.time[Timeplain.y,Timeplain.x].time:=
Timeplain.time[Timeplain.y,Timeplain.x].time+
gen.getbesttime;

gen.Free;
gen:=nil;
end;

CurLink:=CurLink+StepLink;
end;
Curtask:=Curtask+Steptask;
end;

{вывод на диаграмму}

for i:=1 to Timeplain.x do
for j:=1 to Timeplain.y do
begin
//Curtask:=Timeplain.time[j,i].Curtask;
//Curlink:=Timeplain.time[j,i].Curlink;

r:=Timeplain.time[j,i].time/Timeplain.time[j,i].tkrit;
form9.StringGrid1.Cells[i,j]:=Format('%f',[r]);
end;
end;
Form5.SpeedButton1.Enabled:=True;

end;

end.
