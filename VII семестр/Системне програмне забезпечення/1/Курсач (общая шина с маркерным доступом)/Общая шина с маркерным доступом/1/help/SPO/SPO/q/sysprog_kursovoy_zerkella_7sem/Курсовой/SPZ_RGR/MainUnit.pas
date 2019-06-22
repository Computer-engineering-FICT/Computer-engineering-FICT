unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Spin, Menus, IniFiles, Grids;

const
  // Queue type
  QTP_SEPARATE = 0;
  QTP_COMMON = 1;

  // Indexes in sgProcs
  SGR_PROCNAME = 0;
  SGR_PROC = 1;
  SGR_QUEUEDIVIDER = 2;
  SGC_FIRST = 0;

  // Strings
  EOFL = #13#10;

type

  // Two values record
  TTwoValues = record
    FromVal, ToVal: Integer;
  end;

  // Task
  TTask = record
    Ops: Integer;
    OpsCompleted: Integer;
    TimeCameAt: Integer;
    TimeWaiting: Integer;
    ForProcessor: Integer;
    Id: Integer;
  end;

  PTask = ^TTask;

  // Queue
  TQueue = TList;

  // Options
  TOptions = record
    QueueType: Byte;
    Intense: TTwoValues;
    TaskOps: TTwoValues;
  end;

  // Processor
  TProcessor = record
    // Common options
    TactsOnOp: Integer;
    // Current options for modelling
    TactsCompleted: Integer;
    Task: PTask;
    Queue: TQueue;
    // Stats
    StatsTactsFilled: Integer;
  end;

  // Array of processors
  TProcessors = array of TProcessor;

  // Stats
  TStats = record
    NumWentAway, TimeWaited: Integer;
    TimeServe: Integer;
  end;

  // Modelling info
  TModelling = record
    Started: Boolean;
    Paused: Boolean;
    Step: Integer;
    MaxTaskId: Integer;
    Stats: TStats;
  end;

  TForm1 = class(TForm)
    pcMain: TPageControl;
    tsModelling: TTabSheet;
    btStart: TButton;
    btStep: TButton;
    btGo: TButton;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    cbProcs: TComboBox;
    Label2: TLabel;
    seNumProcs: TSpinEdit;
    rgQueue: TRadioGroup;
    Label3: TLabel;
    seTactsOnOp: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    seIntenseFrom: TSpinEdit;
    Label6: TLabel;
    seIntenseTo: TSpinEdit;
    Label7: TLabel;
    Label8: TLabel;
    seTaskOpsFrom: TSpinEdit;
    Label9: TLabel;
    seTaskOpsTo: TSpinEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    lbStep: TLabel;
    Panel1: TPanel;
    sgProcs: TStringGrid;
    sgCommonQueue: TStringGrid;
    Splitter1: TSplitter;
    cxUpdateAll: TCheckBox;
    lbEffect: TLabel;
    lbTimeWaited: TLabel;
    lbTimeServe: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btStartClick(Sender: TObject);
    procedure btStepClick(Sender: TObject);
    procedure btGoClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure cbProcsChange(Sender: TObject);
    procedure seNumProcsChange(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sgProcsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgCommonQueueDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure pcMainChange(Sender: TObject);
  private
    // Property functions
    function GetNumProcessors: Integer;
    procedure SetNumProcessors(Value: Integer);
  public
    // Properties
    OldProcIndex: Integer;
    Options: TOptions;
    Procs: TProcessors;
    MD: TModelling;
    CommonQueue: TQueue;
    property ProcNum: Integer read GetNumProcessors write SetNumProcessors;
    // Inits/Uninits
    procedure InitEverything;
    procedure UnInitEverything;
    procedure FreeProcessor(Index: Integer);
    procedure InitProcessor(Index: Integer);
    // Misc
    function PutTaskToSt(PT: PTask; UseForProcessor: Boolean): string;
    function GetRndByPair(TwoValues: TTwoValues): Integer;
    procedure LoadConfiguration(FileName: string);
    procedure SaveConfiguration(FileName: string);
    procedure ClearStructure;
    procedure ClearProcQueue(Index: Integer);
    procedure ClearCommonQueue;
    procedure InitCommonQueue;
    function GetProcessorForTask(PT: PTask): Integer;
    function StatsProcWorkLoad(Index: Integer): Real;
    function StatsWaitTime: Real;
    function StatsEffectiveness: Real;
    function StatsServeTime: Real;
    // Visuals
    procedure PutString2Canvas(Canvas: TCanvas; Rect: TRect; St: string);
    procedure SetGridView;
    procedure GatherValuesToOptions;
    procedure SetConfiguration2Visuals;
    procedure UpdateVisualsProcessors(ChangeProcessorIndex: Boolean);
    procedure UpdateTactsOpForProcessor;
    procedure SetString(Col, Row: Byte; St: string);
    procedure SetQString(Col, Row: Byte; St: string);
    // Modelling functions
    procedure MD_Start;
    procedure MD_Step;
    procedure MD_Go(UpdateAll: Boolean);
    procedure MD_Pause;
    procedure MD_Clear;
    procedure MD_UpdateVisuals(UpdateAll: Boolean);
    procedure MDV_FreeVisuals;
    procedure MDV_InitVisuals;
    // Updating models
    procedure UpdateModellingButtons;
  end;

var
  Form1: TForm1;
  Path: string;

implementation

{$R *.DFM}

// Returns random based on pairs
function TForm1.GetRndByPair(TwoValues: TTwoValues): Integer;
begin
  Result := TwoValues.FromVal + Random(TwoValues.ToVal - TwoValues.FromVal);
end;

// Gets number of processors
function TForm1.GetNumProcessors: Integer;
begin
  Result := Length(Procs);
end;

// Sets number of processors
procedure TForm1.SetNumProcessors(Value: Integer);
var
  I: Integer;
  OldProcNum: Integer;
begin
  OldProcNum := ProcNum;
  if Value = OldProcNum then Exit;
  if Value < ProcNum then
  begin
    for I := Value to ProcNum - 1 do
      FreeProcessor(I);
  end;
  SetLength(Procs, Value);
  if Value > OldProcNum then
  begin
    for I := OldProcNum to Value - 1 do
    begin
      InitProcessor(I);
      Procs[I].TactsOnOp := 3;
    end;
  end;
end;

// Updates visual task opeations for processor
procedure TForm1.UpdateTactsOpForProcessor;
var
  Index: Integer;
begin
  Index := cbProcs.ItemIndex;
  seTactsOnOp.Value := Procs[Index].TactsOnOp;
end;

// Updates visual processors
procedure TForm1.UpdateVisualsProcessors(ChangeProcessorIndex: Boolean);
var
  I: Integer;
  OldItemIndex: Integer;
begin
  OldItemIndex := cbProcs.ItemIndex;
  cbProcs.Clear;
  for I := 0 to ProcNum - 1 do
    cbProcs.Items.Add('Процессор ' + IntToStr(I + 1));
  if ChangeProcessorIndex then
  begin
    cbProcs.ItemIndex := 0;
  end
  else begin
    if OldItemIndex >= ProcNum then
      cbProcs.ItemIndex := ProcNum - 1 else
      cbProcs.ItemIndex := OldItemIndex;
  end;
  UpdateTactsOpForProcessor;
end;

// Sets configuration 2 visuals
procedure TForm1.SetConfiguration2Visuals;
begin
  rgQueue.ItemIndex := Options.QueueType;
  seIntenseFrom.Value := Options.Intense.FromVal;
  seIntenseTo.Value := Options.Intense.ToVal;
  seTaskOpsFrom.Value := Options.TaskOps.FromVal;
  seTaskOpsTo.Value := Options.TaskOps.ToVal;
  seNumProcs.Value := ProcNum;
  UpdateVisualsProcessors(True);
end;

// Gathers values to options
procedure TForm1.GatherValuesToOptions;
begin
  Options.QueueType := rgQueue.ItemIndex;
  Options.Intense.FromVal := seIntenseFrom.Value;
  Options.Intense.ToVal := seIntenseTo.Value;
  Options.TaskOps.FromVal := seTaskOpsFrom.Value;
  Options.TaskOps.ToVal := seTaskOpsTo.Value;
  Procs[cbProcs.ItemIndex].TactsOnOp := seTactsOnOp.Value;
end;

// Loads configuration
procedure TForm1.SaveConfiguration(FileName: string);
var
  FIni: TIniFile;
  I: Integer;
begin
  FIni := TIniFile.Create(FileName);
  // Queue type
  FIni.WriteString('Program', 'QueueType', IntToStr(Options.QueueType));
  // Intensity
  FIni.WriteString('Program', 'IntenseFrom', IntToStr(Options.Intense.FromVal));
  FIni.WriteString('Program', 'IntenseTo', IntToStr(Options.Intense.ToVal));
  // Task operation
  FIni.WriteString('Program', 'TaskFrom', IntToStr(Options.TaskOps.FromVal));
  FIni.WriteString('Program', 'TaskTo', IntToStr(Options.TaskOps.ToVal));
  // Number of processors
  FIni.WriteString('Program', 'NumProcessors', IntToStr(ProcNum));
  // Write all procs data
  for I := 0 to ProcNum - 1 do
    FIni.WriteString('Program', 'Processor' + IntToStr(I) + '.TactsOp', IntToStr(Procs[I].TactsOnOp));
  // Free
  FIni.UpdateFile;
  FIni.Free;
end;

// Saves configuration
procedure TForm1.LoadConfiguration(FileName: string);
var
  FIni: TIniFile;
  St: string;
  NumProcs, TactsOp: Integer;
  I: Integer;
begin
  ClearStructure;
  FIni := TIniFile.Create(FileName);
  // Queue type
  St := FIni.ReadString('Program', 'QueueType', IntToStr(QTP_COMMON));
  try
    Options.QueueType := StrToInt(St);
    if (Options.QueueType <> QTP_COMMON) and (Options.QueueType <> QTP_SEPARATE) then Options.QueueType := QTP_COMMON;
  except
    Options.QueueType := QTP_COMMON
  end;
  // Intensity
  St := FIni.ReadString('Program', 'IntenseFrom', '10');
  try
    Options.Intense.FromVal := StrToInt(St);
    if Options.Intense.FromVal <= 0 then Options.Intense.FromVal := 10;
  except
    Options.Intense.FromVal := 10;
  end;
  St := FIni.ReadString('Program', 'IntenseTo', '15');
  try
    Options.Intense.ToVal := StrToInt(St);
    if Options.Intense.ToVal <= 0 then Options.Intense.ToVal := 15;
  except
    Options.Intense.ToVal := 15;
  end;
  if Options.Intense.FromVal > Options.Intense.ToVal then Options.Intense.ToVal := Options.Intense.FromVal + 5;
  // Task operation
  St := FIni.ReadString('Program', 'TaskFrom', '5');
  try
    Options.TaskOps.FromVal := StrToInt(St);
    if Options.TaskOps.FromVal <= 0 then Options.TaskOps.FromVal := 5;
  except
    Options.TaskOps.FromVal := 5;
  end;
  St := FIni.ReadString('Program', 'TaskTo', '10');
  try
    Options.TaskOps.ToVal := StrToInt(St);
    if Options.TaskOps.ToVal <= 0 then Options.TaskOps.ToVal := 10;
  except
    Options.Intense.ToVal := 10;
  end;
  if Options.TaskOps.FromVal > Options.TaskOps.ToVal then Options.Intense.ToVal := Options.TaskOps.FromVal + 5;
  // Number of processors
  St := FIni.ReadString('Program', 'NumProcessors', '1');
  try
    NumProcs := StrToInt(St);
    if NumProcs <= 0 then NumProcs := 1;
  except
    NumProcs := 1;
  end;
  ProcNum := NumProcs;
  // Read all procs data
  for I := 0 to ProcNum - 1 do
  begin
    St := FIni.ReadString('Program', 'Processor' + IntToStr(I) + '.TactsOp', '3');
    try
      TactsOp := StrToInt(St);
      if TactsOp <= 0 then TactsOp := 3;
    except
      TactsOp := 3;
    end;
    Procs[I].TactsOnOp := TactsOp;
  end;
  // Free
  FIni.Free;
end;

// Clears queue of processor
procedure TForm1.ClearProcQueue(Index: Integer);
begin
end;

// Clears common queue
procedure TForm1.ClearCommonQueue;
var
  I: Integer;
  PT: PTask;
begin
  if CommonQueue = nil then Exit;
  for I := 0 to CommonQueue.Count - 1 do
  begin
    PT := CommonQueue[I];
    Dispose(PT);
  end;
  CommonQueue.Free;
  CommonQueue := nil;
end;

// Inits common queue
procedure TForm1.InitCommonQueue;
begin
  CommonQueue := TList.Create;
end;

// Clears all strcutures
procedure TForm1.ClearStructure;
var
  I: Integer;
begin
  for I := 0 to ProcNum - 1 do
    FreeProcessor(I);
  ClearCommonQueue;
end;

// Sets normal grid view
procedure TForm1.SetGridView;
begin
  sgProcs.ColCount := 2;
  sgProcs.RowCount := SGR_QUEUEDIVIDER + 2;
  sgProcs.ColWidths[SGC_FIRST] := 10;
  sgProcs.ColWidths[SGC_FIRST + 1] := 100;
  sgProcs.RowHeights[SGR_PROCNAME] := 20;
  sgProcs.RowHeights[SGR_PROC] := 90;
  sgProcs.RowHeights[SGR_QUEUEDIVIDER] := 15;
  sgProcs.RowHeights[SGR_QUEUEDIVIDER + 1] := sgProcs.RowHeights[SGR_PROC];
  sgCommonQueue.RowHeights[0] := sgProcs.RowHeights[SGR_PROCNAME];
  sgCommonQueue.RowHeights[1] := sgProcs.RowHeights[SGR_QUEUEDIVIDER + 1];
  sgCommonQueue.ColWidths[0] := sgProcs.ColWidths[SGC_FIRST];  
  sgCommonQueue.ColWidths[1] := sgProcs.ColWidths[SGC_FIRST + 1];
end;

// Inits everything
procedure TForm1.InitEverything;
begin
  Procs := nil;
  OldProcIndex := -1;
  // Load configuration
  LoadConfiguration(Path + 'SPZ_RGR.ini');
  SetConfiguration2Visuals;
  // Init visuals
  SetGridView;
  pcMain.ActivePage := tsModelling;
  // Modelling
  MD.Started := False;
  UpdateModellingButtons;
end;

// Uninits everything
procedure TForm1.UnInitEverything;
begin
  GatherValuesToOptions;
  SaveConfiguration(Path + 'SPZ_RGR.ini');
  ClearStructure;
end;

// Sets string
procedure TForm1.SetString(Col, Row: Byte; St: string);
begin
  sgProcs.Cells[Col, Row] := St;
end;

// Sets string in common queue
procedure TForm1.SetQString(Col, Row: Byte; St: string);
begin
  sgCommonQueue.Cells[Col, Row] := St;
end;

// Frees all data in processor
procedure TForm1.FreeProcessor(Index: Integer);
var
  I: Integer;
  PT: PTask;
begin
  // Clear task
  if Procs[Index].Task <> nil then
  begin
    Dispose(Procs[Index].Task);
    Procs[Index].Task := nil;
  end;
  // Clear proc queue
  if Procs[Index].Queue <> nil then
  begin
    for I := 0 to Procs[Index].Queue.Count - 1 do
    begin
      PT := Procs[Index].Queue[I];
      Dispose(PT);
    end;
    Procs[Index].Queue.Free;
    Procs[Index].Queue := nil;
  end;
end;

// Inits all data in processor
procedure TForm1.InitProcessor(Index: Integer);
begin
  Procs[Index].Task := nil;
  // Clear proc queue
  Procs[Index].Queue := TList.Create;
  Procs[Index].TactsCompleted := 0;
  Procs[Index].StatsTactsFilled := 0;
end;

// Updates modelling buttons
procedure TForm1.UpdateModellingButtons;
begin
  if MD.Started then
  begin
    btGo.Enabled := True;
    if MD.Paused then
    begin
      btStart.Enabled := True;
      btStep.Enabled := True;
      btGo.Caption := 'Поехали';
    end
    else begin
      btStart.Enabled := False;
      btStep.Enabled := False;
      btGo.Caption := 'Пауза';
    end;
  end
  else begin
    btStart.Enabled := True;
    btGo.Caption := 'Поехали';
    btStep.Enabled := False;
    btGo.Enabled := False;
  end;
end;

// Gets processor to which queue to add task
function TForm1.GetProcessorForTask(PT: PTask): Integer;
var
  Tacts: array of Integer;
  I, J: Integer;
  PT2: PTask;
begin
  // We calc when the task will come out
  SetLength(Tacts, ProcNum);
  for I := 0 to ProcNum - 1 do
  begin
    Tacts[I] := 0;
    if Procs[I].Task <> nil then
    begin
      Inc(Tacts[I], Procs[I].TactsOnOp * (Procs[I].Task.Ops - Procs[I].Task.OpsCompleted));
      Dec(Tacts[I], Procs[I].TactsCompleted);
    end;
    // Go throug queues
    for J := 0 to Procs[I].Queue.Count - 1 do
    begin
      PT2 := Procs[I].Queue[J];
      Inc(Tacts[I], Procs[I].TactsOnOp * PT2.Ops);
    end;
    for J := 0 to CommonQueue.Count - 1 do
    begin
      PT2 := CommonQueue[J];
      if PT2.ForProcessor = I then
        Inc(Tacts[I], Procs[I].TactsOnOp * PT2.Ops);
    end;
    // Add this task
    Inc(Tacts[I], Procs[I].TactsOnOp * PT.Ops);
  end;
  // Find the lowest value
  Result := 0;
  for I := 1 to ProcNum - 1 do
  begin
    if Tacts[Result] > Tacts[I] then
      Result := I
    else begin
      // Chose the processor with the lowest workload
      if (Tacts[Result] = Tacts[I]) and (Procs[I].StatsTactsFilled < Procs[Result].StatsTactsFilled) then
        Result := I;
    end;
  end;
  // Free
  SetLength(Tacts, 0);
  Tacts := nil;
end;

// Starts modelling
procedure TForm1.MD_Start;
var
  I: Integer;
begin
  for I := 0 to ProcNum - 1 do
    InitProcessor(I);
  InitCommonQueue;  
  MD.MaxTaskId := 0;
  MD.Started := True;
  MD.Paused := True;
  MD.Step := 0;
  MD.Stats.NumWentAway := 0;
  MD.Stats.TimeServe := 0;
  MD.Stats.TimeWaited := 0;  
end;

// Set modelling pause
procedure TForm1.MD_Pause;
begin
  MD.Paused := True;
end;

// Modelling step
procedure TForm1.MD_Step;
var
  Rnd, Rnd2: Integer;
  PT: PTask;
  I, J: Integer;
begin
  // Check new task comes
  Rnd := GetRndByPair(Options.Intense);
  Rnd2 := Random(Rnd);
  if Rnd2 = 0 then
  begin
    // Add task to queue
    New(PT);
    PT^.Id := MD.MaxTaskId;
    Inc(MD.MaxTaskId);
    PT.Ops := GetRndByPair(Options.TaskOps);
    PT.OpsCompleted := 0;
    PT.TimeCameAt := MD.Step;
    PT.TimeWaiting := 0;
    PT.ForProcessor := GetProcessorForTask(PT);
    // Check were to set it
    if Options.QueueType = QTP_COMMON then
      CommonQueue.Add(PT) else
      Procs[PT.ForProcessor].Queue.Add(PT);
  end;
  // Check whether the task in processors go away
  for I := 0 to ProcNum - 1 do
    if Procs[I].Task <> nil then
    begin
      PT := Procs[I].Task;
      // Operation completed
      if Procs[I].TactsCompleted = Procs[I].TactsOnOp then
      begin
        Procs[I].TactsCompleted := 0;
        Inc(PT.OpsCompleted);
      end;
      // Task completed
      if PT.Ops = PT.OpsCompleted then
      begin
        Inc(MD.Stats.NumWentAway);
        Inc(MD.Stats.TimeWaited, PT.TimeWaiting);
        Inc(MD.Stats.TimeServe, MD.Step - PT.TimeCameAt);
        Dispose(PT);
        Procs[I].Task := nil;
      end;
    end;
  // Check whether the task comes to processor
  for I := 0 to ProcNum - 1 do
    if Procs[I].Task = nil then
    begin
      // If common queue
      for J := 0 to CommonQueue.Count - 1 do
      begin
        PT := CommonQueue[J];
        if PT.ForProcessor = I then
        begin
          Procs[I].Task := PT;
          Procs[I].TactsCompleted := 0;
          CommonQueue.Delete(J);
          Break;
        end;
      end;
      // If separate queue
      if Procs[I].Queue.Count > 0 then
      begin
        PT := Procs[I].Queue[0];
        Procs[I].Task := PT;
        Procs[I].TactsCompleted := 0;
        Procs[I].Queue.Delete(0);
      end;
    end;
  // Update tacts
  for I := 0 to ProcNum - 1 do
  begin
    // Task in
    if Procs[I].Task <> nil then
    begin
      Inc(Procs[I].TactsCompleted);
      Inc(Procs[I].StatsTactsFilled);
    end;
    // Task in queue waiting
    for J := 0 to Procs[I].Queue.Count - 1 do
    begin
      PT := Procs[I].Queue[J];
      Inc(PT.TimeWaiting);
    end;
  end;
  for J := 0 to CommonQueue.Count - 1 do
  begin
    PT := CommonQueue[J];
    Inc(PT.TimeWaiting);
  end;
  // Increase step
  Inc(MD.Step);
end;

// Make modelling steps
procedure TForm1.MD_Go(UpdateAll: Boolean);
begin
  MD.Paused := False;
  repeat
    MD_Step;
    MD_UpdateVisuals(UpdateAll);
    Application.ProcessMessages;
  until MD.Paused;
end;

// Clears all modelling allocated memory
procedure TForm1.MD_Clear;
var
  I: Integer;
begin
  for I := 0 to ProcNum - 1 do
    FreeProcessor(I);
  MD.Started := False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UnInitEverything;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitEverything;
end;

// Returns processor workload
function TForm1.StatsProcWorkLoad(Index: Integer): Real;
begin
  if MD.Step = 0 then
    Result := 0 else
    Result := Procs[Index].StatsTactsFilled / MD.Step;
end;

// Wait time
function TForm1.StatsWaitTime: Real;
var
  PT: PTask;
  TotalTasks: Integer;
  TotalTimeWaited: Integer;
  I, J: Integer;
begin
  TotalTasks := MD.Stats.NumWentAway;
  TotalTimeWaited := MD.Stats.TimeWaited;
  // Common queue
  Inc(TotalTasks, CommonQueue.Count);
  for I := 0 to CommonQueue.Count - 1 do
  begin
    PT := CommonQueue[I];
    Inc(TotalTimeWaited, PT.TimeWaiting);
  end;
  // Separate queues and processor
  for I := 0 to ProcNum - 1 do
  begin
    // In processor
    if Procs[I].Task <> nil then
    begin
      Inc(TotalTasks, 1);
      Inc(TotalTimeWaited, Procs[I].Task.TimeWaiting);
    end;
    // Queue
    Inc(TotalTasks, Procs[I].Queue.Count);
    for J := 0 to Procs[I].Queue.Count - 1 do
    begin
      // Queue
      PT := Procs[I].Queue[J];
      Inc(TotalTimeWaited, PT.TimeWaiting);
    end;
  end;
  // Result
  if TotalTasks = 0 then
    Result := 0 else
    Result := TotalTimeWaited / TotalTasks;
end;

// Effectiveness
function TForm1.StatsEffectiveness: Real;
var
  TotalTasks: Integer;
  I: Integer;
begin
  TotalTasks := MD.Stats.NumWentAway;
  // Common queue
  Inc(TotalTasks, CommonQueue.Count);
  // Separate queues and processor
  for I := 0 to ProcNum - 1 do
  begin
    // In processor
    if Procs[I].Task <> nil then
    begin
      Inc(TotalTasks, 1);
    end;
    // Queue
    Inc(TotalTasks, Procs[I].Queue.Count);
  end;
  // Result
  if TotalTasks = 0 then
    Result := 0 else
    Result := MD.Stats.NumWentAway / TotalTasks;
end;

function TForm1.StatsServeTime: Real;
begin
  // Result
  if MD.Stats.NumWentAway = 0 then
    Result := 0 else
    Result := MD.Stats.TimeServe / MD.Stats.NumWentAway;
end;

// Puts task to string
function TForm1.PutTaskToSt(PT: PTask; UseForProcessor: Boolean): string;
begin
  Result := 'Задача ' + IntToStr(PT.Id) + EOFL;
  Result := Result + 'Пришла в: ' + IntToStr(PT.TimeCameAt) + EOFL;
  Result := Result + 'Операций: ' + IntToStr(PT.OpsCompleted) + '/' + IntToStr(PT.Ops) + EOFL;
  Result := Result + 'Ожидание: ' + IntToStr(PT.TimeWaiting);
  if UseForProcessor then
    Result := Result + EOFL + 'Назначена на: ' + IntToStr(PT.ForProcessor + 1);
end;

// Frees all visuals
procedure TForm1.MDV_FreeVisuals;
begin
end;

// Inits visual elements
procedure TForm1.MDV_InitVisuals;
var
  I, J: Integer;
begin
  sgProcs.ColCount := ProcNum + 1;
  sgProcs.RowCount := SGR_QUEUEDIVIDER + 2;
  for I := 0 to sgProcs.ColCount - 1 do
    for J := 0 to sgProcs.RowCount - 1 do
      SetString(I, J, '');
  for I := 0 to ProcNum - 1 do
  begin
    sgProcs.ColWidths[SGC_FIRST + I + 1] := sgProcs.ColWidths[SGC_FIRST + 1];
    SetString(SGC_FIRST + I + 1, SGR_PROCNAME, 'Процессор ' + IntToStr(I + 1) + ' - ' + FloatToStrF(1/Procs[I].TactsOnOp, ffGeneral, 2, 2));
  end;
  // Update common queue
  if Options.QueueType = QTP_COMMON then
  begin
    sgCommonQueue.Visible := True;
    sgCommonQueue.ColCount := 2;
    sgCommonQueue.RowCount := 2;
    for I := 0 to sgCommonQueue.ColCount - 1 do
      for J := 0 to sgCommonQueue.RowCount - 1 do
        SetQString(I, J, '');
    SetQString(1, 0, 'Общая очередь');
  end
  else sgCommonQueue.Visible := False;
end;

// Updates visuals on every step
procedure TForm1.MD_UpdateVisuals(UpdateAll: Boolean);
var
  I, J: Integer;
  St: string;
  MaxQueue: Integer;
begin
  if UpdateAll then
  begin
    // Processors
    for I := 0 to ProcNum - 1 do
    begin
      if Procs[I].Task = nil then
      begin
        St := 'Свободен' + EOFL;
      end
      else begin
        St := PutTaskToSt(Procs[I].Task, False);
        St := St + EOFL + 'Тактов: ' + IntToStr(Procs[I].TactsCompleted) + '/' + IntToStr(Procs[I].TactsOnOp);
       end;
      SetString(SGC_FIRST + 1 + I, SGR_PROC, St);
      St := 'Загрузка: ' + FloatToStrF(100 * StatsProcWorkLoad(I), ffGeneral, 4, 7) +'%';
      SetString(SGC_FIRST + 1 + I, SGR_QUEUEDIVIDER, St);
    end;
    // Common queue
    if Options.QueueType = QTP_COMMON then
    begin
      if CommonQueue.Count = 0 then
      begin
        sgCommonQueue.ColCount := 2;
        sgCommonQueue.Cells[1, 1] := '';
      end
      else begin
        sgCommonQueue.ColCount := CommonQueue.Count + 1;
        for I := 0 to CommonQueue.Count - 1 do
        begin
          sgCommonQueue.ColWidths[I + 1] := sgCommonQueue.ColWidths[1];
          sgCommonQueue.Cells[I + 1, 1] := PutTaskToSt(CommonQueue[I], True);
        end;
      end;
    end;
    // Separate queues
    if Options.QueueType = QTP_SEPARATE then
    begin
      MaxQueue := 0;
      for I := 0 to ProcNum - 1 do
        if Procs[I].Queue.Count > MaxQueue then MaxQueue := Procs[I].Queue.Count;
      if MaxQueue = 0 then MaxQueue := 1;
      sgProcs.RowCount := SGR_QUEUEDIVIDER + MaxQueue + 1;
      for J := SGR_QUEUEDIVIDER + 2 to sgProcs.RowCount - 1 do
        sgProcs.RowHeights[J] := sgProcs.RowHeights[SGR_QUEUEDIVIDER + 1];
      // Put all tasks to grid
      for I := 0 to ProcNum - 1 do
      begin
        for J := 0 to Procs[I].Queue.Count - 1 do
        begin
          sgProcs.Cells[SGC_FIRST + I + 1, SGR_QUEUEDIVIDER + J + 1] := PutTaskToSt(Procs[I].Queue[J], False);
        end;
        for J := SGR_QUEUEDIVIDER + Procs[I].Queue.Count + 1 to sgProcs.RowCount - 1 do
          sgProcs.Cells[SGC_FIRST + I + 1, J] := '';
      end;
    end;
    // Stats
    lbEffect.Caption := 'Эффективность: ' + FloatToStrF(100 * StatsEffectiveness, ffGeneral, 4, 7) + '%';
    lbTimeWaited.Caption := 'Среднее время ожидания: ' + FloatToStrF(StatsWaitTime, ffGeneral, 4, 7);
    lbTimeServe.Caption := 'Среднее время обслуживания: ' + FloatToStrF(StatsServeTime, ffGeneral, 4, 7);
  end;
  // Labels
  lbStep.Caption := 'Текущий шаг: ' + IntToStr(MD.Step);
end;

procedure TForm1.btStartClick(Sender: TObject);
begin
  MDV_FreeVisuals;
  GatherValuesToOptions;
  MDV_InitVisuals;
  // Start
  if MD.Started then MD_Clear;
  MD_Start;
  MD_UpdateVisuals(True);
  UpdateModellingButtons;
end;

procedure TForm1.btStepClick(Sender: TObject);
begin
  MD_Step;
  MD_UpdateVisuals(True);
end;

procedure TForm1.btGoClick(Sender: TObject);
begin
  if MD.Paused then
  begin
    MD.Paused := False;
    UpdateModellingButtons;
    MD_Go(cxUpdateAll.Checked);
  end
  else MD_Pause;
  MD_UpdateVisuals(True);
  UpdateModellingButtons;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cbProcsChange(Sender: TObject);
begin
  // Save data to processor
  if (OldProcIndex >= 0) and (OldProcIndex < ProcNum) then
  begin
    Procs[OldProcIndex].TactsOnOp := seTactsOnOp.Value;
  end;
  // Set values of new processor
  OldProcIndex := cbProcs.ItemIndex;
  UpdateTactsOpForProcessor;
end;

procedure TForm1.seNumProcsChange(Sender: TObject);
begin
  ProcNum := seNumProcs.Value;
  UpdateVisualsProcessors(False);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    LoadConfiguration(OpenDialog.Filename);
    SetConfiguration2Visuals;    
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  if SaveDialog.Execute then
    SaveConfiguration(SaveDialog.Filename);
end;

// Puts string 2 canvas, breaking it by EOFL
procedure TForm1.PutString2Canvas(Canvas: TCanvas; Rect: TRect; St: string);
var
  St2: string;
  AddH, Pos: Integer;
begin
  Canvas.Brush.Color := clWhite;
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(Rect);
  Canvas.Font.Color := clBlack;
  AddH := 2;
  repeat
    if St <> '' then
    begin
      Pos := AnsiPos(EOFL, St);
      if Pos > 0 then
      begin
        St2 := Copy(St, 1, Pos - 1);
        Delete(St, 1, Pos + Length(EOFL) - 1);
      end
      else begin
        St2 := St;
        St := '';
      end;
      Canvas.TextOut(Rect.Left + 2, Rect.Top + AddH, St2);
      Inc(AddH, sgProcs.Canvas.TextHeight(St2));
    end;
  until St = '';
end;

procedure TForm1.sgProcsDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ACol = 0) or (ARow = 0) then Exit;
  PutString2Canvas(sgProcs.Canvas, Rect, sgProcs.Cells[ACol, ARow]);
end;

procedure TForm1.sgCommonQueueDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (ACol = 0) or (ARow = 0) then Exit;
  PutString2Canvas(sgCommonQueue.Canvas, Rect, sgCommonQueue.Cells[ACol, ARow]);
end;

procedure TForm1.pcMainChange(Sender: TObject);
begin
  if (pcMain.ActivePage = tsModelling) and MD.Started then
    btStart.Click
end;

initialization
  Randomize;
  // Get path
  Path := ExtractFilePath(ParamStr(0));
  if (Length(Path) > 0) and (Path[Length(Path)] <> '\') then
    Path := Path + '\';

end.
