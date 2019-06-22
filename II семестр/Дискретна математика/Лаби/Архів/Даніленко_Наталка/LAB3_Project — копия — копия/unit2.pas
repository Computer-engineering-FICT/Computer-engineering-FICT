unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TInp1_2Form }

  TInp1_2Form = class(TForm)
    NVarLabel: TLabel;
    LoadParamButton: TButton;
    SaveParamButton: TButton;
    Label6: TLabel;
    Start2_Label: TLabel;
    P_Button: TButton;
    Label5: TLabel;
    P_Label: TLabel;
    s_Button: TButton;
    s_Edit: TEdit;
    ExitButton: TButton;
    InfoPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Start1_Label: TLabel;
    NZK_Label: TLabel;
    n_Label: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure LoadParamButtonClick(Sender: TObject);
    procedure P_ButtonClick(Sender: TObject);
    procedure SaveParamButtonClick(Sender: TObject);
    procedure s_ButtonClick(Sender: TObject);
  private
    { private declarations }
    function factorial (n:integer):integer;
    procedure LoadParam;
    procedure SaveParam;


  public
    { public declarations }
  end;
Type
TVArr=array [1..20] of Integer;
var
  Inp1_2Form: TInp1_2Form;
  s,s_max:Integer;
  PVector:TVArr;
implementation
Uses Unit5;
var ParamPath:String;
{$R *.lfm}

{ TInp1_2Form }

function TInp1_2Form.factorial (n:integer):integer;
var i:Integer;
begin
 if n =1 then factorial:=1 else factorial:=n*factorial(n-1);
end;

procedure TInp1_2Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp1_2Form.FormActivate(Sender: TObject);
var SPer1,SPer2:String;
    i:Integer;
begin
 NVarLabel.Caption:=VariantArr[NumVariant];
 NumElements:=10+NZK mod 11;
 n_Label.Caption:='n=10+(NZK mod 11)='+IntToStr(NumElements);
 NZK_Label.Caption:='NZK='+IntToStr(NZK);
 SPer1:='';
 SPer2:='';
 s_Edit.Text:='';
 P_Label.Caption:='';
 s:=0;
 For i:=1 to 20 do PVector[i]:=0;
 For i:=1 to NumElements do
 begin
  If i<NumElements then
  begin
   SPer1:=SPer1+IntToStr(i)+',';
   SPer2:=SPer2+IntToStr(NumElements+1-i)+',';
  end else
  begin
   SPer1:=SPer1+IntToStr(i);
   SPer2:=SPer2+IntToStr(NumElements+1-i);
  end;
  end;
  Start1_Label.Caption:=SPer1;
  Start2_Label.Caption:=SPer2;
 end;

procedure TInp1_2Form.FormCreate(Sender: TObject);
begin
  ParamPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp1_2Form.Label2Click(Sender: TObject);
begin

end;

procedure TInp1_2Form.LoadParamButtonClick(Sender: TObject);
begin
 LoadParam;
end;

procedure TInp1_2Form.P_ButtonClick(Sender: TObject);
var i,k,Ind:Integer;
    PVS:String;
function CheckDbl(n:Integer):Boolean;
var j:Integer;
begin
 Result:=false;
 For j:=1 to 20 do
 begin
  If PVector[j]=n then
  begin
   Result:=true;
   Break;
  end;
 end;
end;

begin
  For i:=1 to 20 do PVector[i]:=0;
  Randomize;
  i:=1;
  While i<=NumElements do
  begin
   Ind:=Random(NumElements)+1;
   If not CheckDbl(Ind) then
   begin
    PVector[i]:=Ind;
    Inc(I);
   end;
  end;
  PVS:='';
  For k:=1 to NumElements do
  begin
   If k<NumElements then PVS:=PVS+IntToStr(PVector[k])+',' else
   PVS:=PVS+IntToStr(PVector[k]);
  end;
  P_Label.Caption:=PVS;
end;

procedure TInp1_2Form.SaveParamButtonClick(Sender: TObject);
begin
  SaveParam;
end;

procedure TInp1_2Form.s_ButtonClick(Sender: TObject);
begin
 InfoPanel.Caption:='';
 If s_Edit.Text>'' then
 begin
  InfoPanel.Caption:='';
  try
   s := StrToInt(s_Edit.Text);
 except
   on EConvertError do
   begin
    InfoPanel.Caption:='Помилка вводу числа.';
    s_Edit.Text:='';
    InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
    abort;
   end;
  end;
 If (s<=factorial(NumElements)) AND (s>0) then InfoPanel.Caption:='Вибрано '+s_Edit.Text+' перестановок'
 else begin
       InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
       s_Edit.Text:='';
      end;
 end else InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
end;


 procedure TInp1_2Form.LoadParam;
Var F : Text;
    ParamFileName:String;
    str:String;
    vrNE:Integer;
    i:Integer;
    PVS:String;
begin
ParamFileName:=ParamPath+'DATA\P1.txt';
 If FileExists(ParamFileName) then
 begin
  InfoPanel.Caption:='';
  PVS:='';
  AssignFile(F,ParamFileName);
  {$I-} Reset(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо прочитати з '+ParamFileName;
   Exit;
  end;
  Readln(F,str); s_Edit.Text:=str; s := StrToInt(str);
  Readln(F,str);
  vrNE:=StrToInt(str);
  If vrNE=NumElements then
  begin
   For i:=1 to 20 do PVector[i]:=0;
   For i:=1 to NumElements do
   begin
    Readln(F,str);
    PVector[i]:=StrToInt(str);
    If i<NumElements then  PVS:=PVS+str+', 'else PVS:=PVS+str;
    end;
    P_Label.Caption:=PVS;
  end else
  InfoPanel.Caption:='Збережені дані не відповідають вашому варіанту';
 end;
 CloseFile(F);
end;


 procedure TInp1_2Form.SaveParam;
 Var F : Text;
     ParamFileName:String;
     sNumElements:String;
     i:Integer;
     str:String;
 begin
  InfoPanel.Caption:='';
  ParamFileName:=ParamPath+'DATA\P1.txt';
  sNumElements:=IntToStr(NumElements);
  AssignFile(F,ParamFileName);
  {$I-} Rewrite(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо записати в '+ParamFileName;
   Exit;
  end;
  Writeln(F,s_Edit.Text);
  Writeln(F,sNumElements);
  For i:=1 to NumElements do
  begin
   str:=IntToStr(PVector[i]);
   Writeln(F,str);
  end;
  CloseFile(F);
end;

end.

