unit Unit10;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;
const m_max=40;


type

  { TInp10Form }

  TInp10Form = class(TForm)
    a_Button: TButton;
    ClearButton: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LenLabel: TLabel;
    aListBox: TListBox;
    BinListBox: TListBox;
    Memo1: TMemo;
    StartListBox: TListBox;
    NamesListBox: TListBox;
    NVarLabel: TLabel;
    LoadParamButton: TButton;
    SaveParamButton: TButton;
    s_Button: TButton;
    m_Edit: TEdit;
    ExitButton: TButton;
    InfoPanel: TPanel;
    Label1: TLabel;
    ComLenLabel: TLabel;
    Label4: TLabel;
    NZK_Label: TLabel;
    procedure a_ButtonClick(Sender: TObject);
    procedure BinListBoxClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComLenLabelClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure LoadParamButtonClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure NamesListBoxClick(Sender: TObject);
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
  Inp10Form: TInp10Form;
  m:Integer;
  aVector:TVArr;
  StartVector:TVArr;
  BinVector:TVArr;
implementation
Uses Unit5;
var ParamPath:String;
{$R *.lfm}

{ TInp10Form }

function TInp10Form.factorial (n:integer):integer;
var i:Integer;
begin
 if n =1 then factorial:=1 else factorial:=n*factorial(n-1);
end;

procedure TInp10Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp10Form.a_ButtonClick(Sender: TObject);
var ind,i,k:Integer;

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
 aListBox.Clear;
 binListBox.Clear;
 Randomize;
 For i:=1 to m_max do begin aVector[i]:=''; binVector[i]:=''; end;
 i:=1;
 While i<=NumElements do
 begin
  Ind:=Random(NumElements)+1;
  If not CheckDbl(Ind) then
  begin
   aVector[i]:=StartVector[Ind];
   aListBox.Items.Add(StartVector[Ind]);
   binListBox.Items.Add('1');
   binVector[i]:='1';
   Inc(i);
  end;
 end;
end;

procedure TInp10Form.BinListBoxClick(Sender: TObject);
Var Elem:String;
begin
 Elem:=binListBox.Items.Strings[binListBox.ItemIndex];
 If Elem='1' then
 begin
  binListBox.Items.Strings[binListBox.ItemIndex]:='0';
  binVector[binListBox.ItemIndex+1]:='0';
 end else
 begin
  binListBox.Items.Strings[binListBox.ItemIndex]:='1';
  binVector[binListBox.ItemIndex+1]:='1';
 end;

end;

procedure TInp10Form.ClearButtonClick(Sender: TObject);
var i:Integer;
begin
 StartListBox.Clear;
 aListBox.Clear;
 BinListBox.Clear;
 For i:=1 to NumElements do
 begin
  aVector[i]:='';
  StartVector[i]:='';
  binVector[i]:='';
 end;
 NumElements:=0;
 LenLabel.Caption:='';
end;






procedure TInp10Form.FormActivate(Sender: TObject);
Var    i:Integer;
begin
 NVarLabel.Caption:=VariantArr[NumVariant];
 NZK_Label.Caption:='NZK='+IntToStr(NZK);
 m_Edit.Text:='1';
 m:=0;
 For i:=1 to m_max do aVector[i]:='';
end;

procedure TInp10Form.FormCreate(Sender: TObject);
begin
  ParamPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp10Form.ComLenLabelClick(Sender: TObject);
begin

end;

procedure TInp10Form.Label5Click(Sender: TObject);
begin

end;

procedure TInp10Form.LoadParamButtonClick(Sender: TObject);
begin
 LoadParam;
end;

procedure TInp10Form.Memo1Change(Sender: TObject);
begin

end;

procedure TInp10Form.NamesListBoxClick(Sender: TObject);
var NewElem:String;
function CheckDbl(Elem:String):Boolean;
var i:Integer;
begin
 Result:=false;
 For i:=0 to StartListBox.Items.Count-1 do
 If StartListBox.Items.Strings[i]=Elem then
 begin
  Result:=true;
  InfoPanel.Caption:='Елемент "'+Elem+'" вже є в списку';
  Break;
 end;
end;
begin
 If StartListBox.Items.Count<=m_max-1 then
 begin
  NewElem:=NamesListBox.Items.Strings[NamesListBox.ItemIndex];
  If Not CheckDbl(NewElem) then
  begin
   InfoPanel.Caption:='Вибрано ім''я '+NewElem;
   StartListBox.Items.Add(NewElem);
   LenLabel.Caption:=IntToStr(StartListBox.Items.Count);
   NumElements:=StartListBox.Items.Count;
   StartVector[NumElements]:=NewElem;
  end;
 end else InfoPanel.Caption:='Достигнут предел заполнения стартового списка';
end;

procedure TInp10Form.SaveParamButtonClick(Sender: TObject);
begin
  SaveParam;
end;




procedure TInp10Form.s_ButtonClick(Sender: TObject);
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


 procedure TInp10Form.LoadParam;
Var F : Text;
    ParamFileName:String;
    str:String;
    vrNE:Integer;
    i:Integer;
    PVS:String;
begin
ParamFileName:=ParamPath+'DATA\P9.txt';
 If FileExists(ParamFileName) then
 begin
  InfoPanel.Caption:='';
  aListBox.Clear;
  StartListBox.Clear;
  BinListBox.Clear;
  AssignFile(F,ParamFileName);
  {$I-} Reset(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо прочитати з '+ParamFileName;
   Exit;
  end;
  Readln(F,str); m_Edit.Text:=str; m := StrToInt(str);
  Readln(F,str);
  NumElements:=StrToInt(str);
  LenLabel.Caption:=str;
  For i:=1 to m_max do aVector[i]:='';
  For i:=1 to NumElements do
  begin
   Readln(F,str);
   aVector[i]:=str;
   aListBox.Items.Add(str);
   StartListBox.Items.Add(str);
   Readln(F,str);
   BinListBox.Items.Add(str);
   binVector[i]:=str;
  end;
  CloseFile(F);
 end;
end;


 procedure TInp10Form.SaveParam;
 Var F : Text;
     ParamFileName:String;
     sNumElements:String;
     i:Integer;
     str:String;
 begin
  InfoPanel.Caption:='';
  ParamFileName:=ParamPath+'DATA\P9.txt';
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
   str:=BinVector[i];
   Writeln(F,str);
  end;
  CloseFile(F);
end;

end.

