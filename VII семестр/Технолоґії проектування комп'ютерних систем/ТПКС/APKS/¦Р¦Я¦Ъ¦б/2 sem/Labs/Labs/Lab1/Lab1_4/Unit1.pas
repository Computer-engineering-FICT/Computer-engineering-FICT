unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    ScrollBox2: TScrollBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
const
  MaxN=200;
  delta=15;
  l=5;
  wideth=40;
  Height=60;
Type
  TTerm=record
    Value:array of integer;
    x,y:integer;
   end;

   TFunc=record
     Name:string;
     TermList:array of integer;
     x,y,xt,yt:integer;
   end;
var
  Terms:array[0..MaxN] of TTerm;
  Funcs:array[0..MaxN] of TFunc;
  Strings,SignalNames:array[0..MaxN] of string;
  Top:integer=40;
  Left:integer;
  maxBottom:integer=0;
  TRigCnt,InCnt,TermCnt,FuncCnt,StrCnt:integer;
  TrigName:string;
{----------------------------------}
procedure Connect1(orX,orY,Vhod,Nom,andX,AndY,VhodCnt:integer);
  var x1,y1,x2,y2,x3,y3,x4,y4:integer;
begin
  x1:=orX;
  y1:=orY+delta*(Vhod+1);
  x2:=andX+wideth+delta*(Nom+1);
  y2:=y1;
  x3:=x2;
  y3:=andY+((VhodCnt+1)*delta) div 2;
  x4:=andX+wideth;
  y4:=y3;
  Form1.Image1.Canvas.MoveTo(x1,y1);
  Form1.Image1.Canvas.LineTo(x2,y2);
  Form1.Image1.Canvas.LineTo(x3,y3);
  Form1.Image1.Canvas.LineTo(x4,y4);
end;
{----------------------------------}
procedure Connect2(TrigX,TrigY,Vhod,Nom,X,Y,VhodCnt:integer);
  var x1,y1,x2,y2,x3,y3,x4,y4:integer;
begin
  x1:=TrigX;
  case Vhod of
    0:y1:=TrigY+Height div 2;
    1:y1:=TrigY+Height div 3;
    2:y1:=TrigY+(Height div 3)*2
  end;
  if X<>-1 then
  begin
   x2:=X+wideth+delta*(Nom+1);
   y2:=y1;
   x3:=x2;
   y3:=Y+((VhodCnt+1)*delta) div 2;
   x4:=X+wideth;
   y4:=y3;
  end
  else
  begin
   x2:=x1-30;
   y2:=y1;
   x3:=x2;
   y3:=y2;
   x4:=x3;
   y4:=y3
  end;
  Form1.Image1.Canvas.MoveTo(x1,y1);
  Form1.Image1.Canvas.LineTo(x2,y2);
  Form1.Image1.Canvas.LineTo(x3,y3);
  Form1.Image1.Canvas.LineTo(x4,y4);
  if X=-1 then
    Form1.Image1.Canvas.TextOut(x2-10,y2-7,'0');
end;

{------------------------------------}
procedure Connect3(x,y,Vhod,Trig,TrigX,TrigY,Vyh:integer);
  var x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6:integer;
begin
  x1:=x;
  y1:=y+delta*(Vhod+1);
  x2:=x1-delta*(Trigcnt-Trig+1);
  y2:=y1;
  x3:=x2;
  y3:=MaxBottom+delta*(TrigCnt-Trig+1);
  x4:=TrigX+3*(wideth div 2)+delta*(TrigCnt-Trig+1);
  if Vyh=1 then
  begin
    x4:=x4+5*delta;
    y3:=y3+5*delta;
    x2:=x2-5*delta;
    x3:=x2
  end;
  y4:=y3;
  x5:=x4;
  if Vyh=1 then
    y5:=TrigY+ Height div 3
  else
    y5:=TrigY+(Height div 3)*2;
    x6:=Trigx+(Wideth div 2)*3;
  y6:=y5;
  Form1.Image1.Canvas.MoveTo(x1,y1);
  Form1.Image1.Canvas.LineTo(x2,y2);
  Form1.Image1.Canvas.LineTo(x3,y3);
  Form1.Image1.Canvas.LineTo(x4,y4);
  Form1.Image1.Canvas.LineTo(x5,y5);
  Form1.Image1.Canvas.LineTo(x6,y6);

end;
{-------------------------------------}
procedure PutElem(Text:string;Nom,VhodCnt:integer);
  var h:integer;
begin
  left:=0;
  h:=(VhodCnt+1)*delta;
  if Text='&'
    then Left:=200;
  if Text='1'
    then Left:=200+Wideth+delta* (TermCnt+2);
  Form1.Image1.Canvas.Rectangle(Left,Top,Left+wideth,Top+h);
  Form1.Image1.Canvas.TextOut(8+Left+wideth div 2,Top+delta-10,text);
  Form1.Image1.Canvas.TextOut(Left+wideth div 2,Top+H div 2,intToStr(Nom));
  if Top+h>MaxBottom then
    MaxBottom:=Top+h;
  if Text='&' then
  begin
    Terms[Nom].x:=Left;
    Terms[Nom].y:=Top
  end;
  if Text='1' then
  begin
    Funcs[Nom].x:=Left;
    Funcs[Nom].y:=Top
  end ;
  Top:=Top+delta+h;
end;
{----------------------------------}
procedure PutTrigger(Text:string;Nom:integer);
begin
  Form1.Image1.Canvas.Rectangle(Left,Top,Left+wideth+wideth div 2,Top+height);
  Form1.Image1.Canvas.MoveTo(Left+wideth,Top);
  Form1.Image1.Canvas.Lineto(Left+wideth,Top+height);
  Form1.Image1.Canvas.TextOut(Left+wideth div 2,Top+delta,text);
  Form1.Image1.Canvas.TextOut(Left+wideth div 2,Top+Height div 2,intToStr(Nom));

  Form1.Image1.Canvas.MoveTo(Left+3*(wideth div 2),Top+height div 3);
  Form1.Image1.Canvas.Lineto(Left+3*(wideth div 2)+15,Top+height div 3);
  Form1.Image1.Canvas.MoveTo(Left+3*(wideth div 2),Top+(height div 3)*2);
  Form1.Image1.Canvas.Lineto(Left+3*(wideth div 2)+15,Top+(height div 3)*2);
  Form1.Image1.Canvas.TextOut(Left+3*(wideth div 2)-15,Top-5+height div 3,'Q');
  Form1.Image1.Canvas.TextOut(Left+3*(wideth div 2)-15,Top-5+(height div 3)*2,'Q');
  Form1.Image1.Canvas.Ellipse(Left-3+3*(wideth div 2),Top-3+(height div 3)*2,Left+3+3*(wideth div 2),Top+3+(height div 3)*2);

  Funcs[Nom].xt:=left;
  Funcs[Nom].yt:=Top;
  if Top+height+delta>MaxBottom then
    MaxBottom:=Top+height+delta;
  Top:=Top+delta+height;
end;
{---------------------------------}
procedure DivideStr(S:string;var First,Last:string;delim:char);
  var i:integer;
      flag:boolean;
begin
  Last:='';
  First:='';
  flag:=true;
  for i:=1 to Length(S) do
    if flag and(S[i]=delim) then
      flag:=false
    else
      if flag then
        First:=First+S[i]
      else
        Last:=Last+S[i]
end; {Devidestr}
{--------------------------------}
function Find(var pos:integer):boolean;
  var i,j:integer;
  flag:boolean;
begin
  Find:=false;
  for i:=0 to TermCnt-1 do
  begin
    if length(Terms[i].value)<>length(Terms[TermCnt].Value) then
    flag:=false
    else
    begin
      flag:=true;
      for j:=0 to Length(Terms[i].value)-1 do
        if Terms[i].Value[j]<>Terms[TermCnt].Value[j] then
          flag:=false;
    end;
    if flag then
    begin
      pos:=i;
      find:=true
    end
  end
end;{Find}
{---------------------------}
procedure StringAnalyser(s:string);
  var Last,First,Last1,First1:string;
      TermNom,i:integer;
begin
  DivideStr(s,first,last,'=');
  Funcs[FuncCnt].Name:=First;
  if Last='0' then
  begin
    SetLength(Funcs[FuncCnt].TermList,1);
    Funcs[FuncCnt].TermList[0]:=-1
  end
  else
    repeat
      DivideStr(Last,First,Last,'V');
      last1:=First;
      i:=0;
      repeat
        DivideStr(Last1,First1,Last1,'*');
        setLength(Terms[TermCnt].Value,i+1);
        if Length(First1)<>0 then
        if (First1[2]='n')or (first1[3]='n') then
        Terms[termCnt].Value[i]:=0
        else
          Terms[termCnt].Value[i]:=1;
        i:=i+1
      until Last1='' ;
      if not Find(TermNom) then
      begin
        TermNom:=TermCnt;
        TermCnt:=TermCnt+1
      end
      else
        SetLength(Terms[TermCnt].value,0);
      SetLength(Funcs[FuncCnt].TermList,Length(Funcs[FuncCnt].TermList)+1);
      Funcs[FuncCnt].TermList[Length(Funcs[FuncCnt].termList)-1]:=TermNom
    Until Last='';
  FuncCnt:=FuncCnt+1 ;
end;{StringAnalyser}
{-------------------------}
procedure ExtractSignalNames (NomStr:integer);
  var Last,First,Term:string;
      i:integer;
begin
  i:=0;
  DivideStr(Strings[NomStr],Term,Last,'V');
  Last:=Term;
  while Last<>'' do
  begin
    DivideStr(Last,First,Last,'x');
    if Last<>'' then
    begin
      SignalNames[i]:='x'+Last[1];
      i:=i+1
    end
  end;
  Last:=Term;
  while Last<>'' do
  begin
    DivideStr(Last,First,Last,'Q');
    if Last<>'' then
    begin
      SignalNames[i]:='Q'+Last[1];
      i:=i+1
    end
  end
end;{ExtractSignalNames}
{-------------------------}
procedure Draw;
  var i:integer;
begin
Form1.Image1.Canvas.Pen.Color:=clBlue;
  TrigCnt:=0;
  for i:=0 to FuncCnt-1 do
    if (Funcs[i].Name[1]='T') or
       (Funcs[i].Name[1]='D') or
       (Funcs[i].Name[1]='K') or
       (Funcs[i].Name[1]='S') then
       TrigCnt:=TrigCnt+1;
  if Funcs[0].Name[1] ='S' then
    TrigName:='RS';
  if Funcs[0].Name[1]='J' then
    TrigName:='JK';
  if Funcs[0].Name[1]='T' then
    TrigName:='T';
  if Funcs[0].Name[1]='D' then
    TrigName:='D';
  top:=40;
  InCnt:=length(Terms[0].Value);
  for i:=0 To termCnt-1 do
    PutElem('&',i,InCnt);
  Top:=40;
  for i:=0 to FuncCnt-1 do
  if length(Funcs[i].TermList)>1 then
    PutElem('1',i,length(Funcs[i].TermList))
  else
  begin
    Funcs[i].x:=-1;
    Funcs[i].y:=-1;
  end;
  Top:=40;
  Left:=left+Wideth+Delta*(Funccnt+2);

  if (TrigName='T')or (TrigName='D') then
    for i:=0 to TrigCnt-1 do
      PutTrigger(TrigName,i)
  else
    for i:=0 to TrigCnt-1 do
      PutTrigger(TrigName,i*2);
end;{Draw}
{---------------------------------------}
procedure Init;
  var i:integer;
begin
  Form1.Image1.Canvas.Pen.Color:=clWhite;
  Form1.Image1.Canvas.Rectangle(0,0,2000,4000);
  for i:=0 to MaxN do
  begin
    Terms[i].x:=0;
    Terms[i].y:=0;
    SetLength(Terms[i].value,0)
  end;
  for i:=0 to MaxN do
  begin
    Funcs[i].x:=0;
    Funcs[i].y:=0;
    Funcs[i].xt:=0;
    Funcs[i].yt:=0;
    Funcs[i].Name:='';
    SetLength(Funcs[i].TermList,0)
  end;
  for i:=0 to MaxN do
    SignalNames[i]:='';
  TermCnt:=0;
  FuncCnt:=0;
  Top:=20;
  left:=200;
  maxBottom:=0;

end;
{------------------------------------}
procedure TForm1.Button1Click(Sender: TObject);
  var f:Textfile;
      i:integer;
begin
  Init;
  Form1.Memo1.Lines.Clear;
  if OpenDialog1.Execute then
  begin
    AssignFile(f,OpenDialog1.FileName);
    reset(f);
    StrCnt:=0;
    while not eof(f) do
    begin
      readln(f,Strings[StrCnt]);
      StrCnt:=StrCnt+1
    end
  end;
  for i:=0 to StrCnt-1 do
  begin
    Memo1.Lines.Add(Strings[i]);
    Memo1.Lines.Add('')
  end
end;

{----------------------------}
procedure PutConnections;
  var i,j,  Xcnt:integer;
begin
  for i:=0 to FuncCnt-1 do
    if length(Funcs[i].TermList)>1 then
      for j:=0 to length(Funcs[i].TermList)-1 do
       Connect1(Funcs[i].x,Funcs[i].y,j,Funcs[i].TermList[j], terms[Funcs[i].TermList[j]].x,terms[Funcs[i].TermList[j]].y,length(Terms[j].value{Funcs[i].TermList})   );

  for i:=0 to Trigcnt-1 do
      if  (TrigName='T')or (TrigName='D') then
        Connect2(Funcs[i].xt,Funcs[i].yt,0,i,Funcs[i].x,Funcs[i].y,length(Funcs[i].TermList) )
      else
      begin
        Connect2 (Funcs[2*i].xt,Funcs[2*i].yt,1,2*i,Funcs[i*2].x,Funcs[i*2].y,length(Funcs[2*i].TermList) );
        Connect2 (Funcs[2*i].xt,Funcs[2*i].yt,2,2*i+1,Funcs[2*i+1].x,Funcs[2*i+1].y,length(Funcs[2*i+1].TermList) )
      end;

   for i:=0 to TermCnt-1 do
    begin
      if Length(Terms[0].value)=length(Terms[i].value)then
         XCnt:=Length(Terms[0].value)-TrigCnt
      else
        XCnt:=0;
      for j:=XCnt to length(Terms[i].value)-1 do
     if  (TrigName='T')or (TrigName='D') then
       connect3(Terms[i].x,Terms[i].y,j, j-xcnt,Funcs[j-xCnt].xt,Funcs[j-xCnt].yt,Terms[i].value[j])
     else
       connect3(Terms[i].x,Terms[i].y,j,j-xcnt,Funcs[2*(j-xCnt)].xt,Funcs[2*(j-xCnt)].yt,Terms[i].value[j])
   end
end;
{-------------------------}
procedure PutSignalNames;
  var i,j,k,XCnt,TrVyhCnt:integer;
begin
  k:=0;
  if (TrigName='T')or(TrigName='D') then
     TrVyhCnt:=1
  else
     TrVyhCnt:=2;
  XCnt:=Length(Terms[0].value)-TrigCnt;
  for i:=0 to TermCnt-1 do
  begin
    for j:=0 to length(Terms[i].Value)-1 do
    begin
      if length(Terms[i].Value)=length(Terms[0].Value) then
      begin
        if Terms[i].Value[j]=1 then
          Form1.Image1.Canvas.TextOut(Terms[i].x-25,Terms[i].y+delta*j,Signalnames[j])
        else
          Form1.Image1.Canvas.TextOut(Terms[i].x-35,Terms[i].y+delta*j,'not '+Signalnames[j])
      end
      else
      begin
        if Terms[i].Value[j]=1 then
          Form1.Image1.Canvas.TextOut(Terms[i].x-25,Terms[i].y+delta*j,Signalnames[j+XCnt])
        else
          Form1.Image1.Canvas.TextOut(Terms[i].x-35,Terms[i].y+delta*j,'not '+Signalnames[j+XCnt])
      end;
      Form1.Image1.Canvas.MoveTo(Terms[i].x-15,Terms[i].y+delta*(j+1));
      Form1.Image1.Canvas.LineTo(Terms[i].x,Terms[i].y+delta*(j+1));
    end;
    if length(Terms[i].Value)<>length(Terms[0].Value) then
    begin
    //  Form1.Image1.Canvas.MoveTo(Terms[i].x+wideth,Terms[i].y+((length(Terms[i].value)+1)*delta) div 2);
    //  Form1.Image1.Canvas.Pen.Color:=clRed;
    //  Form1.Image1.Canvas.LineTo(Terms[i].x+wideth+25,Terms[i].y+((length(Terms[i].value)+1)*delta) div 2);
     // Form1.Image1.Canvas.Pen.Color:=clblue;

    //  Form1.Image1.Canvas.TextOut(Terms[i].x+wideth+30,Terms[i].y-5+((length(Terms[i].value)+1)*delta) div 2,Funcs[TrigCnt*TrVyhCnt+k].Name);
      k:=k+1
    end;
  end;

  for i:=0 to FuncCnt-1 do
    if Length(Funcs[i].TermList)>1 then
    begin
      Form1.Image1.Canvas.MoveTo(Funcs[i].x+wideth,Funcs[i].y+((length(Funcs[i].TermList)+1)*delta) div 2);
      Form1.Image1.Canvas.LineTo(Funcs[i].x+wideth+10,Funcs[i].y+((length(Funcs[i].TermList)+1)*delta) div 2);
      Form1.Image1.Canvas.TextOut(Funcs[i].x+wideth+12,Funcs[i].y-5+((length(Funcs[i].TermList)+1)*delta) div 2,Funcs[i].Name);
    end
    else
    begin
      if length(Terms[Funcs[i].TermList[0]].Value)=length(Terms[0].Value) then
      begin
        Form1.Image1.Canvas.MoveTo(Terms[Funcs[i].TermList[0]].x+wideth,Terms[Funcs[i].TermList[0]].y+((length(terms[Funcs[i].termList[0]].value)+1)*delta) div 2);
        Form1.Image1.Canvas.LineTo(Terms[Funcs[i].TermList[0]].x+wideth+delta*(Funcs[i].TermList[0]+1),Terms[Funcs[i].TermList[0]].y+((length(terms[Funcs[i].termList[0]].value)+1)*delta) div 2);
        Form1.Image1.Canvas.LineTo(Terms[Funcs[i].TermList[0]].x+wideth+delta*(Funcs[i].TermList[0]+1),25);
        Form1.Image1.Canvas.TextOut(Terms[Funcs[i].TermList[0]].x+wideth+delta*(Funcs[i].TermList[0]+1),10,Funcs[i].Name);
      end
    end
end;{PutSignalNames}
{---------------------------}
procedure TForm1.Button2Click(Sender: TObject);
  var i:integer;
begin
  Init;
  pagecontrol1.SelectNextPage(true);
  for i:=0 to StrCnt-1 do
    StringAnalyser(Strings[i]);
  ExtractSignalNames(0);
    if SignalNames[0]=''then
    begin
      i:=1;
      repeat
        ExtractSignalNames(i) ;
        i:=i+1
      until (SignalNames[0]<>'')or(StrCnt=i)
    end;

  
  Draw;
  PutConnections;
  PutSignalNames
end;

end.

