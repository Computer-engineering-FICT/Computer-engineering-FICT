unit Unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids, ExtCtrls;

const n=17;
  m=144;
type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    load: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    InfoPanel: TPanel;
    sg1: TStringGrid;
    sg2: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure loadClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.close;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j:Integer;
  q:Boolean;
  k:byte;
begin
  for i:=1 to m do
     begin
         q:=true;
         k:=0;
         for j:=1 to n do
         begin
             if (q=true) then
             begin
              if (sg1.Cells[i,j]='1') then	//знаходить першу та другу одиницю
              k:=k+1;
              if (k=2) then
              q:=false;
              end
             else (sg1.Cells[i,j]:='');		//після двох одиниць заповнює пропусками
         end;
     end;
     InfoPanel.Caption:='Опрацювання виконано';

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i,j: Integer;
  a: array[1..3] of byte;
  f: Byte;
begin
  Image1.Visible:=true;		//картинка стає видимою
 sg2.Clean;
 for i:=1 to n do
     sg2.Cells[i,0]:='v'+intToStr(i);	//заповнення крайніх рядків
  for i:=1 to n do
     sg2.Cells[0,i]:='v'+intToStr(i);  	//заповнення крайніх стовбців
  for i:=1 to m do
     begin
     f:=1;			//лічильник для індекса
        a[1]:=0;			//індекс1
        a[2]:=0;			//індекс2
     for j:=1 to n do
        begin
        if (sg1.Cells[i,j]='1') then 			//знаходить першу одиницю стовбці
        begin
        a[f]:=j;			//запам’ятовує індекс 1, а потім 2
        f:=f+1;
        end;
        if (sg1.Cells[i,j]='2') then		//якщо знаходить двійку «2» в стовбці
        begin
        a[1]:=j;				//обидва індекси рівні номеру її рядку
        a[2]:=j;
        end;
        end;
          if (a[1]<>0) then begin		//якщо це не нуль «0»
          sg2.Cells[a[1],a[2]]:='1';	//в іншому sg2 заповнює одиниці відповідно до індексів
          sg2.Cells[a[2],a[1]]:='1';
          end;
     end;
 InfoPanel.Caption:='Завдання виконано';

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Visible:=false;
end;

procedure TForm1.loadClick(Sender: TObject);
var F : Text;
    Str:String;
    i,j:Integer;
begin
  sg1.Clean;
  for i:=1 to m do
      sg1.Cells[i,0]:='e'+intToStr(i);
   for i:=1 to n do
      sg1.Cells[0,i]:='v'+intToStr(i);
  AssignFile(F,'DATA\P2.txt');
  Reset(F);
  Readln(F, Str);
  sg1.RowCount:=StrToInt(str);		//заповнення крайніх рядків
  Readln(F, Str);
  sg1.ColCount:=StrToInt(str);			//заповнення крайніх стовбців
  For j:=1 to sg1.RowCount-1 do
  For i:=1 to sg1.ColCount-1 do
  begin
   Readln(F,str);
   sg1.Cells[i,j]:=str;				//заповнення відношеннями
  end;
  CloseFile(F);
  InfoPanel.Caption:='Загрузка виконана';
 end;

end.

