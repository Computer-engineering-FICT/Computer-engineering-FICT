unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,inifiles,
  StdCtrls, Math, Gauges, ComCtrls, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edModellingTime: TEdit;
    meResults: TMemo;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    btBeginModel: TButton;
    btNextStep: TButton;
    lbCurrentTact: TLabel;
    Label3: TLabel;
    meProcessors: TMemo;
    lbTasks: TLabel;
    meTasks: TMemo;
    gaCompleted: TGauge;
    lbCompleted: TLabel;
    meEvents: TMemo;
    Label4: TLabel;
    btRunToEvent: TButton;
    PageControl: TPageControl;
    tsSettings: TTabSheet;
    tsRun: TTabSheet;
    Label5: TLabel;
    edMaxPriority: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Button2: TButton;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    edIntensityFrom: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edIntensityTo: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edTimeTaskFrom: TEdit;
    Label11: TLabel;
    edTimeTaskTo: TEdit;
    GroupBox5: TGroupBox;
    edSingleIntensity: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edIntensityStep: TEdit;
    TabSheet1: TTabSheet;
    chProcBusy: TChart;
    Series1: TBarSeries;
    Label14: TLabel;
    edMaxQuant1: TEdit;
    cbTimeWait: TComboBox;
    Label15: TLabel;
    Chart1: TChart;
    BarSeries1: TBarSeries;
    Label16: TLabel;
    cbTaskPriorityCameToLeft: TComboBox;
    TabSheet2: TTabSheet;
    Chart2: TChart;
    BarSeries2: TBarSeries;
    cbTasksToAllTasks: TComboBox;
    Label17: TLabel;
    Chart3: TChart;
    BarSeries3: TBarSeries;
    Label18: TLabel;
    cbMidTimeWait: TComboBox;
    TabSheet3: TTabSheet;
    Chart4: TChart;
    BarSeries4: TBarSeries;
    cbDisp: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edMaxQuant2: TEdit;
    lbMiddleTime: TLabel;
    Label22: TLabel;
    edAddTacts: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure btBeginModelClick(Sender: TObject);
    procedure btNextStepClick(Sender: TObject);
    procedure btRunToEventClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cbTimeWaitChange(Sender: TObject);
    procedure cbTaskPriorityCameToLeftChange(Sender: TObject);
    procedure cbTasksToAllTasksChange(Sender: TObject);
    procedure cbMidTimeWaitChange(Sender: TObject);
    procedure cbDispChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

const
EOFL=#13#10;

MAX_QUEUE_NUM=5000;
NUM_PROCESSORS=2;

//Priorities
PRI_USUAL=0;

//Changed interval time
CHI_ADDTIME = 20;

type
     TStatArray=array[0..999] of real;
     TTask=record
         Id:integer;
         TimeNeeded:integer;
         TimeCompleted:integer;
         TimeFrom:integer;
         Priority:byte;
         //Misc field
         LastPos:Integer;
     end;
     PTask = ^TTask;
     TProcessor=record
         Free:boolean;
         Task:TTask;
         Quant:integer;
         QuantCompleted:integer;
     end;
     TTaskEvent=record
         Happened:Boolean;
         Task:TTask;
     end;

const
MAX_TIME_WAIT_DISP=10000;
MAX_PRIORITY=10;

type
   TTimeDispersion=array [0..MAX_TIME_WAIT_DISP] of integer;

var path:string;
    Opts:record
       ModellingTime:integer;
       MaxPriority:integer;
       TimeTaskFrom,TimeTaskTo:integer;
       IntensityFrom,IntensityTo,IntensityStep:integer;
       MaxQuants:array [0..NUM_PROCESSORS-1] of Integer;
       AddTacts: integer;
       SingleIntensity:Integer;
    end;
    //Modelling system
    Processors:array [0..NUM_PROCESSORS-1] of TProcessor;
    CurrentTaskId:Integer;
    Stats:record
       MiddleWaitTime:real;
       TimeRun:integer;
       TotalTasksCame:int64;
       TotalTasksInQueue:int64;
       TotalTasksLeft:integer;
       Procs:array [0..NUM_PROCESSORS-1] of record
          TotalIdleTime:integer;
          TotalBusyTime:integer;
       end;
       Tasks:array [0..255] of record
          TotalTasksCame:integer;
          TotalTasksLeft:integer;
          TotalTimeWait:int64;
          TasksAtQueueCurrently:integer;
          TimeWaitAtQueueCurrently:int64;
       end;
       TimeWaitDispersion:array [0..MAX_PRIORITY] of TTimeDispersion;
       TimeWaitQueueDispersion: array [0..MAX_PRIORITY] of TTimeDispersion;
       MaxTimeWait:integer;
    end;
    Modelling:record
       CurrentTime:Integer;
       FatalError:boolean;
       CurrentIntensity:integer;
       UpdateFinalStatsAtStep:boolean;
       UseSingleIntensity:boolean;
    end;
    Events:record
       Came:TTaskEvent;
       ProcEvents:array [0..NUM_PROCESSORS] of record
          Completed:TTaskEvent;
          Back:TTaskEvent;
          CameIn:TTaskEvent;
       end;
    end;
    QueueList:TList=nil;
    //Results
    Procs:array [0..NUM_PROCESSORS-1] of TStatArray;
    Intensities:TStatArray;
    Results:record
       NumStarts:integer;
    end;
    RTasks:array [0..255] of record
       LeftToCame:TStatArray;
       LeftToAllLeft:TStatArray;
       TimeWait:TStatArray;
    end;

//Gets path to file
function GetPath(st:string):string;
var i:word;
begin
i:=length(st)+1;
repeat
   dec(i)
until (i=0)or(st[i]='\');
getpath:=copy(st,1,i)
end;

//Saves current options
procedure SaveOptions;
var fini:tinifile;
begin
fini:=tinifile.create(path+'SysProg1.ini');
fini.WriteString('Options','ModellingTime',form1.edModellingTime.Text);
fini.WriteString('Options','MaxPriority',form1.edMaxPriority.Text);
fini.WriteString('Options','SingleIntensity',form1.edSingleIntensity.Text);
fini.WriteString('Options','IntensityFrom',form1.edIntensityFrom.Text);
fini.WriteString('Options','IntensityTo',form1.edIntensityTo.Text);
fini.WriteString('Options','TimeTaskFrom',form1.edTimeTaskFrom.Text);
fini.WriteString('Options','TimeTaskTo',form1.edTimeTaskTo.Text);
fini.WriteString('Options','IntensityStep',form1.edIntensityStep.Text);
fini.WriteString('Options','MaxQuant1',form1.edMaxQuant1.Text);
fini.WriteString('Options','MaxQuant2',form1.edMaxQuant2.Text);
fini.WriteString('Options','AddTacts',form1.edAddTacts.Text);
fini.updatefile;
fini.free;
end;

//Loads system options
procedure LoadOptions;
var fini:tinifile;
begin
fini:=tinifile.create(path+'SysProg1.ini');
//Modelling time
form1.edModellingTime.Text:=fini.readstring('Options','ModellingTime','10000');
form1.edMaxPriority.Text:=fini.readstring('Options','MaxPriority','2');
form1.edSingleIntensity.Text:=fini.readstring('Options','SingleIntensity','21');
form1.edIntensityFrom.Text:=fini.readstring('Options','IntensityFrom','20');
form1.edIntensityTo.Text:=fini.readstring('Options','IntensityTo','25');
form1.edIntensityStep.Text:=fini.readstring('Options','IntensityStep','1');
form1.edTimeTaskFrom.Text:=fini.readstring('Options','TimeTaskFrom','40');
form1.edTimeTaskTo.Text:=fini.readstring('Options','TimeTaskTo','41');
form1.edMaxQuant1.Text:=fini.readstring('Options','MaxQuant1','20');
form1.edMaxQuant2.Text:=fini.readstring('Options','MaxQuant2','20');
form1.edAddTacts.Text:=fini.readstring('Options','AddTacts','10');
//Free
fini.free;
end;

procedure DenyGraphics(OneRunToo:boolean); forward;

//Inits System
procedure InitEverything;
var i:integer;
begin
LoadOptions;
form1.PageControl.ActivePage:=form1.tsSettings;
Results.NumStarts:=0;
form1.cbTimeWait.Clear;
form1.cbTimeWait.Items.Add('Система в общем');
for i:=1 to NUM_PROCESSORS do
 form1.cbTimeWait.Items.Add('Процессор '+inttostr(i));
DenyGraphics(true);
end;

//Completes opts structure from visual
//controls
function GatherVisualOptions:boolean;
var st:string;
    i:integer;
begin
st:='';
try
   Opts.ModellingTime:=strtoint(form1.edModellingTime.Text);
   Opts.MaxPriority:=strtoint(form1.edMaxPriority.Text);
   Opts.SingleIntensity:=strtoint(form1.edSingleIntensity.Text);
   Opts.IntensityFrom:=strtoint(form1.edIntensityFrom.Text);
   Opts.IntensityTo:=strtoint(form1.edIntensityTo.Text);
   Opts.IntensityStep:=strtoint(form1.edIntensityStep.Text);
   Opts.TimeTaskFrom:=strtoint(form1.edTimeTaskFrom.Text);
   Opts.TimeTaskTo:=strtoint(form1.edTimeTaskTo.Text);
   for i:=0 to NUM_PROCESSORS-1 do
      Opts.MaxQuants[i]:=20;
   Opts.MaxQuants[0]:=strtoint(form1.edMaxQuant1.Text);
   Opts.MaxQuants[1]:=strtoint(form1.edMaxQuant2.Text);
   Opts.AddTacts := strtoint(form1.edAddTacts.Text);
except
   st:='Ошибка во введенных данных для моделирования';
end;
//Check
if (Opts.ModellingTime<=0)and(st='') then st:='Неверное время моделирования';
if (Opts.MaxPriority<0)and(st='') then st:='Неверный максимальный приоритет';
if (Opts.SingleIntensity<=0)and(st='') then st:='Неверная одиночная интенсивность';
if (Opts.TimeTaskFrom<=0)and(st='') then st:='Неверное значение Тактов на задачу';
if (Opts.TimeTaskTo<=0)and(st='') then st:='Неверное значение Тактов на задачу';
if (Opts.IntensityFrom<=0)and(st='') then st:='Неверное значение Интенсивность';
if (Opts.IntensityTo<=0)and(st='') then st:='Неверное значение Интенсивность';
if (Opts.IntensityStep<=0)and(st='') then st:='Неверное значение Интенсивность Шаг';
if (Opts.TimeTaskFrom>Opts.TimeTaskTo)and(st='') then st:='Неверная комбинация значений Тактов на задачу';
if (Opts.IntensityFrom>Opts.IntensityTo)and(st='') then st:='Неверная комбинация значений Интенсивность';
if (Opts.MaxQuants[0]<=0)and(st='') then st:='Неверное значение Максималььный квант 1';
if (Opts.MaxQuants[1]<=0)and(st='') then st:='Неверное значение Максималььный квант 2';
//Go
if st<>'' then ShowMessage(st);
Result:=st='';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
InitEverything;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveOptions;
if QueueList<>nil then QueueList.Free;
end;

//Gets random value between (including)
//values
function RandomFromTo(VFrom,VTo:Integer):integer;
begin
Result:=Random(VTo-VFrom+1)+VFrom;
end;

//Converts string list to memo
procedure ListToMemo(List:TStringList;Memo:TMemo);
var st:string;
    i:integer;
begin
st:='';
for i:=0 to List.Count-1 do
 st:=st+List[i]+#13+#10;
Memo.Text:=st;
end;

//Sorting proc for task queue
function TaskQueue_SortingFunc(P1,P2:Pointer):integer;
var PT1,PT2:PTask;
begin
PT1:=P1;
PT2:=P2;
//By priorities
if PT1^.Priority>PT2^.Priority then begin
   Result:=-1;
   exit;
end;
if PT1^.Priority<PT2^.Priority then begin
   Result:=+1;
   exit;
end;
//By number
if PT1^.LastPos>PT2^.LastPos then begin
   Result:=+1;
   exit
end;
if PT1^.LastPos<PT2^.LastPos then begin
   Result:=-1;
   exit
end;
Result:=0;
end;

//Adds task to tail
procedure TaskQueue_AddToTail(Task:TTask);
var PT:PTask;
    i:integer;
begin
New(PT);
PT^:=Task;
QueueList.Add(PT);
//Sort
for i:=0 to QueueList.Count-1 do begin
   PTask(QueueList.Items[i]).LastPos:=i;
end;
QueueList.Sort(TaskQueue_SortingFunc);
end;

//Gets task by index
function TaskQueue_GetTask(Index:Integer):TTask;
var PT:PTask;
begin
PT:=QueueList.Items[Index];
Result:=PT^;
end;

//Removes task from beginning
procedure TaskQueue_RemoveTaskFromBeginning;
var PT:PTask;
begin
PT:=QueueList.Items[0];
QueueList.Delete(0);
Dispose(PT);
end;

//Gets number of items in task queue
function TaskQueue_GetNum:integer;
begin
Result:=QueueList.Count;
end;

//Calculates middle time of waiting of
//tasks in queue
function Stats_MiddleWaitTime:real;
var Task: TTask;
    i:integer;
begin
Result:=0;
if TaskQueue_GetNum=0 then exit;
for i:=0 to TaskQueue_GetNum-1 do begin
   Task := TaskQueue_GetTask(i);
   Result := Result + Modelling.CurrentTime - Task.TimeFrom - Task.TimeCompleted -1;
end;
Result:=Result/TaskQueue_GetNum;
end;

//Adds 1 to task came counter
procedure Stats_IncTaskCame;
begin
inc(Stats.TotalTasksCame);
end;

procedure Stats_IncTaskLeft;
begin
inc(Stats.TotalTasksLeft);
end;

//Completes stat timing variables
procedure Stats_UpdateTiming;
var i:integer;
begin
inc(Stats.TimeRun);
inc(Stats.TotalTasksInQueue,TaskQueue_GetNum);
for i:=0 to NUM_PROCESSORS-1 do begin
   if Processors[i].Free then inc(Stats.Procs[i].TotalIdleTime)
   else inc(Stats.Procs[i].TotalBusyTime);
end;
Stats.MiddleWaitTime:=Stats_MiddleWaitTime;
end;

procedure Stats_UpdateTimeWaitByQueue;
var i:integer;
    PT:PTask;
    timewait:integer;
begin
for i:=0 to Opts.MaxPriority do begin
   Stats.Tasks[i].TasksAtQueueCurrently:=0;
   Stats.Tasks[i].TimeWaitAtQueueCurrently:=0;
end;
if Modelling.UseSingleIntensity then begin
   FillChar(Stats.TimeWaitQueueDispersion,sizeof(Stats.TimeWaitQueueDispersion),0);
end;
//
for i:=0 to QueueList.Count-1 do begin
   PT:=QueueList.Items[i];
   TimeWait:=Modelling.CurrentTime-PT^.TimeFrom-PT^.TimeCompleted;
   inc(Stats.Tasks[PT^.Priority].TasksAtQueueCurrently);
   inc(Stats.Tasks[PT^.Priority].TimeWaitAtQueueCurrently,TimeWait);
   inc(Stats.TimeWaitQueueDispersion[PT^.Priority,TimeWait]);
   Stats.MaxTimeWait:=Max(Stats.MaxTimeWait,TimeWait);
end;
end;

procedure Stats_UpdateTimeWaitByTaskLeft(Task:TTask);
var timewait:integer;
begin
timewait:=Modelling.CurrentTime-Task.TimeFrom-Task.TimeNeeded;
inc(Stats.Tasks[Task.Priority].TotalTasksLeft);
inc(Stats.Tasks[Task.Priority].TotalTimeWait,timewait);
inc(Stats.TimeWaitDispersion[Task.Priority,TimeWait]);
Stats.MaxTimeWait:=Max(Stats.MaxTimeWait,TimeWait);
end;

//Checks and adds task to queue
procedure Task_CheckAddToQueue(Time:integer);
var Task:TTask;
begin
if (time mod Modelling.CurrentIntensity) = 0 then begin
   Task.Id:=CurrentTaskId+1;
   Task.TimeNeeded:=RandomFromTo(Opts.TimeTaskFrom,Opts.TimeTaskTo);
   Task.TimeCompleted:=0;
   Task.TimeFrom:=Time;
   Task.Priority:=Random(Opts.MaxPriority+1);
   TaskQueue_AddToTail(Task);
   inc(Stats.Tasks[Task.Priority].TotalTasksCame);
   Stats_IncTaskCame;
   inc(CurrentTaskId);
   //Events
   Events.Came.Happened:=true;
   Events.Came.Task:=Task;
end;
end;

//Checks to increase time of processor
//being loaded with task
procedure ProcessorAndTaskIn_CheckIncTime(Index:integer);
begin
with Processors[Index] do begin
//
if Free then exit;
inc(QuantCompleted);
inc(Task.TimeCompleted);
//
end;
end;

//Checks to free processor from task
procedure Processor_CheckToFree(index:byte);
begin
with Processors[Index] do begin
//
if Free then exit;
//Check to end task
if Task.TimeCompleted=Task.TimeNeeded then begin
   Free:=true;
   Stats_IncTaskLeft;
   Stats_UpdateTimeWaitByTaskLeft(Task);
   //Events
   Events.ProcEvents[Index].Completed.Happened:=true;
   Events.ProcEvents[Index].Completed.Task:=Task;
   exit;
end;
//Check to interrupt task
if QuantCompleted=Quant then begin
   Free:=true;
   TaskQueue_AddToTail(Task);
   //Events
   Events.ProcEvents[Index].Back.Happened:=true;
   Events.ProcEvents[Index].Back.Task:=Task;
end;
//
end;
end;

//Checks to load processor with task
procedure Processor_CheckToLoad(Index:Integer);
var QuantUpdated: integer;
begin
with Processors[Index] do begin
//
if not Free then exit;
if TaskQueue_GetNum=0 then exit;
//Load task
Task:=TaskQueue_GetTask(0);
QuantUpdated := Opts.MaxQuants[Index];
if Stats.MiddleWaitTime<(Modelling.CurrentTime - Task.TimeFrom - Task.TimeCompleted-1) then
 QuantUpdated:=QuantUpdated + Opts.AddTacts;
Quant:=Min(QuantUpdated,Task.TimeNeeded-Task.TimeCompleted);
QuantCompleted:=0;
Free:=false;
TaskQueue_RemoveTaskFromBeginning;
//Events
Events.ProcEvents[Index].CameIn.Happened:=true;
Events.ProcEvents[Index].CameIn.Task:=Task;
//
end;
end;

//Inits events structure
procedure Modelling_InitEvents;
var i:integer;
begin
Events.Came.Happened:=False;
for i:=0 to NUM_PROCESSORS-1 do begin
   Events.ProcEvents[I].Completed.Happened:=false;
   Events.ProcEvents[I].Back.Happened:=false;
   Events.ProcEvents[I].CameIn.Happened:=false;
end;
end;

//Inits modelling
function Modelling_Init(UseSingleIntensity:boolean;NumStarts:integer):boolean;
var i:integer;
begin
Result:=false;
//Init system
if not GatherVisualOptions then exit;
//Init vars
for i:=0 to NUM_PROCESSORS-1 do
 Processors[i].Free:=true;
CurrentTaskId:=0;
Modelling.CurrentTime:=0;
Modelling.FatalError:=false;
Modelling.UseSingleIntensity:=UseSingleIntensity;
if UseSingleIntensity then Modelling.CurrentIntensity:=Opts.SingleIntensity
else begin
   Modelling.CurrentIntensity:=Opts.IntensityFrom+Opts.IntensityStep*NumStarts;
   if Modelling.CurrentIntensity>Opts.IntensityTo then exit;
end;
//Queue
if QueueList<>nil then QueueList.Free;
QueueList:=TList.Create;
//Events
Modelling_InitEvents;
//Stats
Stats.TimeRun:=0;
Stats.TotalTasksCame:=0;
Stats.TotalTasksInQueue:=0;
Stats.TotalTasksLeft:=0;
for i:=0 to Opts.MaxPriority do begin
   Stats.Tasks[i].TotalTasksCame:=0;
   Stats.Tasks[i].TotalTimeWait:=0;
   Stats.Tasks[i].TotalTasksLeft:=0;
   Stats.Tasks[i].TasksAtQueueCurrently:=0;
   Stats.Tasks[i].TimeWaitAtQueueCurrently:=0;
end;
for i:=0 to NUM_PROCESSORS-1 do begin
   Stats.Procs[i].TotalBusyTime:=0;
   Stats.Procs[i].TotalIdleTime:=0;
end;
Stats.MiddleWaitTime:=0;
if UseSingleIntensity then begin
   Stats.MaxTimeWait:=0;
   FillChar(Stats.TimeWaitDispersion,sizeof(Stats.TimeWaitDispersion),0);
   FillChar(Stats.TimeWaitQueueDispersion,sizeof(Stats.TimeWaitQueueDispersion),0);
end;
Result:=true;
end;

//Completes next step of modelling
procedure Modelling_NextStep;
var i:integer;
begin
//Init events
Modelling_InitEvents;
//Check maybe task comes
Task_CheckAddToQueue(Modelling.CurrentTime);
//Add counters to quants in processors
for i:=0 to NUM_PROCESSORS-1 do
 ProcessorAndTaskIn_CheckIncTime(i);
//Check processor to free
for i:=0 to NUM_PROCESSORS-1 do
 Processor_CheckToFree(i);
//Check processor to load with tash
for i:=0 to NUM_PROCESSORS-1 do
 Processor_CheckToLoad(i);
//Update timer
inc(Modelling.CurrentTime);
//Update stats
Stats_UpdateTiming;
if Modelling.UpdateFinalStatsAtStep then Stats_UpdateTimeWaitByQueue;
end;

//Checks events
function Modelling_EventsHappened:boolean;
var i:integer;
begin
Result:=false;
if Events.Came.Happened then Result:=true;
for i:=0 to NUM_PROCESSORS do begin
   if Events.ProcEvents[i].Completed.Happened then Result:=true;
   if Events.ProcEvents[i].Back.Happened then Result:=true;
   if Events.ProcEvents[i].CameIn.Happened then Result:=true;
end;
end;

//Logs result
procedure LogLine(st:string);
begin
form1.meResults.Lines.Add(st);
end;

//Outputs results
procedure OutputResults;
var i:integer;
    BusyTime:integer;
    TimeWait:real;
    TotalTasks:integer;
    TotalTime:int64;
    Mus:Real;
    List:TStringList;
begin
List:=TStringList.Create;
if Stats.TimeRun=0 then exit;
List.Add('Всего пришло заявок: '+inttostr(Stats.TotalTasksCame));
List.Add('Всего выполнено заявок: '+inttostr(Stats.TotalTasksLeft));
List.Add('Заявок в очереди в среднем: '+FloatToStr(Stats.TotalTasksInQueue/Stats.TimeRun));
for i:=0 to NUM_PROCESSORS-1 do begin
   List.Add('');
   List.Add('Процессор '+inttostr(i+1));
   BusyTime:=round(Stats.Procs[i].TotalBusyTime*100/Stats.TimeRun);
   List.Add(' занят - '+inttostr(BusyTime)+'%');
   List.Add(' свободен - '+inttostr(100-BusyTime)+'%');
end;
List.Add('');
List.Add('Заявки по приоритетам');
for i:=Opts.MaxPriority downto 0 do begin
   List.Add('');
   List.Add('Приоритет '+inttostr(i));
   TotalTasks:=Stats.Tasks[i].TotalTasksLeft+Stats.Tasks[i].TasksAtQueueCurrently;
   TotalTime:=Stats.Tasks[i].TotalTimeWait+Stats.Tasks[i].TimeWaitAtQueueCurrently;
   if TotalTasks<>0 then TimeWait:=TotalTime/TotalTasks
   else TimeWait:=0;
   List.Add(' среднее время в очереди: '+FloatToStr(TimeWait));
   if Stats.TotalTasksLeft<>0 then Mus:=Stats.Tasks[i].TotalTasksLeft/Stats.TotalTasksLeft
   else Mus:=0;
   List.Add(' выполненные ко всем выполненным: '+inttostr(round(Mus*100))+'%');
   if Stats.Tasks[i].TotalTasksCame<>0 then Mus:=Stats.Tasks[i].TotalTasksLeft/Stats.Tasks[i].TotalTasksCame
   else Mus:=0;
   List.Add(' выполненные к таким пришедшим: '+inttostr(round(Mus*100))+'%');
end;
ListToMemo(List,form1.meResults);
List.Free;
end;

procedure OutputTaskToList(List:TStringList;Task:TTask);
begin
List.Add('Заявка '+inttostr(Task.Id));
List.Add(' необходимо времени: '+inttostr(Task.TimeNeeded));
List.Add(' потрачено времени: '+inttostr(Task.TimeCompleted));
List.Add(' находится в системе с: '+inttostr(Task.TimeFrom));
List.Add(' время ожидания: '+inttostr(Modelling.CurrentTime - Task.TimeFrom - Task.TimeCompleted -1));
List.Add(' приоритет: '+inttostr(Task.Priority));
end;

//Draws graphics
procedure OutputGraphics1;
var ind:integer;
    i,j:integer;
    sum:real;
begin
form1.Series1.Clear;
ind:=form1.cbTimeWait.ItemIndex;
//Business of processor
if ind<>0 then begin
   for i:=0 to Results.NumStarts-1 do
    form1.Series1.add(Procs[ind-1,i],inttostr(round(Intensities[i])),clYellow);
end
else begin
   for i:=0 to Results.NumStarts-1 do begin
      sum:=0;
      for j:=0 to NUM_PROCESSORS-1 do
       sum:=sum+Procs[j,i];
      form1.Series1.add(sum/NUM_PROCESSORS,inttostr(round(Intensities[i])),clYellow);
   end;
end;
end;

procedure OutputGraphics2;
var ind:integer;
    i,j:integer;
    sum:real;
begin
form1.BarSeries1.Clear;
ind:=form1.cbTaskPriorityCameToLeft.ItemIndex;
//
if ind<>0 then begin
   for i:=0 to Results.NumStarts-1 do
    form1.BarSeries1.add(RTasks[Opts.MaxPriority-ind+1].LeftToCame[i],inttostr(round(Intensities[i])),clYellow);
end
else begin
   for i:=0 to Results.NumStarts-1 do begin
      sum:=0;
      for j:=0 to Opts.MaxPriority do
       sum:=sum+RTasks[j].LeftToCame[i];
      sum:=round(sum/(Opts.MaxPriority+1));
      form1.BarSeries1.add(sum,inttostr(round(Intensities[i])),clYellow);
   end;
end;
end;

procedure OutputGraphics3;
var ind:integer;
    i:integer;
begin
form1.BarSeries2.Clear;
ind:=form1.cbTasksToAllTasks.ItemIndex;
//
for i:=0 to Results.NumStarts-1 do
 form1.BarSeries2.add(RTasks[Opts.MaxPriority-ind].LeftToAllLeft[i],inttostr(round(Intensities[i])),clYellow);
end;

procedure OutputGraphics4;
var ind:integer;
    i,j:integer;
    sum:real;
begin
form1.BarSeries3.Clear;
ind:=form1.cbMidTimeWait.ItemIndex;
//
if ind<>0 then begin
   for i:=0 to Results.NumStarts-1 do
    form1.BarSeries3.add(RTasks[Opts.MaxPriority-ind+1].TimeWait[i],inttostr(round(Intensities[i])),clYellow);
end
else begin
   for i:=0 to Results.NumStarts-1 do begin
      sum:=0;
      for j:=0 to Opts.MaxPriority do
       sum:=sum+RTasks[j].TimeWait[i];
      sum:=round(sum/(Opts.MaxPriority+1));
      form1.BarSeries3.add(sum,inttostr(round(Intensities[i])),clYellow);
   end;
end;
end;

procedure OutputGraphics5;
const MAX_NUM_BARS=70;
var ind:integer;
    i,j:integer;
    sum:real;
    numsums,currsum:integer;
begin
form1.BarSeries4.Clear;
ind:=form1.cbDisp.ItemIndex;
//
numsums:=0;
currsum:=0;
if ind<>0 then begin
   for i:=0 to Stats.MaxTimeWait do begin
      //Checked
      sum:=Stats.TimeWaitDispersion[Opts.MaxPriority-ind+1,i];
      sum:=sum+Stats.TimeWaitQueueDispersion[Opts.MaxPriority-ind+1,i];
      if sum<>0 then inc(numsums);
   end;
   for i:=0 to Stats.MaxTimeWait do begin
      //Checked
      sum:=Stats.TimeWaitDispersion[Opts.MaxPriority-ind+1,i];
      sum:=sum+Stats.TimeWaitQueueDispersion[Opts.MaxPriority-ind+1,i];
      if (sum<>0)and((currsum mod round((numsums/MAX_NUM_BARS)+1))=0)
       then form1.BarSeries4.add(sum,inttostr(round(i)),clYellow);
      if sum<>0 then inc(currsum);
   end;
end
else begin
   for i:=0 to Stats.MaxTimeWait do begin
      //Check
      sum:=0;
      for j:=0 to Opts.MaxPriority do begin
         sum:=sum+Stats.TimeWaitDispersion[j,i];
         sum:=sum+Stats.TimeWaitQueueDispersion[j,i];
      end;
      if sum<>0 then inc(numsums);
   end;
   for i:=0 to Stats.MaxTimeWait do begin
      sum:=0;
      for j:=0 to Opts.MaxPriority do begin
         sum:=sum+Stats.TimeWaitDispersion[j,i];
         sum:=sum+Stats.TimeWaitQueueDispersion[j,i];
      end;
      if (sum<>0)and((currsum mod round((numsums/MAX_NUM_BARS)+1))=0)
       then form1.BarSeries4.add(sum,inttostr(round(i)),clYellow);
      if sum<>0 then inc(currsum);
   end;
end;
end;

procedure DenyGraphics(OneRunToo:boolean);
begin
form1.BarSeries1.Clear;
form1.Series1.Clear;
form1.cbTaskPriorityCameToLeft.enabled:=false;
form1.cbTimeWait.enabled:=false;
form1.cbTasksToAllTasks.enabled:=false;
form1.cbMidTimeWait.enabled:=false;
form1.cbDisp.enabled:=not OneRunToo;
end;

procedure AllowGraphics(OneRunToo:boolean);
begin
form1.cbTaskPriorityCameToLeft.enabled:=true;
form1.cbTimeWait.enabled:=true;
form1.cbTasksToAllTasks.enabled:=true;
form1.cbMidTimeWait.enabled:=true;
form1.cbDisp.enabled:=OneRunToo;
end;

//Outputs only current for this step results
procedure OutputCurrentResults;
var i:integer;
    List:TStringList;
begin
with form1 do begin
//
lbCurrentTact.Caption:='Текущий такт: '+inttostr(Modelling.CurrentTime);
//Processors
List:=TStringList.Create;
for i:=0 to NUM_PROCESSORS-1 do begin
   List.Add('Процессор '+inttostr(i+1));
   if Processors[i].free then List.Add(' свободен')
   else begin
      List.Add(' занят');
      List.Add(' выделен квант: '+inttostr(Processors[i].Quant));
      List.Add(' выполнено '+inttostr(Processors[i].QuantCompleted));
      OutputTaskToList(List,Processors[i].Task);
   end;
   List.Add('');
end;
//Output Result
ListToMemo(List,meProcessors);
//Tasks
List.Clear;
lbTasks.Caption:='Очередь: '+inttostr(TaskQueue_GetNum)+' заявок';
for i:=0 to Min(TaskQueue_GetNum-1,30) do begin
   OutputTaskToList(List,TaskQueue_GetTask(i));
   List.Add('');
end;
ListToMemo(List,meTasks);
//Events
List.Clear;
with Events do begin
   //Task came
   if Came.Happened then begin
      List.Add('В очередь добавлена заявка '+inttostr(Came.Task.Id));
      List.Add('');
   end;
   //Task completed or interrupted
   for i:=0 to NUM_PROCESSORS-1 do begin
      if ProcEvents[i].Completed.Happened then begin
         List.Add('В процессоре '+inttostr(i+1)+' обслужена заявка '+inttostr(ProcEvents[i].Completed.Task.Id));
         List.Add('');
      end;
      if ProcEvents[i].Back.Happened then begin
         List.Add('В процессоре '+inttostr(i+1)+' прервана заявка '+inttostr(ProcEvents[i].Back.Task.Id));
         List.Add('');
      end;
   end;
   //Task loaded to processor
   for i:=0 to NUM_PROCESSORS-1 do begin
      if ProcEvents[i].CameIn.Happened then begin
         List.Add('Процессор '+inttostr(i+1)+' получил заявку '+inttostr(ProcEvents[i].CameIn.Task.Id));
         List.Add('');
      end;
   end;
end;
ListToMemo(List,meEvents);
//Middle time
Form1.lbMiddleTime.Caption := 'Среднее время ожидания: '+FloatToStr(Stats_MiddleWaitTime);
//Free
List.Free;
//
end;
end;

//Runs single modelling
function RunModelling:boolean;
var i:integer;
    perc:integer;
    lastperc:integer;
begin
Result:=true;
Modelling.UpdateFinalStatsAtStep:=false;
//Init
if not Modelling_Init(true,0) then begin
   Result:=false;
   exit;
end;
form1.gaCompleted.Progress:=0;
sleep(100);
//Check
if (opts.modellingtime = 0) then begin
   ShowMessage('Введите время моделироания');
   exit;
end;
lastperc:=0;
//Run
for i:=0 to opts.modellingtime-1 do begin
   Modelling_NextStep;
   if Modelling.FatalError then exit;
   perc:=(i*100) div opts.modellingtime;
   if (perc mod 10 = 0)and(perc<>lastperc) then begin
      lastperc:=perc;
      form1.gaCompleted.Progress:=perc;
   end;
end;
form1.gaCompleted.Progress:=100;
//Update Stats
Stats_UpdateTimeWaitByQueue;
//Results
OutputCurrentResults;
OutputResults;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
    OptMaxTime:integer;
    MaxNumTasks:integer;
    sum:integer;
begin
if RunModelling then begin
   btNextStep.Enabled:=true;
   btRunToEvent.Enabled:=true;
end;
DenyGraphics(false);
//
//Optimize dispersion
//
OptMaxTime:=0;
MaxNumTasks:=1;
for i:=0 to Stats.MaxTimeWait do begin
   sum:=0;
   for j:=0 to Opts.MaxPriority do begin
      sum:=sum+Stats.TimeWaitDispersion[j,i];
      sum:=sum+Stats.TimeWaitQueueDispersion[j,i];
   end;
   if sum*100/MaxNumTasks>=1 then begin
      OptMaxTime:=i;
      MaxNumTasks:=sum;
   end;
end;
Stats.MaxTimeWait:=OptMaxTime;
//
cbDisp.Clear;
cbDisp.Items.Add('Все заявки');
for i:=Opts.MaxPriority downto 0 do
 form1.cbDisp.Items.Add('Приоритет '+inttostr(i));
cbDisp.Itemindex:=0;
OutputGraphics5;
end;

procedure TForm1.btBeginModelClick(Sender: TObject);
begin
//Init
if Modelling_Init(true,0) then begin
   //Visual
   btNextStep.Enabled:=true;
   btRunToEvent.Enabled:=true;
   OutputResults;
   OutputCurrentResults;
end;
DenyGraphics(true);
end;

procedure TForm1.btNextStepClick(Sender: TObject);
begin
//Step
Modelling.UpdateFinalStatsAtStep:=true;
Modelling_NextStep;
//Results
OutputResults;
OutputCurrentResults;
DenyGraphics(true);
end;

procedure TForm1.btRunToEventClick(Sender: TObject);
begin
//Step
repeat
   Modelling_NextStep;
until Modelling_EventsHappened;
//Results
OutputResults;
OutputCurrentResults;
DenyGraphics(true);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i:integer;
    numstarts:integer;
    FreeTime:Real;
    perc,lastperc:byte;
    TotalTasks:integer;
    TotalTime:int64;
    TimeWait:real;
    Mus:real;
begin
btNextStep.Enabled:=false;
btRunToEvent.Enabled:=false;
AllowGraphics(false);
meProcessors.Clear;
meTasks.Clear;
meResults.Clear;
numstarts:=0;
lastperc:=0;
Modelling.UpdateFinalStatsAtStep:=false;
form1.gaCompleted.Progress:=0;
sleep(100);
repeat
   inc(numstarts);
   //Init
   if not Modelling_Init(false,numstarts-1) then break;
   //Run
   for i:=0 to opts.modellingtime-1 do begin
      Modelling_NextStep;
      if Modelling.FatalError then exit;
   end;
   perc:=round(Opts.IntensityStep*numstarts*100/(Opts.IntensityTo-Opts.IntensityFrom+1));
   if perc<>lastperc then begin
      form1.gaCompleted.Progress:=perc;
      lastperc:=perc;
   end;
   //Stats
   Stats_UpdateTimeWaitByQueue;
   Intensities[numstarts-1]:=Modelling.CurrentIntensity;
   for i:=0 to NUM_PROCESSORS-1 do begin
      FreeTime:=100-Stats.Procs[i].TotalBusyTime*100/Stats.TimeRun;
      Procs[i,numstarts-1]:=FreeTime;
   end;
   //Came to left
   for i:=0 to Opts.MaxPriority do begin
      TotalTasks:=Stats.Tasks[i].TotalTasksLeft+Stats.Tasks[i].TasksAtQueueCurrently;
      TotalTime:=Stats.Tasks[i].TotalTimeWait+Stats.Tasks[i].TimeWaitAtQueueCurrently;
      if TotalTasks<>0 then TimeWait:=TotalTime/TotalTasks
      else TimeWait:=0;
      RTasks[i].TimeWait[numstarts-1]:=TimeWait;
      if Stats.TotalTasksLeft<>0 then Mus:=Stats.Tasks[i].TotalTasksLeft/Stats.TotalTasksLeft
      else Mus:=0;
      RTasks[i].LeftToAllLeft[numstarts-1]:=Mus*100;
      if Stats.Tasks[i].TotalTasksCame<>0 then Mus:=Stats.Tasks[i].TotalTasksLeft/Stats.Tasks[i].TotalTasksCame
      else Mus:=0;
      RTasks[i].LeftToCame[numstarts-1]:=Mus*100;
   end;
until false;
form1.gaCompleted.Progress:=100;
//Update form
form1.cbTaskPriorityCameToLeft.Clear;
form1.cbTaskPriorityCameToLeft.Items.Add('Все заявки');
for i:=Opts.MaxPriority downto 0 do
 form1.cbTaskPriorityCameToLeft.Items.Add('Приоритет '+inttostr(i));
form1.cbTasksToAllTasks.Clear;
for i:=Opts.MaxPriority downto 0 do
 form1.cbTasksToAllTasks.Items.Add('Приоритет '+inttostr(i));
form1.cbMidTimeWait.Clear;
form1.cbMidTimeWait.Items.Add('Все заявки');
for i:=Opts.MaxPriority downto 0 do
 form1.cbMidTimeWait.Items.Add('Приоритет '+inttostr(i));
//Results
Results.NumStarts:=numstarts-1;
form1.cbTimeWait.ItemIndex:=0;
form1.cbTaskPriorityCameToLeft.ItemIndex:=0;
form1.cbTasksToAllTasks.ItemIndex:=0;
form1.cbMidTimeWait.ItemIndex:=0;
OutputGraphics1;
OutputGraphics2;
OutputGraphics3;
OutputGraphics4;
end;

procedure TForm1.cbTimeWaitChange(Sender: TObject);
begin
OutputGraphics1;
end;

procedure TForm1.cbTaskPriorityCameToLeftChange(Sender: TObject);
begin
OutputGraphics2;
end;

procedure TForm1.cbTasksToAllTasksChange(Sender: TObject);
begin
OutputGraphics3;
end;

procedure TForm1.cbMidTimeWaitChange(Sender: TObject);
begin
OutputGraphics4;
end;

procedure TForm1.cbDispChange(Sender: TObject);
begin
OutputGraphics5;
end;

initialization
path:=GetPath(ParamStr(0));
randomize;

end.
 