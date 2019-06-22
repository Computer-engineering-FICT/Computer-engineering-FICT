unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids, GlobalINF;

type

  { TOperForm }

  TOperForm = class(TForm)
     ALoad: TButton;
     Button1: TButton;
     CreateS: TButton;
     CreateR: TButton;
    ExitButton: TButton;
    InfoPanel: TPanel;
    SGrid: TStringGrid;
    RGrid: TStringGrid;
   procedure ALoadClick(Sender: TObject);
   procedure Button1Click(Sender: TObject);
   procedure CreateSClick(Sender: TObject);
   procedure CreateRClick(Sender: TObject);
   procedure ExitButtonClick(Sender: TObject);
   procedure FormCreate(Sender: TObject);
   procedure SGridSelectCell(Sender: TObject; aCol, aRow: Integer;
     var CanSelect: Boolean);
   private
    { private declarations }
  public
    { public declarations }
  end;
  MnArr = array [1..9] of integer;
  OtArr = array [1..9, 1..9] of integer;
var
  OperForm: TOperForm;
  AArr,BArr: MnArr;
  SArr, RArr :OtArr;
  ALength,BLength: integer;

implementation
 Uses Unit4;

const Max = 10 ;

{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.FormCreate(Sender: TObject);
begin

end;

procedure TOperForm.SGridSelectCell(Sender: TObject; aCol, aRow: Integer;
var CanSelect: Boolean);
var Tmp1,Tmp2: string;
begin
  if RArr[aCol,aRow] = 1 then
   begin
   Tmp1:=RGrid.Cells[0,aRow];
   Delete(Tmp1,1,4);
   Tmp2:=RGrid.Cells[aCol,0];
   Delete(Tmp2,1,4);
   InfoPanel.Caption:=Tmp1+' - это отец '+Tmp2;
   end
  else
   begin
    Tmp1:=RGrid.Cells[0,aRow];
    Delete(Tmp1,1,4);
    Tmp2:=RGrid.Cells[aCol,0];
    Delete(Tmp2,1,4);
    InfoPanel.Caption:=Tmp1+' - это не отец '+Tmp2;
   end;
end;

procedure TOperForm.ALoadClick(Sender: TObject);
 var
  F : text;
  Str:String;

  begin
  ALength:=0;
  AssignFile(F,'DATA\A.TXT');
  Reset(F);
  While not EOF(F) do
  begin
   inc(ALength);
   Readln(F, Str);
   SGrid.Cells [0,ALength]:=Str;
   RGrid.Cells [0,ALength]:=Str;
   if Pos('Ч:',Str)<>0 then AArr[ALength]:=1;
  end;
  CloseFile(F);

  BLength:=0;
  AssignFile(F,'DATA\B.TXT');
  Reset(F);
  While not EOF(F) do
  begin
   inc(BLength);
   Readln(F, Str);
   SGrid.Cells [BLength,0]:=Str;
   RGrid.Cells [BLength,0]:=Str;
   if Pos('Ч:',Str)<>0 then BArr[BLength]:=1;
  end;
  CloseFile(F);

  InfoPanel.Caption:='Загружены наши множества. Множество А - 1 столбик, В - первый ряд.'
end;

procedure TOperForm.Button1Click(Sender: TObject);
begin
  ActionForm.Show;
end;

procedure TOperForm.CreateSClick(Sender: TObject);
var i,j,k:integer;
    TwoMens: boolean;
begin
 TwoMens:=false;
 for i:=1 to ALength do
  if AArr[i] = 1 then
   for j:=1 to BLength do
    if BArr[j] = 0 then
     begin
     for k:=1 to ALength do
      if  SArr[j,k] = 1 then TwoMens:=true;
     if not (TwoMens) then
     begin
     SArr[j,i]:= 1;
     break;
     end
     else TwoMens:=false;
     end;

 for i:=1 to ALength do
  for j:=1 to BLength do
   SGrid.Cells[j,i]:=inttostr(SArr[j,i]);

 InfoPanel.Caption:='Теперь мы видим сформированное отношение aSb, где a - муж b.'
end;

procedure TOperForm.CreateRClick(Sender: TObject);
var i,j,k: integer;
    HisWomen,TwoDads,SameMan: boolean;
begin
HisWomen:= false;
TwoDads:= false;
 for i:=1 to ALength do
  if AArr[i] = 1 then
   for j:=1 to BLength do
    begin
    if SArr[j,i] = 1 then HisWomen:= true;
    if RGrid.Cells[0,i] = RGrid.Cells[j,0] then SameMan:= true;
    for k:=1 to ALength do
      if  RArr[j,k] = 1 then TwoDads:=true;
     if not (TwoDads) and not (HisWomen) and not (SameMan) then
     begin
     RArr[j,i]:= 1;
     //break;
     end
     else
     begin
     TwoDads:=false;
     HisWomen:=false;
     SameMan:=false;
    end;
    end;

for i:=1 to ALength do
 for j:=1 to BLength do
  RGrid.Cells[j,i]:=inttostr(RArr[j,i]);

InfoPanel.Caption:='Теперь мы видим сформированное отношение aRb, где a - отец b. Данное отношение основано исходя из данных отношения S.'
end;

end.

