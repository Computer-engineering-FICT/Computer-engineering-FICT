unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;
const m_max=40;


type

  { TInp5Form }

  TInp5Form = class(TForm)
    b_Button: TButton;
    FIOButton: TButton;
    FIOEdit: TEdit;
    b_Label: TLabel;
    LenLabel: TLabel;
    Label7: TLabel;
    NVarLabel: TLabel;
    LoadParamButton: TButton;
    SaveParamButton: TButton;
    Label6: TLabel;
    Start2_Label: TLabel;
    s_Button: TButton;
    m_Edit: TEdit;
    ExitButton: TButton;
    InfoPanel: TPanel;
    Label1: TLabel;
    ComLenLabel: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Start1_Label: TLabel;
    NZK_Label: TLabel;
    procedure b_ButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FIOButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComLenLabelClick(Sender: TObject);
    procedure LoadParamButtonClick(Sender: TObject);
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
TVArr=array [1..m_max] of String;
var
  Inp5Form: TInp5Form;
  m:Integer;
  aVector:TVArr;
  StartVector:TVArr;
implementation
Uses Unit5;
var ParamPath:String;
{$R *.lfm}

{ TInp5Form }

function TInp5Form.factorial (n:integer):integer;
var i:Integer;
begin
 if n =1 then factorial:=1 else factorial:=n*factorial(n-1);
end;

procedure TInp5Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp5Form.b_ButtonClick(Sender: TObject);
var ind,i,k:Integer;
   PVS:String;

function CheckDbl(d:Integer):Boolean;
var p:Integer;
begin
 Result:=false;
 For p:=1 to m_max do
 begin
  If StartVector[d]=aVector[p] then
  begin
   Result:=true;
   Break;
  end;
 end;
end;

begin
 Randomize;
 For i:=1 to m_max do aVector[i]:='';
 i:=1;
 While i<=NumElements do
 begin
  Ind:=Random(NumElements)+1;
  If not CheckDbl(Ind) then
  begin
   aVector[i]:=StartVector[Ind];
   Inc(i);
  end;
 end;
 PVS:='';
 For k:=1 to NumElements do
 begin
  If k<NumElements then PVS:=PVS+aVector[k]+',' else
  PVS:=PVS+aVector[k];
 end;
 b_Label.Caption:=PVS;
end;

procedure TInp5Form.FIOButtonClick(Sender: TObject);
var vf:String;
    i,L,k:Integer;
    Pr:String;
function CheckDbl(ds:String):Boolean;
var p:Integer;
begin
 Result:=false;
 For p:=1 to m_max do
 begin
  If StartVector[p]=ds then
  begin
   Result:=true;
   Break;
  end;
 end;
end;

begin
 Start1_Label.Caption:='';
 Start2_Label.Caption:='';
 vf:=FIOEdit.Text;
 L:=Length(vf);
 i:=1;
 k:=1;
 Pr:='';
 For i:=1 to m_max do StartVector[i]:='';

 For i:=1 to 37 do
 begin
  If (Pos(UpAtArr[i],vf)>0) OR (Pos(LowAtArr[i],vf)>0) then
   If not CheckDbl(LowAtArr[i]) then
   begin
    StartVector[k]:=LowAtArr[i];
    inc(k);
   end;
 end;
 NumElements:=k-1;
 LenLabel.Caption:=IntToStr(k-1);
 For i:=1 to NumElements do
 begin
  If i<NumElements then
  begin
   Start1_Label.Caption:=Start1_Label.Caption+StartVector[i]+', ';
   Start2_Label.Caption:=Start2_Label.Caption+StartVector[NumElements-i+1]+', ';
  end  else
  begin
   Start1_Label.Caption:=Start1_Label.Caption+StartVector[i];
   Start2_Label.Caption:=Start2_Label.Caption+StartVector[NumElements-i+1]+', '
  end;
 end;
end;





procedure TInp5Form.FormActivate(Sender: TObject);
Var    i:Integer;
begin
 NVarLabel.Caption:=VariantArr[NumVariant];
 NZK_Label.Caption:='NZK='+IntToStr(NZK);
 m_Edit.Text:='1';
 m:=0;
 For i:=1 to m_max do aVector[i]:='';
end;

procedure TInp5Form.FormCreate(Sender: TObject);
begin
  ParamPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp5Form.ComLenLabelClick(Sender: TObject);
begin

end;

procedure TInp5Form.LoadParamButtonClick(Sender: TObject);
begin
 LoadParam;
end;

procedure TInp5Form.SaveParamButtonClick(Sender: TObject);
begin
  SaveParam;
end;


procedure TInp5Form.s_ButtonClick(Sender: TObject);
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


 procedure TInp5Form.LoadParam;
Var F : Text;
    ParamFileName:String;
    str:String;
    vrNE:Integer;
    i:Integer;
    PVS:String;
begin
ParamFileName:=ParamPath+'DATA\P5.txt';
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
   For i:=1 to m_max do aVector[i]:='';
   For i:=1 to NumElements do
   begin
    Readln(F,str);
    aVector[i]:=str;
    If i<NumElements then  PVS:=PVS+str+', 'else PVS:=PVS+str;
    end;
    b_Label.Caption:=PVS;
  end else
  InfoPanel.Caption:='Збережені дані не відповідають вашому варіанту';
 end;
 CloseFile(F);
end;


 procedure TInp5Form.SaveParam;
 Var F : Text;
     ParamFileName:String;
     sNumElements:String;
     i:Integer;
     str:String;
 begin
  InfoPanel.Caption:='';
  ParamFileName:=ParamPath+'DATA\P5.txt';
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
   str:=aVector[i];
   Writeln(F,str);
  end;
  CloseFile(F);
end;

end.

