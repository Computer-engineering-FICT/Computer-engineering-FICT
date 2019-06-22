unit Unit16;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  math,maintype,
  ArrowCha, TeEngine, Series, BubbleCh, ExtCtrls, TeeProcs, Chart;


type TgraphData=record
                n:inttype;
                point:array of inttype;
                links:array of array of inttype;
                level:array of inttype;
                range:array of inttype;
                end;

type Tgraphobj=class(Tobject)
private
date:TgraphData;
SeriesTop: TBubbleSeries;
SeriesLink: TArrowSeries;
procedure cleardata;virtual;
procedure relocate;virtual;
public
constructor create(var Series1: TBubbleSeries;
var Series2: TArrowSeries);overload;
constructor Create;overload;
procedure Reset;
procedure generate(
MinTop,MaxTop,Ntop,Maxlink,MinLink:inttype;linking:realtype);
procedure load(s:string);
procedure save(s:string);
procedure AddTop(Point:inttype);
procedure RemTop(Top:inttype);
procedure ChengeTop(Top,Point:inttype);
procedure AddLink(From,into,point:inttype);
procedure RemLink(From,into:inttype);
procedure ChengeLink(From,into,point:inttype);
procedure Show;
function getgraph:Tgraphgenetic;
function ifTop(Top:inttype):inttype;virtual;
function iflink(from,into:inttype):inttype;virtual;
destructor Free;
end;


implementation

constructor Tgraphobj.Create;
begin
end;

procedure Tgraphobj.cleardata;
begin
date.n:=0;
date.point:=nil;
date.links:=nil;
date.level:=nil;
date.range:=nil;
end;

procedure Tgraphobj.Reset;
begin
cleardata;
End;

destructor Tgraphobj.Free;
begin
cleardata;
end;

procedure Tgraphobj.relocate;
var i,j,l,r,complete:inttype;
var marked,steped,recive:array of inttype;
begin
/////////////////////
SetLength(date.level,date.n+1);
SetLength(date.range,date.n+1);
//////////////////
SetLength(marked,date.n+1);
SetLength(steped,date.n+1);
SetLength(recive,date.n+1);
for i:=1 to date.n do
begin
recive[i]:=0;
marked[i]:=0;
steped[i]:=0;
end;
for i:=1 to date.n do
for j:=1 to date.n do
if date.links[i,j]<>0 then
inc(recive[j]);

complete:=0;
l:=0;
while complete=0 do
begin
for i:=1 to date.n do
steped[i]:=0;
r:=0;

for i:=1 to date.n do
if marked[i]=0 then
if recive[i]=0 then
if steped[i]=0 then
        begin
        inc(r);
        date.range[i]:=r;
        date.level[i]:=l;
        marked[i]:=1;
        for j:=1 to date.n do
        if date.links[i,j]<>0 then
        begin
        dec(recive[j]);
        steped[j]:=1;
        end;
        end;

inc(l);
complete:=1;
for i:=1 to date.n do
if marked[i]=0 then
complete:=0;
end;

marked:=nil;
recive:=nil;
steped:=nil;
end;

constructor Tgraphobj.create(var Series1: TBubbleSeries;
var Series2: TArrowSeries);
begin
SeriesTop:=Series1;
SeriesLink:=Series2;
end;


procedure Tgraphobj.generate(
MinTop,MaxTop,Ntop,Maxlink,MinLink:inttype;linking:realtype);
var i,j:inttype;
var tic,tmp1,tmp2,allproc,alllink:inttype;
begin
randomize;
cleardata;

date.n:=Ntop;
SetLength(date.point,date.n+1);
SetLength(date.links,date.n+1,date.n+1);
for i:=1 to date.n do
date.point[i]:=0;
for i:=1 to date.n do
for j:=1 to date.n do
date.links[i,j]:=0;


tmp1:=(MaxTop-MinTop)+1;
if tmp1<1 then
tmp1:=1;
allproc:=0;
for i:=1 to date.n do
begin
date.point[i]:=MinTop+trunc(Random(tmp1));
allproc:=allproc+date.point[i];
end;

allproc:=Trunc((allproc*linking)/(1-linking))+1;

tmp2:=(Maxlink-MinLink)+1;
if tmp2<1 then
tmp2:=1;


alllink:=0;
tic:=0;

while (allproc>allLink) and (tic<((date.n*date.n)*100)) do
begin
inc(tic);
i:=trunc(random(date.n+1));
if i<1 then i:=1;
j:=i+trunc(random(date.n-i+1));
if j>date.n then j:=date.n;
if (j>i) and (date.links[i,j]=0) then
begin
date.links[i,j]:=MinLink+trunc(Random(tmp2));
alllink:=alllink+date.links[i,j];
end;

end;

end;

procedure Tgraphobj.load(s:string);
var
i,j:inttype;
f1:TFileStream;
begin
cleardata;
f1:=TFileStream.Create(s,fmOpenRead);
f1.Read(date.n,sizeof(date.n));

SetLength(date.point,date.n+1);
SetLength(date.links,date.n+1,date.n+1);

for i:=1 to date.n do
f1.Read(date.point[i],sizeof(date.point[i]));
for i:=1 to date.n do
for j:=1 to date.n do
f1.Read(date.links[i,j],sizeof(date.links[i,j]));

f1.Free;
end;

procedure Tgraphobj.save(s:string);
var
i,j:inttype;
f1:TFileStream;
begin
f1:=TFileStream.Create(s,fmCreate);
f1.Write(date.n,sizeof(date.n));
for i:=1 to date.n do
f1.Write(date.point[i],sizeof(date.point[i]));
for i:=1 to date.n do
for j:=1 to date.n do
f1.Write(date.links[i,j],sizeof(date.links[i,j]));
f1.Free;
end;

procedure Tgraphobj.AddTop(Point:inttype);
var i:inttype;
begin
inc(date.n);
SetLength(date.point,date.n+1);
SetLength(date.links,date.n+1,date.n+1);

for i:=1 to date.n do
begin
date.links[Date.n,i]:=0;
date.links[i,Date.n]:=0;
end;
date.point[date.n]:=Point;
end;

procedure Tgraphobj.RemTop(Top:inttype);
var i,j:inttype;
begin
if ifTop(Top)<>0 then
begin
for i:=top to date.n-1 do
date.point[i]:=date.point[i+1];

for i:=top to date.n-1 do
for j:=1 to date.n do
date.links[i,j]:=date.links[i+1,j];

for i:=1 to date.n-1 do
for j:=top to date.n do
date.links[i,j]:=date.links[i,j+1];

dec(date.n);
SetLength(date.point,date.n+1);
SetLength(date.links,date.n+1,date.n+1);
end;
end;

procedure Tgraphobj.ChengeTop(Top,Point:inttype);
begin
if ifTop(Top)<>0 then
begin
date.point[Top]:=Point;
end;
end;

procedure Tgraphobj.AddLink(From,into,point:inttype);
begin
if (from<=date.n) and (into<=date.n) and (from<>into) then
begin
date.links[from,into]:=point;
end;
end;

procedure Tgraphobj.RemLink(From,into:inttype);
begin
if iflink(from,into)<>0 then
begin
date.links[from,into]:=0;
end;
end;

procedure Tgraphobj.ChengeLink(From,into,point:inttype);
begin
if iflink(from,into)<>0 then
begin
date.links[from,into]:=point;
end;
end;

procedure Tgraphobj.Show;
var i,j:inttype;
var x,y:realtype;
var x1,y1:realtype;
begin
relocate;
SeriesTop.Clear;
SeriesLink.Clear;

for i:=1 to date.n do
for j:=1 to date.n do
if date.links[i,j]<>0 then
begin
x:=date.range[i]*20;
y:=-20*date.level[i];
x1:=date.range[j]*20;
y1:=-20*date.level[j];
SeriesLink.AddArrow(x,y,x1,y1,
Format('%d',[date.links[i,j]]),clGreen);
x:=(x+x1)/2;
y:=(y+y1)/2;
SeriesTop.AddBubble(x,y,0,
Format('%d',[date.links[i,j]]),clGreen);
end;
for i:=1 to date.n do
begin
x:=date.range[i]*20;
y:=-20*date.level[i];
SeriesTop.AddBubble(x,y,5,
Format('%d',[i])+' / '+Format('%d',[date.point[i]]),clWhite);
end;

end;

function Tgraphobj.getgraph:Tgraphgenetic;
var i,j:inttype;
tmpgen:Tgraphgenetic;
begin
SetLength(tmpgen.point,date.n+1);
SetLength(tmpgen.links,date.n+1,date.n+1);
tmpgen.n:=date.n;
for i:=1 to date.n do
tmpgen.point[i]:=date.point[i];
for i:=1 to date.n do
for j:=1 to date.n do
tmpgen.links[i,j]:=date.links[i,j];
getgraph.n:=tmpgen.n;
getgraph.point:=tmpgen.point;
getgraph.links:=tmpgen.links;
end;

function Tgraphobj.ifTop(Top:inttype):inttype;
begin
if top<=date.n then
iftop:=Top
else
iftop:=0;
end;

function Tgraphobj.iflink(from,into:inttype):inttype;
begin
iflink:=0;
if (from<=date.n) and (into<=date.n) then
if date.links[from,into]>0 then
iflink:=date.links[from,into]
else
iflink:=0;
end;

end.
