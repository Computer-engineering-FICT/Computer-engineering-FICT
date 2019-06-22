unit Unit10;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls;

type

  { TInp8Form }

  TInp8Form = class(TForm)
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
Type  T8Arr = Array [0..15,0..12] of String;

var
  Inp8Form: TInp8Form;
  A8GridCol, A8GridRow, B8GridCol, B8GridRow:Integer;
  LocalPath:String;
  A8Arr,B8Arr:T8Arr;

implementation

{$R *.lfm}

{ TInp8Form }
Const
   MaxCol=15;
   MaxRow=12;

procedure TInp8Form.FormCreate(Sender: TObject);
begin
 A8GridCol:=-1;
 A8GridRow:=0;
 B8GridCol:=-1;
 B8GridRow:=0;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp8Form.FormActivate(Sender: TObject);
var i,j:Integer;
    N:Integer;
begin
 N:=0; i:=-1; j:=0;
 While N<=1023 do
 begin
  If N mod 5 = 0 then
  begin
   Inc(i);
   If i=MaxCol+1 then begin i:=0; inc(j); end;
   ZGrid.Cells[i,j]:=IntToStr(N);
  end;
  N:=N+1;
 end;
end;

procedure TInp8Form.ZGridSelectCell(Sender: TObject; aCol, aRow: Integer;
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
    If (A8GridRow=MaxRow) AND (A8GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині А' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині А' else
     begin
      If A8GridCol<MaxCol then Inc(A8GridCol) else
      begin A8GridCol:=0; Inc(A8GridRow); end;
      AGrid.Cells[A8GridCol,A8GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
  If BRadioButton.Checked then
  begin
    If (B8GridRow=MaxRow) AND (B8GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині B' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ZGrid.Cells[ACol,ARow]+' уже є в множині B' else
     begin
      If B8GridCol<MaxCol then Inc(B8GridCol) else
      begin B8GridCol:=0; Inc(B8GridRow); end;
      BGrid.Cells[B8GridCol,B8GridRow]:=ZGrid.Cells[ACol,ARow];
     end;
    end;
  end;
end;


procedure TInp8Form.ASaveButtonClick(Sender: TObject);
begin
 SaveToFile('A');
end;

procedure TInp8Form.ZGridClick(Sender: TObject);
begin

end;

procedure TInp8Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp8Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;


procedure TInp8Form.BClearButtonClick(Sender: TObject);
begin
 ClearGrid('B');
end;

procedure TInp8Form.ARadioButtonChange(Sender: TObject);
begin

end;

procedure TInp8Form.ARadioButtonClick(Sender: TObject);
begin

end;

procedure TInp8Form.BLoadButtonClick(Sender: TObject);
begin
 LoadFromFile('B');
end;

procedure TInp8Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp8Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;

begin
  For i:=0 to MaxCol do
  For j:=0 to MaxRow do
  begin
    A8Arr[i,j]:=AGrid.Cells[i,j];
    B8Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;

procedure TInp8Form.SaveToFile(M:String);
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
  For j:=0 to A8GridRow do
  If j<A8GridRow then For i:=0 to MaxCol do   Writeln(F,AGrid.Cells[i,j])
  else For i:=0 to A8GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=0 to B8GridRow do
  If j<B8GridRow then For i:=0 to MaxCol do   Writeln(F,BGrid.Cells[i,j])
  else For i:=0 to B8GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp8Form.LoadFromFile(M:String);
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
  A8GridCol:=-1;
  A8GridRow:=0;
  While not EOF(F) do
  begin
   If A8GridCol<MaxCol then Inc(A8GridCol) else
   begin
    A8GridCol:=0;
    Inc(A8GridRow);
    If A8GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A8GridCol,A8GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B8GridCol:=-1;
  B8GridRow:=0;
  While not EOF(F) do
  begin
   If B8GridCol<MaxCol then Inc(B8GridCol) else
   begin
    B8GridCol:=0;
    Inc(B8GridRow);
    If A8GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
  Readln(F, Str); BGrid.Cells[B8GridCol,B8GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;

procedure TInp8Form.ClearGrid(M:String);
var i,j:Integer;
begin
 If M='A' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=0 to MaxCol do
 For j:=0 to MaxRow do  BGrid.Cells[i,j]:='';
 A8GridCol:=-1;
 A8GridRow:=0;
 B8GridCol:=-1;
 B8GridRow:=0;
end;


end.

