unit lab3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Mask, ComCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Columns,Rows:integer;

implementation

{$R *.dfm}

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if edit2.Text='' then edit2.Text:='1';
  if edit2.Text='0' then edit2.Text:='1';
  Rows:=StrToIntDef(edit2.Text,rows);
  edit2.Text:=inttostr(rows);
  StringGrid1.RowCount:=rows;
  StringGrid2.RowCount:=rows;
  StringGrid3.RowCount:=rows;
  if rows>10 then stringgrid3.Width:=41
  else
    stringgrid3.Width:=24;

end;


procedure TForm1.Edit1Change(Sender: TObject);
begin
  if edit1.Text='' then edit1.Text:='1';
  if edit1.Text='0' then edit1.Text:='1';
  columns:=StrToIntDef(edit1.Text,columns);
  edit1.Text:=inttostr(columns);
  StringGrid4.colCount:=columns;
  StringGrid2.colCount:=columns;
  StringGrid1.colCount:=columns;
  if columns>9 then stringgrid4.height:=41
  else
    stringgrid4.height:=24;

end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;A:array of array of integer;


procedure proc(x:integer);
var i,j,sum,r,c:integer;S:string;
  begin
    for i:=x to rows-1 do
      begin
        sum:=0;
        for j:= x to columns-1 do
          sum:=sum+A[j,i];
        A[columns,i]:=sum;
      end;
    for i:=x to columns-1 do
      begin
        sum:=0;
        for j:= x to rows-1 do
          sum:=sum+A[i,j];
        A[i,rows]:=sum;
      end;


    sum:=500;
    for i:=x to rows-1 do
      if (A[columns,i]<>0)and(A[columns,i]<sum) then
        begin
          sum:=A[columns,i];
          r:=i;
        end;
    if sum<>500 then
      begin
        sum:=500;
        for i:= x to columns-1 do
          if (A[i,r]=1)and(A[i,rows]<sum) then
            begin
              sum:=A[i,rows];
              c:=i;
            end;
        s:=stringgrid3.Cells[0,r];
        stringgrid3.Cells[0,r]:=stringgrid3.cells[0,x];
        stringgrid3.Cells[0,x]:=s;
        s:=stringgrid4.Cells[c,0];
        stringgrid4.Cells[c,0]:=stringgrid4.cells[x,0];
        stringgrid4.Cells[x,0]:=s;

        for i:=0 to columns-1 do
          begin
            sum:=A[i,x];
            A[i,x]:=A[i,r];
            A[i,r]:=sum;
          end;

        for i:=0 to rows-1 do
          begin
            sum:=A[x,i];
            A[x,i]:=A[c,i];
            A[c,i]:=sum;
          end;

        {//////////////}


      end;


  end;


begin
  SetLength(A,columns+1);
  for i:=0 to rows-1 do
    stringgrid3.Cells[0,i]:=inttostr(i+1);
  for i:=0 to columns-1 do
    stringgrid4.Cells[i,0]:=inttostr(i+1);

  for i:=0 to columns-1 do
    begin
      Setlength(A[i],rows+1);
      for j:= 0 to rows-1 do
        if stringgrid1.Cells[i,j]<>'1' then
          begin
            stringgrid1.Cells[i,j]:='0';
            A[i,j]:=0;
          end else
            A[i,j]:=1;
    end;
  setlength(A[columns],rows);
  {изменять тут}
  for i:=0 to columns-2 do
    proc(i);
  for i:= 0 to columns-1 do
    for j:= 0 to rows-1 do
      stringgrid2.Cells[i,j]:=inttostr(A[i,j]);
end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  StringGrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=key;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='1';
  stringgrid1.Cells[1,0]:='1';
  stringgrid1.Cells[2,1]:='1';
  stringgrid1.Cells[0,2]:='1';
  stringgrid1.Cells[1,2]:='1';
  stringgrid1.Cells[3,2]:='1';
  stringgrid1.Cells[2,3]:='1';
  stringgrid1.Cells[4,3]:='1';
  stringgrid1.Cells[0,4]:='1';
  stringgrid1.Cells[1,4]:='1';
  stringgrid1.Cells[3,5]:='1';
end;

end.
