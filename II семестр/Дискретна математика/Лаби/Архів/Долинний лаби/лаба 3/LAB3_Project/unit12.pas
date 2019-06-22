unit Unit12;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;
const m_max=40;


type

  { TInp12Form }

  TInp12Form = class(TForm)
    ClearButton: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cLabel: TLabel;
    LenLabel: TLabel;
    aListBox: TListBox;
    vListBox: TListBox;
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
    procedure vListBoxClick(Sender: TObject);
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
    procedure LoadParam;
    procedure SaveParam;


  public
    { public declarations }
  end;
Type
TVArr=array [1..m_max] of String;
var
  Inp12Form: TInp12Form;
  aVector:TVArr;
  StartVector:TVArr;
  vVector:TVArr;
implementation
Uses Unit5;
var ParamPath:String;
{$R *.lfm}

{ TInp12Form }


procedure TInp12Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;



procedure TInp12Form.vListBoxClick(Sender: TObject);
Var ind:Integer;
    i:Integer;
begin
 If CombElements>0 then
 begin
  Ind:=vListBox.ItemIndex;
  vListBox.Items.Delete(ind);
  aListBox.Items.Delete(ind);
  cLabel.Caption:=IntToStr(vListBox.Items.Count);
  For i:=Ind+1 to CombElements-1 do
  begin
   aVector[i]:=aVector[i+1];
   vVector[i]:=vVector[i+1];
  end;
  aVector[CombElements]:='';
  vVector[CombElements]:='';
  CombElements:=CombElements-1;
 end;

end;

procedure TInp12Form.ClearButtonClick(Sender: TObject);
var i:Integer;
begin
 StartListBox.Clear;
 aListBox.Clear;
 vListBox.Clear;
 For i:=1 to NumElements do
 begin
  aVector[i]:='';
  StartVector[i]:='';
  vVector[i]:='';
 end;
 NumElements:=0;
 CombElements:=0;
 LenLabel.Caption:='';
 cLabel.Caption:='';
end;






procedure TInp12Form.FormActivate(Sender: TObject);
Var    i:Integer;
begin
 NVarLabel.Caption:=VariantArr[NumVariant];
 NZK_Label.Caption:='NZK='+IntToStr(NZK);
 m_Edit.Text:='0';
 SElements:=0;
end;

procedure TInp12Form.FormCreate(Sender: TObject);
begin
  ParamPath:=ExtractFilePath(Application.ExeName);
end;

procedure TInp12Form.ComLenLabelClick(Sender: TObject);
begin

end;

procedure TInp12Form.Label5Click(Sender: TObject);
begin

end;

procedure TInp12Form.LoadParamButtonClick(Sender: TObject);
begin
 LoadParam;
end;

procedure TInp12Form.Memo1Change(Sender: TObject);
begin

end;

procedure TInp12Form.NamesListBoxClick(Sender: TObject);
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
   aListBox.Items.Add(NewElem);
   If StartListBox.Items.Count<10 then
   vListBox.Items.Add('0'+IntToStr(StartListBox.Items.Count)) else
   vListBox.Items.Add(IntToStr(StartListBox.Items.Count));
     LenLabel.Caption:=IntToStr(StartListBox.Items.Count);
   cLabel.Caption:=IntToStr(StartListBox.Items.Count);
   NumElements:=StartListBox.Items.Count;
   CombElements:=aListBox.Items.Count;
   StartVector[NumElements]:=NewElem;
   aVector[NumElements]:=NewElem;
   vVector[NumElements]:=IntToStr(StartListBox.Items.Count);
  end;
 end else InfoPanel.Caption:='Достигнут предел заполнения стартового списка';
end;

procedure TInp12Form.SaveParamButtonClick(Sender: TObject);
begin
  SaveParam;
end;




procedure TInp12Form.s_ButtonClick(Sender: TObject);
begin
 InfoPanel.Caption:='';
 If m_Edit.Text>'' then
 begin
  InfoPanel.Caption:='';
  try
   SElements := StrToInt(m_Edit.Text);
 except
   on EConvertError do
   begin
    InfoPanel.Caption:='Помилка вводу числа.';
    m_Edit.Text:='';
    InfoPanel.Caption:='Наберіть кількість сполучень і натисніть "ВВІД"';
    abort;
   end;
  end;
 If (SElements>0) then InfoPanel.Caption:='Вибрано '+m_Edit.Text+' сполучнь'
 else begin
       InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
       m_Edit.Text:='';
       SElements:=0
      end;
 end else InfoPanel.Caption:='Наберіть кількість перестанвок і натисніть "ВВІД"';
end;


 procedure TInp12Form.LoadParam;
Var F : Text;
    ParamFileName:String;
    str:String;
    vrNE:Integer;
    i:Integer;
    PVS:String;
begin
ParamFileName:=ParamPath+'DATA\P12.txt';
 If FileExists(ParamFileName) then
 begin
  InfoPanel.Caption:='';
  aListBox.Clear;
  StartListBox.Clear;
  vListBox.Clear;
  AssignFile(F,ParamFileName);
  {$I-} Reset(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо прочитати з '+ParamFileName;
   Exit;
  end;
  Readln(F,str); NumElements:=StrToInt(str);LenLabel.Caption:=str;
  Readln(F,str); CombElements:=StrToInt(str);cLabel.Caption:=str;
  Readln(F,str); SElements:=StrToInt(str); m_Edit.Text:=str;
  For i:=1 to m_max do
  begin StartVector[i]:=''; aVector[i]:=''; vVector[i]:=''; end;
  For i:=1 to NumElements do
  begin Readln(F,str); StartListBox.Items.Add(str); end;
  For i:=1 to CombElements do
  begin
    Readln(F,str); aVector[i]:=str; aListBox.Items.Add(str);
    Readln(F,str); vVector[i]:=str;
    If StrToInt(str)<10 then vListBox.Items.Add('0'+str) else vListBox.Items.Add(str);
  end;
  CloseFile(F);
 end;
end;


 procedure TInp12Form.SaveParam;
 Var F : Text;
     ParamFileName:String;
     sNumElements:String;
     sCombElements:String;
     i:Integer;
     str:String;
     sLocal:String;
 begin
  InfoPanel.Caption:='';
  ParamFileName:=ParamPath+'DATA\P12.txt';
  sNumElements:=IntToStr(NumElements);
  sCombElements:=IntToStr(CombElements);
  sLocal:=IntToStr(SElements);
  AssignFile(F,ParamFileName);
  {$I-} Rewrite(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо записати в '+ParamFileName;
   Exit;
  end;
  Writeln(F,sNumElements);
  Writeln(F,sCombElements);
  Writeln(F,sLocal);
  For i:=1 to NumElements do
  begin
   str:=StartVector[i];
   Writeln(F,str);
  end;
  For i:=1 to CombElements do
  begin
   str:=aVector[i];
   Writeln(F,str);
   str:=vVector[i];
   Writeln(F,str);
  end;
  CloseFile(F);
end;

end.

