unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Button5: TButton;
    ScrollBar1: TScrollBar;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label4: TLabel;
    RadioGroup2: TRadioGroup;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Button6: TButton;
    Button7: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label6: TLabel;
    ComboBox3: TComboBox;
    Button8: TButton;
    Button9: TButton;
    TabSheet3: TTabSheet;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Button10: TButton;
    StringGrid4: TStringGrid;
    StringGrid3: TStringGrid;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Button11: TButton;
    Button12: TButton;
    Memo2: TMemo;
    ScrollBox1: TScrollBox;
    Image2: TImage;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ScrollBox1DockDrop(Sender: TObject; Source: TDragDockObject;
      X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  addversh:boolean=false;
implementation
uses MainUnit;
{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
begin
  VershCol:=strtoint(Edit1.text);
  for i:=1 to VershCol do
    for j:=1 to VershCol do
      StringGrid1.Cells[j,i]:='';
  for i:=1 to VershCol do
    for j:=0 to 3 do
      StringGrid2.Cells[j,i]:='';
  StringGrid1.RowCount:=VershCol+1;
  StringGrid1.ColCount:=VershCol+1;
  StringGrid2.RowCount:=VershCol+1;
  for i:=1 to VershCol do begin
    StringGrid1.Cells[0,i]:=inttostr(i);
    StringGrid1.Cells[i,0]:=inttostr(i);
    StringGrid2.Cells[0,i]:=inttostr(i);
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to 50 do
    memo1.Lines[i]:='';
  SG_to_matrix;
  Testing_input_data;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SG_to_matrix;
  Save_alg;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Open_Alg;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
image1.top:=-5*ScrollBar1.Position;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=-1 then
    RadioGroup2.enabled:=false
  else
    if signali[0,ComboBox1.ItemIndex+1]<>'cond' then
      RadioGroup2.enabled:=false
    else
      RadioGroup2.enabled:=true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  addversh:=true;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if (ComboBox1.ItemIndex<>-1) and (ComboBox2.ItemIndex<>-1) then
    if signali[0,ComboBox1.ItemIndex+1]='start' then
      Perehodi[ComboBox2.ItemIndex+1,ComboBox1.ItemIndex+1]:='start'
    else
    if signali[0,ComboBox1.ItemIndex+1]='end' then
      Perehodi[ComboBox2.ItemIndex+1,ComboBox1.ItemIndex+1]:='end'
    else
    if signali[0,ComboBox1.ItemIndex+1]='link' then
      Perehodi[ComboBox2.ItemIndex+1,ComboBox1.ItemIndex+1]:='link'
    else
    if signali[0,ComboBox1.ItemIndex+1]='cond' then
      Perehodi[ComboBox2.ItemIndex+1,ComboBox1.ItemIndex+1]:=RadioGroup2.Items[RadioGroup2.ItemIndex];
    matrix_to_SG;
    Draw_algoritm;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if (ComboBox1.ItemIndex<>-1) and (ComboBox2.ItemIndex<>-1) then
    Perehodi[ComboBox2.ItemIndex+1,ComboBox1.ItemIndex+1]:='';
    matrix_to_SG;
  Draw_algoritm;
end;

procedure TForm1.Button8Click(Sender: TObject);
var i,j:integer;
begin
  if ComboBox3.ItemIndex<>-1 then begin
    for i:=ComboBox3.ItemIndex+1 to VershCol-1 do begin
      for j:=1 to VershCol do
        perehodi[j,i]:=Perehodi[j,i+1];
      for j:=0 to 3 do
        signali[j,i]:=signali[j,i+1];
      block_coord[i,1]:=block_coord[i+1,1];
      block_coord[i,2]:=block_coord[i+1,2];
    end;
    for i:=ComboBox3.ItemIndex+1 to VershCol-1 do
      for j:=1 to VershCol do
        perehodi[i,j]:=Perehodi[i+1,j];
    for i:=1 to VershCol do begin
      perehodi[i,VershCol]:='';
      perehodi[VershCol,i]:='';
    end;
    for i:=0 to 3 do
      signali[i,VershCol]:='';
    dec(VershCol);
    ComboBox1.Items.Delete(VershCol);
    ComboBox2.Items.Delete(VershCol);
    ComboBox3.Items.Delete(VershCol);
    matrix_to_SG;
    Draw_Algoritm;

  end;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i,j:integer;
begin
  if addversh=true then begin
    addversh:=false;
    inc(VershCol);
    block_coord[VershCol,1]:=X;
    block_coord[VershCol,2]:=Y;
    if (block_coord[VershCol,1] mod 10)>=5 then
      block_coord[VershCol,1]:=((block_coord[VershCol,1] div 10)+1)*10
    else block_coord[VershCol,1]:=(block_coord[VershCol,1] div 10)*10;
    if (block_coord[VershCol,2] mod 10)>=5 then
      block_coord[VershCol,2]:=((block_coord[VershCol,2] div 10)+1)*10
    else block_coord[VershCol,2]:=(block_coord[VershCol,2] div 10)*10;

    //добавляю вершину (ее тип и сигналы)
    case RadioGroup1.ItemIndex of
      0: signali[0,VershCol]:='start';
      1: begin
           signali[0,VershCol]:='end';
           perehodi[1,VershCol]:='end';
         end;
      2: begin
           signali[0,VershCol]:='link';
           signali[1,VershCol]:=edit2.text;
           signali[2,VershCol]:=edit3.text;
           signali[3,VershCol]:=edit4.text;
         end;
      3: begin
           signali[0,VershCol]:='cond';
           signali[1,VershCol]:=edit2.text;
           signali[2,VershCol]:=edit3.text;
           signali[3,VershCol]:=edit4.text;
         end;
    end;

    //Обновляю SG-ы
    Edit1.text:=inttostr(VershCol);
    matrix_to_SG;
    //Обновление КомбоБоксов
    Form1.ComboBox1.Items.Add(inttostr(VershCol));
    Form1.ComboBox2.Items.Add(inttostr(VershCol));
    Form1.ComboBox3.Items.Add(inttostr(VershCol));
    //графика
    Draw_algoritm;
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  SG_to_matrix;
  Draw_Algoritm;
end;

procedure TForm1.Button10Click(Sender: TObject);
var i,j:integer;
begin
  stringgrid3.rowcount:=5;
  stringgrid3.colcount:=5;
  stringgrid4.rowcount:=2;
  stringgrid4.colcount:=5;
  Razmetka;
  //разметка состояний в СГ
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  functions;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Draw_shema;
end;

procedure TForm1.ScrollBox1DockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  Draw_shema;
end;

end.
