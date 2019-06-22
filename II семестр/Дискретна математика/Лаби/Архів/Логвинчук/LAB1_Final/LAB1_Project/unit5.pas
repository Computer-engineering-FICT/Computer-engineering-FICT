unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  ExtCtrls, StdCtrls;

type

  { TInp3Form }

  TInp3Form = class(TForm)
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
    UkrGrid: TStringGrid;
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
    procedure UkrGridSelectCell(Sender: TObject; aCol, aRow: Integer;
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

  Type  T3Arr = Array [1..10,1..6] of String;

var
  Inp3Form: TInp3Form;
  A3GridCol,A3GridRow,B3GridCol,B3GridRow:Integer;
  A3Arr,B3Arr:T3Arr;

implementation

{$R *.lfm}
Const MaxCol=10;
      MaxRow=7;
Var  LocalPath:String;

{ TInp3Form }

procedure TInp3Form.FormCreate(Sender: TObject);
begin
 A3GridCol:=0;
 A3GridRow:=1;
 B3GridCol:=0;
 B3GridRow:=1;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp3Form.UkrGridSelectCell(Sender: TObject; aCol, aRow: Integer;
var CanSelect: Boolean);

function CheckDbl:Boolean;
Var k,m:Integer;
begin
 Result:=false;
 For k:=1 to MaxCol do
  For m:=1 to MaxRow do
  begin
   If ARadioButton.Checked then
   If AGrid.Cells[k,m]=UkrGrid.Cells[ACol,ARow] then
   begin Result:=true; Exit; end;
   If BRadioButton.Checked then
   If BGrid.Cells[k,m]=UkrGrid.Cells[ACol,ARow] then
   begin Result:=true; Exit; end;
  end;
end;
begin
 CanSelect:=false;
 InfoPanel.Caption:='';
 If ARadioButton.Checked then
 begin
   If (A3GridRow=MaxRow) AND (A3GridCol=MaxCol) then
   InfoPanel.Caption:='Немає місця в множині А' else
   begin
    If CheckDbl then
    InfoPanel.Caption:='Eлемент '+UkrGrid.Cells[ACol,ARow]+' уже є в множині А' else
    begin
     If A3GridCol<MaxCol then Inc(A3GridCol) else
     begin A3GridCol:=1; Inc(A3GridRow); end;
     AGrid.Cells[A3GridCol,A3GridRow]:=UkrGrid.Cells[ACol,ARow];
    end;
   end;
 end;
 If BRadioButton.Checked then
 begin
   If (B3GridRow=MaxRow) AND (B3GridCol=10) then
   InfoPanel.Caption:='Немає місця в множині B' else
   begin
    If CheckDbl then
    InfoPanel.Caption:='Eлемент '+UkrGrid.Cells[ACol,ARow]+' уже є в множині B' else
    begin
     If B3GridCol<MaxCol then Inc(B3GridCol) else
     begin B3GridCol:=1; Inc(B3GridRow); end;
     BGrid.Cells[B3GridCol,B3GridRow]:=UkrGrid.Cells[ACol,ARow];
    end;
   end;
 end;
end;

procedure TInp3Form.ASaveButtonClick(Sender: TObject);
begin
  SaveToFile('A');
end;

procedure TInp3Form.BClearButtonClick(Sender: TObject);
begin
  ClearGrid('B');
end;

procedure TInp3Form.BLoadButtonClick(Sender: TObject);
begin
  LoadFromFile('B');
end;

procedure TInp3Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp3Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp3Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;

procedure TInp3Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;
begin
  For i:=1 to MaxCol do
  For j:=1 to MaxRow do
  begin
    A3Arr[i,j]:=AGrid.Cells[i,j];
    B3Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;
procedure TInp3Form.SaveToFile(M: String);
var F : Text;
    LogFileName:String;
    i,j:integer;
begin
 LogFileName:=LocalPath+'DATA\'+M+'3.TXT';
 AssignFile(F,LogFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно записать в '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  For j:=1 to A3GridRow do
  If j<A3GridRow then
  For i:=1 to MaxCol do   Writeln(F,AGrid.Cells[i,j]) else
  For i:=1 to A3GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=1 to B3GridRow do
  If j<B3GridRow then
  For i:=1 to MaxCol do   Writeln(F,BGrid.Cells[i,j]) else
  For i:=1 to B3GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp3Form.LoadFromFile(M:String);
var F : Text;
    LogFileName,Str:String;
begin
 ClearGrid(M);
 LogFileName:=LocalPath+'DATA\'+M+'3.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  A3GridCol:=0;
  A3GridRow:=1;
  While not EOF(F) do
  begin
   If A3GridCol<MaxCol then Inc(A3GridCol) else
   begin
    A3GridCol:=1;
    Inc(A3GridRow);
    If A3GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A3GridCol,A3GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B3GridCol:=0;
  B3GridRow:=1;
  While not EOF(F) do
  begin
   If B3GridCol<MaxCol then Inc(B3GridCol) else
   begin
    B3GridCol:=1;
    Inc(B3GridRow);
    If A3GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); BGrid.Cells[B3GridCol,B3GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;


procedure TInp3Form.ClearGrid(M: String);
var i,j:Integer;
begin
 If M='A' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  BGrid.Cells[i,j]:='';
 A3GridCol:=0;
 A3GridRow:=1;
 B3GridCol:=0;
 B3GridRow:=1;
end;


end.

