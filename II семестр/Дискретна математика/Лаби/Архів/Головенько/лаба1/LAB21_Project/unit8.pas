unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls;

type

  { TInp6Form }

  TInp6Form = class(TForm)
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
Type  T6Arr = Array [0..15,0..31] of String;

var
  Inp6Form: TInp6Form;
  A6GridCol, A6GridRow, B6GridCol, B6GridRow:Integer;
  LocalPath:String;
  A6Arr,B6Arr:T6Arr;

implementation

{$R *.lfm}

{ TInp6Form }
Const
   MaxCol=15;
   MaxRow=31;

procedure TInp6Form.FormCreate(Sender: TObject);
begin
 A6GridCol:=-1;
 A6GridRow:=0;
 B6GridCol:=-1;
 B6GridRow:=0;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp6Form.FormActivate(Sender: TObject);
var i,j:Integer;
    N:Integer;
begin
  N:=0; i:=0; j:=0;
  While N<=1022 do
  begin
   ZGrid.Cells[i,j]:=IntToStr(N);
   N:=N+2;
   Inc(i);
   If i=MaxCol+1 then begin i:=0; inc(j); end;
  end;
end;

procedure TInp6Form.ZGridSelectCell(Sender: TObject; aCol, aRow: Integer;
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
    If (A6GridRow=MaxRow) AND (A6GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині А' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині А' else
     begin
      If A6GridCol<MaxCol then Inc(A6GridCol) else
      begin A6GridCol:=0; Inc(A6GridRow); end;
      AGrid.Cells[A6GridCol,A6GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
  If BRadioButton.Checked then
  begin
    If (B6GridRow=MaxRow) AND (B6GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині B' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині B' else
     begin
      If B6GridCol<MaxCol then Inc(B6GridCol) else
      begin B6GridCol:=0; Inc(B6GridRow); end;
      BGrid.Cells[B6GridCol,B6GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
end;


procedure TInp6Form.ASaveButtonClick(Sender: TObject);
begin
 SaveToFile('A');
end;

procedure TInp6Form.ZGridClick(Sender: TObject);
begin

end;

procedure TInp6Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp6Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;


procedure TInp6Form.BClearButtonClick(Sender: TObject);
begin
 ClearGrid('B');
end;

procedure TInp6Form.ARadioButtonChange(Sender: TObject);
begin

end;

procedure TInp6Form.ARadioButtonClick(Sender: TObject);
begin

end;

procedure TInp6Form.BLoadButtonClick(Sender: TObject);
begin
 LoadFromFile('B');
end;

procedure TInp6Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp6Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;

begin
  For i:=0 to MaxCol do
  For j:=0 to MaxRow do
  begin
    A6Arr[i,j]:=AGrid.Cells[i,j];
    B6Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;

procedure TInp6Form.SaveToFile(M:String);
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
  For j:=0 to A6GridRow do
  If j<A6GridRow then For i:=0 to MaxCol do   Writeln(F,AGrid.Cells[i,j])
  else For i:=0 to A6GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=0 to B6GridRow do
  If j<B6GridRow then For i:=0 to MaxCol do   Writeln(F,BGrid.Cells[i,j])
  else For i:=0 to B6GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp6Form.LoadFromFile(M:String);
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
  A6GridCol:=-1;
  A6GridRow:=0;
  While not EOF(F) do
  begin
   If A6GridCol<MaxCol then Inc(A6GridCol) else
   begin
    A6GridCol:=0;
    Inc(A6GridRow);
    If A6GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A6GridCol,A6GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B6GridCol:=-1;
  B6GridRow:=0;
  While not EOF(F) do
  begin
   If B6GridCol<MaxCol then Inc(B6GridCol) else
   begin
    B6GridCol:=0;
    Inc(B6GridRow);
    If A6GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
  Readln(F, Str); BGrid.Cells[B6GridCol,B6GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;

procedure TInp6Form.ClearGrid(M:String);
var i,j:Integer;
begin
 If M='A' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  BGrid.Cells[i,j]:='';
 A6GridCol:=-1;
 A6GridRow:=0;
 B6GridCol:=-1;
 B6GridRow:=0;
end;


end.

