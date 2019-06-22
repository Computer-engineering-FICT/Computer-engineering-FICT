unit SetupUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, ExtCtrls;

type

  TSetupForm = class(TForm)
    Label1: TLabel;
    MinPV: TSpinEdit;
    MaxPV: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MinCV: TSpinEdit;
    MaxCV: TSpinEdit;
    Label5: TLabel;
    PW: TSpinEdit;
    Label6: TLabel;
    PH: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    TaskFonColor: TPanel;
    LinkFonColor: TPanel;
    TaskTextColor: TPanel;
    LinkTextColor: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ColorD: TColorDialog;
    Label8: TLabel;
    GH: TSpinEdit;
    Label9: TLabel;
    GW: TSpinEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetupForm: TSetupForm;

implementation

uses GraphWin;

{$R *.DFM}

















procedure TSetupForm.SpeedButton1Click(Sender: TObject);
begin
  ColorD.Color:=TaskFonColor.Color;
  if ColorD.Execute then TaskFonColor.Color:=ColorD.Color;
end;


procedure TSetupForm.SpeedButton2Click(Sender: TObject);
begin
  ColorD.Color:=LinkFonColor.Color;
  if ColorD.Execute then LinkFonColor.Color:=ColorD.Color;
end;

procedure TSetupForm.SpeedButton3Click(Sender: TObject);
begin
  ColorD.Color:=TaskTextColor.Color;
  if ColorD.Execute then TaskTextColor.Color:=ColorD.Color;
end;

procedure TSetupForm.SpeedButton4Click(Sender: TObject);
begin
  ColorD.Color:=LinkTextColor.Color;
  if ColorD.Execute then LinkTextColor.Color:=ColorD.Color;
end;




procedure TSetupForm.Button2Click(Sender: TObject);
begin
  Close
end;

procedure TSetupForm.FormShow(Sender: TObject);
begin
  MinPV.Value:=MainForm.Setup.MinPointValue;
  MaxPV.Value:=MainForm.Setup.MaxPointValue;
  MinCV.Value:=MainForm.Setup.MinConValue;
  MaxCV.Value:=MainForm.Setup.MaxConValue;
  PW.Value:=MainForm.Setup.PoleWidth;
  PH.Value:=MainForm.Setup.PoleHeight;
  GW.Value:=MainForm.Setup.GridWidth;
  GH.Value:=MainForm.Setup.GridHeight;
  TaskFonColor.Color:=MainForm.Setup.TaskBackColor;
  TaskTextColor.Color:=MainForm.Setup.TaskTextColor;
  LinkFonColor.Color:=MainForm.Setup.LinkBackColor;
  LinkTextColor.Color:=MainForm.Setup.LinkTextColor
end;

procedure TSetupForm.Button1Click(Sender: TObject);
begin
  MainForm.Setup.MinPointValue:=MinPV.Value;
  MainForm.Setup.MaxPointValue:=MaxPV.Value;
  MainForm.Setup.MinConValue:=MinCV.Value;
  MainForm.Setup.MaxConValue:=MaxCV.Value;
  MainForm.Setup.PoleWidth:=PW.Value;
  MainForm.Setup.PoleHeight:=PH.Value;
  MainForm.Setup.GridWidth:=GW.Value;
  MainForm.Setup.GridHeight:=GH.Value;
  MainForm.Setup.TaskBackColor:=TaskFonColor.Color;
  MainForm.Setup.TaskTextColor:=TaskTextColor.Color;
  MainForm.Setup.LinkBackColor:=LinkFonColor.Color;
  MainForm.Setup.LinkTextColor:=LinkTextColor.Color;
  MainForm.ApplySetup;
  Close
end;

end.
