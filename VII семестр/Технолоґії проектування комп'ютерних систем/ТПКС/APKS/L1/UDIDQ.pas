unit UDIDQ;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Grids,L6U;

type
  TDDIDQ = class(TForm)
    StringGridDI: TStringGrid;
    StringGridDQ: TStringGrid;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
  public
    MS:TSurface;
  end;

var
  DDIDQ: TDDIDQ;


implementation
{$R *.dfm}

  procedure TDDIDQ.FormCreate(Sender: TObject);
  begin
    MS:=nil;
  end;

procedure TDDIDQ.FormShow(Sender: TObject);
Var i,j:word;P:TNode;
begin
  with MS.MyBox do begin
    StringGridDI.ColCount:=PN+1;
    StringGridDI.RowCount:=RTN+1;

    StringGridDQ.ColCount:=PN+1;
    StringGridDQ.RowCount:=RTN+1;

    j:=1;
    while j<=RTN do begin
      P:=getRT(j);
      StringGridDI.Cells[0,j]:=P.Name;
      StringGridDQ.Cells[0,j]:=P.Name;
      j:=j+1;
    end;
    i:=1;
    while i<=PN do begin
      P:=getP(i);
      StringGridDI.Cells[i,0]:=P.Name;
      StringGridDQ.Cells[i,0]:=P.Name;
      j:=1;
      while j<=RTN do begin
        StringGridDI.Cells[i,j]:=IntToStr(Connected(getP(i),getRT(j)));
        StringGridDQ.Cells[i,j]:=IntToStr(Connected(getRT(j),getP(i)));
        j:=j+1;
      end;
      i:=i+1;
    end;
  end;
end;

procedure TDDIDQ.FormResize(Sender: TObject);
begin
  StringGridDI.Left:=10;
  StaticText1.Left:=StringGridDI.Left;
  StringGridDI.Width:=(Width div 2)-20;
  StringGridDQ.Left:=StringGridDI.Left+StringGridDI.Width+10;
  StaticText2.Left:=StringGridDQ.Left;
  StringGridDQ.Width:=(Width div 2)-20;
  StringGridDI.Height:=Height-70;
  StringGridDQ.Height:=Height-70;
end;

end.
