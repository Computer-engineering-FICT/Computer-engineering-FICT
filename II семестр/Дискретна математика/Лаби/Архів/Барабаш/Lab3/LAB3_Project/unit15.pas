unit Unit15;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;
const m_max=40;

type

  { TOperForm }
  TOperForm = class(TForm)
    Data: TEdit;
    Data1: TLabel;
    Data2: TLabel;
    Save: TButton;
    Label1: TLabel;
    Label2: TEdit;
    Leksi: TRadioButton;
    AntiLeksi: TRadioButton;
    Gen: TButton;
    Setup: TButton;
    ExitButton: TButton;
    InfoPanel: TPanel;
    Result: TListBox;
    Load: TButton;
    ClearBut: TButton;
    procedure GenClick (Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure ClearButClick(Sender: TObject);
    procedure LoadVClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SetupClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    function factorial (n:integer):integer;
    procedure L;
  private
    { private declarations }
  public
    { public declarations }
  end;
type tindex=0..34;
  vector=array [tindex]of integer;
  TVArr=array [1..20] of Integer;
var
  OperForm: TOperForm;
  bVector:TVArr;
var f:text;
  numb:integer;
  con,i:integer;
  R:string;
  Sa:vector;
  n:integer;
  m:Integer;
  const NumElements=34;

implementation
var ParamPath:String;

{$R *.lfm}

{ TOperForm }
function TOperForm.factorial (n:integer):integer;
var i:Integer;
begin
 if n =1 then factorial:=1 else factorial:=n*factorial(n-1);
end;
procedure TOperForm.ExitButtonClick(Sender: TObject);
begin
     result.clear;
   DAta.caption:='';
    infopanel.caption:='';
  Close;
end;

procedure TOperForm.L;
begin
   DAta.caption:='';
     assignfile(f,'DATA/P3.txt');
     Reset(f);
     readln(f,numb);
     readln(f,con);
     sa[0]:=0;
     For i:=1 to NumElements do
          begin
               readln(f,sa[i]);
               Data.caption:=data.caption+inttostr(sa[i]);
          end;
          Label2.caption:=inttostr(numb);
     closefile(f);
end;
procedure TOperForm.SetupClick(Sender: TObject);
begin
     result.clear;
     L;
     n:=1;
     while(sa[0]=0) do
begin
     if (Leksi.checked or AntiLeksi.checked) then
     if (Leksi.checked) then
     begin
     r:=inttostr(n)+': ';
     for i:=1 to NumElements do
          r:=r+inttostr(sa[i]);
     result.items.add(r);
     numb:=numb-1;
     If numb=0 then
        break;
     For i:=NumElements downto 1 do
          begin
               If sa[i]=1 then
                  sa[i]:=0
               else
               begin
                    sa[i]:=1;
                    break;
               end;
          end;
     n:=n+1;
     infopanel.caption:='Згенеровано вектори у лексиграфічному порядку';
end
     else
     begin
        r:=inttostr(n)+': ';
     for i:=1 to NumElements do
          r:=r+inttostr(sa[i]);
     result.items.add(r);
     numb:=numb-1;
     If numb=0 then
        break;
     For i:=NumElements downto 1 do
          begin
               If sa[i]=0 then
                  sa[i]:=1
               else
               begin
                    sa[i]:=0;
                    break;
               end;
          end;
     n:=n+1;
        infopanel.caption:='Згенеровано вектори у антилексиграфічному порядку';
      end
else infopanel.caption:='Не вибрано спосіб генерування';
end;
end;

procedure TOperForm.LoadClick(Sender: TObject);
begin
      L;
end;
procedure TOperForm.GenClick(Sender: TObject);
var i,k:Integer;
    PVS:String;

begin
 For i:=1 to m_max do bVector[i]:=0;
  Randomize;
  i:=1;
  For i:=1 to NumElements do bVector[i]:=Random(2);
  PVS:='';
  For k:=1 to NumElements do
  begin
   If k<NumElements then PVS:=PVS+IntToStr(bVector[k]) else
   PVS:=PVS+IntToStr(bVector[k]);
  end;
  Data.Caption:=PVS;
end;

procedure TOperForm.ClearButClick(Sender: TObject);
begin
  result.clear;
end;

procedure TOperForm.LoadVClick(Sender: TObject);
begin
    L;
end;

procedure TOperForm.SaveClick(Sender: TObject);
Var F : Text;
     ParamFileName:String;
     sNumElements:String;
     i:Integer;
     str:String;
begin
  If Label2.Text>'' then
 begin
  InfoPanel.Caption:='';
  try
   m := StrToInt(Label2.Text);
 except
   on EConvertError do
   begin
    InfoPanel.Caption:='Помилка вводу числа.';
    Label2.Text:='';
    InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
    abort;
   end;
  end;
 If (m<=factorial(10)) AND (m>0) then
 InfoPanel.Caption:='Вибрано '+Label2.Text+' перестановок'
 else begin
       InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
       Label2.Text:='';
      end;

  ParamFileName:=ParamPath+'DATA\P3.txt';
  sNumElements:=IntToStr(NumElements);
  AssignFile(F,ParamFileName);
  {$I-} Rewrite(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо записати в '+ParamFileName;
   Exit;
  end;
  Writeln(F,Label2.Text);
  Writeln(F,sNumElements);
  For i:=1 to NumElements do
  begin
   str:=IntToStr(bVector[i]);
   Writeln(F,str);
  end;
  CloseFile(F);
 end;
end;

end.

