unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls,utils, Menus, Grids, StdCtrls, ExtCtrls;

type
  TSCroll=class(TScrollBox)
  	procedure WndProc(var Message: TMessage); override;
  end;

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
	New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
	Saveas1: TMenuItem;
	N2: TMenuItem;
    Exit1: TMenuItem;
    page: TPageControl;
	tab1: TTabSheet;
	TabSheet2: TTabSheet;
	TabSheet3: TTabSheet;
	Status: TMemo;
    Spliter: TSplitter;
    Open: TOpenDialog;
	Save: TSaveDialog;
    Panel1: TPanel;
	Input: TMemo;
	Clear: TButton;
    Model: TRadioGroup;
    Trigger: TRadioGroup;
    Accept: TButton;
    Table: TStringGrid;
    Mode: TButton;
    Node0: TButton;
    Node1: TButton;
    Node2: TButton;
    Node3: TButton;
    Run: TButton;
    Full: TCheckBox;
    Func: TMemo;
    TabSheet4: TTabSheet;
    ScrollBox1: TScrollBox;
    graph: TPaintBox;
    procedure Panel1Resize(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure TabSheet2Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Node0Click(Sender: TObject);
    procedure Node1Click(Sender: TObject);
    procedure Node2Click(Sender: TObject);
    procedure Node3Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ScrollResize(Sender: TObject);
    procedure ModeClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RunClick(Sender: TObject);
    procedure AcceptClick(Sender: TObject);
    procedure graphPaint(Sender: TObject);
  private
  public
	{ Public declarations }
  end;
var
	Form1: TForm1;
    Scroll:TScroll;
//var
	N:integer;
	mas:TMas;//array of array of integer;
	t:TVec;//array of integer;
    s:TStr;

implementation
uses Unit2,part1,part2,graph;
var
	FName:string;
    Grp:TGraph;
    Check:TCheck;
    tbl:TTable;
    //flags
    CheckCreated:boolean=false;
    TableCreated:boolean=false;
    Paintf:boolean=false;

{$R *.DFM}

procedure TScroll.WndProc(var Message: TMessage);
begin
	if Message.Msg=WM_PAINT then
    	grp.OnPaint(form1);
    inherited;
end;

procedure TForm1.Panel1Resize(Sender: TObject);
begin
	input.Height:=panel1.Height;
	input.Width:=panel1.Width-100;
	scroll.Height:=panel1.Height;
	scroll.Width:=panel1.Width-100;
	Run.Left:=panel1.Width-80;
	Clear.Left:=panel1.Width-80;
	mode.Left:=panel1.Width-80;
	Node0.Left:=panel1.Width-80;
	Node1.Left:=panel1.Width-80;
	Node2.Left:=panel1.Width-80;
	Node3.Left:=panel1.Width-80;
    graph.Refresh
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
	form1.Close
end;

procedure TForm1.New1Click(Sender: TObject);
begin
	grp.ClearGraph();
    FName:=''
end;

procedure TForm1.ClearClick(Sender: TObject);
begin
	status.Clear
end;

procedure TForm1.TabSheet2Resize(Sender: TObject);
begin
	Table.Width:=tabsheet2.Width-100;
	Table.Height:=tabsheet2.Height-3;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
	Scroll:=TScroll.Create(form1);
	Scroll.Parent:=form1.tab1;
    scroll.Color:=clWhite;
	Grp:=TGraph.create(scroll);
	tabsheet2.TabVisible:=false;
	tabsheet3.TabVisible:=false;
	tabsheet4.TabVisible:=false;
	ToGraph()
end;

procedure TForm1.Node0Click(Sender: TObject);
begin
	grp.AddNode(5,5,0,'')
end;

procedure TForm1.Node1Click(Sender: TObject);
begin
	grp.AddNode(5,5,1,'')
end;

procedure TForm1.Node2Click(Sender: TObject);
begin
	grp.AddNode(5,5,2,'Y'+inttostr(grp.NodeCount))
end;

procedure TForm1.Node3Click(Sender: TObject);
begin
	grp.AddNode(5,5,3,'X'+inttostr(grp.NodeCount))
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
	grp.OnPaint(sender)
end;

procedure TForm1.ScrollResize(Sender: TObject);
begin
	grp.OnPaint(sender)
end;

procedure TForm1.ModeClick(Sender: TObject);
begin
	if form1.Mode.Caption='View Source'then	ToText()
	else ToGraph();
    grp.ExportToFile('temp');
    form1.Input.Lines.LoadFromFile('temp');
    DeleteFile('temp')
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
	if open.Execute then
    begin
    	grp.Load(open.filename);
        FName:=open.FileName
    end
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
	if FName<>'' then grp.Save(FName)
    else form1.Saveas1.Click
end;

procedure TForm1.Saveas1Click(Sender: TObject);
begin
	if save.Execute then
    begin
    	grp.Save(save.filename);
        FName:=save.FileName
    end
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
    i:=MessageDlg('Save Changes to file: '+FName,
    			mtConfirmation,[mbYes,mbNo,mbCancel],0);
    if i=mrCancel then Action:=caNone;
	if i=mrYes then form1.Save1.Click
end;

procedure TForm1.RunClick(Sender: TObject);
begin
	grp.ExportToFile('temp');
	LoadMas('temp');
    deletefile('temp');
    if CheckCreated then Check.Change(t,mas)
    else Check:=TCheck.Create(t,mas,status);
    CheckCreated:=true;
    if Check.Check()=0 then
    	begin
    		form1.TabSheet2.tabVisible:=true;
        end
    else
    	begin
    		form1.TabSheet2.tabVisible:=false;
			tabsheet3.TabVisible:=false;
			tabsheet4.TabVisible:=false;
        end
end;

procedure TForm1.AcceptClick(Sender: TObject);
begin
    if TableCreated then tbl.Change(t,mas,s)
    else tbl:=TTable.Create(t,mas,s,table,func,graph);
    TableCreated:=true;
	tbl.Run(model.ItemIndex,trigger.ItemIndex,full.Checked);
    paintf:=true;
	tabsheet3.TabVisible:=true;
	tabsheet4.TabVisible:=true;
end;

procedure TForm1.graphPaint(Sender: TObject);
begin
	if paintf then tbl.OnPaint()
end;

end.
