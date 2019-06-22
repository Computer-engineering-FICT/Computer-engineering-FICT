unit Unit14;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TInp14Form }

  TInp14Form = class(TForm)
    ExitButton: TButton;
    InfoPanel: TPanel;
    Label1: TLabel;
    LoadParamButton1: TButton;
    NVarLabel: TLabel;
    NZK_Label: TLabel;
    SaveParamButton: TButton;
    s_Button: TButton;
    s_Edit: TEdit;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LoadParamButton1Click(Sender: TObject);
    procedure SaveParamButtonClick(Sender: TObject);
  private
    { private declarations }
    procedure LoadParam;
    procedure SaveParam;
  public
    { public declarations }
  end;

var
  Inp14Form: TInp14Form;

implementation
Uses Unit5;

var ParamPath:String;

{$R *.lfm}

{ TInp14Form }

procedure TInp14Form.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInp14Form.FormActivate(Sender: TObject);
var SPer1,SPer2:String;
    i:Integer;
begin
 NVarLabel.Caption:=VariantArr[NumVariant];
 NZK_Label.Caption:='NZK='+IntToStr(NZK);
end;
procedure TInp14Form.LoadParamButton1Click(Sender: TObject);
begin
 LoadParam;
end;

procedure TInp14Form.SaveParamButtonClick(Sender: TObject);
begin
 SaveParam;
end;

 procedure TInp14Form.LoadParam;
Var F : Text;
    ParamFileName:String;
    str:String;

    begin
ParamFileName:=ParamPath+'DATA\P14.txt';
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
  Readln(F,str); s_Edit.Text:=str; MainNumber := StrToInt(str);
 end;
 CloseFile(F);
end;


 procedure TInp14Form.SaveParam;
 Var F : Text;
     ParamFileName:String;
     sMainNumber:String;
     str:String;
 begin
  InfoPanel.Caption:='';
  ParamFileName:=ParamPath+'DATA\P14.txt';
  sMainNumber:=IntToStr(MainNumber);
  AssignFile(F,ParamFileName);
  {$I-} Rewrite(F); {$I+}
  if IOResult <> 0 then
  begin
   InfoPanel.Caption:='Неможливо записати в '+ParamFileName;
   Exit;
  end;
  Writeln(F,s_Edit.Text);
  Writeln(F,sMainNumber);
  CloseFile(F);
end;

end.

