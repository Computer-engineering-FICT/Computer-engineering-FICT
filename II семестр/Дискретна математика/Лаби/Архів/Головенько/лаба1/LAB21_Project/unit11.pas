unit Unit11;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls;

type

  { TInp9Form }

  TInp9Form = class(TForm)
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
Type  T9Arr = Array [0..15,0..21] of String;

var
  Inp9Form: TInp9Form;
  A9GridCol, A9GridRow, B9GridCol, B9GridRow:Integer;
  LocalPath:String;
  A9Arr,B9Arr:T9Arr;

implementation

{$R *.lfm}

{ TInp9Form }
Const
   MaxCol=15;
   MaxRow=21;

procedure TInp9Form.FormCreate(Sender: TObject);
begin
 A9GridCol:=-1;
 A9GridRow:=0;
 B9GridCol:=-1;
 B9GridRow:=0;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp9Form.FormActivate(Sender: TObject);
var i,j:Integer;
    N:Integer;
begin
 N:=0; i:=-1; j:=0;
 While N<=1023 do
 begin
  If N mod 3 = 0 then
  begin
   Inc(i);
   If i=MaxCol+1 then begin i:=0; inc(j); end;
   ZGrid.Cells[i,j]:=IntToStr(N);
  end;
  N:=N+1;
 end;
end;

procedure TInp9Form.ZGridSelectCell(Sender: TObject; aCol, aRow: Integer;
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
    If (A9GridRow=MaxRow) AND (A9GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині А' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині А' else
     begin
      If A9GridCol<MaxCol then Inc(A9GridCol) else
      begin A9GridCol:=0; Inc(A9GridRow); end;
      AGrid.Cells[A9GridCol,A9GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
  If BRadioButton.Checked then
  begin
    If (B9GridRow=MaxRow) AND (B9GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині B' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині B' else
     begin
      If B9GridCol<MaxCol then Inc(B9GridCol) else
      begin B9GridCol:=0; Inc(B9GridRow); end;
      BGrid.Cells[B9GridCol,B9GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
end;


procedure TInp9Form.ASaveButtonClick(Sender: TObject);
begin
 SaveToFile('A');
end;

procedure TInp9Form.ZGridClick(Sender: TObject);
begin

end;

procedure TInp9Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp9Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;


procedure TInp9Form.BClearButtonClick(Sender: TObject);
begin
 ClearGrid('B');
end;

procedure TInp9Form.ARadioButtonChange(Sender: TObject);
begin

end;

procedure TInp9Form.ARadioButtonClick(Sender: TObject);
begin

end;

procedure TInp9Form.BLoadButtonClick(Sender: TObject);
begin
 LoadFromFile('B');
end;

procedure TInp9Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp9Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;

begin
  For i:=0 to MaxCol do
  For j:=0 to MaxRow do
  begin
    A9Arr[i,j]:=AGrid.Cells[i,j];
    B9Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;

procedure TInp9Form.SaveToFile(M:String);
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
  For j:=0 to A9GridRow do
  If j<A9GridRow then For i:=0 to MaxCol do   Writeln(F,AGrid.Cells[i,j])
  else For i:=0 to A9GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=0 to B9GridRow do
  If j<B9GridRow then For i:=0 to MaxCol do   Writeln(F,BGrid.Cells[i,j])
  else For i:=0 to B9GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp9Form.LoadFromFile(M:String);
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
  A9GridCol:=-1;
  A9GridRow:=0;
  While not EOF(F) do
  begin
   If A9GridCol<MaxCol then Inc(A9GridCol) else
   begin
    A9GridCol:=0;
    Inc(A9GridRow);
    If A9GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A9GridCol,A9GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B9GridCol:=-1;
  B9GridRow:=0;
  While not EOF(F) do
  begin
   If B9GridCol<MaxCol then Inc(B9GridCol) else
   begin
    B9GridCol:=0;
    Inc(B9GridRow);
    If A9GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
  Readln(F, Str); BGrid.Cells[B9GridCol,B9GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;

procedure TInp9Form.ClearGrid(M:String);
var i,j:Integer;
begin
 If M='A' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  BGrid.Cells[i,j]:='';
 A9GridCol:=-1;
 A9GridRow:=0;
 B9GridCol:=-1;
 B9GridRow:=0;
end;


end.

