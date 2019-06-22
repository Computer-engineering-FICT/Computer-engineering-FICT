unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    sgData: TStringGrid;
    GroupBox2: TGroupBox;
    sgRez: TStringGrid;
    Label7: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    edtQ: TEdit;
    btnInit: TButton;
    btnCalc: TButton;
    procedure btnInitClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Q:integer;
  Rebra,Rez:array of array of integer;
  v: array of boolean;
  res: array of integer;
  n, m, i, j, cnt: integer;



implementation

{$R *.dfm}

procedure TForm1.btnInitClick(Sender: TObject);
var
  i,j:integer;
begin
  try
    q:=strtoint(edtQ.Text);
    sgData.ColCount:=q;
    sgData.RowCount:=q;
    sgRez.ColCount:=q;
    sgRez.RowCount:=q;
    Setlength(Rebra,q,q);
    Setlength(Rez,q,q);
    setlength(res,q);
    setlength(v,q);
    for i:=0 to q-1 do
      for j:=0 to q-1 do begin
        sgdata.cells[i,j]:='0';
      end;
  except
    Showmessage('Введите число');
  end;
end;

function tryit (j: integer): boolean; {пытается найти вершине j пару}
  var
    i: integer;
  begin
    if v[j] then {j в текущем паросочетании уже просмотрена}
      begin
        tryit:= false;
	exit
      end;
  v[j]:= true;
  for i:= 0 to q-1 do
{ребро между i и j существует} {у i еще нет пары}{пару i можно пристроить к другой вершине,для чего нужно построить чередующуюся цепочку}
  if (rebra[i, j]<>0) and ((res[i] = -1) or tryit(res[i])) then
    begin
      tryit:=true;
      res[i]:=j;
      exit
    end;
  tryit:=false;
end;


procedure TForm1.btnCalcClick(Sender: TObject);
var
  i,j,m,ic,jc:integer;
  qrow,qcol:array of integer;
  changes,changes2,found:boolean;
begin
  try //vvod dannih
    changes:=true;
    changes2:=true;
    for i:=0 to q-1 do begin
      for j:=0 to q-1 do begin
        Rebra[i,j]:=strtoint(sgData.cells[j,i]);
        sgrez.cells[i,j]:=' ';
       end;
      res[i]:=-1;
      v[i]:=false;
      end;
//Reducirovanie grafa
  setlength(qcol,q);setlength(qrow,q);
  while changes2 do begin
    while (changes) do begin
      changes:=false;
      for i:=0 to q-1 do begin
        qcol[i]:=0;qrow[i]:=0;
      end;
      for i:=0 to q-1 do
        for j:=0 to q-1 do
          if rebra[i,j]<>0 then begin
            inc(qcol[j]);
            inc(qrow[i]);
          end;
      for i:=0 to q-1 do begin
        if qcol[i]=1 then  //cols
          for j:=0 to q-1 do
            if (rebra[j,i]=1) and (not v[j]) then begin //j 4 cols, i 4 rows
              ic:=j;jc:=i;found:=false;
              v[ic]:=true;
              res[ic]:=jc;
              for m:=0 to q-1 do
                if ((rebra[ic,m])<>0) and (m<>jc) then rebra[ic,m]:=0;
              for m:=0 to q-1 do
                if ((rebra[m,jc])<>0) and (m<>ic) then rebra[m,jc]:=0;
              changes:=true;
            end;
        if qrow[i]=1 then  //rows
          if not v[i] then begin //j 4 cols, i 4 rows
            ic:=i;jc:=0;found:=false;
            while not found do
              if rebra[ic,jc]<>0 then found:=true
                                 else inc(jc);
            v[ic]:=true;
            res[ic]:=jc;
            for m:=0 to q-1 do
              if ((rebra[ic,m])<>0) and (m<>jc) then rebra[ic,m]:=0;
            for m:=0 to q-1 do
              if ((rebra[m,jc])<>0) and (m<>ic) then rebra[m,jc]:=0;
            changes:=true;
          end;
      end;
    end;
{reducirovanie okoncheno, esli ono ne zavershaet rabotu,
 to prikreplyaem 1-y variant neopredelivsheysya zadache
  i zapuskaem reducirovanie snova}
    changes2:=false;
    for i:=0 to q-1 do
      if not v[i] then begin //nahodim perviy popavshiysya stolbets
        for j:=0 to q-1 do
          if rebra[i,j]=1 then begin
            changes2:=true;
            jc:=j;
            break;
          end;
        if changes2 then begin
          v[i]:=true;
          res[i]:=jc;
          for m:=0 to q-1 do
            if ((rebra[i,m])<>0) and (m<>jc) then rebra[i,m]:=0;
          for m:=0 to q-1 do
            if ((rebra[m,jc])<>0) and (m<>i) then rebra[m,jc]:=0;
        end;
      end;
  end;
//vivod dannih
    for i:=0 to q-1 do
      if res[i]<>-1 then
        sgRez.Cells[res[i],i]:='1';
  except
    Showmessage('input numbers into grid');
  end;
end;

end.
