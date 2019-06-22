unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus,unit2,unit3,unit4,unit6,unit7,unit8,unit9;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    procedure N21Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure OnResize(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
  createForm6:integer;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.N21Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
Form3.Show;
unit3.graph.Reset;
unit3.graph.Show;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
Form7.Show;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
unit4.graph.Reset;
unit4.graph.Show;
Form4.Show;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm1.OnResize(Sender: TObject);
begin
if Form1.Width<590 then
Form1.Width:=590;
if Form1.Height<375 then
Form1.Height:=375;
end;


procedure TForm1.N8Click(Sender: TObject);
begin
SaveDialog1.Execute;
if SaveDialog1.FileName<>'' then
unit3.graph.save(SaveDialog1.FileName);
end;

procedure TForm1.N9Click(Sender: TObject);
begin
OpenDialog1.Execute;
if OpenDialog1.FileName<>'' then
unit3.graph.load(OpenDialog1.FileName);
OpenDialog1.FileName:='';
unit3.graph.Show;
Form3.Show;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
SaveDialog2.Execute;
if SaveDialog2.FileName<>'' then
unit4.graph.save(SaveDialog2.FileName);
end;

procedure TForm1.N14Click(Sender: TObject);
begin
OpenDialog2.Execute;
if OpenDialog2.FileName<>'' then
unit4.graph.load(OpenDialog2.FileName);
OpenDialog2.FileName:='';
unit4.graph.Show;
Form4.Show;
end;

procedure TForm1.N18Click(Sender: TObject);
begin
Form6.Show;
form6.WindowState:=wsMaximized;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
Form9.Show;
Form9.WindowState:=wsMaximized;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
Form3.Show;
end;

end.
