unit uPart1;

interface

uses
  uAnalyzer,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, Grids;

type
  TFormPart1 = class(TForm)
    MainMenu: TMainMenu;
    Menu: TMenuItem;
    MenuOpenFile: TMenuItem;
    OpenDialog: TOpenDialog;
    MenuAnalyze: TMenuItem;
    PageControl: TPageControl;
    TabSheetWays: TTabSheet;
    TabSheetCycles: TTabSheet;
    StringGridWays: TStringGrid;
    StringGridCycles: TStringGrid;
    MenuSave: TMenuItem;
    SaveDialog: TSaveDialog;
    procedure MenuOpenFileClick(Sender: TObject);
    procedure MenuAnalyzeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MenuSaveClick(Sender: TObject);
  private
    procedure ShowWays;
    procedure ShowWay(WayId: integer);
    procedure ShowCycles;
    procedure ShowCycle(CycleId: integer);
  public
    { Public declarations }
  end;

var
  FormPart1: TFormPart1;
implementation

{$R *.DFM}

procedure TFormPart1.MenuOpenFileClick(Sender: TObject);
var
  F: TextFile;
begin
  if OpenDialog.Execute
  then begin
    AssignFile(F, OpenDialog.FileName);
    Reset(F);
    ReadLn(F, Analyzer.Alhoritm);
    CloseFile(F);
    Analyzer.FileName := OpenDialog.FileName;
    MenuAnalyze.Enabled := true;
  end;
end;

procedure TFormPart1.MenuAnalyzeClick(Sender: TObject);
var
  F: TextFile;
begin
  repeat
    try
      Analyzer.Analyze;
    except;
    end;
    if Analyzer.Status = 'Cancel' then Exit;
    if Analyzer.Status = 'Success' then Break;
  until false;

  AssignFile(F, Analyzer.FileName);
  Rewrite(F);
  Write(F, Analyzer.Alhoritm);
  CloseFile(F);

  ShowWays;
  ShowCycles;
  MenuSave.Enabled := true;  
end;

procedure TFormPart1.FormCreate(Sender: TObject);
begin
  Analyzer := TAnalyzer.Create;
end;

procedure TFormPart1.ShowWays;
var
  i, WaysCount: integer;
begin
  StringGridWays.ColCount := 1;
  StringGridWays.RowCount := 1;
  StringGridWays.Cells[0,0] := '';

  WaysCount := 0;
  for i := 0 to High(Analyzer.Ways) do
  if not Analyzer.IsCycle(i)
  then begin
    Inc(WaysCount);
    if StringGridWays.ColCount < WaysCount then StringGridWays.ColCount := StringGridWays.ColCount + 1;
    ShowWay(i);
  end;
end;

procedure TFormPart1.ShowWay(WayId: integer);
var
  NodeId: integer;
begin
  if StringGridWays.RowCount < Length(Analyzer.Ways[WayId]) then StringGridWays.RowCount := Length(Analyzer.Ways[WayId]);
  for NodeId := 0 to High(Analyzer.Ways[WayId]) do StringGridWays.Cells[StringGridWays.ColCount - 1, NodeId] := Analyzer.Nodes[Analyzer.Ways[WayId][NodeId]].Name;
end;

procedure TFormPart1.ShowCycles;
var
  CycleId: integer;
begin
  StringGridCycles.ColCount := 1;
  StringGridCycles.RowCount := 1;
  StringGridCycles.Cells[0,0] := '';

  if Length(Analyzer.Cycles) > 0
  then begin
    StringGridCycles.ColCount := Length(Analyzer.Cycles);
    for CycleId := 0 to High(Analyzer.Cycles) do ShowCycle(CycleId);
  end;
end;

procedure TFormPart1.ShowCycle(CycleId: integer);
var
  NodeId: integer;
begin
  if StringGridCycles.RowCount < Length(Analyzer.Ways[Analyzer.Cycles[CycleId]]) - Analyzer.GetCycleStart(Analyzer.Cycles[CycleId]) then StringGridCycles.RowCount := Length(Analyzer.Ways[Analyzer.Cycles[CycleId]]) - Analyzer.GetCycleStart(Analyzer.Cycles[CycleId]);
  for NodeId := Analyzer.GetCycleStart(Analyzer.Cycles[CycleId]) to High(Analyzer.Ways[Analyzer.Cycles[CycleId]]) do StringGridCycles.Cells[CycleId, NodeId - Analyzer.GetCycleStart(Analyzer.Cycles[CycleId])] := Analyzer.Nodes[Analyzer.Ways[Analyzer.Cycles[CycleId]][NodeId]].Name;
end;

procedure TFormPart1.FormActivate(Sender: TObject);
begin
  StringGridWays.ColCount := 1;
  StringGridWays.RowCount := 1;
  StringGridWays.Cells[0,0] := '';

  StringGridCycles.ColCount := 1;
  StringGridCycles.RowCount := 1;
  StringGridCycles.Cells[0,0] := '';

  MenuAnalyze.Enabled := false;
  MenuSave.Enabled := false;
end;

procedure TFormPart1.MenuSaveClick(Sender: TObject);
var
  F: TextFile;
  i, j: integer;
begin
  if SaveDialog.Execute
  then begin
    AssignFile(F, SaveDialog.FileName);
    Rewrite(F);

    WriteLn(F, '# Connection structure');
    for i := 0 to High(Analyzer.Conn) do
    begin
      for j := 0 to High(Analyzer.Conn[i]) do Write(F, ' ', IntToStr(Analyzer.Conn[i][j]));
      WriteLn(F);
    end;

    WriteLn(F, '# Node names');
    for i := 0 to High(Analyzer.Nodes) do WriteLn(F, Analyzer.Nodes[i].Name);

    CloseFile(F);
  end;
end;

end.
