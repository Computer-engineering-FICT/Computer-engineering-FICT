unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  ExtCtrls, StdCtrls;

type

  { TInp4Form }

  TInp4Form = class(TForm)
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
    RusGrid: TStringGrid;
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
    procedure RusGridSelectCell(Sender: TObject; aCol, aRow: Integer;
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

  Type  T4Arr = Array [1..10,1..6] of String;

var
  Inp4Form: TInp4Form;
  A4GridCol,A4GridRow,B4GridCol,B4GridRow:Integer;
  A4Arr,B4Arr:T4Arr;

implementation

{$R *.lfm}
Const MaxCol=10;
      MaxRow=7;
Var  LocalPath:String;

{ TInp4Form }

procedure TInp4Form.FormCreate(Sender: TObject);
begin
 A4GridCol:=0;
 A4GridRow:=1;
 B4GridCol:=0;
 B4GridRow:=1;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp4Form.RusGridSelectCell(Sender: TObject; aCol, aRow: Integer;
var CanSelect: Boolean);

function CheckDbl:Boolean;
Var k,m:Integer;
begin
 Result:=false;
 For k:=1 to MaxCol do
  For m:=1 to MaxRow do
  begin
   If ARadioButton.Checked then
   If AGrid.Cells[k,m]=RusGrid.Cells[ACol,ARow] then
   begin Result:=true; Exit; end;
   If BRadioButton.Checked then
   If BGrid.Cells[k,m]=RusGrid.Cells[ACol,ARow] then
   begin Result:=true; Exit; end;
  end;
end;
begin
 CanSelect:=false;
 InfoPanel.Caption:='';
 If ARadioButton.Checked then
 begin
   If (A4GridRow=MaxRow) AND (A4GridCol=MaxCol) then
   InfoPanel.Caption:='Немає місця в множині А' else
   begin
    If CheckDbl then
    InfoPanel.Caption:='Eлемент '+RusGrid.Cells[ACol,ARow]+' уже є в множині А' else
    begin
     If A4GridCol<MaxCol then Inc(A4GridCol) else
     begin A4GridCol:=1; Inc(A4GridRow); end;
     AGrid.Cells[A4GridCol,A4GridRow]:=RusGrid.Cells[ACol,ARow];
    end;
   end;
 end;
 If BRadioButton.Checked then
 begin
   If (B4GridRow=MaxRow) AND (B4GridCol=10) then
   InfoPanel.Caption:='Немає місця в множині B' else
   begin
    If CheckDbl then
    InfoPanel.Caption:='Eлемент '+RusGrid.Cells[ACol,ARow]+' уже є в множині B' else
    begin
     If B4GridCol<MaxCol then Inc(B4GridCol) else
     begin B4GridCol:=1; Inc(B4GridRow); end;
     BGrid.Cells[B4GridCol,B4GridRow]:=RusGrid.Cells[ACol,ARow];
    end;
   end;
 end;
end;

procedure TInp4Form.ASaveButtonClick(Sender: TObject);
begin
  SaveToFile('A');
end;

procedure TInp4Form.BClearButtonClick(Sender: TObject);
begin
  ClearGrid('B');
end;

procedure TInp4Form.BLoadButtonClick(Sender: TObject);
begin
  LoadFromFile('B');
end;

procedure TInp4Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp4Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp4Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;

procedure TInp4Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;

begin
  For i:=1 to MaxCol do
  For j:=1 to MaxRow do
  begin
    A4Arr[i,j]:=AGrid.Cells[i,j];
    B4Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;
procedure TInp4Form.SaveToFile(M: String);
var F : Text;
    LogFileName:String;
    i,j:integer;
begin
 LogFileName:=LocalPath+'DATA\'+M+'4.TXT';
 AssignFile(F,LogFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно записать в '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  For j:=1 to A4GridRow do
  If j<A4GridRow then
  For i:=1 to MaxCol do   Writeln(F,AGrid.Cells[i,j]) else
  For i:=1 to A4GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=1 to B4GridRow do
  If j<B4GridRow  then
  For i:=1 to MaxCol do   Writeln(F,BGrid.Cells[i,j]) else
  For i:=1 to B4GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp4Form.LoadFromFile(M:String);
var F : Text;
    LogFileName,Str:String;
begin
 ClearGrid(M);
 LogFileName:=LocalPath+'DATA\'+M+'4.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  A4GridCol:=0;
  A4GridRow:=1;
  While not EOF(F) do
  begin
   If A4GridCol<MaxCol then Inc(A4GridCol) else
   begin
    A4GridCol:=1;
    Inc(A4GridRow);
    If A4GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A4GridCol,A4GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B4GridCol:=0;
  B4GridRow:=1;
  While not EOF(F) do
  begin
   If B4GridCol<MaxCol then Inc(B4GridCol) else
   begin
    B4GridCol:=1;
    Inc(B4GridRow);
    If A4GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); BGrid.Cells[B4GridCol,B4GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;


procedure TInp4Form.ClearGrid(M: String);
var i,j:Integer;
begin
 If M='A' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  BGrid.Cells[i,j]:='';
 A4GridCol:=0;
 A4GridRow:=1;
 B4GridCol:=0;
 B4GridRow:=1;
end;


end.

