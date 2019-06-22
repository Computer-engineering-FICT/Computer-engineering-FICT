unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  ExtCtrls, StdCtrls;

type

  { TInp2Form }

  TInp2Form = class(TForm)
    AClearButton: TButton;
    AGrid: TStringGrid;
    ALoadButton: TButton;
    ARadioButton: TRadioButton;
    ASaveButton: TButton;
    BClearButton: TButton;
    BGrid: TStringGrid;
    BLoadButton: TButton;
    BRadioButton: TRadioButton;
    BSaveButton: TButton;
    EngGrid: TStringGrid;
    ExitBtn: TButton;
    InfoPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure AClearButtonClick(Sender: TObject);
    procedure ALoadButtonClick(Sender: TObject);
    procedure ASaveButtonClick(Sender: TObject);
    procedure BClearButtonClick(Sender: TObject);
    procedure BLoadButtonClick(Sender: TObject);
    procedure BSaveButtonClick(Sender: TObject);
    procedure EngGridSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    procedure SaveToFile(M:String);
    procedure LoadFromFile(M:String);
    procedure ClearGrid(M:String);
  public
    { public declarations }
  end;

  Type  T2Arr = Array [1..10,1..6] of String;

var
  Inp2Form: TInp2Form;
  A2GridCol,A2GridRow,B2GridCol,B2GridRow:Integer;
  A2Arr,B2Arr:T2Arr;

implementation

{$R *.lfm}
Const MaxCol=10;
      MaxRow=6;
Var  LocalPath:String;

{ TInp2Form }

procedure TInp2Form.FormCreate(Sender: TObject);
begin
 A2GridCol:=0;
 A2GridRow:=1;
 B2GridCol:=0;
 B2GridRow:=1;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp2Form.EngGridSelectCell(Sender: TObject; aCol, aRow: Integer;
var CanSelect: Boolean);

function CheckDbl:Boolean;
Var k,m:Integer;
begin
 Result:=false;
 For k:=1 to MaxCol do
  For m:=1 to MaxRow do
  begin
   If ARadioButton.Checked then
   If AGrid.Cells[k,m]=EngGrid.Cells[ACol,ARow] then
   begin Result:=true; Exit; end;
   If BRadioButton.Checked then
   If BGrid.Cells[k,m]=EngGrid.Cells[ACol,ARow] then
   begin Result:=true; Exit; end;
  end;
end;
begin
 CanSelect:=false;
 InfoPanel.Caption:='';
 If ARadioButton.Checked then
 begin
   If (A2GridRow=MaxRow) AND (A2GridCol=MaxCol) then
   InfoPanel.Caption:='Немає місця в множині А' else
   begin
    If CheckDbl then
    InfoPanel.Caption:='Eлемент '+EngGrid.Cells[ACol,ARow]+' уже є в множині А' else
    begin
     If A2GridCol<MaxCol then Inc(A2GridCol) else
     begin A2GridCol:=1; Inc(A2GridRow); end;
     AGrid.Cells[A2GridCol,A2GridRow]:=EngGrid.Cells[ACol,ARow];
    end;
   end;
 end;
 If BRadioButton.Checked then
 begin
   If (B2GridRow=MaxRow) AND (B2GridCol=10) then
   InfoPanel.Caption:='Немає місця в множині B' else
   begin
    If CheckDbl then
    InfoPanel.Caption:='Eлемент '+EngGrid.Cells[ACol,ARow]+' уже є в множині B' else
    begin
     If B2GridCol<MaxCol then Inc(B2GridCol) else
     begin B2GridCol:=1; Inc(B2GridRow); end;
     BGrid.Cells[B2GridCol,B2GridRow]:=EngGrid.Cells[ACol,ARow];
    end;
   end;
 end;
end;

procedure TInp2Form.ASaveButtonClick(Sender: TObject);
begin
  SaveToFile('A');
end;

procedure TInp2Form.BClearButtonClick(Sender: TObject);
begin
  ClearGrid('B');
end;

procedure TInp2Form.BLoadButtonClick(Sender: TObject);
begin
  LoadFromFile('B');
end;

procedure TInp2Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp2Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp2Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;

procedure TInp2Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;
begin
  For i:=1 to MaxCol do
  For j:=1 to MaxRow do
  begin
    A2Arr[i,j]:=AGrid.Cells[i,j];
    B2Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;
procedure TInp2Form.SaveToFile(M: String);
var F : Text;
    LogFileName:String;
    i,j:integer;
begin
 LogFileName:=LocalPath+'DATA\'+M+'2.TXT';
 AssignFile(F,LogFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно записать в '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  For j:=1 to A2GridRow do
  If j<A2GridRow then
  For i:=1 to MaxCol do   Writeln(F,AGrid.Cells[i,j]) else
  For i:=1 to A2GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=1 to B2GridRow do
  If j<B2GridRow then
  For i:=1 to MaxCol do   Writeln(F,BGrid.Cells[i,j]) else
  For i:=1 to B2GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp2Form.LoadFromFile(M:String);
var F : Text;
    LogFileName,Str:String;
begin
 ClearGrid(M);
 LogFileName:=LocalPath+'DATA\'+M+'2.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  A2GridCol:=0;
  A2GridRow:=1;
  While not EOF(F) do
  begin
   If A2GridCol<MaxCol then Inc(A2GridCol) else
   begin
    A2GridCol:=1;
    Inc(A2GridRow);
    If A2GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A2GridCol,A2GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B2GridCol:=0;
  B2GridRow:=1;
  While not EOF(F) do
  begin
   If B2GridCol<MaxCol then Inc(B2GridCol) else
   begin
    B2GridCol:=1;
    Inc(B2GridRow);
    If A2GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); BGrid.Cells[B2GridCol,B2GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;


procedure TInp2Form.ClearGrid(M: String);
var i,j:Integer;
begin
 If M='A' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  BGrid.Cells[i,j]:='';
 A2GridCol:=0;
 A2GridRow:=1;
 B2GridCol:=0;
 B2GridRow:=1;
end;


end.

