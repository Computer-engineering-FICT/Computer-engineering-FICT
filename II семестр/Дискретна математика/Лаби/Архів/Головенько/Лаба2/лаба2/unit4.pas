unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, Unit3;

type

  { TActionForm }

  TActionForm = class(TForm)
    ResultPanel: TLabel;
    Obedinenie: TButton;
    Obratnoe: TButton;
    Dekartovo: TButton;
    Button4: TButton;
    RezGrid: TStringGrid;
    procedure Button4Click(Sender: TObject);
    procedure DekartovoClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure ObedinenieClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ObratnoeClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ActionForm: TActionForm;

implementation
const Max = 10 ;

{$R *.lfm}

{ TActionForm }

procedure TActionForm.FormCreate(Sender: TObject);
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
   RezGrid.Cells [0,ALength]:=Str;
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
   RezGrid.Cells [BLength,0]:=Str;
   if Pos('Ч:',Str)<>0 then BArr[BLength]:=1;
  end;
  CloseFile(F);
end;

procedure TActionForm.ObratnoeClick(Sender: TObject);
var i,j,tmp: integer;
    TmpStr: string;
begin
 for i:=1 to Max-2 do
 begin
  TmpStr:=RezGrid.Cells[0,i];
  RezGrid.Cells[0,i]:=RezGrid.Cells[i,0];
  RezGrid.Cells[i,0]:=TmpStr;
 end;

 for i:=2 to ALength do
 for j:=1 to i-1 do
 begin
 tmp:=RArr[j,i];
 RArr[j,i]:=RArr[i,j];
 RArr[i,j]:=tmp;
 end;
 for i:=1 to ALength do
  for j:=1 to BLength do
   RezGrid.Cells[j,i]:=inttostr(RArr[j,i]);
end;

procedure TActionForm.ObedinenieClick(Sender: TObject);
var i,j: integer;
begin
  for i:=1 to ALength do
  for j:=1 to BLength do
   RezGrid.Cells[j,i]:=inttostr(SArr[j,i]);
  for i:=1 to ALength do
  for j:=1 to BLength do
   if RArr[j,i]=1 then
   RezGrid.Cells[j,i]:=inttostr(RArr[j,i]);
end;

procedure TActionForm.Memo1Change(Sender: TObject);
begin

end;

procedure TActionForm.DekartovoClick(Sender: TObject);
var i,j,k,p: integer;
begin
ResultPanel.Caption:='SxR={';
  for i:=1 to ALength do
  for j:=1 to BLength do
    if SArr[j,i]=1 then
     for k:=1 to ALength do
     for p:=1 to BLength do
      if RArr[p,k]=1 then ResultPanel.Caption:=ResultPanel.Caption+'(('+inttostr(i)+','+inttostr(j)+'),('+inttostr(k)+','+inttostr(p)+')),';
      ResultPanel.Caption:=ResultPanel.Caption+'}'
end;

procedure TActionForm.Button4Click(Sender: TObject);
var i,j,k,p: integer;
begin
ResultPanel.Caption:='SxR^(-1)={';
  for i:=1 to ALength do
  for j:=1 to BLength do
    if SArr[j,i]=1 then
     for k:=1 to ALength do
     for p:=1 to BLength do
      if RArr[k,p]=1 then ResultPanel.Caption:=ResultPanel.Caption+'(('+inttostr(i)+','+inttostr(j)+'),('+inttostr(k)+','+inttostr(p)+')),';
      ResultPanel.Caption:=ResultPanel.Caption+'}'
end;

end.

