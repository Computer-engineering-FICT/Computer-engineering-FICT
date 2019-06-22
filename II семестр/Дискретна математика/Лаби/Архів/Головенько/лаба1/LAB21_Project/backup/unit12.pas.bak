unit Unit12;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids;

type
  Tarray = Array [1..100] of String;
  { TOperForm }

  TOperForm = class(TForm)
    AGrid: TStringGrid;
    BGrid: TStringGrid;
    DoptoB: TButton;
    DoptoA: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SymetrRiznyca: TButton;
    RiznycaAmB: TButton;
    Intersection: TButton;
    CombinationAB: TButton;
    ClearC: TButton;
    CGrid: TStringGrid;
    Button1: TButton;
    ClearB: TButton;
    ClearA: TButton;
    LoadB: TButton;
    LoadA: TButton;
    ExitBtn: TButton;
    InfoPanel: TPanel;
    RiznycaBmA: TButton;



    procedure DoptoAClick(Sender: TObject);
    procedure ClearBClick(Sender: TObject);
    procedure ClearAClick(Sender: TObject);
    procedure ClearCClick(Sender: TObject);
    procedure CombinationABClick(Sender: TObject);
    procedure DoptoBClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure IntersectionPeret (arrA:Tarray; countA:Integer; arrB:Tarray; countB:Integer; var arrC:Tarray; var countC:Integer);
    procedure IntersectionClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure LoadBClick(Sender: TObject);


    procedure LoadFromFile(M:String);
    procedure ClearGrid(M:String);
    procedure Combination(var arr: Tarray; value:String; var count:Integer);
    procedure Button1Click(Sender: TObject);
    procedure LoadAClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Riznyca(arrA:Tarray; countA:Integer; arrB:Tarray; countB:Integer; var arrC:Tarray; var countC:Integer);
    procedure RiznycaAmBClick(Sender: TObject);
    procedure RiznycaBmAClick(Sender: TObject);
    procedure SymetrRiznycaClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
  Type T3Arr = Array [1..10,1..6] of String;
var
  OperForm: TOperForm;
  A3GridCol,A3GridRow,B3GridCol,B3GridRow,C3GridCol,C3GridRow:Integer;
A3Arr,B3Arr,C3Arr:T3Arr;
implementation

{$R *.lfm}
Const MaxCol=10;
  MaxRow=7;
Var LocalPath:String;
{ TOperForm }


 procedure TOperForm.Button1Click(Sender: TObject);
 begin

 end;



 procedure TOperForm.LoadAClick(Sender: TObject);
 begin
   loadfromfile('A');

 end;

 procedure ToperForm.LoadFromFile(M:String);
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
    A3arr[A3GridCol,A3GridRow]:=Str;
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
    B3arr[B3GridCol,B3GridRow]:=Str;
   end;
  end;
  CloseFile(F);
 end;

 procedure TOperForm.IntersectionPeret(arrA:Tarray; countA:Integer; arrB:Tarray; countB:Integer; var arrC:Tarray; var countC:Integer);
var
    i,j:Integer;
begin
 countC:=0;
  for i := 1 to countA do
    for j := 1 to countB do
    if( arrA[i] = arrB[j]) then
    begin
        INC(countC);
        arrC[countC] := arrA[i];
    end;
end;

 procedure TOperForm.Riznyca(arrA:Tarray; countA:Integer; arrB:Tarray; countB:Integer; var arrC:Tarray; var countC:Integer);
var
    i,j:Integer;
    flag:boolean;
begin
  countC:=0;
  for i := 1 to countA do
  begin
   flag := true;
    for j := 1 to countB do
    if( arrA[i] = arrB[j]) then
      flag :=false;

    if(flag) then
    begin
      INC(countC);
      arrC[countC] := arrA[i];
    end;
  end;
end;

procedure TOperForm.RiznycaAmBClick(Sender: TObject);

  var
    i,j:Integer;
    arrA, arrB, arrC:Tarray;
    countA, countB, countC:Integer;
begin
 countA :=0;
 countB :=0;
  ClearGrid('C');
  For j:=1 to maxrow do
  For i:=1 to maxcol do
  begin
   if (AGrid.Cells[i, j] <> '') then
     Combination(arrA, AGrid.Cells[i, j], countA);
   if (BGrid.Cells[i, j] <> '') then
     Combination(arrB, BGrid.Cells[i, j], countB);
   end;
   Riznyca(arrA, countA, arrB, countB, arrC, countC);

 i := 0;
 while ((i < countC) AND (i < maxcol*maxrow)) do begin
   cGrid.Cells[(i MOD 10) + 1, (i DIV 10) + 1] := arrC[i + 1];
   INC(i);
 end;
   InfoPanel.Caption := 'Різниця множин А і В';
   image1.picture.loadfromfile(LocalPath+'DATA\3733333_html_m6acbfd8b.png');
 image1.visible:=true;


  end;

procedure TOperForm.RiznycaBmAClick(Sender: TObject);
  var
     i,j:Integer;
     arrA, arrB, arrC:Tarray;
     countA, countB, countC:Integer;
  begin
  countA :=0;
  countB :=0;
   ClearGrid('C');
   For j:=1 to maxrow do
   For i:=1 to maxcol do
   begin
    if (AGrid.Cells[i, j] <> '') then
      Combination(arrA, AGrid.Cells[i, j], countA);
    if (BGrid.Cells[i, j] <> '') then
      Combination(arrB, BGrid.Cells[i, j], countB);
    end;
    Riznyca(arrB, countB, arrA, countA, arrC, countC);

  i := 0;
  while ((i < countC) AND (i < 7*10)) do begin
    cGrid.Cells[(i MOD 10) + 1, (i DIV 10) + 1] := arrC[i + 1];
    INC(i);
  end;
    InfoPanel.Caption := 'Різниця множин В і А';
    image1.picture.loadfromfile(LocalPath+'DATA\BmA.jpg');
 image1.visible:=true;

  end;

procedure TOperForm.SymetrRiznycaClick(Sender: TObject);

  var
    i,j:Integer;
    arrA, arrB, arrC1, arrC2:Tarray;
    countA, countB, countC1, countC2:Integer;
begin
 countA :=0;
 countB :=0;
  ClearGrid('C');
  For j:=1 to maxrow do
  For i:=1 to maxcol do
  begin
   if (AGrid.Cells[i, j] <> '') then
     Combination(arrA, AGrid.Cells[i, j], countA);
   if (BGrid.Cells[i, j] <> '') then
     Combination(arrB, BGrid.Cells[i, j], countB);
  end;

  Riznyca(arrA, countA, arrB, countB, arrC1, countC1);
  Riznyca(arrB, countB, arrA, countA, arrC2, countC2);

  for i:=1 to countC2 do
  begin
   INC(countC1);
   arrC1[countC1] := arrC2[i];
  end;

  i := 0;
 while ((i < countC1) AND (i < maxcol*maxrow)) do begin
   cGrid.Cells[(i MOD 10) + 1, (i DIV 10) + 1] := arrC1[i + 1];
   INC(i);
 end;
   InfoPanel.Caption := 'Симетрична різниця множин ';
   image1.picture.loadfromfile(LocalPath+'DATA\boolean-diffonly.bmp');
 image1.visible:=true;
end;


    procedure TOperForm.Combination(var arr: Tarray; value: String;
    var count: Integer);
var i : Integer;
    flag : Boolean;
begin
  flag := true;

  for i := 1 to count do
    if (arr[i] = value) then begin
      flag := false;
      break;
    end;

  if (flag) then begin
    INC(count);
    arr[count] := value;
  end;
end;
 procedure ToperForm.ClearGrid(M: String);
 var i,j:Integer;
 begin
  If M='A' then
  For i:=1 to MaxCol do
  For j:=1 to MaxRow do  AGrid.Cells[i,j]:='';
  If M='B' then
  For i:=1 to MaxCol do
  For j:=1 to MaxRow do  BGrid.Cells[i,j]:='';
  If M='C' then
  For i:=1 to MaxCol do
  For j:=1 to MaxRow do  CGrid.Cells[i,j]:='';
  A3GridCol:=0;
  A3GridRow:=1;
  B3GridCol:=0;
  B3GridRow:=1;
  C3GridCol:=0;
  C3GridRow:=1;
 end;


procedure TOperForm.LoadBClick(Sender: TObject);
begin
  LoadFromfile('B');
end;



procedure TOperForm.ClearAClick(Sender: TObject);
begin
  ClearGrid('A');
end;

procedure TOperForm.ClearCClick(Sender: TObject);
begin
  ClearGrid('C');
end;

procedure TOperForm.CombinationABClick(Sender: TObject);

  var
    i,j,count : Integer;
    arr : Tarray;

begin
 count := 0;
 ClearGrid('C');
 For j:=1 to maxrow do
 For i:=1 to maxcol do
   if (AGrid.Cells[i, j] <> '') then
     Combination(arr, AGrid.Cells[i, j], count);


 For j:=1 to maxrow do
 For i:=1 to maxcol do
   if (BGrid.Cells[i, j] <> '') then
     Combination(arr, BGrid.Cells[i, j], count);

 i := 0;
 while ((i < count) AND (i < maxcol*maxrow)) do begin
   CGrid.Cells[(i MOD 10) + 1, (i DIV 10) + 1] := arr[i + 1];
   INC(i);
 end;
 InfoPanel.Caption := 'Об`єднання множин';
 image1.picture.loadfromfile(LocalPath+'DATA\boolean-junction.png');
 image1.visible:=true;
end;

procedure TOperForm.DoptoBClick(Sender: TObject);
  var F : Text;
  loadedArr, result,Ukrarr: Tarray;
  LogFileName:String;
  i, j:integer;
  countA, countB, countC:Integer;
  begin
  ClearGrid('C');
  LogFileName:=LocalPath+'DATA\Ukr.TXT';
  AssignFile(F,LogFileName);
  {$I-} Reset(F); {$I+}
  i:=1;
  begin
  While not EOF(F) do
  begin
  Readln(F, Ukrarr[i]);
  INC(i);
  end;
   end;
   CloseFile(F);
   countA := maxrow*maxcol;
    countB:=0;
   For j:=1 to maxrow do
   For i:=1 to maxcol do
   begin
    if (BGrid.Cells[i, j] <> '') then
      combination(loadedArr, BGrid.Cells[i, j], countB)
    end;
     Riznyca(UkrArr, countA, loadedArr, countB, result, countC);
     i := 0;
  while ((i < countC) AND (i < maxrow*maxcol)) do begin
    cGrid.Cells[(i MOD 10) + 1, (i DIV 10) + 1] := result[i + 1];
    INC(i);
  end;
   image1.picture.loadfromfile(LocalPath+'DATA\Дополнение2.jpg');
 image1.visible:=true;
 InfoPanel.Caption := 'Доповнення до В';

  end;

procedure TOperForm.Image1Click(Sender: TObject);
begin

end;


procedure TOperForm.IntersectionClick(Sender: TObject);
  var
    i,j:Integer;
    arrA, arrB, arrC:Tarray;
    countA, countB, countC:Integer;
begin
 countA :=0;
 countB :=0;
  ClearGrid('C');
  For j:=1 to maxrow do
  For i:=1 to maxcol do
   if (AGrid.Cells[i, j] <> '') then
     Combination(arrA, AGrid.Cells[i, j], countA);

  For j:=1 to maxrow do
  For i:=1 to maxcol do
   if (BGrid.Cells[i, j] <> '') then
     Combination(arrB, BGrid.Cells[i, j], countB);

  IntersectionPeret(arrA, countA, arrB, countB, arrC, countC);

 i := 0;
 while ((i < countC) AND (i < maxcol*maxrow)) do
 begin
   cGrid.Cells[(i MOD 10) + 1, (i DIV 10) + 1] := arrC[i + 1];
   INC(i);
 end;
   InfoPanel.Caption := 'Перетин множин ';

   image1.picture.loadfromfile(LocalPath+'DATA\image008.gif');
   image1.visible:=true;

end;


procedure TOperForm.Label1Click(Sender: TObject);
begin

end;

procedure TOperForm.ClearBClick(Sender: TObject);
begin
  Cleargrid ('B');
end;

procedure TOperForm.DoptoAClick(Sender: TObject);

var F : Text;
loadedArr, result,Ukrarr: Tarray;
LogFileName:String;
i, j:integer;
countA, countB, countC:Integer;
begin
ClearGrid('C');
LogFileName:=LocalPath+'DATA\Ukr.TXT';
AssignFile(F,LogFileName);
{$I-} Reset(F); {$I+}
i:=1;
begin
While not EOF(F) do
begin
Readln(F, Ukrarr[i]);
INC(i);
end;
 end;
 CloseFile(F);
 countA := maxrow*maxcol;
  countB:=0;
 For j:=1 to maxrow do
 For i:=1 to maxcol do
 begin
  if (AGrid.Cells[i, j] <> '') then
    combination(loadedArr, AGrid.Cells[i, j], countB)
  end;
   Riznyca(UkrArr, countA, loadedArr, countB, result, countC);
   i := 0;
while ((i < countC) AND (i < maxrow*maxcol)) do begin
  cGrid.Cells[(i MOD 10) + 1, (i DIV 10) + 1] := result[i + 1];
  INC(i);
end;
 image1.picture.loadfromfile(LocalPath+'DATA\Дополнение.jpg');
   image1.visible:=true;
   InfoPanel.Caption := 'Доповнення до А';

end;


procedure TOperForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.FormCreate(Sender: TObject);
begin

end;



procedure TOperForm.Memo1Change(Sender: TObject);
begin

end;

end.

