unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,unit2;

  const
  ColWidth=90;
  RowHeight=60;
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

procedure DisConnect(Col1,Row1,Col2,Row2:integer;Variant:TConVar);
procedure DelRect(Col,Row:integer;text:string);
procedure DelRomb(Col,Row:integer;text:string);
procedure DelEllipse(Col,Row:integer);

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Button7: TButton;
    SaveDialog1: TSaveDialog;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Button8: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3, Unit4;

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
      x3:=x1-{+}round(ColWidth/2)+5;
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
        x3:=round((x1+x5)/2);
      x4:=x3
    end;
   Form1.Image1.Canvas.MoveTo(x1,y1);
   Form1.Image1.Canvas.LineTo(x2,y2);
   Form1.Image1.Canvas.LineTo(x3,y3);
   Form1.Image1.Canvas.LineTo(x4,y4);
   Form1.Image1.Canvas.LineTo(x5,y5);
   Form1.Image1.Canvas.LineTo(x6,y6);
end;

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
  else
    Form1.Image1.Canvas.TextOut(x1-7,y1-7,inttostr(N));

end;


procedure PutRomb(Col,Row,N:integer;Text:string);
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
  else
   Form1.Image1.Canvas.TextOut(Coord[1].x-7,Coord[1].y-13,IntTostr(N));

end;

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
  else
    Form1.Image1.Canvas.TextOut(x1-7,y1-7,intTostr(N));

end;

procedure DisConnect(Col1,Row1,Col2,Row2:integer;Variant:TConVar);
begin
  Form1.Image1.Canvas.Pen.Color:=clWhite;
  connect(Col1,Row1,Col2,Row2,Variant);
  Form1.Image1.Canvas.Pen.Color:=clBlack;
end;{DisConnect}

procedure DelRect(Col,Row:integer;text:string);
begin
  Form1.Image1.Canvas.Pen.Color:=clWhite;
  PutRect(Col,Row,-1,Text);
  Form1.Image1.Canvas.Pen.Color:=clBlack;
end;{DelRect}

procedure DelRomb(Col,Row:integer;text:string);
begin
  Form1.Image1.Canvas.Pen.Color:=clWhite;
  PutRomb(Col,Row,-1,Text);
  Form1.Image1.Canvas.Pen.Color:=clBlack;
end;{DelRomb}

procedure DelEllipse(Col,Row:integer);
begin
  Form1.Image1.Canvas.Pen.Color:=clWhite;
  Putellipse(Col,Row,-1);
  Form1.Image1.Canvas.Pen.Color:=clBlack;
end;{delEllipse}


procedure TForm1.Button1Click(Sender: TObject); {проверка}
  var i,j:integer;
      AllRight:boolean;
begin
  CreateTabSv;
  AllRight:=true;
  if CorrectConnect then
  begin
    PathCycle;
    ListBox1.Items.Clear;
    ListBox2.Items.Clear;
    for i:=1 to ComplPathCount do
    begin
      ListBox1.Items.Add(' ');
      for j:=0 to length(CompletePathArr[i])-1 do
        ListBox1.Items[i-1]:=ListBox1.Items[i-1]+ inttostr(CompletePathArr[i,j])+'  ' ;
    end;
    for i:=1 to CycleCount do
    begin
      ListBox2.Items.Add('');
      for j:=0 to length(CycleArr[i])-1 do
        ListBox2.Items[i-1]:=ListBox2.Items[i-1]+ inttostr(CycleArr[i,j])+'  ' ;
    end;
    if  not AllInPath then
      Allright:=False
    else
       if not CycleCorrect then
         AllRight:=False                                                         
       else
         if not  TestConnect then
           AllRight:=false
  end
  else
    AllRight:=false;
if AllRight then
  ShowMessage('Ошибок не обнаружено')    
end; {проверка}

procedure TForm1.Button3Click(Sender: TObject);
  var i:integer;
      empty:boolean;
begin
    Form3:=TForm3.Create(Self);
    empty:=true;
    for i:=0 to MaxVerNum do
    if VerList[i].exist then
      begin
      if (Verlist[i].Vid<>k)and(Verlist[i].NextMain=-1) then
      begin
        empty:=false;
        Form3.ComboBox1.Items.Add(IntToStr(VerList[i].Num));
      end;
      if VerList[i].Vid=l then
        if VerList[i].NextAlt=-1 then
        begin
          empty:=false;
          Form3.ComboBox1.Items.Add(IntToStr(VerList[i].Num)+'/ альтернативная ветвь');
        end;
    end;
  if empty then
   showMessage('Невозможно добавить вершину в граф !')
  else
  begin
    Form3.ComboBox1.ItemIndex:=0;
    form3.RadioGroup1.ItemIndex:=1;
    Form3.ShowModal;
    Form3.Free;
  end;

   end; {Insert }

procedure TForm1.FormCreate(Sender: TObject);
  var i:integer;
begin
  CurrentVer:=0;
  MaxVerNum:=0;
  EndVerNum:=-1;
  VerCount:=1;
  for i:=0 to maxV do
  with Verlist[i] do
  begin
    nextMain:=-1;
    NextAlt:=-1;
    exist:=false;
  end;
  With VerList[0] do
  begin
    Num:=0;
    Vid:=b;
    exist:=true;
    Row:=2;
    Col:=3;
    PutEllipse(Col,Row,0)
  end

end;

procedure TForm1.Button5Click(Sender: TObject);{Добавление связи}
  var i:integer;
  empty:boolean;
begin
  Form4:=TForm4.Create(Self);
  empty:=true;
  for i:=0 to MaxVerNum do
  if VerList[i].exist then
  begin
    if (Verlist[i].Vid<>k)and(Verlist[i].NextMain=-1) then
    begin
      empty:=false;
      Form4.ComboBox1.Items.Add(IntToStr(VerList[i].Num));
    end;
    if VerList[i].Vid=l then
      if VerList[i].NextAlt=-1 then
      begin
        empty:=false;
        Form4.ComboBox1.Items.Add(IntToStr(VerList[i].Num)+'/ альтернативная ветвь');
      end;
  end;
  if empty then
    showMessage('Невозможно добавить связь в граф !')
  else
  begin
    for i:=1 to MaxVerNum do
      if VerList[i].exist then
        Form4.ComboBox2.Items.Add(IntToStr(VerList[i].Num));
    Form4.ComboBox1.ItemIndex:=0;
    Form4.ComboBox2.ItemIndex:=0;
    Form4.Button1.Visible:=True;
    Form4.Button1.Enabled:=True;
    Form4.Button3.Visible:=False;
    Form4.Button3.Enabled:=False;
    Form4.Button4.Visible:=false;
    Form4.Button4.Enabled:=false;
    Form4.ComboBox1.Visible:=true;
    Form4.ComboBox1.Enabled:=true;
    Form4.Label1.Visible:=true;
    Form4.Label2.Caption:='Следующая вершина';
    Form4.ShowModal;
    Form4.Free;
  end;
end;{Ins Connection}

procedure TForm1.Button4Click(Sender: TObject);
  var i:integer;
begin
  Form4:=TForm4.Create(Self);
  for i:=1 to MaxVerNum do
    if VerList[i].exist then
      Form4.ComboBox2.Items.Add(IntToStr(VerList[i].Num));
  Form4.ComboBox2.ItemIndex:=0;
  Form4.Button1.Visible:=false;
  Form4.Button1.Enabled:=false;
  Form4.Button3.Visible:=true;
  Form4.Button3.Enabled:=true;
  Form4.Button4.Visible:=false;
  Form4.Button4.Enabled:=false;
  Form4.ComboBox1.Visible:=false;
  Form4.ComboBox1.Enabled:=false;
  Form4.Label1.Visible:=false;
  Form4.Label2.Caption:='Удаляемая вершина';

  Form4.ShowModal;
  Form4.Free;
end; {Del}

procedure TForm1.Button6Click(Sender: TObject);{DelConnect}
  var i:integer;
      empty:boolean;
begin
  Form4:=TForm4.Create(Self);
  empty:=true;
  for i:=0 to MaxVerNum do
  if VerList[i].exist then
  begin
    if (Verlist[i].Vid<>k)and(Verlist[i].NextMain<>-1) then
    begin
       empty:=false;
       Form4.ComboBox1.Items.Add(IntToStr(VerList[i].Num));
    end;
    if VerList[i].Vid=l then
      if VerList[i].NextAlt<>-1 then
      begin
        empty:=false;
        Form4.ComboBox1.Items.Add(IntToStr(VerList[i].Num)+'/ альтернативная ветвь');
      end;
  end;
  if empty then
    showMessage('Граф не содержит связей !')
  else
  begin
    for i:=1 to MaxVerNum do
    if VerList[i].exist then
      Form4.ComboBox2.Items.Add(IntToStr(VerList[i].Num));
    Form4.ComboBox1.ItemIndex:=0;
    Form4.ComboBox2.ItemIndex:=0;

    Form4.Button1.Visible:=false;
    Form4.Button1.Enabled:=false;
    Form4.Button3.Visible:=false;
    Form4.Button3.Enabled:=false;
    Form4.Button4.Visible:=true;
    Form4.Button4.Enabled:=true;
    Form4.ComboBox1.Visible:=true;
    Form4.ComboBox1.Enabled:=true;
    Form4.Label1.Visible:=true;
    Form4.Label2.Caption:='Следующая вершина';

    Form4.ShowModal;
    Form4.Free;
  end
end;

procedure TForm1.Button2Click(Sender: TObject);
  var i:integer;
begin
  Image1.Canvas.Rectangle(0,0,500,540);
  CurrentVer:=0;
  MaxVerNum:=0;
  EndVerNum:=-1;
  VerCount:=1;
  for i:=0 to maxV do
  with Verlist[i] do
  begin
    nextMain:=-1;
    NextAlt:=-1;
    exist:=false;
  end;
  With VerList[0] do
  begin
    Num:=0;
    Vid:=b;
    exist:=true;
    Row:=2;
    Col:=3;
    PutEllipse(Col,Row,0)
  end
end;

procedure TForm1.Button7Click(Sender: TObject); {save in file}
  type TVer=record
        num:integer;
        Vid:TVid;
        Value:string [10];
        NextMain,NextAlt,col,row:integer
      end;

  var f:file of TVer;
       rec:Tver;
      i:integer;
begin
  if  SaveDialog1.Execute then
  begin
     AssignFile(f,SaveDialog1.FileName);
     Rewrite(f);

     for i:=0 to VerCount-1 do
     begin
       rec.num:=VerList[i].num;
       rec.Vid:=VerList[i].Vid;
       rec.Value:=VerList[i].Value;
       rec.NextMain:=VerList[i].NextMain;
       rec.NextAlt:=VerList[i].NextAlt;
       rec.col:=VerList[i].Col;
       rec.row:=VerList[i].Row;
       write(f,rec)
     end;
     closeFile(f);
  end;
end;{ save in file}

procedure TForm1.Button8Click(Sender: TObject);{load from file}
  type TVer=record
        num:integer;
        Vid:TVid;
        Value:string [10];
        NextMain,NextAlt,col,row:integer
      end;

  var f:file of TVer;
       rec:Tver;
      i:integer;
begin
  if OpenDialog1.Execute then
  begin
     AssignFile(f,OpenDialog1.FileName);
     Reset(f);
     i:=0;
     while not eof(f) do
     begin
       read(f,rec);
       VerList[i].num:=rec.num;
       VerList[i].Vid:=rec.Vid;
       VerList[i].Value:=rec.Value;
       VerList[i].NextMain:=rec.NextMain;
       VerList[i].NextAlt:=rec.NextAlt;
       VerList[i].Col:=rec.col;
       VerList[i].Row:=rec.row;
       i:=i+1;
{       showMessage(VerList[i-1].Value);}
     end;
     closeFile(f);
  Image1.Canvas.Rectangle(0,0,500,540);
  CurrentVer:=0;
  MaxVerNum:=0;
  EndVerNum:=-1;
  VerCount:=1;
  for i:=0 to maxV do
  with Verlist[i] do
  begin
    nextMain:=-1;
    NextAlt:=-1;
    exist:=false;
  end;
  With VerList[0] do
  begin
    Num:=0;
    Vid:=b;
    exist:=true;
    Row:=2;
    Col:=3;
    PutEllipse(Col,Row,0)
  end ;

     {.......}


  end
end;

end.
