unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls;

type

  { TInp0Form }

  TInp0Form = class(TForm)
    BClearButton: TButton;
    ALoadButton: TButton;
    ASaveButton: TButton;
    ASCIIGrid: TStringGrid;
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
    procedure ASCIIGridClick(Sender: TObject);
    procedure ASCIIGridSelectCell(Sender: TObject; aCol, aRow: Integer;
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
Type  T0Arr = Array [1..10,1..10] of String;

var
  Inp0Form: TInp0Form;
  A0GridCol,A0GridRow,B0GridCol,B0GridRow:Integer;
  A0Arr,B0Arr:T0Arr;

implementation

{$R *.lfm}

{ TInp0Form }
 Const MaxCol=10;
       MaxRow=10;
 Var  LocalPath:String;

procedure TInp0Form.FormCreate(Sender: TObject);
begin
 A0GridCol:=0;
 A0GridRow:=1;
 B0GridCol:=0;
 B0GridRow:=1;
 LocalPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp0Form.FormActivate(Sender: TObject);
var i,j:Integer;

begin
  For j:=1 to MaxRow do
   For i:=1 to MaxCol do
   begin
    ASCIIGrid.Cells[i,j]:=Chr(19+j*10+i);
   end;
end;

procedure TInp0Form.ASCIIGridSelectCell(Sender: TObject; aCol, aRow: Integer;
var CanSelect: Boolean);
function CheckDbl:Boolean;
Var k,m:Integer;
begin
  Result:=false;
  For k:=1 to MaxCol do
   For m:=1 to MaxRow do
   begin
    If ARadioButton.Checked then
       If AGrid.Cells[k,m]=ASCIIGrid.Cells[ACol,ARow] then
        begin
             Result:=true;
             Exit;
        end;
    If BRadioButton.Checked then
       If BGrid.Cells[k,m]=ASCIIGrid.Cells[ACol,ARow] then
       begin
            Result:=true;
            Exit;
       end;
   end;
end;
begin
  CanSelect:=false;
  InfoPanel.Caption:='';
  If ARadioButton.Checked then
  begin
    If (A0GridRow=MaxRow) AND (A0GridCol=MaxCol) then
    InfoPanel.Caption:='Немає місця в множині А' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ASCIIGrid.Cells[ACol,ARow]+' уже є в множині А' else
     begin
      If A0GridCol<MaxCol then Inc(A0GridCol) else
      begin A0GridCol:=1; Inc(A0GridRow); end;
      AGrid.Cells[A0GridCol,A0GridRow]:=ASCIIGrid.Cells[ACol,ARow];
     end;
    end;
  end;
  If BRadioButton.Checked then
  begin
    If (B0GridRow=MaxRow) AND (B0GridCol=10) then
    InfoPanel.Caption:='Немає місця в множині B' else
    begin
     If CheckDbl then
     InfoPanel.Caption:='Eлемент '+ASCIIGrid.Cells[ACol,ARow]+' уже є в множині B' else
     begin
      If B0GridCol<MaxCol then Inc(B0GridCol) else
      begin B0GridCol:=1; Inc(B0GridRow); end;
      BGrid.Cells[B0GridCol,B0GridRow]:=ASCIIGrid.Cells[ACol,ARow];
     end;
    end;
  end;
end;


procedure TInp0Form.ASaveButtonClick(Sender: TObject);
begin
 SaveToFile('A0');
end;

procedure TInp0Form.ASCIIGridClick(Sender: TObject);
begin

end;

procedure TInp0Form.ALoadButtonClick(Sender: TObject);
begin
  LoadFromFile('A0');
end;

procedure TInp0Form.AClearButtonClick(Sender: TObject);
begin
  ClearGrid('A0');
end;


procedure TInp0Form.BClearButtonClick(Sender: TObject);
begin
 ClearGrid('B0');
end;

procedure TInp0Form.ARadioButtonChange(Sender: TObject);
begin

end;

procedure TInp0Form.ARadioButtonClick(Sender: TObject);
begin

end;

procedure TInp0Form.BLoadButtonClick(Sender: TObject);
begin
 LoadFromFile('B0');
end;

procedure TInp0Form.BSaveButtonClick(Sender: TObject);
begin
  SaveToFile('B0');
end;

procedure TInp0Form.ExitBtnClick(Sender: TObject);
var i,j:Integer;
begin
  For i:=1 to MaxCol do
  For j:=1 to MaxRow do
  begin
    A0Arr[i,j]:=AGrid.Cells[i,j];
    B0Arr[i,j]:=BGrid.Cells[i,j];
  end;
  Close;
end;

procedure TInp0Form.SaveToFile(M:String);
var F : Text;
    LogFileName:String;
    i,j:integer;
begin
 LogFileName:=LocalPath+'DATA\'+M+'.TXT';
 AssignFile(F,LogFileName);
 {$I-} Rewrite(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно записать в '+LogFileName;
  Exit;
 end;
 If M='A0' then
 begin
  For j:=1 to A0GridRow do
  If j<A0GridRow then
  For i:=1 to MaxCol do   Writeln(F,AGrid.Cells[i,j]) else
  For i:=1 to A0GridCol do   Writeln(F,AGrid.Cells[i,j]);
 end;
 If M='B0' then
 begin
  For j:=1 to B0GridRow do
  If j<B0GridRow then
  For i:=1 to MaxCol do   Writeln(F,BGrid.Cells[i,j]) else
  For i:=1 to B0GridCol do   Writeln(F,BGrid.Cells[i,j]);
 end;
 CloseFile(F);
end;

procedure TInp0Form.LoadFromFile(M:String);
var F : Text;
    LogFileName,Str:String;
begin
 ClearGrid(M);
 LogFileName:=LocalPath+'DATA\'+M+'.TXT';
 AssignFile(F,LogFileName);
 {$I-} Reset(F); {$I+}
 if IOResult <> 0 then
 begin
  InfoPanel.Caption:='Невозможно прочитать из '+LogFileName;
  Exit;
 end;
 If M='A0' then
 begin
  A0GridCol:=0;
  A0GridRow:=1;
  While not EOF(F) do
  begin
   If A0GridCol<MaxCol then Inc(A0GridCol) else
   begin
    A0GridCol:=1;
    Inc(A0GridRow);
    If A0GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу А.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); AGrid.Cells[A0GridCol,A0GridRow]:=Str;
  end;
 end;
 If M='B0' then
 begin
  B0GridCol:=0;
  B0GridRow:=1;
  While not EOF(F) do
  begin
   If B0GridCol<MaxCol then Inc(B0GridCol) else
   begin
    B0GridCol:=1;
    Inc(B0GridRow);
    If A0GridRow>MaxRow then
    begin
     InfoPanel.Caption:='Дані з файлу B.TXT не помістилися в таблицю';
     CloseFile(F);
     Exit;
    end;
   end;
   Readln(F, Str); BGrid.Cells[B0GridCol,B0GridRow]:=Str;
  end;
 end;
 CloseFile(F);
end;

procedure TInp0Form.ClearGrid(M:String);
var i,j:Integer;
begin
 If M='A0' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  AGrid.Cells[i,j]:='';
 If M='B0' then
 For i:=1 to MaxCol do
 For j:=1 to MaxRow do  BGrid.Cells[i,j]:='';
 A0GridCol:=0;
 A0GridRow:=1;
 B0GridCol:=0;
 B0GridRow:=1;
end;


end.

