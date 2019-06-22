unit GraphForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ToolWin, ComCtrls, ActnList, ImgList, Menus,
  uGraph, FormAbout, Lang, Grids;

const
  pGraph        = 0;
  pTable        = 1;
  pEquation     = 2;
  pSceme        = 3;

type
  TMainGraphForm = class(TForm)
    {ActionListener&Actions}
    ActionListener: TActionList;
      afNew: TAction;
      afOpen: TAction;
      afSave: TAction;
      afSaveAs: TAction;
      afExit: TAction;
      aaMove: TAction;
      aaSetTie: TAction;
      aaDelTie: TAction;
      aaDelTop: TAction;
      aaSetText: TAction;
      aatOper: TAction;
      aatCond: TAction;
      aatBegin: TAction;
      aatEnd: TAction;
      aatTemp: TAction;
      acCheck: TAction;
      ahAbout: TAction;
    mmGraph: TMainMenu;
      mFile: TMenuItem;
        mfNew: TMenuItem;
        mfS1: TMenuItem;
        mfOpen: TMenuItem;
        mfSave: TMenuItem;
        mfSaveAs: TMenuItem;
        mfS2: TMenuItem;
        mfExit: TMenuItem;
      mHelp: TMenuItem;
        mhAbout: TMenuItem;
    {Other}
    ImageList: TImageList;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PageControl: TPageControl;
    tsGraph: TTabSheet;
    Splitter1: TSplitter;
    CoolBar: TCoolBar;
    tbFile: TToolBar;
    tbfNew: TToolButton;
    tbfLoad: TToolButton;
    tbfSave: TToolButton;
    tbActions: TToolBar;
    tbaMove: TToolButton;
    tbaAddTie: TToolButton;
    tbaDelTie: TToolButton;
    tbaDelTop: TToolButton;
    tbaSetText: TToolButton;
    tbAddTop: TToolBar;
    tbatOper: TToolButton;
    tbatCond: TToolButton;
    tbatBegin: TToolButton;
    tbatEnd: TToolButton;
    tbatTemp: TToolButton;
    tbCheck: TToolBar;
    tbcCheckGraph: TToolButton;
    mResult: TMemo;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Memo2: TMemo;
    TabSheet5: TTabSheet;
    ScrollBox1: TScrollBox;
    Image2: TImage;
    Edit1: TEdit;
    StringGrid2: TStringGrid;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Panel2: TPanel;
    StringGrid4: TStringGrid;
    StringGrid3: TStringGrid;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure afNewExecute(Sender: TObject);
    procedure afOpenExecute(Sender: TObject);
    procedure afSaveExecute(Sender: TObject);
    procedure afSaveAsExecute(Sender: TObject);
    procedure aaMoveExecute(Sender: TObject);
    procedure aaSetTieExecute(Sender: TObject);
    procedure aaDelTieExecute(Sender: TObject);
    procedure aaDelTopExecute(Sender: TObject);
    procedure aaSetTextClick(Sender: TObject);
    procedure aatOperExecute(Sender: TObject);
    procedure aatCondExecute(Sender: TObject);
    procedure aatBeginExecute(Sender: TObject);
    procedure aatEndExecute(Sender: TObject);
    procedure aatTempExecute(Sender: TObject);
    procedure acCheckGraphExecute(Sender: TObject);
    procedure ahAboutExecute(Sender: TObject);
//----------------------
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure ScrollBox1DockDrop(Sender: TObject; Source: TDragDockObject;
      X, Y: Integer);
//------------------------------------
  private
    Graph : TGraph;
  public
    procedure ClearArrays;
    procedure AddTop_(X,Y,TopStyle: Integer; InText: string);
    procedure SetTie_(Top1,Top2:integer; TieType: string);
  end;

var
  MainGraphForm: TMainGraphForm;
  addversh:boolean=false;

implementation
uses MainUnit;
{$R *.DFM}

procedure TMainGraphForm.FormCreate(Sender: TObject);
begin
  Application.Title := Title;
  Caption := Title;
  Graph := TGraph.Create(Self);
  Graph.Align := alClient;
  Graph.Top := 40;
  Graph.Left := 5;
  Graph.Height := 300;
  Graph.Width := 300;
  PageControl.Pages[pGraph].InsertControl(Graph);
  aatOperExecute(Self);
  aaMoveExecute(Self);
end;

procedure TMainGraphForm.FormDestroy(Sender: TObject);
begin
  PageControl.Pages[pGraph].RemoveControl(Graph);
  Graph.Free;
end;

procedure TMainGraphForm.afNewExecute(Sender: TObject);
begin
  if Graph.IsModified then
    case Application.MessageBox(GraphIsModifiedNeedSave, Quest,
                               MB_YESNOCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION) of
      IDYES: afSaveAsExecute(Sender);
      IDNO: ;
      IDCANCEL: exit;
    end;
  Graph.Clear;
  Caption := Title;
  SaveDialog.FileName := '';
end;

procedure TMainGraphForm.afOpenExecute(Sender: TObject);
var
  S: string;
begin
  if OpenDialog.Execute then
  begin
    S := OpenDialog.FileName;
    if Graph.IsModified then
      case Application.MessageBox(GraphIsModifiedNeedSave, Quest,
                                   MB_YESNOCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION) of
        IDYES: afSaveAsExecute(Sender);
        IDNO: ;
        IDCANCEL: exit;
      end;
    OpenDialog.FileName := S;
    if Graph.LoadFromFile(OpenDialog.FileName) then
      begin
        SaveDialog.FileName := OpenDialog.FileName;
        Caption := Title + Divider + ExtractFileName(OpenDialog.FileName);
      end;
  end;
end;

procedure TMainGraphForm.afSaveExecute(Sender: TObject);
begin
  if (SaveDialog.FileName='')
  then if SaveDialog.Execute
    then
    begin
      Graph.SaveToFile(SaveDialog.FileName,FirstSave);
      OpenDialog.FileName := SaveDialog.FileName;
      Caption := Title + Divider + ExtractFileName(SaveDialog.FileName);
    end
    else
  else Graph.SaveToFile(SaveDialog.FileName,NotFirstSave);
end;

procedure TMainGraphForm.afSaveAsExecute(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    Graph.SaveToFile(SaveDialog.FileName,FirstSave);
    OpenDialog.FileName := SaveDialog.FileName;
    Caption := Title + Divider + ExtractFileName(SaveDialog.FileName);
  end;
end;

procedure TMainGraphForm.aaMoveExecute(Sender: TObject);
begin
  Graph.ActionType := atMove;
end;

procedure TMainGraphForm.aaSetTieExecute(Sender: TObject);
begin
  Graph.ActionType := atAddTie;
end;

procedure TMainGraphForm.aaDelTieExecute(Sender: TObject);
begin
  Graph.ActionType := atDelTie;
end;

procedure TMainGraphForm.aaDelTopExecute(Sender: TObject);
begin
  Graph.ActionType := atDelTop;
end;

procedure TMainGraphForm.aaSetTextClick(Sender: TObject);
begin
  Graph.ActionType := atSetText;
end;

procedure TMainGraphForm.aatOperExecute(Sender: TObject);
begin
  Graph.atStyle := tsOper;
end;

procedure TMainGraphForm.aatCondExecute(Sender: TObject);
begin
  Graph.atStyle := tsCond;
end;

procedure TMainGraphForm.aatBeginExecute(Sender: TObject);
begin
  Graph.atStyle := tsBegin;
end;

procedure TMainGraphForm.aatEndExecute(Sender: TObject);
begin
  Graph.atStyle := tsEnd;
end;

procedure TMainGraphForm.aatTempExecute(Sender: TObject);
begin
  Graph.atStyle := tsTemp;
end;

procedure TMainGraphForm.acCheckGraphExecute(Sender: TObject);
begin
  Graph.Check;
  mResult.Height:=50;
end;

procedure TMainGraphForm.ahAboutExecute(Sender: TObject);
begin
  AboutForm.ShowModal;
end;
//*********************************
procedure TMainGraphForm.Button1Click(Sender: TObject);
var i,j:integer;
begin
  VershCol:=strtoint(Edit1.text);
  for i:=1 to VershCol do
    for j:=1 to VershCol do
      StringGrid1.Cells[j,i]:='';
  for i:=1 to VershCol do
    for j:=0 to 3 do
      StringGrid2.Cells[j,i]:='';
  StringGrid1.RowCount:=VershCol+1;
  StringGrid1.ColCount:=VershCol+1;
  StringGrid2.RowCount:=VershCol+1;
  for i:=1 to VershCol do begin
    StringGrid1.Cells[0,i]:=inttostr(i);
    StringGrid1.Cells[i,0]:=inttostr(i);
    StringGrid2.Cells[0,i]:=inttostr(i);
  end;
end;

procedure TMainGraphForm.Button2Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to 50 do
    mResult.Lines[i]:='';
  SG_to_matrix;
  Testing_input_data;
end;

procedure TMainGraphForm.Button4Click(Sender: TObject);
begin
  SG_to_matrix;
  Save_alg;
end;

procedure TMainGraphForm.Button3Click(Sender: TObject);
begin
  Open_Alg;
end;

procedure TMainGraphForm.Button5Click(Sender: TObject);
begin
  addversh:=true;
end;

procedure TMainGraphForm.ClearArrays;
var
  i,j:integer;
begin
  VershCol := 0;
  for j:=1 to 40 do
  begin
    for i:=1 to 40 do Perehodi[i,j]:='';
    for i:=0 to 3 do Signali[i,j]:='';
  end;
  mResult.Lines.Clear;
end;

procedure TMainGraphForm.SetTie_(Top1,Top2:integer; TieType: string);
begin
  if (Top1<>-1) and (Top2<>-1) then
    if signali[0,Top1+1]='start' then
      Perehodi[Top2+1,Top1+1]:='start'
    else
    if signali[0,Top1+1]='end' then
      Perehodi[Top2+1,Top1+1]:='end'
    else
    if signali[0,Top1+1]='link' then
      Perehodi[Top2+1,Top1+1]:='link'
    else
    if signali[0,Top1+1]='cond' then
      Perehodi[Top2+1,Top1+1]:=TieType;
    matrix_to_SG;
end;

procedure TMainGraphForm.AddTop_(X,Y,TopStyle: Integer; InText: string);
  begin
    addversh:=false;
    inc(VershCol);
    block_coord[VershCol,1]:=X;
    block_coord[VershCol,2]:=Y;
    if (block_coord[VershCol,1] mod 10)>=5 then
      block_coord[VershCol,1]:=((block_coord[VershCol,1] div 10)+1)*10
    else block_coord[VershCol,1]:=(block_coord[VershCol,1] div 10)*10;
    if (block_coord[VershCol,2] mod 10)>=5 then
      block_coord[VershCol,2]:=((block_coord[VershCol,2] div 10)+1)*10
    else block_coord[VershCol,2]:=(block_coord[VershCol,2] div 10)*10;
    //добавл€ю вершину (ее тип и сигналы)
    case TopStyle of
      0: signali[0,VershCol]:='start';
      1: begin
           signali[0,VershCol]:='end';
           perehodi[1,VershCol]:='end';
         end;
      2: begin
           signali[0,VershCol]:='link';
           signali[1,VershCol]:=InText;
         end;
      3: begin
           signali[0,VershCol]:='cond';
           signali[1,VershCol]:=InText;
         end;
    end;
    //ќбновл€ю SG-ы
    Edit1.text:=inttostr(VershCol);
    matrix_to_SG;
end;

procedure TMainGraphForm.Button9Click(Sender: TObject);
begin
  SG_to_matrix;
end;

procedure TMainGraphForm.Button10Click(Sender: TObject);
begin
  stringgrid3.rowcount:=5;
  stringgrid3.colcount:=5;
  stringgrid4.rowcount:=2;
  stringgrid4.colcount:=5;
  Razmetka;
  //разметка состо€ний в —√
  functions;
  Draw_shema;
end;

procedure TMainGraphForm.ScrollBox1DockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  Draw_shema;
end;
//**********************************
end.
