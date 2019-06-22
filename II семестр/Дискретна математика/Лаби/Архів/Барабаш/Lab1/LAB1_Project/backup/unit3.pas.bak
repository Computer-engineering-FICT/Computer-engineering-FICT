unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls;

type

  { TInp1Form }

  TInp1Form = class(TForm)
    BClearButton: TButton;
    ALoadButton: TButton;
    ASaveButton: TButton;
    FFGrid: TStringGrid;
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
    procedure FFGridClick(Sender: TObject);
    procedure FFGridSelectCell(Sender: TObject; aCol, aRow: Integer;
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
Type  T1Arr = Array [1..16,1..16] of String;

var
  Inp1Form: TInp1Form;
  A1GridCol,A1GridRow,B1GridCol,B1GridRow:Integer;
  LocalPath:String;
  A1Arr,B1Arr:T1Arr;

implementation

{$R *.lfm}

{ TInp1Form }
Const
   MaxCol=16;
   MaxRow=16;

procedure TInp1Form.FormCreate(Sender: TObject);
begin
 A1GridCol:=0;
 A1GridRow:=1;
 B1GridCol:=0;
 B1GridRow:=1;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp1Form.FormActivate(Sender: TObject);
var i,j:Integer;

begin
  For j:=1 to MaxRow do
   For i:=1 to MaxCol do
   begin
    FFGrid.Cells[i,j]:=IntToHex(((j-1)*16+(i-1)),2);
   end;
end;

procedure TInp1Form.FFGridSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
function CheckDbl:Boolean;
Var k,m:Integer;
begin
  Result:=false;
  For k:=1 to MaxCol do
   For m:=1 to MaxRow do
   begin
    If ARadioButton.Checked then
    If AGrid.Cells[k,m]=FFGrid.Cells[ACol,ARow] then
    begin Result:=true; Exit; end;
    If BRadioButton.Checked then
    If BGrid.Cells[k,m]=FFGrid.Cells[ACol,ARow] then
    begin Result:=true; Exit; end;
   end;
end;
begin
  CanSelect:=false;
  InfoPanel.Caption:='';
  If ARadioButton.Checked then
  begin
    If (A1GridRow=MaxRow) AND (A1GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині А' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+FFGrid.Cells[ACol,ARow]+' уже є в множині А' else
     begin
      If A1GridCol<MaxCol then Inc(A1GridCol) else
      begin A1GridCol:=1; Inc(A1GridRow); end;
      AGrid.Cells[A1GridCol,A1GridRow]:=FFGrid.Cells[ACol,ARow];
     end;
    end;
  end;
  If BRadioButton.Checked then
  begin
    If (B1GridRow=MaxRow) AND (B1GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині B' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+FFGrid.Cells[ACol,ARow]+' уже є в множині B' else
     begin
      If B1GridCol<MaxCol then Inc(B1GridCol) else
      begin B1GridCol:=1; Inc(B1GridRow); end;
      BGrid.Cells[B1GridCol,B1GridRow]:=FFGrid.Cells[ACol,ARow];
     end;
    end;
  end;
end;


procedure TInp1Form.ASaveButtonClick(Sender: TObject);
begin
 SaveToFile('A');
end;

procedure TInp1Form.FFGridClick(Sender: TObject);
begin

end;

procedure TInp1Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A');
end;

procedure TInp1Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A');
end;


procedure TInp1Form.BClearButtonClick(Sender: TObject);
begin
 ClearGrid('B');
end;

procedure TInp1Form.ARadioButtonChange(Sender: TObject);
begin

end;

procedure TInp1Form.ARadioButtonClick(Sender: TObject);
begin

end;

procedure TInp1Form.BLoadButtonClick(Sender: TObject);
begin
 LoadFromFile('B');
end;

procedure TInp1Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B');
end;

procedure TInp1Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;
begin
  For i:=1 to MaxCol do
  For j:=1 to MaxRow do
  begin
    A1Arr[i,j]:=AGrid.Cells[i,j];
    B1Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;

procedure TInp1Form.SaveToFile(M:String);
var F : Text;
    LogFileName:String;
    i,j:integer;
begin
 LogFileName:=LocalPath+'DATA\'+M+'1.TXT';
 AssignFile(F,LogFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно записать в '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  For j:=1 to A1GridRow do
  If j<A1GridRow then
  For i:=1 to MaxCol do   Writeln(F,AGrid.Cells[i,j]) else
  For i:=1 to A1GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B' then
 begin
  For j:=1 to B1GridRow do
  If j<B1GridRow then
  For i:=1 to MaxCol do   Writeln(F,BGrid.Cells[i,j]);
  For i:=1 to B1GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp1Form.LoadFromFile(M:String);
var F : Text;
    LogFileName,Str:String;
begin
 ClearGrid(M);
 LogFileName:=LocalPath+'DATA\'+M+'1.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из '+LogFileName;
  Exit;
 end;
 If M='A' then
 begin
  A1GridCol:=0;
  A1GridRow:=1;
  While not EOF(F) do
  begin
   If A1GridCol<MaxCol then Inc(A1GridCol) else
   begin
    A1GridCol:=1;
    Inc(A1GridRow);
    If A1GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A1GridCol,A1GridRow]:=Str;
  end;
 end;
 If M='B' then
 begin
  B1GridCol:=0;
  B1GridRow:=1;
  While not EOF(F) do
  begin
   If B1GridCol<MaxCol then Inc(B1GridCol) else
   begin
    B1GridCol:=1;
    Inc(B1GridRow);
    If A1GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); BGrid.Cells[B1GridCol,B1GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;

procedure TInp1Form.ClearGrid(M:String);
var i,j:Integer;
begin
 If M='A' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  BGrid.Cells[i,j]:='';
 A1GridCol:=0;
 A1GridRow:=1;
 B1GridCol:=0;
 B1GridRow:=1;
end;


end.

