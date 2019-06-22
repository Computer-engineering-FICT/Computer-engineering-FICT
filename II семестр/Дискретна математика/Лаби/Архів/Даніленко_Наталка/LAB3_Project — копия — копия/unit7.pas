unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Calendar, EditBtn;
const m_max=40;


type

  { TInp7Form }

  TInp7Form = class(TForm)
    InpDateEdit: TDateEdit;
    InDatButton: TButton;
    b_Label: TLabel;
    Label2: TLabel;
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
    procedure ExitButtonClick(Sender: TObject);
    procedure InDatButtonClick(Sender: TObject);
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
  Inp7Form: TInp7Form;
  m:Integer;
  aVector:TVArr;
  InpDate:TDateTime;
  intDate:LongInt;
  sDate:String;

implementation
Uses Unit5;
var ParamPath:String;
{$R *.lfm}

{ TInp7Form }

function TInp7Form.factorial (n:integer):integer;
var i:Integer;
begin
 if n =1 then factorial:=1 else factorial:=n*factorial(n-1);
end;

procedure TInp7Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp7Form.InDatButtonClick(Sender: TObject);
var sInpDate:String;
    i,p:Integer;
    Pr:String;

function DecToBin(Dec:LongInt):String;
var bdig: Char;
    Rbin:String;
    VArr:TVArr;
    k:Integer;
 begin
 For k:=1 to m_max do VArr[k]:='';
 Rbin:='';
 if Dec=0 then Rbin:='0';
 While Dec >= 1 do
 begin
  bdig:=Char(Dec mod 2 + 48);
  Rbin:=bdig+Rbin;
  If p<=m_max then begin inc(p); VArr[p]:=bdig; end;
  Dec:=Dec div 2;
 end;
 Result:=Rbin;
 For k:=1 to p do aVector[k]:=VArr[p-k+1];
end;

begin
 Start1_Label.Caption:='';
 Start2_Label.Caption:='';
 sDate:=InpDateEdit.Text;
 IntDate:=StrToInt(StringReplace(sDate, '.','',[rfReplaceAll, rfIgnoreCase]));
 p:=0;
 b_Label.Caption:=DecToBin(IntDate);
 NumElements:=p;
 LenLabel.Caption:=IntToStr(NumElements);
 For i:=1 to NumElements do
 begin
  Start1_Label.Caption:=Start1_Label.Caption+'0';
  Start2_Label.Caption:=Start2_Label.Caption+'1';
 end;
end;





procedure TInp7Form.FormActivate(Sender: TObject);
Var    i:Integer;
begin
 NVarLabel.Caption:=VariantArr[NumVariant];
 NZK_Label.Caption:='NZK='+IntToStr(NZK);
 m_Edit.Text:='1';
 m:=0;
 For i:=1 to m_max do aVector[i]:='';
end;

procedure TInp7Form.FormCreate(Sender: TObject);
begin
  ParamPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp7Form.ComLenLabelClick(Sender: TObject);
begin

end;

procedure TInp7Form.LoadParamButtonClick(Sender: TObject);
begin
 LoadParam;
end;

procedure TInp7Form.SaveParamButtonClick(Sender: TObject);
begin
  SaveParam;
end;


procedure TInp7Form.s_ButtonClick(Sender: TObject);
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


procedure TInp7Form.LoadParam;
Var F : Text;
    ParamFileName:String;
    str:String;
    vrNE:Integer;
    i:Integer;
    PVS:String;
begin
 ParamFileName:=ParamPath+'DATA\P7.txt';
 If FileExists(ParamFileName) then
 begin
  InfoPanel.Caption:='';
  AssignFile(F,ParamFileName);
  {$I-} Reset(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо прочитати з '+ParamFileName;
   Exit;
  end;
  Readln(F,str); InpDateEdit.Text:=str;
  Readln(F,str); m_Edit.Text:=str;
  InDatButtonClick(nil);
  CloseFile(F);
 end;
end;


 procedure TInp7Form.SaveParam;
 Var F : Text;
     ParamFileName:String;
     sNumElements:String;
     i:Integer;
     str:String;
 begin
  InfoPanel.Caption:='';
  ParamFileName:=ParamPath+'DATA\P7.txt';
  AssignFile(F,ParamFileName);
  {$I-} Rewrite(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо записати в '+ParamFileName;
   Exit;
  end;
  Writeln(F, InpDateEdit.Text);
  Writeln(F, m_Edit.Text);
  CloseFile(F);
end;

end.

