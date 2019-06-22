unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;
const m_max=40;
type

  { TInp3Form }

  TInp3Form = class(TForm)
    NVarLabel: TLabel;
    LoadParamButton: TButton;
    SaveParamButton: TButton;
    Label6: TLabel;
    Start2_Label: TLabel;
    b_Button: TButton;
    Label5: TLabel;
    b_Label: TLabel;
    s_Button: TButton;
    m_Edit: TEdit;
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
    procedure b_ButtonClick(Sender: TObject);
    procedure SaveParamButtonClick(Sender: TObject);
    procedure Start1_LabelClick(Sender: TObject);
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
TVArr=array [1..m_max] of Integer;
var
  Inp3Form: TInp3Form;
  m:Integer;
  bVector:TVArr;
implementation
Uses Unit5;
var ParamPath:String;
{$R *.lfm}

{ TInp3Form }

function TInp3Form.factorial (n:integer):integer;
var i:Integer;
begin
 if n =1 then factorial:=1 else factorial:=n*factorial(n-1);
end;

procedure TInp3Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp3Form.FormActivate(Sender: TObject);
var SPer1,SPer2:String;
    i:Integer;
begin
 NVarLabel.Caption:=VariantArr[NumVariant];
 NumElements:=20+NZK mod 21;
 n_Label.Caption:='n=20+(NZK mod 21)='+IntToStr(NumElements);
 NZK_Label.Caption:='NZK='+IntToStr(NZK);
 SPer1:='';
 SPer2:='';
 m_Edit.Text:='1';
 b_Label.Caption:='';
 m:=0;
 For i:=1 to m_max do bVector[i]:=0;
 For i:=1 to NumElements do
 begin
  If i<NumElements then
  begin
   SPer1:=SPer1+'0,';
   SPer2:=SPer2+'1,';
  end else
  begin
   SPer1:=SPer1+'0';
   SPer2:=SPer2+'1';
  end;
 end;
 Start1_Label.Caption:=SPer1;
 Start2_Label.Caption:=SPer2;
end;

procedure TInp3Form.FormCreate(Sender: TObject);
begin
  ParamPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp3Form.Label2Click(Sender: TObject);
begin

end;

procedure TInp3Form.LoadParamButtonClick(Sender: TObject);
begin
 LoadParam;
end;

procedure TInp3Form.b_ButtonClick(Sender: TObject);
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
   If k<NumElements then PVS:=PVS+IntToStr(bVector[k])+',' else
   PVS:=PVS+IntToStr(bVector[k]);
  end;
  b_Label.Caption:=PVS;
end;

procedure TInp3Form.SaveParamButtonClick(Sender: TObject);
begin
  SaveParam;
end;

procedure TInp3Form.Start1_LabelClick(Sender: TObject);
begin

end;

procedure TInp3Form.s_ButtonClick(Sender: TObject);
begin
 InfoPanel.Caption:='';
 If m_Edit.Text>'' then
 begin
  InfoPanel.Caption:='';
  try
   m := StrToInt(m_Edit.Text);
 except
   on EConvertError do
   begin
    InfoPanel.Caption:='Помилка вводу числа.';
    m_Edit.Text:='';
    InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
    abort;
   end;
  end;
 If (m<=factorial(NumElements)) AND (m>0) then InfoPanel.Caption:='Вибрано '+m_Edit.Text+' перестановок'
 else begin
       InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
       m_Edit.Text:='';
      end;
 end else InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
end;


 procedure TInp3Form.LoadParam;
Var F : Text;
    ParamFileName:String;
    str:String;
    vrNE:Integer;
    i:Integer;
    PVS:String;
begin
ParamFileName:=ParamPath+'DATA\P3.txt';
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
  Readln(F,str); m_Edit.Text:=str; m := StrToInt(str);
  Readln(F,str);
  vrNE:=StrToInt(str);
  If vrNE=NumElements then
  begin
   For i:=1 to m_max do bVector[i]:=0;
   For i:=1 to NumElements do
   begin
    Readln(F,str);
    bVector[i]:=StrToInt(str);
    If i<NumElements then  PVS:=PVS+str+', 'else PVS:=PVS+str;
    end;
    b_Label.Caption:=PVS;
  end else
  InfoPanel.Caption:='Збережені дані не відповідають вашому варіанту';
 end;
 CloseFile(F);
end;


 procedure TInp3Form.SaveParam;
 Var F : Text;
     ParamFileName:String;
     sNumElements:String;
     i:Integer;
     str:String;
 begin
  InfoPanel.Caption:='';
  ParamFileName:=ParamPath+'DATA\P3.txt';
  sNumElements:=IntToStr(NumElements);
  AssignFile(F,ParamFileName);
  {$I-} Rewrite(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо записати в '+ParamFileName;
   Exit;
  end;
  Writeln(F,m_Edit.Text);
  Writeln(F,sNumElements);
  For i:=1 to NumElements do
  begin
   str:=IntToStr(bVector[i]);
   Writeln(F,str);
  end;
  CloseFile(F);
end;

end.

