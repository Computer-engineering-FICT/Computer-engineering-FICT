unit Unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls;

type

  { TInp7Form }

  TInp7Form = class(TForm)
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
Type  T7Arr = Array [0..15,0..31] of String;

var
  Inp7Form: TInp7Form;
  A7GridCol, A7GridRow, B7GridCol, B7GridRow:Integer;
  LocalPath:String;
  A7Arr,B7Arr:T7Arr;

implementation

{$R *.lfm}

{ TInp7Form }
Const
   MaxCol=15;
   MaxRow=31;

procedure TInp7Form.FormCreate(Sender: TObject);
begin
 A7GridCol:=-1;
 A7GridRow:=0;
 B7GridCol:=-1;
 B7GridRow:=0;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp7Form.FormActivate(Sender: TObject);
var i,j:Integer;
    N:Integer;
begin
  N:=1; i:=0; j:=0;
  While N<=1023 do
  begin
   ZGrid.Cells[i,j]:=IntToStr(N);
   N:=N+2;
   Inc(i);
   If i=MaxCol+1 then begin i:=0; inc(j); end;
  end;
end;

procedure TInp7Form.ZGridSelectCell(Sender: TObject; aCol, aRow: Integer;
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
    If (A7GridRow=MaxRow) AND (A7GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині А' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині А' else
     begin
      If A7GridCol<MaxCol then Inc(A7GridCol) else
      begin A7GridCol:=0; Inc(A7GridRow); end;
      AGrid.Cells[A7GridCol,A7GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
  If BRadioButton.Checked then
  begin
    If (B7GridRow=MaxRow) AND (B7GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині B' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині B' else
     begin
      If B7GridCol<MaxCol then Inc(B7GridCol) else
      begin B7GridCol:=0; Inc(B7GridRow); end;
      BGrid.Cells[B7GridCol,B7GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
end;


procedure TInp7Form.ASaveButtonClick(Sender: TObject);
begin
 SaveToFile('A');
end;

procedure TInp7Form.ZGridClick(Sender: TObject);
begin

end;

procedure TInp7Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp7Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;


procedure TInp7Form.BClearButtonClick(Sender: TObject);
begin
 ClearGrid('B');
end;

procedure TInp7Form.ARadioButtonChange(Sender: TObject);
begin

end;

procedure TInp7Form.ARadioButtonClick(Sender: TObject);
begin

end;

procedure TInp7Form.BLoadButtonClick(Sender: TObject);
begin
 LoadFromFile('B');
end;

procedure TInp7Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp7Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;

begin
  For i:=0 to MaxCol do
  For j:=0 to MaxRow do
  begin
    A7Arr[i,j]:=AGrid.Cells[i,j];
    B7Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;

procedure TInp7Form.SaveToFile(M:String);
var F : Text;
    LogFileName:String;
    i,j:integer;
begin
 LogFileName:=LocalPath+'DATA\'+M+'6.TXT';
 AssignFile(F,LogFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно записать в '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  For j:=0 to A7GridRow do
  If j<A7GridRow then For i:=0 to MaxCol do   Writeln(F,AGrid.Cells[i,j])
  else For i:=0 to A7GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=0 to B7GridRow do
  If j<B7GridRow then For i:=0 to MaxCol do   Writeln(F,BGrid.Cells[i,j])
  else For i:=0 to B7GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp7Form.LoadFromFile(M:String);
var F : Text;
    LogFileName,Str:String;
begin
 ClearGrid(M);
 LogFileName:=LocalPath+'DATA\'+M+'6.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  A7GridCol:=-1;
  A7GridRow:=0;
  While not EOF(F) do
  begin
   If A7GridCol<MaxCol then Inc(A7GridCol) else
   begin
    A7GridCol:=0;
    Inc(A7GridRow);
    If A7GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A7GridCol,A7GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B7GridCol:=-1;
  B7GridRow:=0;
  While not EOF(F) do
  begin
   If B7GridCol<MaxCol then Inc(B7GridCol) else
   begin
    B7GridCol:=0;
    Inc(B7GridRow);
    If A7GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
  Readln(F, Str); BGrid.Cells[B7GridCol,B7GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;

procedure TInp7Form.ClearGrid(M:String);
var i,j:Integer;
begin
 If M='A' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  BGrid.Cells[i,j]:='';
 A7GridCol:=-1;
 A7GridRow:=0;
 B7GridCol:=-1;
 B7GridRow:=0;
end;


end.

