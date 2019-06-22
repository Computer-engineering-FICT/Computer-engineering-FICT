unit Unit1;


interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Unit2, StdCtrls, Grids, ExtCtrls, ExtDlgs;
  
const
  ColWidth=60;
  RowHeight=40;
type
  TConVar=0..2;
var
  EndVerNum:integer;
  PrevList:array of integer;
  CurrentVer:integer;
procedure Connect(Col1,Row1,Col2,Row2:integer;Variant:TConVar);
procedure PutRect(Col,Row,N:integer;text:string);
procedure PutRomb(Col,Row,N:integer;text:string);
procedure PutEllipse(Col,Row,N:integer);


type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3;

{$R *.dfm}
procedure Connect(Col1,Row1,Col2,Row2:integer;Variant:TConVar);
  var x1,x2,y1,y2,x3,y3,x4,y4,x5,y5,x6,y6:integer;
begin
    if variant=0 then
    begin
      x1:=round((Col1-0.75)*ColWidth);
      y1:=round((Row1-0.5)*RowHeight);
      x2:=x1;
      y2:=y1+round(0.25*RowHeight);
    end;
    if variant=1 then
    begin
    if col1<col2 then
      x1:=round((Col1-0.5)*ColWidth)
    else
      x1:=(Col1-1)*ColWidth;
      y1:=round((Row1-0.75)*RowHeight);
      x2:=x1;
      y2:=y1;
    end;
    if variant=2 then
    begin
      x1:=round((Col1-0.75)*ColWidth);
      y1:=round((Row1-0.75)*RowHeight);
      x2:=x1;
      y2:=y1+round(0.25*RowHeight);
    end;
    if (Col1=Col2)and(row1>row2) then
    begin
 //     showmessage(intToStr(row1-row2));
      x3:=x1-{+}round(ColWidth/2)+2*((row1-row2)mod 5);{+5}
      y3:=y2;
      x4:=x3;
      y4:=(Row2-1)*RowHeight-round(0.25*RowHeight);
      x5:=round((Col2-0.75)*ColWidth);
      y5:=y4;
      x6:=x5;
      y6:=(Row2-1)*RowHeight;
    end
    else
    begin
      y3:=y2;
      y4:=(Row2-1)*RowHeight-round(0.25*RowHeight);
      x5:=round((Col2-0.75)*ColWidth);
      y5:=y4;
      x6:=x5;
      y6:=(Row2-1)*RowHeight;
      if (variant=1) and (col2=col1)then
        x3:=x1-round(ColWidth*0.25)
      else
        x3:=round((x1+x5)/2);//-(row1 mod 5)*5;
      x4:=x3
    end;
   Form1.Image1.Canvas.MoveTo(x1,y1);
   Form1.Image1.Canvas.LineTo(x2,y2);
   Form1.Image1.Canvas.LineTo(x3,y3);
   Form1.Image1.Canvas.LineTo(x4,y4);
   Form1.Image1.Canvas.LineTo(x5,y5);
   Form1.Image1.Canvas.LineTo(x6,y6);

end; {Connect}

procedure PutRect(Col,Row,N:integer;text:string);
  var x1,x2,y1,y2:integer;
begin
  x1:=(Col-1)*ColWidth;
  y1:=(Row-1)*RowHeight;
  x2:=round((Col-0.5)*ColWidth);
  y2:=round((Row-0.5)*RowHeight)-3;
  Form1.Image1.Canvas.Rectangle(x1,y1,x2,y2);
  Form1.Image1.Canvas.TextOut(round((x1+x2)/2)-5,round((y1+y2)/2)-5,text);
  if N=-1 then
    Form1.Image1.Canvas.Rectangle(X1-7,y1-7,x1+4,y1+4)
//  else
//    Form1.Image1.Canvas.TextOut(x1-7,y1-7,inttostr(N));
end;{PutRect}

procedure PutRomb(Col,Row,N:integer;text:string);
  var Coord:array[1..4] of TPoint;
begin
  Coord[1].x:=(Col-1)*ColWidth;
  Coord[1].y:=round((Row-0.75)*RowHeight);
  Coord[2].x:=round((Col-0.75)*ColWidth);
  Coord[2].y:=(Row-1)*RowHeight;
  Coord[3].x:=round((Col-0.5)*ColWidth);
  Coord[3].y:=Coord[1].y;
  Coord[4].x:=Coord[2].x;
  Coord[4].y:=round((Row-0.5)*RowHeight);
  Form1.Image1.Canvas.Polygon(Coord);
  Form1.Image1.Canvas.TextOut(Coord[2].x-5,Coord[1].y-5,Text);
  if N=-1 then
    Form1.Image1.Canvas.Rectangle(Coord[1].x-7,Coord[1].y-13,Coord[1].x,Coord[1].y)
//  else
//   Form1.Image1.Canvas.TextOut(Coord[1].x-7,Coord[1].y-13,IntTostr(N));
end;{PutRomb}

procedure PutEllipse(Col,Row,N:integer);
  var x1,x2,y1,y2:integer;
begin
  x1:=(Col-1)*ColWidth;
  y1:=(Row-1)*RowHeight;
  x2:=round((Col-0.5)*ColWidth);
  y2:=round((Row-0.75)*RowHeight)-3;
  Form1.Image1.Canvas.Ellipse(x1,y1,x2,y2);
    if N=-1 then
    Form1.Image1.Canvas.Rectangle(x1-10,y1-10,x1,y1+5)
//  else
//    Form1.Image1.Canvas.TextOut(x1-7,y1-7,intTostr(N));
end;{PutEllipse}

procedure WriteSost;
  var i,x1,y1:integer;
begin
  for i:=0 to VerCnt-1 do
  begin
    x1:=(VerList[i].Col-1)*ColWidth;
    y1:=(VerList[i].Row-1)*RowHeight;
    Form1.Image1.Canvas.Pen.color:=clWhite;
    Form1.Image1.Canvas.Rectangle(x1-10,y1-7,x1,y1+10);
    Form1.Image1.Canvas.Pen.color:=clBlack;
  end;
  for i:=0 to SostCnt-1 do
  begin
    x1:=(VerList[Sost[i]].Col-1)*ColWidth;
    y1:=(VerList[Sost[i]].Row-1)*RowHeight;
    if IsMura then
      y1:=y1+5;
    Form1.Image1.Canvas.TextOut(x1-7,y1-7,intTostr(i));
  end;
  if IsMura then
  begin
    x1:=(VerList[0].Col-1)*ColWidth;
    y1:=(VerList[0].Row-1)*RowHeight;
    Form1.Image1.Canvas.TextOut(x1-7,y1-7,'0');
  end
  else
  begin
    x1:=(VerList[Sost[SostCnt]].Col-1)*ColWidth;
    y1:=(VerList[Sost[SostCnt]].Row-1)*RowHeight;
    Form1.Image1.Canvas.TextOut(x1-7,y1-7,'0');
   end;

end;{WriteSost}

procedure Load ;
      type TVer=record
        num:integer;
        Vid:TVid;
        Value:string [10];
        NextMain,NextAlt,Col,Row:integer
      end;

  var f:file of TVer;
       rec:Tver;
       i:integer;
       V:TConVar;
begin
     Form1.ScrollBox1.Visible:=true;

     Form1.Image1.Canvas.Rectangle(0,0,2000,2000);
     AssignFile(f,Form1.OpenDialog1.FileName);
     Reset(f);
     VerCnt:=0;
     while not eof(f) do
     begin
       read(f,rec);
       VerList[VerCnt].num:=rec.num;
       VerList[VerCnt].Vid:=rec.Vid;
       VerList[VerCnt].Value:=rec.Value;
       VerList[VerCnt].NextMain:=rec.NextMain;
       VerList[VerCnt].NextAlt:=rec.NextAlt;
       VerList[VerCnt].Col:=rec.Col;
       VerList[VerCnt].Row:=rec.Row;
       VerCnt:=VerCnt+1;
       if rec.num>MaxverNum then
         MaxVerNum:=rec.num
     end;
     closeFile(f);

    for i:=0 to VerCnt-1 do
    with VerList[i] do
    begin
      case Vid of
        o:V:=0;
        l:V:=0;
        b:V:=2;
      end;
      case Vid of
        k,b:PutEllipse(Col,row,i);
        o:PutRect(Col,Row,i,Value);
        l:PutRomb(Col,Row,i,Value)
      end;
      if NextMain>-1 then
        Connect(Col,Row,VerList[FindVer(NextMain)].Col, VerList[FindVer(NextMain)].Row,V);
      if NextAlt>-1 then
        Connect(Col,Row,VerList[FindVer(NextAlt)].Col, VerList[FindVer(NextAlt)].Row,1);
    end ;


end;{Load}


procedure TForm1.Button2Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=0 then
    IsMura:=true
  else
  IsMura:=false;
  MakeX;
  MakeY;
  if IsMURA then
    Mura
  else
    Mili;
  WriteSost;
  {-----------}
 MakeTabIst;
 MakeTabPer;
 CodeSost;
{---------------}
 MakeStructTab;
  case ComboBox1.ItemIndex of
   0:begin
      Trigger1:=T;
      TrigSize:=1;
     end;
   1:begin
      Trigger1:=D;
      TrigSize:=1;
     end;
   2:begin
      Trigger2:=RS;
      TrigSize:=2;
     end;
   3:begin
      Trigger2:=JK;
      TrigSize:=2;
     end;
   end;
   if  TrigSize=1 then
     TriggerFunc1
   else
     TriggerFunc2;

  Form3:=TForm3.Create(Self);
  Form3.Show;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    if Form1.OpenDialog1.Execute then
    begin
      Load;
      Button2.Enabled:=true;
      CheckBox1.Enabled:=true;
    end;

end;

end.
