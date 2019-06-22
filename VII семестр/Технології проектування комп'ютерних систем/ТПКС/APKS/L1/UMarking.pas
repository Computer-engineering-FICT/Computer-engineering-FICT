unit UMarking;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls,L6U, Grids;

type
  TDMarking = class(TForm)
    MarkingSG: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    MS:TSurface;
  end;
function bybitstr(x:integer):string;
var
  DMarking: TDMarking;

implementation

{$R *.dfm}

function bybitstr(x:integer):string;
var i:word;S:STRING;xx:integer;
Begin
  s:='';
  xx:=x;
  i:=1;
  while (i<=32)and(xx<>0) do begin
    if (xx and 1)=0 then
      s:='0'+s
    else
      s:='1'+s;
    xx:=xx shr 1;
    i:=i+1;
  end;
  if s='' then s:='0';
  bybitstr:=s;
end;

procedure TDMarking.FormShow(Sender: TObject);
Var i,j,nq:word;
begin
  if MS<>nil then begin
    MS.updateMatrix;
    nq:=Length(MS.mi2);//MS.PN;
    MarkingSG.ColCount:=nq+3;
    MarkingSG.RowCount:=nq+1;
    MarkingSG.Cells[0,0]:='M#';
    MarkingSG.Cells[1,0]:='El.Type';
    MarkingSG.Cells[MarkingSG.ColCount-1,0]:='Cod';
    i:=1;
    while i<=nq do begin
      MarkingSG.Cells[0,i]:=IntToStr(i);
      MarkingSG.Cells[i+1,0]:=IntToStr(i);
      case MS.MI2[i-1][0] of
      1:MarkingSG.Cells[1,i]:='Begin';
      2:MarkingSG.Cells[1,i]:='End';
      4:MarkingSG.Cells[1,i]:='Box';
      5:MarkingSG.Cells[1,i]:='zn';
      3:MarkingSG.Cells[1,i]:='If';
      end;
      j:=1;
      while j<=nq do begin
        MarkingSG.Cells[j+1,i]:=IntToStr(MS.MI2[i-1][j]);
        MarkingSG.Cells[MarkingSG.ColCount-1,i]:=bybitstr(MS.MI2[i-1][Length(MS.MI2[i-1])-1]);
        j:=j+1;
      end;
      i:=i+1;
    end;
  end;
end;

procedure TDMarking.FormCreate(Sender: TObject);
begin
  MS:=nil;
end;

end.
