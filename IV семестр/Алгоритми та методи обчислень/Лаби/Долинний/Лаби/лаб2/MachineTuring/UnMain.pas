unit UnMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ToolWin, ComCtrls, ActnList, ExtCtrls;

type
  TFMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    ActionList1: TActionList;
    InValLen: TAction;
    StartMT: TAction;
    PauseMT: TAction;
    StepMT: TAction;
    shEditMT: TAction;
    OpenDialog1: TOpenDialog;
    OpenMT: TAction;
    Timer1: TTimer;
    ExitAp: TAction;
    N8: TMenuItem;
    N11: TMenuItem;
    procedure InValLenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure StepMTExecute(Sender: TObject);
    procedure OpenMTExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StartMTExecute(Sender: TObject);
    procedure PauseMTExecute(Sender: TObject);
    procedure ShFMTExecute(Sender: TObject);
    procedure ShPanelExecute(Sender: TObject);
    procedure ExitApExecute(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  ML : array [-1000..1000] of string;
   P : integer;
Sost : String;

implementation

uses UnPanel, UnEdit, UnMT, UnLog, StdCtrls, Grids, UnLIST;


{$R *.dfm}

function FindSosMT(Temp:String):integer;
var
 T1, T2, OT:integer;
begin
 OT:=0;
 T2:=FList.StringGrid1.ColCount;
 for T1:=1 to T2 do
     begin
     If FList.StringGrid1.Cells[T1,0]=Temp then
                                           begin
                                           OT:=T1;
                                           end;
     end;
 FindSosMT:=OT;
end;

Function FindCommand(temp:string):string;
var
 T1,T2,QW:integer;
 Com:String;
begin
 T2:=FList.StringGrid1.RowCount;
 for T1:=1 to T2 do
 begin
 If FList.StringGrid1.Cells[0,T1]=Temp then
                                       begin
                                       QW:=FindSosMT(SOST);
                                       Com:=FList.StringGrid1.Cells[QW,T1];
                                       end;
 end;
 FindCommand:=Com;
end;

Procedure ReadFileMT(var Temp:string);
var
           F : TextFile;
 Temp1,Temp2 : integer;
    RZ,T1,T2 : integer;
       Temp3 : String;
begin
T1:=0;
T2:=0;
//FList.StringGrid1.ColCount:=T2;
//FList.StringGrid1.RowCount:=T1;
Flog.memo1.lines.LoadFromFile(Temp);
//FList.StringGrid1.ColCount:=;
//FList.StringGrid1.RowCount:=0;

FList.StringGrid1.RowCount:=Flog.Memo1.Lines.Count;
For Temp1:=0 to Flog.Memo1.Lines.Count do
    begin
    T2:=0;
    if FLog.Memo1.Lines.Strings[Temp1]<>'' then
    begin
    Temp3:=FLog.Memo1.Lines.Strings[Temp1];
    For Temp2:=0 to Length(Temp3) do
        begin
        If Temp3[Temp2]=#9 then T2:=T2+1
                           else if Temp2>0 then FList.StringGrid1.Cells[T2,Temp1]:=FList.StringGrid1.Cells[T2,Temp1]+Temp3[Temp2];
        if T2>RZ then
                 begin
                 RZ:=T2;
                 FList.StringGrid1.ColCount:=Rz+1;
                 end;
        end;
    end;
    end;
    SOST:=FList.StringGrid1.Cells[1,0];
end;

Procedure RefreshMT;
var
 Temp:Integer;
begin
FPanel.Label2.Caption:='Текущее положение:'+#13+inttostr(P);
for Temp:=P-13 to P+13 do
        begin
        FMT.StringGrid1.Cells[(Temp-(P-13)),0]:=ML[Temp];
        end;
end;

Procedure LeftMT;
var
 Temp:integer;
 T:string;
begin
P:=P-1;

for Temp:=1 to 8 do
begin
T:=inttostr(Temp)+'.bmp';
FMT.Image2.Picture.LoadFromFile(T);
FMT.Image3.Picture.LoadFromFile(T);
FMT.Update;
Sleep(100);
end;

RefreshMT;

end;

Procedure RightMT;
var
 Temp:integer;
 T:string;
Begin
P:=P+1;

for Temp:=8 downto 1 do
begin
T:=inttostr(Temp)+'.bmp';
FMT.Image2.Picture.LoadFromFile(T);
FMT.Image3.Picture.LoadFromFile(T);
FMT.Update;
Sleep(100);
end;

RefreshMT;
end;

procedure SavetoMT(var temp:integer; Sym:string);
begin
ML[Temp]:=Sym;
RefreshMT;
FPanel.Label4.Caption:='Символ:'+#13+ML[Temp];
end;

Function LoadfrMT(Var Temp:integer):string;
begin
LoadfrMT:=ML[Temp];
FPanel.Label4.Caption:='Символ:'+#13+ML[Temp];
end;

procedure TFMain.InValLenExecute(Sender: TObject);
Var
 S:String;
 D, Temp:integer;
begin
If Sost<>'' then
 begin
 P:=1;
 For Temp:=-1000 to 1000 do
              begin
              ML[Temp]:='#';
              end;
 S:=InputBox('Лента...','Введите значение ленты',S);
 If S<>'' then
          Begin
          D:=length(S);
          For Temp:=1 to D do
              begin
              ML[Temp]:=S[Temp];
              end;
              P:=1;
          end;
 end;
 RefreshMT;
end;

procedure TFMain.FormCreate(Sender: TObject);
var
 Temp:integer;
begin
Sost:='Q2';
For Temp:=-1000 to 1000 do
        begin
        ML[Temp]:='#';
        end;

end;

procedure TFMain.FormPaint(Sender: TObject);
begin
RefreshMT;
end;

procedure TFMain.StepMTExecute(Sender: TObject);
var
 Temp, T:string;
begin
T:=LoadfrMT(P);
Temp:=FindCommand(T);

repeat
if (Temp<>'STOP') and (Temp<>'') then
begin
FPanel.Label3.Caption:='Команда:'+#13 +Temp;
case Temp[1] of
'R':
   begin
   RightMT;
   Temp:=Copy(Temp,2,(length(Temp)-1))
   end;
'L':
   begin
   LeftMT;
   Temp:=Copy(Temp,2,(length(Temp)-1))
   end;
'Q':
   begin
   Sost:=Temp;
   FPanel.Label1.Caption:='Текущее состояние:'+#13+Sost;
   Temp:='';
   end;
 else
 begin
   ML[P]:=Temp[1];
   Temp:=Copy(Temp,2,(length(Temp)-1));
   Refresh;
 end;
end;
end

Until (Temp='') or (Temp='STOP');

end;

procedure TFMain.OpenMTExecute(Sender: TObject);
var
 Temp:string;
begin
Temp:='';
If OpenDialog1.Execute then Temp:=OpenDialog1.FileName;
If Temp<>'' then ReadFileMT(Temp);
end;

procedure TFMain.Timer1Timer(Sender: TObject);
begin
StepMTExecute(SpeedButton9);
end;

procedure TFMain.StartMTExecute(Sender: TObject);
begin
Timer1.Enabled:=True;
end;

procedure TFMain.PauseMTExecute(Sender: TObject);
begin
Timer1.Enabled:=False;
end;

procedure TFMain.ShFMTExecute(Sender: TObject);
begin
FMT.SetFocus;
end;

procedure TFMain.ShPanelExecute(Sender: TObject);
begin
FPanel.SetFocus;
end;

procedure TFMain.ExitApExecute(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFMain.N11Click(Sender: TObject);
begin
MessageBox(0,'Программа будет скоро выложена на '+#13+'HTTP:\\www.rullkalendar.narod.ru'+#13+'Осипян Артур','ТРТУ',MB_OK);
end;

end.
