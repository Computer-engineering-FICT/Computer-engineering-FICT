unit GraphWin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ExtCtrls, ComCtrls, Buttons, Menus,Grids, Tabs, MainGraphUnit,
  Spin;

type
  TEnviroment = record
    //-->>
    MinPointValue : integer;
    MaxPointValue : integer;
    MinConValue : integer;
    MaxConValue : integer;
    //-->>
    PoleWidth : integer;
    PoleHeight : integer;
    //-->>
    TaskBackColor:TColor;
    TaskTextColor:Tcolor;
    LinkBackColor:TColor;
    LinkTextColor:TColor;
    //-->>
    GridWidth : integer;
    GridHeight : integer;
  end;


  TWorkMode = (wmArrow,wmAddPoint,wmAddConnection);

  TMainForm = class(TForm)
    SD: TSaveDialog;
    OD: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SaveAs: TMenuItem;
    N6: TMenuItem;
    N2: TMenuItem;
    Arrow_MI: TMenuItem;
    Point_MI: TMenuItem;
    Connection_MI: TMenuItem;
    Actions1: TMenuItem;
    DelMenu: TMenuItem;
    N7: TMenuItem;
    Panel1: TPanel;
    PC: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox: TScrollBox;
    Panel2: TPanel;
    NewBut: TSpeedButton;
    OpenBut: TSpeedButton;
    SaveBut: TSpeedButton;
    ArrowBut: TSpeedButton;
    PointBut: TSpeedButton;
    ConnectionBut: TSpeedButton;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    ColorD: TColorDialog;
    SetupPanel: TPanel;
    TaskFonColor: TPanel;
    Label3: TLabel;
    LFC_Label: TLabel;
    TFC_Label: TLabel;
    LinkFonColor: TPanel;
    TTC_Label: TLabel;
    LTC_Label: TLabel;
    TaskTextColor: TPanel;
    LinkTextColor: TPanel;
    Label8: TLabel;
    RowHeightEdit: TSpinEdit;
    Label9: TLabel;
    ColWidthEdit: TSpinEdit;
    ExitItem: TMenuItem;
    N5: TMenuItem;
    MainSG: TStringGrid;
    GenBut: TSpeedButton;
    N8: TMenuItem;
    N9: TMenuItem;
    DecProcNum: TSpeedButton;
    Label2: TLabel;
    Label4: TLabel;
    IncProcNum: TSpeedButton;
    Status: TStatusBar;
    pole: TPaintBox;
    GroupBox1: TGroupBox;
    OptOneStep: TSpeedButton;
    OptAuto: TSpeedButton;
    procedure FormDestroy(Sender: TObject);
    procedure poleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure poleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure poleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure NewButClick(Sender: TObject);
    procedure poleDblClick(Sender: TObject);
    procedure OpenButClick(Sender: TObject);
    procedure PointButClick(Sender: TObject);
    procedure ConnectionButClick(Sender: TObject);
    procedure ArrowButClick(Sender: TObject);
    procedure polePaint(Sender: TObject);
    procedure DelMenuClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure SaveButClick(Sender: TObject);
    procedure PCChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MainSGDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FaceButClick(Sender: TObject);
    procedure RowHeightEditChange(Sender: TObject);
    procedure ColWidthEditChange(Sender: TObject);
    procedure SetupPanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TFC_LabelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TFC_LabelClick(Sender: TObject);
    procedure LFC_LabelClick(Sender: TObject);
    procedure TTC_LabelClick(Sender: TObject);
    procedure LTC_LabelClick(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure MainSGSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure MainSGMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DecProcNumClick(Sender: TObject);
    procedure IncProcNumClick(Sender: TObject);
    procedure GenButClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure ZoomOnButClick(Sender: TObject);
    procedure ZoomOffButClick(Sender: TObject);
    procedure OptOneStepClick(Sender: TObject);
    procedure OptAutoClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    fname : string;
    StartDir:string;
    GridDelta : integer;
    WasDblClick:boolean;
    WorkMode : TWorkMode;
    // Point move
    DeltaX,DeltaY:integer;
    // Add Connection
    StartPoint : PPoint;
    // -->
    curEl : CurElement;
    //-->>
    procedure CreateNewGraph;
  public
    Setup:TEnviroment;
    Graph:TGraph;
    SubMerger:TSubMerger;
    procedure DrawOnCanvas;
    procedure ReDrawGraph;
//    procedure addCon(CT:ConnectionType;W:extended;SP,EP:PGraphElement;TrueWay:boolean);
    procedure GetGraphContent(var Grid:TStringGrid);
    procedure ApplySetup;
    procedure UpdateStatus;
  end;

var
  MainForm: TMainForm;
implementation

uses TextInput, AutoGenUnit, SetupUnit, OptimFormUnit, AboutUnit;

{$R *.DFM}
const
  FontColor = clBlack;
  PenColor = clBlack;
  BrushColor = clWhite;
  BackColor = clBtnFace;

procedure TMainForm.ApplySetup;
begin
  TaskFonColor.Color:=Setup.TaskBackColor;
  TaskTextColor.Color:=Setup.TaskTextColor;
  LinkFonColor.Color:=Setup.LinkBackColor;
  LinkTextColor.Color:=Setup.LinkTextColor;
  RowHeightEdit.Value:=Setup.GridHeight;
  ColWidthEdit.Value:=Setup.GridWidth;
  MainSg.DefaultColWidth:=Setup.GridWidth;
  MainSg.DefaultRowHeight:=Setup.GridHeight;
  ScrollBox.HorzScrollBar.Range:=Setup.PoleWidth;
  ScrollBox.VertScrollBar.Range:=Setup.PoleHeight;
end;

procedure TMainForm.UpdateStatus;
begin
  Status.Panels[0].Text:='Кол-во верши : '+inttostr(Graph.GetPointsCount);
  Status.Panels[1].Text:='Кол-во соединений : '+inttostr(Graph.GetConsCount);
  if(PC.ActivePage = TabSheet1)or(MainSG.RowCount=1)
  then Status.Panels[2].Text:='Время выполнения : ?'
  else Status.Panels[2].Text:='Время выполнения : '+inttostr(MainSG.RowCount-1)
end;

procedure TMainForm.CreateNewGraph;
begin
{  CurEl.ceType:=selNONE;
  CurEl.element:=nil;
  LastSel.ceType:=selNONE;
  LastSel.element:=nil;
}
  Graph:=TGraph.Create;
  SubMerger := TSubMerger.Create;
end;

procedure TMainForm.ReDrawGraph;
var minX,minY,maxX,maxY:integer;
begin
  pole.Refresh;
//  pole.canvas.Brush.color:=clBtnFace;
//  pole.Canvas.fillRect(Rect(0,0,800,600));
  minX:=ScrollBox.HorzScrollBar.Position;
  minY:=ScrollBox.VertScrollBar.Position;
  maxX:=minX+ScrollBox.Width;
  maxY:=minY+ScrollBox.Height;
  Graph.DrawGraph(pole.canvas,minX,minY,maxX,maxY);
//  tmp1:=WasPole;
//  tmp2:=Pole;
//  WasPole:=tmp2;;
//  Pole := tmp1;
//  NewGraph.DrawGraph(Pole.canvas);
//  Pole.Refresh;
//  WasPole.Refresh;
end;

procedure TMainForm.DrawOnCanvas;
begin
end;


procedure TMainForm.FormDestroy(Sender: TObject);
var f:file;
    fn:string;
    p:integer;
begin
  Graph.Destroy;
  fn:=StartDir+'\setup.cfg';
  p:=pos('\\',fn);
  if p<>0 then delete(fn,p,1);
  assignFile(f,fn);
  rewrite(f,1);
  BlockWrite(f,Setup.MinPointValue,SizeOf(Setup.MinPointValue));
  BlockWrite(f,Setup.MaxPointValue,SizeOf(Setup.MaxPointValue));
  BlockWrite(f,Setup.MinConValue,SizeOf(Setup.MinConValue));
  BlockWrite(f,Setup.MaxConValue,SizeOf(Setup.MinConValue));
  BlockWrite(f,Setup.PoleWidth,SizeOf(Setup.PoleWidth));
  BlockWrite(f,Setup.PoleHeight,SizeOf(Setup.PoleHeight));
  BlockWrite(f,Setup.TaskBackColor,SizeOf(Setup.TaskBackColor));
  BlockWrite(f,Setup.TaskTextColor,SizeOf(Setup.TaskTextColor));
  BlockWrite(f,Setup.LinkBackColor,SizeOf(Setup.LinkBackColor));
  BlockWrite(f,Setup.LinkTextColor,SizeOf(Setup.LinkTextColor));
  BlockWrite(f,Setup.GridWidth,SizeOf(Setup.GridWidth));
  BlockWrite(f,Setup.GridHeight,SizeOf(Setup.GridHeight));
  closeFile(f);
end;

procedure TMainForm.poleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 case WorkMode of
  wmArrow:
  begin
    if curEl.ceType=stPOINT then
    begin
      Graph.GetDeltaOfCurrent(X,Y,DeltaX,DeltaY);
      Graph.ChangeCurAndDrawContur(X-DeltaX,Y-DeltaY,GridDelta,Pole.Canvas,false,true);
   end;
  end;
 end;
end;

procedure TMainForm.poleMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 case WorkMode of
   wmAddConnection: curEl:=Graph.MouseOver(X,Y);
   wmArrow:
   begin
    if(ssLeft in Shift)and(curEl.ceType=stPOINT) then
    begin
      Graph.ChangeCurAndDrawContur(X-DeltaX,Y-DeltaY,GridDelta,Pole.Canvas,true,true);
    end
    else
    begin
      curEl:=Graph.MouseOver(X,Y);
      case curEl.ceType of
        stNONE: Status.Panels[3].text:='';
        stPOINT:Status.Panels[3].text:='Вершина';
        stCON:  Status.Panels[3].text:='Соединение';
//        stNONE: Label1.Caption:='None';
//        stPOINT:Label1.Caption:='Point';
//        stCON:  Label1.Caption:='Connection';
      end;
    end;
   end
 end
end;

procedure TMainForm.poleMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 case WorkMode of
   wmAddConnection:
   begin
     if CurEl.ceType=stPOINT then
     begin
       if StartPoint<>nil then
       begin
         if Graph.AddConnection(StartPoint,CurEl.element,round(Setup.MinConValue+random*(Setup.MaxConValue-Setup.MinConValue))) then
         begin
          StartPoint:=nil;
          Graph.DeSelectCurrent;
          pole.repaint
         end
         else
          MessageDlg(#10+'Вы пытаетесь создать цикл!',mtError,[mbOk],0)
       end
       else
       begin
        StartPoint := CurEl.element;
        Graph.SelectCurrent;
        pole.repaint
//        DrawSelectedPoint
       end; 
     end;
    // if TryAddCon then ReDrawGraph;
   end;
   wmAddPoint:
   begin
     Graph.AddPoint(round(X/GridDelta)*GridDelta,round(Y/GridDelta)*GridDelta,round(Setup.MinPointValue+random*(Setup.MaxPointValue-Setup.MinPointValue)));
//     Graph.add(getOPER,round(X/10)*10,round(Y/10)*10,100,30);
     pole.repaint;
//     ReDrawGraph;
   end;
   wmArrow:
   begin
    if CurEl.ceType=stPOINT then
    begin
      Graph.ChangeCurAndDrawContur(X-DeltaX,Y-DeltaY,GridDelta,Pole.Canvas,true,false);
      Graph.moveOnTop;
      Graph.SelectCurrent;
      pole.repaint;
//      ReDrawGraph;
    end
    else
    begin
      Graph.SelectCurrent;
      pole.repaint;
    end;
    if WasDblClick then
    begin
      if curEl.ceType<>stNONE then InTextForm.ShowModalWithText(CurEl);
      pole.repaint;
      WasDblClick:=false;
    end;

   end;

 end;
 UpdateStatus
end;

procedure TMainForm.FormCreate(Sender: TObject);
var f:file;
    fn:string;
    p:integer;
begin
  StartDir:=GetCurrentDir;
  fname:='';
  WorkMode:=wmArrow;
  WasDblClick:=false;
  CreateNewGraph;
  GridDelta:=5;
  // ---- //
  try
    fn:=StartDir+'\setup.cfg';
    p:=pos('\\',fn);
    if p<>0 then delete(fn,p,1);
    assignFile(f,fn);
    reset(f,1);
    BlockRead(f,Setup.MinPointValue,SizeOf(Setup.MinPointValue));
    BlockRead(f,Setup.MaxPointValue,SizeOf(Setup.MaxPointValue));
    BlockRead(f,Setup.MinConValue,SizeOf(Setup.MinConValue));
    BlockRead(f,Setup.MaxConValue,SizeOf(Setup.MinConValue));
    BlockRead(f,Setup.PoleWidth,SizeOf(Setup.PoleWidth));
    BlockRead(f,Setup.PoleHeight,SizeOf(Setup.PoleHeight));
    BlockRead(f,Setup.TaskBackColor,SizeOf(Setup.TaskBackColor));
    BlockRead(f,Setup.TaskTextColor,SizeOf(Setup.TaskTextColor));
    BlockRead(f,Setup.LinkBackColor,SizeOf(Setup.LinkBackColor));
    BlockRead(f,Setup.LinkTextColor,SizeOf(Setup.LinkTextColor));
    BlockRead(f,Setup.GridWidth,SizeOf(Setup.GridWidth));
    BlockRead(f,Setup.GridHeight,SizeOf(Setup.GridHeight));
    closeFile(f);
  except
    MessageDlg('Файл setup.cfg'+#10+'отсутствует или испорчен!',mtError,[mbOk],0);
    Setup.MinPointValue:=1;
    Setup.MaxPointValue:=5;
    Setup.MinConValue:=1;
    Setup.MaxConValue:=5;
    Setup.PoleWidth:=800;
    Setup.PoleHeight:=600;
    Setup.TaskBackColor:=TaskFonColor.Color;
    Setup.TaskTextColor:=TaskTextColor.Color;
    Setup.LinkBackColor:=LinkFonColor.Color;
    Setup.LinkTextColor:=LinkTextColor.Color;
    Setup.GridWidth:=24;
    Setup.GridHeight:=18;
  end;
  ApplySetup;
  pole.repaint;
end;

procedure TMainForm.NewButClick(Sender: TObject);
begin
 if Graph.IsChanged then
   if MessageDlg('Вы хотите сохранить текущий граф?',mtConfirmation,[mbYes,mbNo],0) = mrYes then SaveBut.Click;
  fname:='';
  Graph.Destroy;
  CreateNewGraph;
  SubMerger.Init(Graph.GetPoints,Graph.GetConnections);
  MainSG.RowCount:=1;
  MainSG.ColCount:=1;
  pole.repaint;
  UpdateStatus
end;

procedure TMainForm.poleDblClick(Sender: TObject);
begin
WasDblClick:=true;
end;

procedure TMainForm.OpenButClick(Sender: TObject);
begin
 if Graph.IsChanged then
   if MessageDlg('Вы хотите сохранить текущий граф?',mtConfirmation,[mbYes,mbNo],0) = mrYes then SaveBut.Click;
 if OD.Execute then
 begin
   ArrowBut.Click;
   Graph.OpenFromFile(OD.filename);
   SubMerger.Init(Graph.GetPoints,Graph.GetConnections);
   MainSG.RowCount:=1;
   MainSG.ColCount:=1;
   pole.repaint;
   fname := OD.filename;
   OptOneStep.Enabled:=false;
   OptAuto.Enabled:=false;
   UpdateStatus
 end;
end;

procedure TMainForm.GetGraphContent(var Grid:TStringGrid);
begin
end;

procedure TMainForm.PointButClick(Sender: TObject);
begin
 WorkMode:=wmAddPoint;
 PointBut.Down:=true;
 Point_MI.Checked:=true;
 CurEl.ceType := stNONE;
 CurEl.element := nil;
 StartPoint:=nil;
 Graph.DeselectCurrent;
 pole.repaint;
end;

procedure TMainForm.ConnectionButClick(Sender: TObject);
begin
 WorkMode:=wmAddConnection;
 ConnectionBut.Down:=true;
 Connection_MI.Checked:=true;
 CurEl.ceType := stNONE;
 CurEl.element := nil;
 StartPoint:=nil;
 Graph.DeselectCurrent;
 pole.repaint;
end;

procedure TMainForm.ArrowButClick(Sender: TObject);
begin
 WorkMode:=wmArrow;
 ArrowBut.Down:=true;
 Arrow_MI.Checked:=true;
 CurEl.ceType := stNONE;
 CurEl.element := nil;
 StartPoint:=nil;
 Graph.DeselectCurrent;
 pole.repaint;
end;


procedure TMainForm.polePaint(Sender: TObject);
var minX,minY,maxX,maxY:integer;
begin
//  pole.Refresh;
//  pole.canvas.Brush.color:=clBtnFace;
//  pole.Canvas.fillRect(Rect(0,0,800,600));
  minX:=ScrollBox.HorzScrollBar.Position;
  minY:=ScrollBox.VertScrollBar.Position;
  maxX:=minX+ScrollBox.Width;
  maxY:=minY+ScrollBox.Height;
  Graph.DrawGraph(pole.canvas,minX,minY,maxX,maxY);
end;

procedure TMainForm.DelMenuClick(Sender: TObject);
begin
  if Graph.DeleteSelected then pole.repaint;
  UpdateStatus
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
  if PC.ActivePage = TabSheet1
  then Graph.DeselectCurrent
  else
  begin
    SubMerger.DeselectTask;
    SubMerger.ShowSubMerging(MainSG);
  end;
  StartPoint:=nil;
  pole.repaint;
  UpdateStatus
end;

procedure TMainForm.SaveAsClick(Sender: TObject);
begin
  SD.Filter:='(*.gaf)|*.gaf';
  SD.DefaultExt:='gaf';
  if SD.Execute then
  begin
    fname:=SD.filename;
    Graph.SaveToFile(fname);
    SubMerger.Init(Graph.GetPoints,Graph.GetConnections);
    MainSG.RowCount:=1;
    MainSG.ColCount:=1;
  end;
end;

procedure TMainForm.SaveButClick(Sender: TObject);
begin
  if fname=''
  then SaveAs.Click
  else
  begin
    Graph.SaveToFile(fname);
    SubMerger.Init(Graph.GetPoints,Graph.GetConnections);
    MainSG.RowCount:=1;
    MainSG.ColCount:=1;
  end;
end;

procedure TMainForm.PCChange(Sender: TObject);
begin
 if Graph.WasChangedAfter then
 begin
  SubMerger.Init(Graph.GetPoints,Graph.GetConnections);
  MainSG.RowCount:=1;
  MainSG.ColCount:=1;
  OptOneStep.Enabled:=false;
  OptAuto.Enabled:=false;
  UpdateStatus
 end;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  SubMerger.DoBazovoe;
  SubMerger.ShowSubMerging(MainSG);
  OptOneStep.Enabled:=true;
  OptAuto.Enabled:=true;
  UpdateStatus
end;

procedure TMainForm.MainSGDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var Up,Down:boolean;
    spaceTop,spaceBottom:shortint;
    SG:TStringGrid;
    NewRect:TRect;
    L:integer;
    s,text:string;
    Selected,MayBeAfter,mayChange:boolean;
    WasColor:TColor;
begin
 SG:=TStringGrid(Sender);
 text:=SG.Cells[Col,Row];
 if(text<>'')and(not(text[1] in ['0'..'9'])) then
 begin
   Selected:=text[1]='s';
   MayBeAfter:=text[1]='m';
   delete(text,1,1);
 end
 else
 begin
   Selected:=false;
   MayBeAfter:=false;
 end;

 mayChange:=not (Selected or MayBeAfter);
 if Selected then
 begin
   SG.Canvas.Brush.Color:=clRed;
   SG.Canvas.Font.Color:=clYellow
 end
 else
 if MayBeAfter then
 begin
   SG.Canvas.Brush.Color:=clGreen;
   SG.Canvas.Font.Color:=clYellow
 end;

{ if Selected then SG.Canvas.Pen.Width:=2
             else SG.Canvas.Pen.Width:=1;
 if MayBeAfter then SG.Canvas.Pen.Style:=psDot
               else SG.Canvas.Pen.Style:=psSolid;
}
 if(row<SG.FixedRows)or(col<SG.FixedCols) then
 begin
  with SG.Canvas do
  begin
    if MayChange then Brush.color:=SG.FixedColor;
    FillRect(Rect);
    L:=round( (Rect.Right-Rect.Left-TextWidth(text))/2);
    TextRect(Rect, Rect.Left+L, Rect.Top+2,text)
  end;
 end
 else
 if text<>'' then
 begin
  Up:=false;
  Down:=false;
  if row<>1 then Up:=SG.Cells[Col,Row]=SG.Cells[Col,Row-1];
  if row<>SG.RowCount-1 then Down:=SG.Cells[Col,Row]=SG.Cells[Col,Row+1];
  with SG.Canvas do
  begin
    WasColor:=Brush.color;
    Brush.color:=clWhite;
    FillRect(Rect);
    Brush.color:=WasColor;
    if mayChange then
    begin
      if (col mod 2) = 1 then
      begin
        Brush.color:=Setup.TaskBackColor;
        Font.color:=Setup.TaskTextColor;
      end
      else
      begin
        Brush.color:=Setup.LinkBackColor;
        Font.color:=Setup.LinkTextColor;
      end;
    end;  
    if Up then
    begin
     spaceTop:=0;
     s:='';
    end
    else
    begin
     spaceTop:=2;
     s:=text;
    end;
    if Down then spaceBottom:=0 else spaceBottom:=2;
    NewRect:=Classes.Rect(Rect.Left+3,Rect.Top+spaceTop,Rect.Right-3,Rect.Bottom-spaceBottom);
    L:=round( (NewRect.Right-NewRect.Left-TextWidth(s))/2);
    TextRect(NewRect,NewRect.Left+L,NewRect.Top+1,s);
    pen.color:=clBlack;
    moveto(Rect.Left+3,Rect.Bottom-spaceBottom);
    lineto(Rect.Left+3,Rect.Top+spaceTop-1);
    if spaceTop<>0 then
    begin
    moveto(Rect.Left+3,Rect.Top+spaceTop-1);
    lineto(Rect.Right-2,Rect.Top+spaceTop-1);
    end;
    moveto(Rect.Right-3,Rect.Bottom-spaceBottom);
    lineto(Rect.Right-3,Rect.Top+spaceTop-1);
    if spaceBottom<>0 then
    begin
    moveto(Rect.Left+3,Rect.Bottom-spaceBottom);
    lineto(Rect.Right-3,Rect.Bottom-spaceBottom);
    end;
    Brush.color:=clWhite;
  end;
 end;
end;

procedure TMainForm.FaceButClick(Sender: TObject);
begin
 { SetupPanel.Visible:=FaceBut.Down}
end;

procedure TMainForm.RowHeightEditChange(Sender: TObject);
begin
  MainSG.DefaultRowHeight:=RowHeightEdit.Value;
  Setup.GridHeight:=RowHeightEdit.Value
end;

procedure TMainForm.ColWidthEditChange(Sender: TObject);
begin
  MainSG.DefaultColWidth:=ColWidthEdit.Value;
  Setup.GridWidth:=ColWidthEdit.Value
end;

procedure TMainForm.SetupPanelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if fsUnderLine in TFC_Label.Font.Style then  TFC_Label.Font.Style:=TFC_Label.Font.Style - [fsUnderLine]
  else
  if fsUnderLine in LFC_Label.Font.Style then  LFC_Label.Font.Style:=LFC_Label.Font.Style - [fsUnderLine]
  else
  if fsUnderLine in TTC_Label.Font.Style then  TTC_Label.Font.Style:=TTC_Label.Font.Style - [fsUnderLine]
  else
  if fsUnderLine in LTC_Label.Font.Style then  LTC_Label.Font.Style:=LTC_Label.Font.Style - [fsUnderLine]
end;

procedure TMainForm.TFC_LabelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if fsUnderLine in TFC_Label.Font.Style then  TFC_Label.Font.Style:=TFC_Label.Font.Style - [fsUnderLine]
  else
  if fsUnderLine in LFC_Label.Font.Style then  LFC_Label.Font.Style:=LFC_Label.Font.Style - [fsUnderLine]
  else
  if fsUnderLine in TTC_Label.Font.Style then  TTC_Label.Font.Style:=TTC_Label.Font.Style - [fsUnderLine]
  else
  if fsUnderLine in LTC_Label.Font.Style then  LTC_Label.Font.Style:=LTC_Label.Font.Style - [fsUnderLine];
  if not(fsUnderLine in TLabel(Sender).Font.Style) then  TLabel(Sender).Font.Style:=TLabel(Sender).Font.Style + [fsUnderLine]
end;

procedure TMainForm.TFC_LabelClick(Sender: TObject);
begin
  ColorD.Color:=TaskFonColor.Color;
  if ColorD.Execute then
  begin
    TaskFonColor.Color:=ColorD.Color;
    Setup.TaskBackColor:=ColorD.Color
  end;
  MainSG.Repaint;
end;

procedure TMainForm.LFC_LabelClick(Sender: TObject);
begin
  ColorD.Color:=LinkFonColor.Color;
  if ColorD.Execute then
  begin
    LinkFonColor.Color:=ColorD.Color;
    Setup.LinkBackColor:=ColorD.Color
  end;
  MainSG.Repaint;
end;

procedure TMainForm.TTC_LabelClick(Sender: TObject);
begin
  ColorD.Color:=TaskTextColor.Color;
  if ColorD.Execute then
  begin
    TaskTextColor.Color:=ColorD.Color;
    Setup.TaskTextColor:=ColorD.Color
  end;
  MainSG.Repaint;
end;

procedure TMainForm.LTC_LabelClick(Sender: TObject);
begin
  ColorD.Color:=LinkTextColor.Color;
  if ColorD.Execute then
  begin
    LinkTextColor.Color:=ColorD.Color;
    Setup.LinkTextColor:=ColorD.Color
  end;
  MainSG.Repaint;
end;

procedure TMainForm.ExitItemClick(Sender: TObject);
begin
 MainForm.Close
end;

procedure TMainForm.MainSGSelectCell(Sender: TObject; Col, Row: Integer;
  var CanSelect: Boolean);
begin
  CanSelect:=false;
end;

procedure TMainForm.MainSGMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var s,first:string;
    UIN,ProcNum:integer;
    Col,Row:integer;
begin
  MainSG.MouseToCell(X,Y,Col,Row);
  if(Col>=0)and(Row>=0)then
  begin
    s:=MainSG.Cells[Col,Row];
    if (s<>'')and(Col mod 2 =1) then
    begin
      first:=s[1];
      if not(s[1] in ['0'..'9']) then delete(s,1,1);
      UIN:=strtoint(s);
      ProcNum:=(col div 2)+1;
      if first='s'
      then SubMerger.DeselectTask
      else
      if first='m'
      then
      begin
        if Row=0 then SubMerger.MoveSelectedAfter(ProcNum,-1)
                 else SubMerger.MoveSelectedAfter(ProcNum,UIN)
      end
      else SubMerger.SelectTask(UIN);
      SubMerger.ShowSubMerging(MainSG);
    end;
  end;
  UpdateStatus
end;

procedure TMainForm.DecProcNumClick(Sender: TObject);
begin
  if SubMerger.DecNumOfProc then SubMerger.ShowSubMerging(MainSG);
  UpdateStatus
end;

procedure TMainForm.IncProcNumClick(Sender: TObject);
begin
  if SubMerger.IncNumOfProc then SubMerger.ShowSubMerging(MainSG);
  UpdateStatus
end;


procedure TMainForm.GenButClick(Sender: TObject);
begin
  AutoGenForm.ShowModal;
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
 SetupForm.ShowModal;
 pole.repaint
end;

procedure TMainForm.ZoomOnButClick(Sender: TObject);
begin
  Graph.ZoomOn(1.5);
  ApplySetup;
  pole.Repaint
end;

procedure TMainForm.ZoomOffButClick(Sender: TObject);
begin
  Graph.ZoomOff(1.5);
  ApplySetup;
  pole.Repaint
end;

procedure TMainForm.OptOneStepClick(Sender: TObject);
begin
  SubMerger.OptimizeOneStep(nil,nil);
  SubMerger.ShowSubMerging(MainSG);
  UpdateStatus
end;

procedure TMainForm.OptAutoClick(Sender: TObject);
begin
  OptimForm.ShowModal;
end;


procedure TMainForm.N10Click(Sender: TObject);
begin
  AboutForm.ShowModal
end;


end.
