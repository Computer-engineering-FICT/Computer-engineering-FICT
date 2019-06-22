unit Unit11;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

Const   c_max=40;

type

  { TInp11Form }

  TInp11Form = class(TForm)
    kButton: TButton;
    kEdit: TEdit;
    Label6: TLabel;
    nButton: TButton;
    nEdit: TEdit;
    NVarLabel: TLabel;
    LoadParamButton: TButton;
    SaveParamButton: TButton;
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
    Start_Label: TLabel;
    NZK_Label: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure kButtonClick(Sender: TObject);
    procedure kEditChange(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure LoadParamButtonClick(Sender: TObject);
    procedure nButtonClick(Sender: TObject);
    procedure P_ButtonClick(Sender: TObject);
    procedure SaveParamButtonClick(Sender: TObject);
    procedure s_ButtonClick(Sender: TObject);
  private
    { private declarations }
    procedure LoadParam;
    procedure SaveParam;


  public
    { public declarations }
  end;
Type
TVArr=array [1..c_max] of Integer;
var
  Inp11Form: TInp11Form;
  PVector:TVArr;
implementation
Uses Unit5;
var ParamPath:String;
{$R *.lfm}

{ TInp11Form }



procedure TInp11Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp11Form.FormActivate(Sender: TObject);
var SPer:String;
    i:Integer;
begin
 NumElements:=32;
 CombElements:=1;
 NVarLabel.Caption:=VariantArr[NumVariant];
 NZK_Label.Caption:='NZK='+IntToStr(NZK);
 SPer:='';
 s_Edit.Text:='';
 P_Label.Caption:='';
 SElements:=0;
 For i:=1 to 20 do PVector[i]:=0;
 For i:=1 to NumElements do
 begin
  If i<NumElements then SPer:=SPer+IntToStr(i)+',' else SPer:=SPer+IntToStr(i)+'}';
 end;
 Start_Label.Caption:=SPer;
end;

procedure TInp11Form.FormCreate(Sender: TObject);
begin
  ParamPath:=ExtractFilePath(Application.ExeName);
end;



procedure TInp11Form.Label2Click(Sender: TObject);
begin

end;

procedure TInp11Form.LoadParamButtonClick(Sender: TObject);
begin
 LoadParam;
end;

procedure TInp11Form.nButtonClick(Sender: TObject);
var i:Integer;
begin
 InfoPanel.Caption:='';
 If nEdit.Text>'' then
 begin
  InfoPanel.Caption:='';
  try
   NumElements := StrToInt(nEdit.Text);
 except
   on EConvertError do
   begin
    InfoPanel.Caption:='Помилка вводу числа.';
    nEdit.Text:='';
    InfoPanel.Caption:='Наберіть кількість елементів множини і натисніть "Ввід n"';
    abort;
   end;
  end;
 If (NumElements>0) then InfoPanel.Caption:='Вибрано '+nEdit.Text+' елементів'
 else begin
       InfoPanel.Caption:='Наберіть кількість елементів і натисніть "Ввід n"';
       nEdit.Text:='';
      end;
 end else InfoPanel.Caption:='Наберіть кількість елементів і натисніть "Ввід n"';
 If NumElements>40 then
 begin
  InfoPanel.Caption:='Максимальна кількість елементів множини:40';
  NumElements:=40;
  nEdit.Text:='40';
 end;
 If NumElements<32 then
 begin
  InfoPanel.Caption:='Мінімальна кількість елементів множини:32';
  NumElements:=32;
  nEdit.Text:='32';
 end;
 If (NumElements>=32) AND (NumElements<=40) then
 begin
  Start_Label.Caption:='';
  For i:=1 to NumElements do
  If  i<NumElements then Start_Label.Caption:=Start_Label.Caption+IntToStr(i)+', ' else
  Start_Label.Caption:=Start_Label.Caption+IntToStr(i)+'}';
 end else   Start_Label.Caption:='';
end;

procedure TInp11Form.kButtonClick(Sender: TObject);
var i:Integer;
begin
 InfoPanel.Caption:='';
 If kEdit.Text>'' then
 begin
  InfoPanel.Caption:='';
  try
   CombElements := StrToInt(kEdit.Text);
  except
   on EConvertError do
   begin
    kEdit.Text:='1';
    InfoPanel.Caption:='Наберіть кількість елементів множини і натисніть "Ввід k"';
    Exit;
   end;
  end;
  If (CombElements>0) then
  begin
   InfoPanel.Caption:='Сполучення складається з '+kEdit.Text+' елементів';
   If (CombElements>NumElements) then
   begin
    InfoPanel.Caption:='Потужність сполучення не повинна перевищувати потужність множини';
    kEdit.Text:=nEdit.Text;
    CombElements:=NumElements;
   end;
  end else
  begin
   kEdit.Text:='1';
   CombElements:=1;
   InfoPanel.Caption:='Сполучення має бути додатньою величиною';
  end;
 end else InfoPanel.Caption:='Наберіть кількість елементів і натисніть "Ввід k"';
end;

procedure TInp11Form.kEditChange(Sender: TObject);
begin

end;


procedure TInp11Form.P_ButtonClick(Sender: TObject);
var i,k,Ind:Integer;
    PVS:String;
    Region:Integer;

function Check (n:Integer):Boolean;
var j:Integer;
begin
 Result:=false;
 For j:=1 to 40 do
 begin
  If PVector[j]=n then
  begin
   Result:=true;
   Exit;
  end;
 end;
 If n<CombElements-i+1 then Result:=true;
end;

begin
 Randomize;
 Region:=NumElements;
 For i:=1 to 40 do PVector[i]:=0;
  i:=1;
  While i<=CombElements do
  begin
   Ind:=Random(Region)+1;
   If not Check(Ind) then
   begin
    PVector[CombElements-i+1]:=Ind;
    Inc(I);
    Region:=Ind;
   end;
  end;
  PVS:='';
  For k:=1 to CombElements do
  begin
   If k<CombElements then PVS:=PVS+IntToStr(PVector[k])+',' else
   PVS:=PVS+IntToStr(PVector[k]);
  end;
  P_Label.Caption:=PVS;
end;

procedure TInp11Form.SaveParamButtonClick(Sender: TObject);
begin
  SaveParam;
end;

procedure TInp11Form.s_ButtonClick(Sender: TObject);
begin
 InfoPanel.Caption:='';
 If s_Edit.Text>'' then
 begin
  InfoPanel.Caption:='';
  try
   SElements := StrToInt(s_Edit.Text);
  except
   on EConvertError do
   begin
    InfoPanel.Caption:='Помилка вводу числа.';
    s_Edit.Text:='';
    InfoPanel.Caption:='Наберіть кількість сполучень і натисніть "ВВІД"';
    abort;
   end;
  end;
  InfoPanel.Caption:='Вибрано '+s_Edit.Text+' сполучень';
  SElements:=StrToInt(s_Edit.Text);
 end else InfoPanel.Caption:='Наберіть кількість сполучень і натисніть "ВВІД"';
end;


 procedure TInp11Form.LoadParam;
Var F : Text;
    ParamFileName:String;
    str:String;
    vrNE:Integer;
    i:Integer;
    PVS:String;
begin
ParamFileName:=ParamPath+'DATA\P11.txt';
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
  Readln(F,str); nEdit.Text:=str;
  nButtonClick(nil);
  Readln(F,str); kEdit.Text:=str;
  kButtonClick(nil);
  Readln(F,str); s_Edit.Text:=str;
  s_ButtonClick(nil);
  For i:=1 to c_max do PVector[i]:=0;
  For i:=1 to CombElements do
  begin
   Readln(F,str); PVector[i]:=StrToInt(str);
   If i<CombElements then  PVS:=PVS+str+', 'else PVS:=PVS+str;
  end;
  P_Label.Caption:=PVS;
 end;
 CloseFile(F);
end;


 procedure TInp11Form.SaveParam;
 Var F : Text;
     ParamFileName:String;
     sNumElements:String;
     sCombElements:String;
     s:String;
     i:Integer;
     str:String;
 begin
  InfoPanel.Caption:='';
  ParamFileName:=ParamPath+'DATA\P11.txt';
  sNumElements:=IntToStr(NumElements);
  sCombElements:=IntToStr(CombElements);
  s:=IntToStr(SElements);
  AssignFile(F,ParamFileName);
  {$I-} Rewrite(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо записати в '+ParamFileName;
   Exit;
  end;
  Writeln(F,sNumElements);
  Writeln(F,sCombElements);
  Writeln(F,s);
  For i:=1 to CombElements do
  begin
   str:=IntToStr(PVector[i]);
   Writeln(F,str);
  end;
  CloseFile(F);
end;

end.

