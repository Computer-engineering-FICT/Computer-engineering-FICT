unit Unit17;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  math,maintype,
  ArrowCha, TeEngine, Series, BubbleCh, ExtCtrls, TeeProcs, Chart;

type TsystemData=record
                n:inttype;
                point:array of inttype;
                links:array of array of inttype;
                duplex:array of array of inttype;
                x:array of realtype;
                y:array of realtype;
                end;

type Tsystemobj=class(Tobject)
private
date:TsystemData;
SeriesTop: TBubbleSeries;
SeriesLink: TArrowSeries;
procedure cleardata;virtual;
procedure makecord;virtual;
public
constructor create(var Series1: TBubbleSeries;
var Series2: TArrowSeries);
procedure Reset;
procedure load(s:string);
procedure save(s:string);
procedure AddTop(Point:inttype);
procedure RemTop(Top:inttype);
procedure ChengeTop(Top,Point:inttype);
procedure AddLink(From,into,point,duplex:inttype);
procedure RemLink(From,into:inttype);
procedure ChengeLink(From,into,point,duplex:inttype);
procedure Show;
function getsystem:Tsystemgenetic;
function ifTop(Top:inttype):inttype;virtual;
function iflink(from,into:inttype):inttype;virtual;
destructor Free;
end;


implementation


procedure Tsystemobj.Reset;
begin
cleardata;
End;

procedure Tsystemobj.Show;
var i,j:inttype;
var x,y:realtype;
var x1,y1:realtype;
begin
makecord;
SeriesTop.Clear;
SeriesLink.Clear;

for i:=1 to date.n do
for j:=1 to date.n do
if date.links[i,j]<>0 then
begin
x:=date.x[i];
y:=date.y[i];
x1:=date.x[j];
y1:=date.y[j];

if date.duplex[i,j]=0 then
SeriesLink.AddArrow(x,y,x1,y1,
Format('%d',[date.links[i,j]]),clGreen)
else
SeriesLink.AddArrow(x,y,x1,y1,
Format('%d',[date.links[i,j]]),clBlue);

x:=(x+x1)/2;
y:=(y+y1)/2;

if date.duplex[i,j]=0 then
SeriesTop.AddBubble(x,y,0,
Format('%d',[date.links[i,j]]),clGreen)
else
SeriesTop.AddBubble(x,y,0,
Format('%d',[date.links[i,j]]),clBlue);
end;

for i:=1 to date.n do
begin
x:=date.x[i];
y:=date.y[i];
SeriesTop.AddBubble(x,y,5,
Format('%d',[i])+' / '+Format('%d',[date.point[i]]),clWhite);
end;

end;

procedure Tsystemobj.makecord;
var i:integer;
var angle,R:realtype;
var x0,y0,tga:realtype;
begin
SetLength(date.x,date.n+1);
SetLength(date.y,date.n+1);

R:=date.N*3;
if date.N<>0 then
angle:=(2*Pi)/date.N
else
angle:=0;

x0:=0;y0:=0;
for i:=1 to date.N do
begin
tga:=Tan(angle*i);
{cord calc}
if ((angle*i)<(Pi/2)) or ((angle*i)>(3*Pi/2)) then
begin
date.X[i]:=(1/(2*(sqr(tga)+1)))*(2*x0+2*sqr(tga)*x0+2*sqrt(sqr(tga)*sqr(R)+sqr(R)));
date.Y[i]:=(y0+(tga/(2*(sqr(tga)+1)))*(2*x0+2*sqr(tga)*x0+2*sqrt(sqr(tga)*sqr(R)+sqr(R))))-tga*x0;
end;

if ((angle*i)>(Pi/2)) and ((angle*i)<(3*Pi/2)) then
begin
date.X[i]:=(1/(2*(sqr(tga)+1)))*(2*x0+2*sqr(tga)*x0+2*sqrt(sqr(tga)*sqr(R)+sqr(R)));
date.Y[i]:=(y0+(tga/(2*(sqr(tga)+1)))*(2*x0+2*sqr(tga)*x0+2*sqrt(sqr(tga)*sqr(R)+sqr(R))))-tga*x0;
date.X[i]:=date.X[i]*(-1);
date.Y[i]:=date.Y[i]*(-1);
end;

if ((angle*i)=(Pi/2)) then
begin
date.X[i]:=x0;
date.Y[i]:=y0+R
end;

if ((angle*i)=(3*Pi/2)) then
begin
date.X[i]:=x0;
date.Y[i]:=y0-R
end;

end;
end;

procedure Tsystemobj.cleardata;
begin
date.n:=0;
date.point:=nil;
date.links:=nil;
date.duplex:=nil;
end;

destructor Tsystemobj.Free;
begin
cleardata;
end;

constructor Tsystemobj.create(var Series1: TBubbleSeries;
var Series2: TArrowSeries);
begin
SeriesTop:=Series1;
SeriesLink:=Series2;
end;

procedure Tsystemobj.load(s:string);
var
i,j:inttype;
f1:TFileStream;
begin
cleardata;
f1:=TFileStream.Create(s,fmOpenRead);
f1.Read(date.n,sizeof(date.n));

SetLength(date.point,date.n+1);
SetLength(date.links,date.n+1,date.n+1);
SetLength(date.duplex,date.n+1,date.n+1);

for i:=1 to date.n do
f1.Read(date.point[i],sizeof(date.point[i]));
for i:=1 to date.n do
for j:=1 to date.n do
f1.Read(date.links[i,j],sizeof(date.links[i,j]));

for i:=1 to date.n do
for j:=1 to date.n do
f1.Read(date.duplex[i,j],sizeof(date.duplex[i,j]));

f1.Free;
end;

procedure Tsystemobj.save(s:string);
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

for i:=1 to date.n do
for j:=1 to date.n do
f1.Write(date.duplex[i,j],sizeof(date.duplex[i,j]));

f1.Free;
end;

procedure Tsystemobj.AddTop(Point:inttype);
var i:inttype;
begin
inc(date.n);
SetLength(date.point,date.n+1);
SetLength(date.links,date.n+1,date.n+1);
SetLength(date.duplex,date.n+1,date.n+1);

for i:=1 to date.n do
begin
date.links[Date.n,i]:=0;
date.links[i,Date.n]:=0;
date.duplex[i,Date.n]:=0;
date.duplex[Date.n,i]:=0;
end;
date.point[date.n]:=Point;
end;

procedure Tsystemobj.RemTop(Top:inttype);
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
SetLength(date.duplex,date.n+1,date.n+1);
end;
end;

procedure Tsystemobj.ChengeTop(Top,Point:inttype);
begin
if ifTop(Top)<>0 then
begin
date.point[Top]:=Point;
end;
end;

procedure Tsystemobj.AddLink(From,into,point,duplex:inttype);
begin
if (from<=date.n) and (into<=date.n) then
begin
date.links[from,into]:=point;
date.links[into,from]:=point;
if duplex<>0 then
begin
date.duplex[from,into]:=1;
date.duplex[into,from]:=1;
end
else
begin
date.duplex[from,into]:=0;
date.duplex[into,from]:=0;
end;

end;
end;

procedure Tsystemobj.RemLink(From,into:inttype);
begin
if iflink(from,into)<>0 then
begin
date.links[from,into]:=0;
date.links[into,from]:=0;
end;
end;

procedure Tsystemobj.ChengeLink(From,into,point,duplex:inttype);
begin
if iflink(from,into)<>0 then
begin
date.links[from,into]:=point;
date.links[into,from]:=point;
if duplex<>0 then
begin
date.duplex[from,into]:=1;
date.duplex[into,from]:=1;
end
else
begin
date.duplex[from,into]:=0;
date.duplex[into,from]:=0;
end;

end;
end;

function Tsystemobj.getsystem:Tsystemgenetic;
var i,j:inttype;
tmpgen:Tsystemgenetic;
begin
SetLength(tmpgen.point,date.n+1);
SetLength(tmpgen.links,date.n+1,date.n+1);
SetLength(tmpgen.duplex,date.n+1,date.n+1);

tmpgen.n:=date.n;
for i:=1 to date.n do
tmpgen.point[i]:=date.point[i];
for i:=1 to date.n do
for j:=1 to date.n do
tmpgen.links[i,j]:=date.links[i,j];

for i:=1 to date.n do
for j:=1 to date.n do
tmpgen.duplex[i,j]:=date.duplex[i,j];

getsystem.n:=tmpgen.n;
getsystem.point:=tmpgen.point;
getsystem.links:=tmpgen.links;
getsystem.duplex:=tmpgen.duplex;
end;

function Tsystemobj.ifTop(Top:inttype):inttype;
begin
if top<=date.n then
iftop:=Top
else
iftop:=0;
end;

function Tsystemobj.iflink(from,into:inttype):inttype;
begin
iflink:=0;
if (from<=date.n) and (into<=date.n) then
if date.links[from,into]>0 then
iflink:=date.links[from,into]
else
iflink:=0;
end;


end.
