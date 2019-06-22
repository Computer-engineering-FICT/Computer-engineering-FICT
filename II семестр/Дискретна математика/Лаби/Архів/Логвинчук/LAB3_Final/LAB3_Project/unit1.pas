unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids, ComCtrls, ExtCtrls, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    GenerateSubSets: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LoadData: TButton;
    NameInput: TEdit;
    ResultGrid: TStringGrid;
    SetGrid: TStringGrid;
    SubsCount: TSpinEdit;
    procedure GenerateSubSetsClick(Sender: TObject);
    procedure LoadDataClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  SetA, SubBuf: String;
  m,n: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.LoadDataClick(Sender: TObject);
var
  i,j: integer;
begin
  SetA:=LowerCase(NameInput.Text);

  while Pos(' ',SetA)<>0 do
    Delete(SetA,Pos(' ',SetA),1);

  for i:=1 to length(SetA) do
   for j:=i+1 to length(SetA) do
    if SetA[i]=SetA[j] then
       Delete(SetA,j,1);


  for i:=0 to length(SetA)-1 do
    SetGrid.Cells[i,0]:=SetA[i+1];

  n:=length(SetA);
  Label1.Caption:=Label1.Caption+' '+IntToStr(n);
end;

procedure TForm1.GenerateSubSetsClick(Sender: TObject);
var
  i,j,k: integer;
begin
  m:=SubsCount.Value;
  SetA:=SetA+'1';
  SubBuf:='';
  j:=0;
  while Pos('1',SubBuf)=0 do
   begin
    for k:=0 to length(SubBuf)-1 do
      ResultGrid.Cells[k,j]:=SubBuf[k+1];
    //if j>14 then break;
    inc(j);
    dec(m);
    if m<>0 then
     begin
      i:=1;
      while Pos(SetA[i],SubBuf)<>0 do
       begin
        Delete(SubBuf,Pos(SetA[i],SubBuf),1);
        inc(i);
       end;
      SubBuf:=SubBuf+SetA[i];
     end
    else
     break;



   end;


end;

end.

