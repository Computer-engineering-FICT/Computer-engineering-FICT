unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    ScrollBox1: TScrollBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
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
  MaxN=2000;
type
  TTab=array [0..MaxN,0..MaxN] of integer;
  TArrStr=array[0..MaxN] of string;
Var
  Qis,X,OutSignal:TTab;
  Captions,ResStr:TarrStr;
  RowCnt,SostCnt,StrCnt,N,XCnt,YCnt,TrigCnt,TrigType:integer;
  IsMura:boolean;

function Stepin(m:integer):integer; {2^x}
  var i:integer;
      St:integer;
begin
  St:=1;
  for i:=1 to m do
    St:=St*2;
  Stepin:=St
end;{Stepin}

function ChangeExt(Name,NewExt:string):string;
  var x:integer;
begin
  ChangeExt:=Name;
  x:=LastDelimiter('.',Name);
  ChangeExt[x+1]:=NewExt[1];
  ChangeExt[x+2]:=NewExt[2];
  ChangeExt[x+3]:=NewExt[3]
end;{ChangeExt}

{--------------------------------------------------------------}
function MakeFunc1(Col:integer):string;
  var i,j:integer;
    MF:string;
    flag:boolean;
begin
  MF:='';
  flag:=false;
  for i:=0 to RowCnt do
    if OutSignal[i,Col]=1 then
    begin
      if flag then MF:=MF+' V ';
      flag:=true;
      for j:=0 to XCnt-1 do
      begin
        if j>0 then MF:=MF+'*';
        if X[i,j]=0 then
          MF:=MF+' not ';
        MF:=MF+Captions[j]
      end;
      for j:=0 to N-1 do
      begin
        if (j>0) or(XCnt<>0) then
          MF:=MF+'*';
        if Qis[i,j]=0 then
          MF:=MF+' not ';
        MF:=MF+'Q'+IntToStr(j)
      end
    end;
  if MF='' then
    MakeFunc1:='0'
  else
    MakeFunc1:=MF;
end;{MakeFunc1}
{--------------------}
function MakeFunc2(Col:integer):string;
  var i,j:integer;
      MF:string;
      flag:boolean;
  function Find(Nom:integer):boolean;
    var i,j:integer;
        f:boolean;
  begin
    find:=false;
    for i:=0 to Nom-1 do
    begin
      f:=true;
      for j:=0 to N-1 do
        if qis[i,j]<>Qis[Nom,j] then
          f:=false;
      if f then
        Find:=true
    end
  end;{Find}
begin
  MF:='';
  flag:=false;
  for i:=0 to RowCnt  do
    if OutSignal[i,Col]=1 then
    if not Find(i) then
    begin
      if flag then MF:=MF+' V ';
      flag:=true;

      for j:=0 to N-1 do
      begin
        if j>0 then
          MF:=MF+'*';
        if Qis[i,j]=0 then
          MF:=MF+' not ';
        MF:=MF+'Q'+IntToStr(j)
      end
  end;
  MakeFunc2:=MF;
end;{MakeFunc2}
{-------------------------}

procedure Main;
  var i:integer;
      s:string;
begin
  StrCnt:=0;
  for i:=0 to TrigCnt-1 do
  begin
    case TrigType of
      0:s:='T'+IntToStr(i);
      1:s:='D'+IntToStr(i);
      2:if i mod 2=0 then s:='S'+IntToStr(i div 2)
        else s:='R'+IntToStr(i div 2);
      3:if i mod 2=0 then s:='J'+IntToStr(i div 2)
        else s:='K'+IntToStr(i div 2)
    end;
    s:=s+'=';
    s:=s+MakeFunc1(YCnt+i);
    ResStr[StrCnt]:=s;
    StrCnt:=StrCnt+1
  end;

  for i:=0 to YCnt-1 do
  begin
    s:=Captions[XCnt+i];
    s:=s+'=';
    if IsMura then
      s:=s+MakeFunc2(i)
    else
      s:=s+MakeFunc1(i);
    ResStr[StrCnt]:=s;
    StrCnt:=StrCnt+1
  end
end;{Main}
{---------------------------------------------}
procedure Save;
  var f:TextFile;
      i:integer;
begin
  AssignFile(f,ChangeExt(Form1.OpenDialog1.FileName,'fun'));
  Rewrite(f);
  for i:=0 to StrCnt-1 do
    writeln(f,ResStr[i]);
  CloseFile(f)
end;
{---------------------------------------------}
procedure {Load & execute}TForm1.Button1Click(Sender: TObject);
  var i,j:integer;
      f:file of integer;
      fs:TextFile;
begin
  if OpenDialog1.Execute then
  begin
    AssignFile(f,OpenDialog1.FileName);
    Reset(f);
    Read(f,SostCnt);
    read(f,N);
    read(f,XCnt);
    read(f,YCnt);
    read(f,TrigCnt);
    read(f,TrigType);
    read(f,i);
    if i=0 then
      IsMura:=false
    else
      IsMura:=true;
    read(f,RowCnt);
    RowCnt:=RowCnt-1;
    for i:=0 to RowCnt do
      for j:=0 to N-1 do
        read(f,Qis[i,j]);
    for i:=0 to RowCnt do
      for j:=0 to XCnt-1 do
        read(f,X[i,j]);
    for i:=0 to RowCnt do
      for j:=0 to YCnt-1 do
        read(f,OutSignal[i,j]);
    for i:=0 to RowCnt do
      for j:=0 to TrigCnt-1 do
        read(f,OutSignal[i,j+YCnt]);
    CloseFile(f);

    AssignFile(fs,ChangeExt(OpenDialog1.FileName,'cap'));
    reset(fs);
    StrCnt:=0;
    while not eof(fs) do
    begin
      readln(fs,Captions[StrCnt]);
      StrCnt:=StrCnt+1
    end;
    CloseFile(fs);

    StringGrid1.RowCount:=RowCnt+2;
    StringGrid1.ColCount:=N+XCnt+YCnt+TrigCnt+4;
    for i:=0 to RowCnt do
    begin
      for j:=0 to XCnt-1  do
        if X[i,j]=2 then
          StringGrid1.Cells[j+1,i+1]:=' _'
        else
          StringGrid1.Cells[j+1,i+1]:=IntToStr(X[i,j]);
      for j:=0 to N-1 do
        StringGrid1.Cells[j+2+XCnt,i+1]:=IntToStr(Qis[i,j]);
      for j:=0 to  YCnt-1 do
        StringGrid1.Cells[j+3+XCnt+N,i+1]:=IntToStr(OutSignal[i,j]);
      for j:=0 to TrigCnt-1 do
      if OutSignal[i,j+YCnt]=2 then
        StringGrid1.Cells[j+4+XCnt+N+YCnt,i+1]:=' _'
      else
        StringGrid1.Cells[j+4+XCnt+N+YCnt,i+1]:=IntToStr(OutSignal[i,j+YCnt])
    end ;
    if isMura then
      Panel1.Caption:='¿‚ÚÓÏ‡Ú Ã”–¿'
    else
      Panel1.Caption:='¿‚ÚÓÏ‡Ú Ã»À»';

    for j:=0 to XCnt-1 do
      StringGrid1.Cells[j+1,0]:=Captions[j];
    for j:=0 to N-1 do
      StringGrid1.Cells[j+2+XCnt,0]:='Q'+IntToStr(j);
    for j:=0 to YCnt-1 do
      StringGrid1.Cells[j+3+XCnt+N,0]:=Captions[j+XCnt];
    for j:=0 to TrigCnt-1 do
      case TrigType of
        0:StringGrid1.Cells[j+4+XCnt+N+YCnt,0]:='T'+IntToStr(j);
        1:StringGrid1.Cells[j+4+XCnt+N+YCnt,0]:='D'+IntToStr(j);
        2:begin
            StringGrid1.Cells[j*2+4+XCnt+N+YCnt,0]:='S'+IntToStr(j);
            StringGrid1.Cells[j*2+1+4+XCnt+N+YCnt,0]:='R'+IntToStr(j);
          end;
        3:begin
            StringGrid1.Cells[j*2+4+XCnt+N+YCnt,0]:='K'+IntToStr(j);
            StringGrid1.Cells[j*2+1+4+XCnt+N+YCnt,0]:='J'+IntToStr(j);
          end
      end;


  Main;
  Memo1.Lines.Clear;
  for i:=0 to StrCnt-1 do
  begin
    Memo1.Lines.Add(ResStr[i]);
    Memo1.Lines.Add('');
  end;

  Save;
  end
end;{load & execute}

{--------------------}

end.
