unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids;

type

  { TOperForm }
  TOperForm = class(TForm)
     aRbGrid: TStringGrid;
     Button1: TButton;
     Label1: TLabel;
     Label2: TLabel;
     Label3: TLabel;
     Label4: TLabel;
     Mult: TButton;
     Inverted: TButton;
     InvS: TRadioButton;
     invR: TRadioButton;
     Panel1: TPanel;
     Result: TStringGrid;
     Unity: TButton;
     ClearGrids: TButton;
     LoadData: TButton;
    ExitButton: TButton;
    InfoPanel: TPanel;
    aSbGrid: TStringGrid;
   procedure aRbGridSelectCell(Sender: TObject; aCol, aRow: Integer;
     var CanSelect: Boolean);
   procedure aSbGridSelectCell(Sender: TObject; aCol, aRow: Integer;
     var CanSelect: Boolean);
   procedure Button1Click(Sender: TObject);
   procedure ClearGridsClick(Sender: TObject);
   procedure ExitButtonClick(Sender: TObject);
   procedure InvertedClick(Sender: TObject);
   procedure LoadDataClick(Sender: TObject);
   procedure MultClick(Sender: TObject);
   procedure UnityClick(Sender: TObject);
   private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;
  A,B: array[1..5] of String;
  GenderA, GenderB: array [1..5] of String;
  lengthA, lengthB: integer;

implementation

{$R *.lfm}

{ TOperForm }


procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.InvertedClick(Sender: TObject);
var
  i,j: integer;
begin
  if InvR.Checked then
    for i:=0 to lengthA do
     for j:=0 to lengthB do
      Result.Cells[i,j]:=aRbGrid.Cells[j,i];
  if InvS.Checked then
    for i:=0 to lengthA do
     for j:=0 to lengthB do
      Result.Cells[i,j]:=aSbGrid.Cells[j,i];

end;

procedure TOperForm.ClearGridsClick(Sender: TObject);
var
  i,j: integer;
begin
  for i:=0 to 5 do
   for j:=0 to 5 do
    begin
     aRbGrid.Cells[j,i]:='';
     aSbGrid.Cells[j,i]:='';
     Result.Cells[j,i]:='';
    end;
end;

procedure TOperForm.Button1Click(Sender: TObject);
  var
  i,j,k,p: integer;
begin
  Panel1.Caption:='SxR={';
    for i:=1 to lengthA do
     for j:=1 to lengthB do
      if aSbGrid.Cells[j,i]='1' then
       for k:=1 to lengthA do
        for p:=1 to LengthB do
         if Result.Cells[p,k]='1' then
         Panel1.Caption:=Panel1.Caption+'(('+inttostr(i)+','+inttostr(j)+'),('+inttostr(k)+','+inttostr(p)+')),';
         Panel1.Caption:=Panel1.Caption+'}';

end;

procedure TOperForm.aSbGridSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
  if aSbGrid.Cells[aCol,aRow]='1'then
   Panel1.Caption:=aSbGrid.Cells[0,aRow]+' сестра '+aSbGrid.Cells[aCol,0]
  else
   Panel1.Caption:=aSbGrid.Cells[0,aRow]+' не сестра '+aSbGrid.Cells[aCol,0];
end;

procedure TOperForm.aRbGridSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
  if aRbGrid.Cells[aCol,aRow]='1'then
   Panel1.Caption:=aRbGrid.Cells[0,aRow]+' дружина '+aRbGrid.Cells[aCol,0]
  else
   Panel1.Caption:=aRbGrid.Cells[0,aRow]+' не дружина '+aRbGrid.Cells[aCol,0];
end;


procedure TOperForm.LoadDataClick(Sender: TObject);
var
  i,j,k: integer;
  occupied,married: boolean;
  source: TextFile;
begin
  lengthA:=0;
  lengthB:=0;

  aSbGrid.Cells[0,0]:='aSb';
  aRbGrid.Cells[0,0]:='aRb';

  AssignFile(source,'DATA\A.txt');
  Reset(source);
  while not eof(source) do
  begin
    inc(lengthA);
    readln(source,A[lengthA]);
    aSbGrid.Cells[0,lengthA]:=A[lengthA];
    arbGrid.Cells[0,lengthA]:=A[lengthA];
  end;
  CloseFile(source);

  AssignFile(source,'DATA\B.txt');
  Reset(source);
  while not eof(source) do
  begin
    inc(lengthB);
    readln(source,B[lengthB]);
    aSbGrid.Cells[lengthB,0]:=B[lengthB];
    arbGrid.Cells[lengthB,0]:=B[lengthB];
  end;
  CloseFile(source);

   for i:=1 to lengthA do
   for j:=1 to lengthB do
    begin
     aRbGrid.Cells[j,i]:='0';
     aSbGrid.Cells[j,i]:='0';
    end;

  for i:=1 to lengthA do
   if Pos('Ч:', A[i])<>0 then
    GenderA[i]:='1'
   else
    GenderA[i]:='0';

  for i:=1 to lengthB do
   if Pos('Ч:', B[i])<>0 then
    GenderB[i]:='1'
   else
    GenderB[i]:='0';
   ///////////////////////////RELATION aRb/////////////////////////
   begin
     for i:=1 to lengthA do
      begin
       married:=false;
       if GenderA[i]='0' then
        for j:=1 to lengthB do
         begin
          if married then break;
          if GenderB[j]='1' then
           begin
             occupied:=false;
             for k:=1 to lengthA do
              if aRbGrid.Cells[j,k]='1' then
               occupied:=true;
             if not occupied then
              begin
                aRbGrid.Cells[j,i]:='1';
                married:=true;
                break;
              end;
           end;

         end;
      end;

   end;
   /////////////////////RELATION aSb///////////////////////////////
   begin
    for i:=1 to lengthA do
     if GenderA[i]='0' then
      for j:=1 to lengthB do
       if aRbGrid.Cells[j,i]='0' then
        aSbGrid.Cells[j,i]:='1';
   end;

end;

procedure TOperForm.MultClick(Sender: TObject);
var i,j,k,p: integer;
begin
  Panel1.Caption:='SxR={';
    for i:=1 to lengthA do
     for j:=1 to lengthB do
      if aSbGrid.Cells[j,i]='1' then
       for k:=1 to lengthA do
        for p:=1 to LengthB do
         if aRbGrid.Cells[p,k]='1' then
         Panel1.Caption:=Panel1.Caption+'(('+inttostr(i)+','+inttostr(j)+'),('+inttostr(k)+','+inttostr(p)+')),';
         Panel1.Caption:=Panel1.Caption+'}';
end;

procedure TOperForm.UnityClick(Sender: TObject);
var
  i,j: integer;
begin
  for i:=0 to lengthA do
   for j:=0 to lengthB do
    begin
    Result.Cells[j,i]:=aRbGrid.Cells[j,i];
    if Result.Cells[j,i]='0' then
     Result.Cells[j,i]:=aSbGrid.Cells[j,i];
    end;

end;






end.

