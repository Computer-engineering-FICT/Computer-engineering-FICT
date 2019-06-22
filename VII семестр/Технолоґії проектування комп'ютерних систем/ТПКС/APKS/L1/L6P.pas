unit L6P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,L6U,ExtCtrls, ComCtrls, StdCtrls, Buttons,StrUtils, Menus,
  ToolWin,UAbout,UDIDQ,UMarking,UCycles,UGraph;

type
  TMainForm = class(TForm)
    OpenDialog: TOpenDialog;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    SaveAs1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    BDelete: TSpeedButton;
    BR: TSpeedButton;
    BT: TSpeedButton;
    BP: TSpeedButton;
    BLine: TSpeedButton;
    BArrow: TSpeedButton;
    SaveDialog: TSaveDialog;
    Tools1: TMenuItem;
    MMatrix: TMenuItem;
    MMarking: TMenuItem;
    MCycle: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BArrowClick(Sender: TObject);
    procedure BRClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure BLineClick(Sender: TObject);
    procedure BPClick(Sender: TObject);
    procedure BTClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure MMatrixClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MCycleClick(Sender: TObject);
    procedure MMarkingClick(Sender: TObject);
  private
    { Private declarations }
  public
    Surface:TSurface;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  SS:Ansistring;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Surface:=TSurface.Create(self);
  Surface.Left:=40;
  Surface.Top:=10;
end;

procedure TMainForm.BArrowClick(Sender: TObject);
begin
  Surface.SetTool(TTArrow.Create(Surface));
end;

procedure TMainForm.BRClick(Sender: TObject);
begin
  Surface.SetTool(TTIfBuilder.Create(TR.Create(Surface),Surface));
end;

procedure TMainForm.BDeleteClick(Sender: TObject);
begin
 Surface.SetTool(TTDelete.Create(Surface));
end;

procedure TMainForm.BLineClick(Sender: TObject);
begin
  Surface.SetTool(TTLineBuilder.Create(Surface));
end;

procedure TMainForm.BPClick(Sender: TObject);
begin
  Surface.SetTool(TTNodeBuilder.Create(TBegin.Create(Surface),Surface));
end;

procedure TMainForm.BTClick(Sender: TObject);
begin
  Surface.SetTool(TTNodeBuilder.Create(TT.Create(Surface),Surface));
end;

procedure TMainForm.New1Click(Sender: TObject);
begin
  Surface.MyBox.Clear(Surface);
end;

procedure TMainForm.Open1Click(Sender: TObject);
Var
  F:file;
  A:ansistring;
  s:char;
begin
  if(OpenDialog.Execute)then begin
    try
      A:='';
      AssignFile(F, OpenDialog.Filename);
      Reset(F,1);
      while not Eof(F) do begin
        BlockRead(F,s,1);
        A:=A+s;
      end;
      CloseFile(F);
      Surface.MyBox.Builder(A,Surface);
    except
      ShowMessage('File '+OpenDialog.FileName+' Error!');
      Surface.MyBox.Clear(Surface);
    end;
  end;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.SaveAs1Click(Sender: TObject);
Var
  F:file;
  A:ansistring;
  i:word;
begin
  A:=Surface.MyBox.getData(Surface.MyBox);
  if(SaveDialog.Execute)then begin
    try
      AssignFile(F,SaveDialog.FileName);
      Rewrite(F,1);
      i:=1;
      while i<=Length(A) do begin
        BlockWrite(F,A[i],1);
        i:=i+1;
      end;
      CloseFile(F);
    except
      ShowMessage('File '+SaveDialog.FileName+' Error!');
    end;
  end;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  UAbout.DAbout.Visible:=true;
end;

procedure TMainForm.MMatrixClick(Sender: TObject);
begin
  UMarking.DMarking.MS:=Surface;
  UMarking.DMarking.Visible:=true;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Surface.Destroy;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
 Surface.SetTool(TTNodeBuilder.Create(TEnd.Create(Surface),Surface));
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  Surface.Check;
end;

procedure TMainForm.MCycleClick(Sender: TObject);
begin
  UCycles.CycleDialog.MS:=Surface;
  UCycles.CycleDialog.Visible:=true;
end;

procedure TMainForm.MMarkingClick(Sender: TObject);
begin
  UGraph.DGraph.MS:=Surface;
  UGraph.DGraph.Visible:=true;
end;

end.
