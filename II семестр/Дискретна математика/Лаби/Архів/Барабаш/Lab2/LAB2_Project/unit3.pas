unit Unit3;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids;
type
  tindex=1..100;
  vectorP=array [tindex] of string[3];
  vectorN=array [tindex] of string[40];

  { TOperForm }

  TOperForm = class(TForm)
     ALoadButton: TButton;
     Button2: TButton;
     ClearLists: TButton;
     DekMultiply: TButton;
     Button5: TButton;
     Button6: TButton;
     ExitButton1: TButton;
     Label3: TLabel;
     Label4: TLabel;
     Label5: TLabel;
     Label6: TLabel;
     StaticText: TStaticText;
     StaticText1: TStaticText;
     UniteSandR: TButton;
    IP: TPanel;
    R_StringGrid: TStringGrid;
    SC: TStringGrid;
    S_StringGrid: TStringGrid;
    sch: TStringGrid;
    Vst: TButton;
    procedure SxmR(Sender: TObject);
    procedure minusR(Sender: TObject);
    procedure SxR(Sender: TObject);
    procedure SpR(Sender: TObject);
    procedure Resetsa(Sender: TObject);
    procedure Resetsg(SG:Tstringgrid);
    procedure R_StringGridSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
   procedure SOper(Sender: TObject);
   procedure loadS(M:tstringgrid);
   procedure ExitButtonClick(Sender: TObject);
   function Checkfree(M:TstringGrid;i:integer):boolean;
   function Checknorm(M:TStringGrid ;i:integer;j:integer;MC:Tstringgrid):boolean;
   function Check(x:string;y:string):integer;
   function eleinV(A:VectorN;ele:string):boolean;
   function ChecknormR(M:Tstringgrid;i,j:integer):boolean;
   procedure Roper();
   procedure ALoadButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  OperForm: TOperForm;
  AP,BP,CP: vectorP;
  AN,BN,CN : vectorN;

implementation
{$R *.lfm}
procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
   resetsa(ClearLists);
  Close;
end;
procedure Toperform.ALoadButtonClick(Sender: TObject);
begin
  resetsa(ClearLists);
  loads(R_StringGrid);
  loads(S_StringGrid);
  IP.Caption:='Завантажено А, В';

end;

procedure TOperForm.loadS(M:Tstringgrid);
var f: text;
  i,j:integer;
  c: string[50];
begin
    assignfile(f,'DATA\A.txt');
    reset (f);
    i:=1;
    while not(EOF(f)) do
    begin
    If i>=R_StringGrid.rowCount then
    begin
    R_StringGrid.rowcount:=R_StringGrid.rowCount+1;
    S_StringGrid.rowcount:=S_StringGrid.rowcount+1;
    end;
    readln(f,c);
    AP[i]:=copy(c,1,2);
    AN[i]:=copy(c,5,length(c)-4);
    M.cells[0,i]:=An[i];
    i:=i+1;
    end;
    closefile(f);

    assignfile(f,'DATA\B.txt');
    reset(f);
    i:=1;
    while not(EOF(f)) do
    begin
    If i>=R_StringGrid.colCount then
    begin
    R_StringGrid.colcount:=R_StringGrid.colCount+1;
    S_StringGrid.colcount:=S_StringGrid.colcount+1;
    end;
    readln(f,c);
    BP[i]:=copy(c,1,2);
    BN[i]:=copy(c,5,length(c)-4);
    M.cells[i,0]:=BN[i];
    i:=i+1;
    end;
    closefile(f);
    j:=1;
    for i:=1 to 100 do
    if eleinv(BN,AN[i]) then
    begin
    CN[j]:=AN[i];
    Cp[j]:=AP[i];
    j:=j+1;
    end;
  end;

procedure TOperForm.SOper(Sender: TObject);
var i,j,s,k:integer;
begin
    resetsg(R_StringGrid);
    loadS(R_StringGrid);
    randomize;
     for i:=1 to R_StringGrid.colcount-1 do
     begin
     s:=0;
     For j:=1 to R_StringGrid.RowCount-1 do

         begin
             If (((AN[j]=BN[i])or(check(AP[j],Bp[i])<>3)))or(not checkfree(R_StringGrid,i)or(not checknormR(R_StringGrid,i,j))) then
                R_StringGrid.cells[i,j]:='0'
             else
                 begin
                      R_StringGrid.cells[i,j]:='0';
                        s:=s+1;
                 end;
         end;
         k:=random(s);
          For j:=1 to R_StringGrid.RowCount-1 do
          begin

             If (((AN[j]=BN[i])or(check(AP[j],Bp[i])<>3)))or(not checkfree(R_StringGrid,i)or(not checknormR(R_StringGrid,i,j))) then
             else
                 begin
                        If k=0 then
                          R_StringGrid.cells[i,j]:='1'
                          else
                              k:=k-1;

         end;
     end;
          end;
     roper;
     IP.Caption:='Встановлено відношення';
end;
procedure ToperForm.Roper();
var i,j,s,k:integer;
begin
    resetsg(S_StringGrid);
    loadS(S_StringGrid);
    randomize;
  for i:=1 to S_StringGrid.colcount-1 do
     begin
        s:=0;
           For j:=1 to S_StringGrid.RowCount-1 do
            begin
                 If ((AN[j]=BN[i])or((check(AP[j],BP[i])<>1)and(check(AP[j],BP[i])<>2))or
                 (not checkfree(S_StringGrid,i))or(not checknorm(S_StringGrid,i,j,R_StringGrid))or(not checknormR(S_StringGrid,i,j)))then
                 S_StringGrid.cells[i,j]:='0'
                 else
                     begin
                        s:=s+1;
                        S_StringGrid.cells[i,j]:='0';
                     end;
            end;
           k:=random(s);
             For j:=1 to S_StringGrid.RowCount-1 do
            begin
                 If ((AN[j]=BN[i])or((check(AP[j],BP[i])<>1)and(check(AP[j],BP[i])<>2))or
                 (not checkfree(S_StringGrid,i))or(not checknorm(S_StringGrid,i,j,R_StringGrid))or(not ChecknormR(S_StringGrid,i,j)))then
                 else
                     If k=0 then
                     S_StringGrid.cells[i,j]:='1'
                     else
                         k:=k-1;

            end;
    end;
end;

function TOperForm.Check(x:string;y:string):integer;
var a,b:string;
begin
     If ((x=y)and(x='Ч')) then
      check:= 1;
     If ((x<>y)and(x='Ч')) then
     check:=2;
     If ((x=y)and(x='Ж')) then
      check:= 3;
     If ((x<>y)and(x='Ж')) then
     check:=4;
end;
function TOperForm.Checkfree(M:TstringGrid;i:integer):boolean;
var x:integer;
begin
  checkfree:=true;
   For x:=1 to M.rowcount-1 do
       begin
            If(M.cells[i,x]='1') then
            checkfree:=false;
       end;
end;
function TOperForm.Checknorm(M:Tstringgrid;i:integer;j:integer;MC:Tstringgrid):boolean;
var x,y,k,t:integer;
begin
     checknorm:=true;
    For x:=1 to M.colcount-1 do
        begin
             If ((M.cells[x,j]='1')and( x<>i)) then
             begin
                For k:=1 to MC.rowcount-1 do
                If BN[i]=AN[k] then
                   For t:=1 to MC.colcount-1 do
                   begin
                        If Mc.cells[t,k]='1' then
                           If M.cells[t,j]='1' then
                              checknorm:=false;
                    end;
             end;
        end;

end;
function Toperform.ChecknormR(M:Tstringgrid;i,j:integer):boolean;
var x,y:integer;
begin
     checknormR:=true;
     For x:=1 to m.RowCount-1 do
     begin
          If AN[x]=BN[i] then
          begin
             For y:=1 to m.ColCount-1 do
             begin
                  If((m.Cells[y,x]='1')and(BN[y]=AN[j]))then
                   checknormR:=false;
             end;
          end;
     end;
end;

procedure TOperForm.Resetsg(SG:Tstringgrid);
var i,j:integer;
begin
     For i:=1 to SG.ColCount-1 do
         for j:=1 to SG.RowCount-1 do
         begin
              SG.cells[i,j]:='';
         end;
end;

procedure TOperForm.R_StringGridSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
    Ip.caption:='';
    IP.caption:=AN[arow]+' и '+BN[acol];
    CanSelect:=true;
  If R_StringGrid.cells[acol,arow]='0' then
   IP.caption:=IP.caption+ ' не';
   IP.caption:=IP.caption+ ' (свекруха та невістка) та';
   If S_StringGrid.cells[acol,arow]='0' then
   IP.caption:=IP.caption+ ' не';
   IP.caption:=IP.caption+ ' (батько та син)';
end;

procedure TOperForm.Resetsa(Sender: TObject);
var i,j:integer;
begin
  for i:=0 to R_StringGrid.colcount-1 do
      for j:=0 to R_StringGrid.RowCount-1 do
      begin
           R_StringGrid.cells[i,j]:='';
           S_StringGrid.cells[i,j]:='';

      end;
  for i:=0 to sc.colcount-1 do
      for j:=0 to sc.RowCount-1 do
      begin
           sc.cells[i,j]:='';
      end;
  IP.Caption:='Очищено А, В та відношення';
end;

procedure TOperForm.SpR(Sender: TObject);
var i,j:integer;
begin
   sc.defaultcolwidth:=80;
  for i:=0 to sc.ColCount-1 do
         for j:=0 to sc.rowcount-1 do
         sc.cells[i,j]:='';
  sc.colcount:=R_StringGrid.colcount;
  sc.rowcount:=R_StringGrid.rowcount;
     for i:=0 to R_StringGrid.ColCount-1 do
         for j:=0 to R_StringGrid.rowcount-1 do
         begin
              If((i<>0)and(j<>0))then
              If ((R_StringGrid.cells[i,j]='1')or(S_StringGrid.cells[i,j]='1')) then
                 sc.cells[i,j]:='1'
                 else
                     sc.cells[i,j]:='0'
                     else
                     sc.cells[i,j]:=R_StringGrid.cells[i,j];

         end;
   IP.Caption:='Знайдено об`єднання відношень';
end;

procedure TOperForm.SxR(Sender: TObject);
var i,j:integer;
begin
   for i:=0 to sc.ColCount-1 do
         for j:=0 to sc.rowcount-1 do
         sc.cells[i,j]:='';
  sc.colcount:=2;
  sc.rowcount:=2;
     for i:=1 to R_StringGrid.ColCount-1 do
         for j:=1 to R_StringGrid.rowcount-1 do
         begin
              If R_StringGrid.cells[i,j]='1' then
              begin
                 sc.Cells[0,sc.RowCount-1]:=R_StringGrid.cells[0,j]+','+R_StringGrid.cells[i,0];
                 sc.RowCount:=sc.RowCount+1;
              end;
              If S_StringGrid.cells[i,j]='1' then
              begin
                 sc.Cells[sc.colCount-1,0]:=S_StringGrid.cells[0,j]+','+S_StringGrid.cells[i,0];
                 sc.colCount:=sc.colCount+1;
              end;
         end;
     sc.ColCount:=sc.colcount-1;
     sc.rowcount:=sc.RowCount-1;
     for i:=1 to sc.ColCount-1 do
         for j:=1 to sc.rowcount-1 do
         sc.cells[i,j]:='1';
         sc.DefaultColWidth:=130;
         IP.Caption:='Знайдено декартовий добуток відношень S × R';
end;

procedure TOperForm.minusR(Sender: TObject);
var  i,j:integer;
begin
    sc.defaultcolwidth:=80;
     for i:=0 to sc.ColCount-1 do
         for j:=0 to sc.rowcount-1 do
         sc.cells[i,j]:='';
     sc.rowcount:=S_StringGrid.colcount;
     sc.ColCount:=S_StringGrid.RowCount;
     for i:=0 to sc.ColCount-1 do
              for j:=0 to sc.rowcount-1 do
              begin
                   sc.Cells[i,j]:=S_StringGrid.Cells[j,i];
              end;
     IP.Caption:='Знайдено обернене відношення';
end;

procedure TOperForm.SxmR(Sender: TObject);
var i,j:integer;

begin
     minusr(button5);
     sch.RowCount:=sc.RowCount;
     sch.colCount:=sc.colCount;
     for i:=0 to sc.ColCount-1 do
         for j:=0 to sc.RowCount-1 do
             sch.cells[i,j]:=sc.cells[i,j];
        for i:=0 to sc.ColCount-1 do
         for j:=0 to sc.rowcount-1 do
         sc.cells[i,j]:='';
  sc.colcount:=2;
  sc.rowcount:=2;
     for i:=1 to R_StringGrid.ColCount-1 do
         for j:=1 to R_StringGrid.rowcount-1 do
         begin
              If R_StringGrid.cells[i,j]='1' then
              begin
                 sc.Cells[0,sc.RowCount-1]:=R_StringGrid.cells[0,j]+','+R_StringGrid.cells[i,0];
                 sc.RowCount:=sc.RowCount+1;
              end;
         end;
     for i:=1 to sch.ColCount-1 do
         for j:=1 to sch.rowcount-1 do
         begin
              If sch.cells[i,j]='1' then
              begin
                 sc.Cells[sc.colCount-1,0]:=sch.cells[0,j]+','+sch.cells[i,0];
                 sc.colCount:=sc.colCount+1;
              end;
         end;
     sc.ColCount:=sc.colcount-1;
     sc.rowcount:=sc.RowCount-1;
     for i:=1 to sc.ColCount-1 do
         for j:=1 to sc.rowcount-1 do
         sc.cells[i,j]:='1';
         sc.DefaultColWidth:=130;
     for i:=0 to sch.ColCount-1 do
         for j:=0 to sch.RowCount-1 do
             sch.cells[i,j]:='';
     IP.Caption:='Знайдено декартовий добуток відношень S × R^-1';

end;

function Toperform.eleinV(A:VectorN;ele:string):boolean;
var i:integer;
begin
  eleinv:=false;
    for i:=1 to 100 do
    If a[i]=ele then
    begin
         eleinv:=true;
         break;
    end;
end;

end.

