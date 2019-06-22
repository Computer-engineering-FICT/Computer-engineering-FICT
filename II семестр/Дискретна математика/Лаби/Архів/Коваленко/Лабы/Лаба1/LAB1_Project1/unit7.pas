unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls;

type

  { TInp5Form }

  TInp5Form = class(TForm)
    BClearButton: TButton;
    ALoadButton: TButton;
    ASaveButton: TButton;
    ZGrid: TStringGrid;
    ARadioButton: TRadioButton;
    BLoadButton: TButton;
    BRadioButton: TRadioButton;
    AClearButton: TButton;
    BSaveButton: TButton;
    ExitBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    AGrid: TStringGrid;
    BGrid: TStringGrid;
    InfoPanel: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure AClearButtonClick(Sender: TObject);
    procedure ALoadButtonClick(Sender: TObject);
    procedure ARadioButtonChange(Sender: TObject);
    procedure ARadioButtonClick(Sender: TObject);
    procedure ASaveButtonClick(Sender: TObject);
    procedure ZGridClick(Sender: TObject);
    procedure ZGridSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure BClearButtonClick(Sender: TObject);
    procedure BLoadButtonClick(Sender: TObject);
    procedure BSaveButtonClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    procedure SaveToFile(M:String);
    procedure LoadFromFile(M:String);
    procedure ClearGrid(M:String);

  public
    { public declarations }

  end;
Type  T5Arr = Array [0..31,0..31] of String;

var
  Inp5Form: TInp5Form;
  A5GridCol,A5GridRow,B5GridCol,B5GridRow:Integer;
  LocalPath:String;
  A5Arr,B5Arr:T5Arr;

implementation

{$R *.lfm}

{ TInp5Form }
Const
   MaxCol=31;
   MaxRow=31;

procedure TInp5Form.FormCreate(Sender: TObject);
begin
 A5GridCol:=-1;
 A5GridRow:=0;
 B5GridCol:=-1;
 B5GridRow:=0;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp5Form.FormActivate(Sender: TObject);
var i,j:Integer;

begin
  For j:=0 to MaxRow do
   For i:=0 to MaxCol do
   begin
    ZGrid.Cells[i,j]:=IntToHex((j*32+i),3);
   end;
end;

procedure TInp5Form.ZGridSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
function CheckDbl:Boolean;
Var k,m:Integer;
begin
  Result:=false;
  For k:=0 to MaxCol do
   For m:=0 to MaxRow do
   begin
    If ARadioButton.Checked then
    If AGrid.Cells[k,m]=ZGrid.Cells[ACol,ARow] then
    begin Result:=true; Exit; end;
    If BRadioButton.Checked then
    If BGrid.Cells[k,m]=ZGrid.Cells[ACol,ARow] then
    begin Result:=true; Exit; end;
   end;
end;
begin
  CanSelect:=false;
  InfoPanel.Caption:='';
  If ARadioButton.Checked then
  begin
    If (A5GridRow=MaxRow) AND (A5GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині А' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині А' else
     begin
      If A5GridCol<MaxCol then Inc(A5GridCol) else
      begin A5GridCol:=0; Inc(A5GridRow); end;
      AGrid.Cells[A5GridCol,A5GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
  If BRadioButton.Checked then
  begin
    If (B5GridRow=MaxRow) AND (B5GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині B' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині B' else
     begin
      If B5GridCol<MaxCol then Inc(B5GridCol) else
      begin B5GridCol:=0; Inc(B5GridRow); end;
      BGrid.Cells[B5GridCol,B5GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
end;


procedure TInp5Form.ASaveButtonClick(Sender: TObject);
begin
 SaveToFile('A');
end;

procedure TInp5Form.ZGridClick(Sender: TObject);
begin

end;

procedure TInp5Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp5Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;


procedure TInp5Form.BClearButtonClick(Sender: TObject);
begin
 ClearGrid('B');
end;

procedure TInp5Form.ARadioButtonChange(Sender: TObject);
begin

end;

procedure TInp5Form.ARadioButtonClick(Sender: TObject);
begin

end;

procedure TInp5Form.BLoadButtonClick(Sender: TObject);
begin
 LoadFromFile('B');
end;

procedure TInp5Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp5Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;

begin
  For i:=0 to MaxCol do
  For j:=0 to MaxRow do
  begin
    A5Arr[i,j]:=AGrid.Cells[i,j];
    B5Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;

procedure TInp5Form.SaveToFile(M:String);
var F : Text;
    LogFileName:String;
    i,j:integer;
begin
 LogFileName:=LocalPath+'DATA\'+M+'5.TXT';
 AssignFile(F,LogFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно записать в '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  For j:=0 to A5GridRow do
  If j<A5GridRow then
  For i:=0 to MaxCol do   Writeln(F,AGrid.Cells[i,j])
  else For i:=0 to A5GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=0 to B5GridRow do
  If j<B5GridRow then
  For i:=0 to MaxCol do   Writeln(F,BGrid.Cells[i,j])
  else For i:=0 to B5GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp5Form.LoadFromFile(M:String);
var F : Text;
    LogFileName,Str:String;
begin
 ClearGrid(M);
 LogFileName:=LocalPath+'DATA\'+M+'5.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  A5GridCol:=-1;
  A5GridRow:=0;
  While not EOF(F) do
  begin
   If A5GridCol<MaxCol then Inc(A5GridCol) else
   begin
    A5GridCol:=0;
    Inc(A5GridRow);
    If A5GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A5GridCol,A5GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B5GridCol:=-1;
  B5GridRow:=0;
  While not EOF(F) do
  begin
   If B5GridCol<MaxCol then Inc(B5GridCol) else
   begin
    B5GridCol:=0;
    Inc(B5GridRow);
    If A5GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); BGrid.Cells[B5GridCol,B5GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;

procedure TInp5Form.ClearGrid(M:String);
var i,j:Integer;
begin
 If M='A' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  BGrid.Cells[i,j]:='';
 A5GridCol:=-1;
 A5GridRow:=0;
 B5GridCol:=-1;
 B5GridRow:=0;
end;


end.

