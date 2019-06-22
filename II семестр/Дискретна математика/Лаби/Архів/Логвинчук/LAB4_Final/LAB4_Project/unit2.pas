unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TOperForm }

  TOperForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Load: TButton;
    IncGrid: TStringGrid;
    Transform: TButton;
    ExitButton: TButton;
    InfoPanel: TPanel;
    SumGrid: TStringGrid;
    procedure LoadClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure TransformClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;
  k: integer;

implementation

{$R *.lfm}

{ TOperForm }

procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOperForm.TransformClick(Sender: TObject);
var
  i,j,n: integer;
begin
  if k>16 then k:=16;
  for i:=1 to 16 do
       IncGrid.Cells[0,i]:='v'+IntToStr(i);
  for i:=1 to k do
       IncGrid.Cells[i,0]:='e'+IntToStr(i);

  n:=1;

  for i:=1 to 16 do
   for j:=1 to 16 do
    begin
       if n>k then break;
       if (SumGrid.Cells[j,i]='1') then
        if i=j then
         begin
           IncGrid.Cells[n,i]:='2';
           inc(n);
         end
       else
        begin
           IncGrid.Cells[n,i]:='1';
           IncGrid.Cells[n,j]:='-1';
           inc(n);
        end;
    end;
    {for i:=1 to 16 do
     for j:=1 to k do
      if IncGrid.Cells[j,i]='' then IncGrid.Cells[j,i]:='0';}
  InfoPanel.Caption:='Матрицю інцидентності побудовано.';

end;

procedure TOperForm.LoadClick(Sender: TObject);
var
  i,j: integer;
  buf: String;
  Source: TextFile;
begin
  for i:=1 to 16 do
   begin
      SumGrid.Cells[0,i]:='v'+IntToStr(i);
      SumGrid.Cells[i,0]:='v'+IntToStr(i);
   end;
  k:=0;
  AssignFile(Source,'DATA\P1.TXT');
  Reset(Source);
  for i:=1 to 16 do
   for j:=1 to 16 do
    if not eof(Source) then
     begin
       readln(Source,buf);
       SumGrid.Cells[j,i]:=buf;
     end;
  CloseFile(Source);
  for i:=1 to 16 do
   for j:=1 to 16 do
    if SumGrid.Cells[j,i]='1' then        //k - к-ть ребер
     inc(k);
    //else
     //SumGrid.Cells[j,i]:='0';
   InfoPanel.Caption:='Матрицю суміжності завантажено.';
end;

end.

