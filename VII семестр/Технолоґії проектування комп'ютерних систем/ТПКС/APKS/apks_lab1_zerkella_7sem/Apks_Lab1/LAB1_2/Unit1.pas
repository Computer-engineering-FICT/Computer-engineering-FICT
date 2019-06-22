unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Unit2, StdCtrls, Grids, ExtCtrls, ExtDlgs, Menus, ImgList,
  Buttons;

const
  ColWidth=60;
  RowHeight=40;
type
  TConVar=0..2;
var
  EndVerNum:integer;
  PrevList:array of integer;
  CurrentVer:integer;
  Path, File_Temp, File_Temp_Cap: string;

procedure Connect(Col1,Row1,Col2,Row2:integer;Variant:TConVar);
procedure PutRect(Col,Row,N:integer;text:string);
procedure PutRomb(Col,Row,N:integer;text:string);
procedure PutEllipse(Col,Row,N:integer);

var MyStrGrid:array [0..500,0..5000] of String[15];

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    nOpen: TMenuItem;
    nSave: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ImageList1: TImageList;
    Panel1: TPanel;
    Splitter1: TSplitter;
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    rbMoor: TRadioButton;
    rbMili: TRadioButton;
    GroupBox2: TGroupBox;
    rbT: TRadioButton;
    rbRS: TRadioButton;
    rbD: TRadioButton;
    rbJK: TRadioButton;
    bbTable: TBitBtn;
    StringGrid2: TStringGrid;
    procedure N3Click(Sender: TObject);
    procedure nOpenClick(Sender: TObject);
    procedure bbTableClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure ClearTable;
    procedure DrawResult;
  end;

var
  Form1: TForm1;

implementation

function ChangeExt(Name,NewExt:string):string;
  var x:integer;
begin
  ChangeExt:=Name;
  x:=LastDelimiter('.',Name);
  ChangeExt[x+1]:=NewExt[1];
  ChangeExt[x+2]:=NewExt[2];
  ChangeExt[x+3]:=NewExt[3]
end;{ChangeExt}

function FindStr(Current:integer;var Same:integer):boolean;
  var i,j:integer;
      eqw:boolean;
begin
  FindStr:=false;
  for i:=1 to Current-1 do
  begin
    eqw:=true;
    if Form1.StringGrid1.Cells[1,i]<>MyStrGrid[1,Current] then
      eqw:=false;
    if Form1.StringGrid1.Cells[5+N+XCnt,i]<>MyStrGrid[5+N+XCnt,Current] then
      eqw:=false;
    for j:=8+N*2+XCnt to  8+N*2+XCnt +YCnt-1  do
      if Form1.StringGrid1.Cells[j,i]<>MyStrGrid[j,Current] then
        eqw:=false;
    if eqw then
    begin
      Same:=i;
      FindStr:=true;
      exit
    end
  end
end;

procedure CorrectX(Current,Same:integer);
  var i:integer;
begin
  for i:=4+N to 4+N+XCnt-1 do
    if MyStrGrid[i,Current]<>Form1.StringGrid1.Cells[i,Same] then
      Form1.StringGrid1.Cells[i,Same]:=' _'
end;

function GetComboIndex: Integer;
begin
  Result := 0;
  if Form1.rbT.Checked then Result := 0;
  if Form1.rbD.Checked then Result := 1;
  if Form1.rbRS.Checked then Result := 2;
  if Form1.rbJK.Checked then Result := 3;
end;

{$R *.dfm}
procedure Connect(Col1,Row1,Col2,Row2:integer;Variant:TConVar);
  var x1,x2,y1,y2,x3,y3,x4,y4,x5,y5,x6,y6:integer;
begin
   x1 := 0;
   y1 := 0;
   x2 := 0;
   y2 := 0;
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
   V := 0;
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


procedure TForm1.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.nOpenClick(Sender: TObject);
begin
  if Form1.OpenDialog1.Execute then
  begin
    Load;
    bbTable.Visible := True;
    StringGrid2.Visible := True;
  end;
end;

procedure TForm1.ClearTable;
var
  I, J: Integer;
begin

  // Razmetka
  for I := 0 to StringGrid1.ColCount - 1 do
    for J := 0 to StringGrid1.RowCount - 1 do
      StringGrid1.Cells[I, J] := '';
  StringGrid1.ColCount := 2;
  StringGrid1.RowCount := 2;

  // Cods
  for I := 0 to StringGrid2.ColCount - 1 do
    for J := 0 to StringGrid2.RowCount - 1 do
      StringGrid2.Cells[I, J] := '';
  StringGrid2.ColCount := 3;
  StringGrid2.RowCount := 2;
  StringGrid2.Cells[0, 0] := 'A';
  StringGrid2.Cells[1, 0] := 'Код';
  StringGrid2.Cells[2, 0] := 'Верш';

  // Buffer
  for I := 0 to 500 do
    for J := 0 to 5000 do
      MyStrGrid[I, J] := '';
end;

procedure TForm1.bbTableClick(Sender: TObject);
begin
  nSave.Enabled:=true;
  isMura := rbMoor.Checked;
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
 if rbT.Checked then
 begin
      Trigger1:=T;
      TrigSize:=1;
 end;
 if rbD.Checked then
 begin
      Trigger1:=D;
      TrigSize:=1;
 end;
 if rbRS.Checked then
 begin
      Trigger2:=RS;
      TrigSize:=2;
 end;
 if rbJK.Checked then
 begin
      Trigger2:=JK;
      TrigSize:=2;
 end;

  if  TrigSize=1 then
     TriggerFunc1
   else
     TriggerFunc2;
   ClearTable;
   DrawResult;
end;

procedure TForm1.DrawResult;
  var j,i,k,Same,RowCnt,m:integer;
      f:file of integer;
      fs:TextFile;
      Save:boolean;
      Filename:string;

begin
  save:=true;
  FileName:=File_Temp;
  if save then
  begin
    assignFile(fs,File_Temp_Cap);
    rewrite(fs);
    for i:=0 to XCnt-1 do
      writeln(fs,X[i]);
    for i:=0 to YCnt-1 do
      writeln(fs,Y[i]);
    CloseFile(fs);

    assignFile(f,FileName);
    rewrite(f);
    write(f,SostCnt);
    write(f,N);
    write(f,Xcnt);
    write(f,Ycnt);
    write(f,TrigCnt);
    i:=GetComboIndex;
    write(f,i);
    if IsMura then
      i:=1
    else
      i:=0;
    write(f,i);
  end;
  StringGrid1.RowCount:=2;
  StringGrid1.ColCount:=2+2*N+YCnt+7+N+XCnt;
  if TrigSize=2 then
    StringGrid1.ColCount:=StringGrid1.ColCount+N;

  RowCnt:=SostCnt*Stepin(XCnt)+1;

  MyStrGrid[1,0]:='ИС';
  for i:=0 to SostCnt-1 do
    for j:=0 to Stepin(XCnt)-1 do
      MyStrGrid[1,i*Stepin(XCnt)+j+1]:=IntToStr(i);

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       for k:=0 to N-1 do
       begin
//         if save then
//            write(f,ISost[i*Stepin(XCnt)+j,k])
         MyStrGrid[3+k,0]:='Q'+IntToStr(k);
         MyStrGrid[3+k,i*Stepin(XCnt)+j+1]:=IntToStr(ISost[i*Stepin(XCnt)+j,k]);

       end;

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       for k:=0 to XCnt-1 do
       begin
//         if save then
//           write(f,TabIst[j,k])
         MyStrGrid[4+N+k,i*Stepin(XCnt)+j+1]:=IntToStr(TabIst[j,k]);
         MyStrGrid[4+N+k,0]:=X[k];

       end;
   MyStrGrid[5+N+XCnt,0]:='СП';

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       MyStrGrid[5+N+XCnt,i*Stepin(XCnt)+j+1]:=IntToStr(TabPer[j,i]);

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       for k:=0 to N-1 do
       begin
         MyStrGrid[7+N+XCnt+k,i*Stepin(XCnt)+j+1]:=IntToStr(SostP[i*Stepin(XCnt)+j,k]);
         MyStrGrid[7+N+XCnt+k,0]:='Q'+IntToStr(k)
       end;
   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
       for k:=0 to YCnt-1 do
       begin
//         if save then
//           write(f,TabVyhMura[i*Stepin(XCnt)+j,k]);
         MyStrGrid[8+N*2+XCnt+k,i*Stepin(XCnt)+j+1]:=IntToStr(TabVyhMura[i*Stepin(XCnt)+j,k]);
         MyStrGrid[8+N*2+XCnt+k,0]:=Y[k];

       end;

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
     if TrigSize=1 then
       for k:=0 to N-1 do
       begin
         if TabTrigger[i*Stepin(XCnt)+j,k]=2 then
          MyStrGrid[9+2*N+XCnt+YCnt+k,i*Stepin(XCnt)+j+1]:='  _'
         else
           MyStrGrid[9+2*N+XCnt+YCnt+k,i*Stepin(XCnt)+j+1]:=IntToStr(TabTrigger[i*Stepin(XCnt)+j,k]);
       case GetComboIndex of
         0:MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='T'+InttoStr(k);
         1:MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='D'+InttoStr(k);
         end;
//        if save then
//          write(f,TabTrigger[i*Stepin(XCnt)+j,k])
       end
     else
       for k:=0 to 2*N-1 do
       begin
         if TabTrigger[i*Stepin(XCnt)+j,k]=2 then
           MyStrGrid[9+2*N+XCnt+YCnt+k,i*Stepin(XCnt)+j+1]:='  _'

         else
           MyStrGrid[9+2*N+XCnt++YCnt+k,i*Stepin(XCnt)+j+1]:=IntToStr(TabTrigger[i*Stepin(XCnt)+j,k]);

       case GetComboIndex of
         2:if k mod 2=1 then
           MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='R'+InttoStr(k div 2)
           else
           MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='S'+InttoStr(k div 2);

         3:if k mod 2=1 then
             MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='J'+InttoStr(k div 2)
           else
             MyStrGrid[9+2*N+XCnt+YCnt+k,0]:='K'+InttoStr(k div 2);

       end;
//        if save then
//          write(f,TabTrigger[i*Stepin(XCnt)+j,k]);
       end ;
//    if save then
//      closeFile(f)

   j:=0;
   for i:=0 to RowCnt-1 do
     if not FindStr(i,Same) then
     begin
       for k:=0 to StringGrid1.ColCount-1 do
         StringGrid1.Cells[k,j]:=MyStrGrid[k,i];
         StringGrid1.RowCount:=StringGrid1.RowCount+1;
       j:=j+1
     end
     else
     begin
       CorrectX(i,Same);
     end;
   for i:=0 to StringGrid1.RowCount-1 do
      StringGrid1.Cells[0,i]:=IntToStr(i);

   j:=j-1;
//   ShowMessage(IntToStr(TrigCnt));
   if save then
   begin
     write(f,j);
     for i:=1 to j do
       for k:=3 to 3+N-1 do
       begin
        m:=StrToInt(StringGrid1.Cells[k,i]);
        write(f,m);
       end;
     for i:=1 to j do
       for k:=4+N to 4+N+XCnt-1 do
       begin
         if trim(StringGrid1.Cells[k,i])='_' then
           m:=2
         else
           m:=StrToInt(StringGrid1.Cells[k,i]);
         write(f,m)
       end;

       for i:=1 to j do
         for k:=8+N*2+XCnt to 8+N*2+XCnt+YCnt-1 do
       begin
        m:=StrToInt(StringGrid1.Cells[k,i]);
        write(f,m);
       end;


       for i:=1 to j do
         for k:=9+2*N+XCnt+YCnt to 9+2*N+XCnt+YCnt+TrigCnt-1 do
         begin
           if trim(StringGrid1.Cells[k,i])='_' then
             m:=2
           else
             m:=StrToInt(StringGrid1.Cells[k,i]);
           write(f,m)
         end;
     CloseFile(f);
   end ;


//  +        write(f,ISost[i*Stepin(XCnt)+j,k])
//  +         write(f,TabIst[j,k])
//           write(f,TabVyhMura[i*Stepin(XCnt)+j,k]);

//   +       write(f,TabTrigger[i*Stepin(XCnt)+j,k])
//          closeFile(f)


{  for i:=0 to StringGrid1.ColCount do
    for j:=0 to StringGrid1.RowCount do
      StringGrid1.Cells[i,j]:=MyStrGrid[i,j];}
   // Daw coding
   StringGrid2.RowCount := SostCnt + 1;
   for i := 1 to SostCnt do
   begin
     StringGrid2.Cells[0, I] := 'a' + IntToStr(I);
     StringGrid2.Cells[1, I] := IntToStr(I - 1);
     StringGrid2.Cells[2, I] := IntToStr(Sost[I - 1]);
   end;
   if rbMoor.Checked then
     StringGrid2.Cells[2, 1] := '0, ' + IntToStr(Sost[0]) else
     StringGrid2.Cells[2, 1] := IntToStr(Sost[0]) + ', ' + IntToStr(Sost[SostCnt]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClearTable;
  Form1.WindowState := wsMaximized;
end;

procedure TForm1.nSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    CopyFile(PChar(File_Temp), PChar(SaveDialog1.FileName), False);
    CopyFile(PChar(File_Temp_Cap), PChar(ChangeExt(SaveDialog1.FileName, 'cap')), False);    
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DeleteFile(File_Temp);
  DeleteFile(File_Temp_Cap);  
end;

initialization
  Path := ExtractFilePath(ParamStr(0));
  if Path[Length(Path)] <> '\' then Path := Path + '\';
  File_Temp := Path + 'Lab2_Res.tmp';
  File_Temp_Cap := Path + 'Lab2_Res.cap';

end.
