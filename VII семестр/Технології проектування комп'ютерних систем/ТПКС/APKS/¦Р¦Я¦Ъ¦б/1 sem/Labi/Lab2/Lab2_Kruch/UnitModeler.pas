unit UnitModeler;

interface
uses UnitGenerators;

type
  TTask = record
    StartTime, ServStartTime: real;
    IsSpecPacket: boolean;
  end;

  TQueue = array of TTask;

  TNode = class
    Queue: TQueue;
    ServStart: real;
    ServTaskId: integer;
    constructor Init(QueueLambda: real; Distribution: integer);
    function CPUIsBusy: boolean;
    function ServedTasksCount: integer;
    function QueueLength: integer;
    function SpecPacketInQueue: boolean;
    function QueueAfterSPLength: integer;
    function CPULoad: integer;
    function MiddleTaskWaitTime: real;
  end;

  TNodeList = array of TNode;

  TModeler = class
    Nodes: TNodeList;
    procedure Model;
    procedure Takt;
    procedure TaktNode(NodeId: integer);
  end;

  TConfigNode = record
    Lambda: real;
    Distribution: integer;
  end;

  TConfigNodeList = array of TConfigNode;

  TConfigurator = record
    SpecPacketCPUId: integer;
    SpecPacketTime: real;
    ConfigNodeList: TConfigNodeList;
  end;

var
  Configurator: TConfigurator;
  ModelingPrognosTime: real;
  Modeler: TModeler;
  Time: real;
  SystemStopped: boolean;

procedure GenerateQueue(var Queue: TQueue; QueueLambda: real; Distribution: integer);

implementation

procedure SortQueue(var Queue: TQueue);
var
  MaxId, i, j: integer;
  Buf: TTask;
begin
  for i := 0 to High(Queue) do
  begin
    MaxId := 0;
    for j := 0 to High(Queue) - i do if Queue[MaxId].StartTime < Queue[j].StartTime then MaxId := j;
    Buf := Queue[High(Queue) - i];
    Queue[High(Queue) - i] := Queue[MaxId];
    Queue[MaxId] := Buf;
  end;
end;

procedure NormalizeQueue(var Queue: TQueue);
var
  i: integer;
  MaxValue: real;
begin
  MaxValue := 0;
  for i := 0 to High(Queue) do
    if MaxValue < Queue[i].StartTime then MaxValue := Queue[i].StartTime;
  for i := 0 to High(Queue) do Queue[i].StartTime := Queue[i].StartTime / MaxValue;
end;

procedure GenerateQueue(var Queue: TQueue; QueueLambda: real; Distribution: integer);
var
  i: integer;
begin
  Queue := nil;
  SetLength(Queue, Round(ModelingPrognosTime*QueueLambda));
  Generator.SetDistribution(Distribution, QueueLambda);

  for i := 0 to High(Queue) do
  begin
    Queue[i].StartTime := Generator.Generate;
    Queue[i].IsSpecPacket := false;
  end;

  NormalizeQueue(Queue);
  SortQueue(Queue);

  for i := 0 to High(Queue) do Queue[i].StartTime := Queue[i].StartTime * ModelingPrognosTime;
end;

constructor TNode.Init(QueueLambda: real; Distribution: integer);
begin
  GenerateQueue(Queue, QueueLambda, Distribution);
  ServTaskId := 0;
  ServStart := -1;
end;

procedure TModeler.Model;
var
  i: integer;
begin
  SystemStopped := false;
  Time := 0;
  ModelingPrognosTime := Configurator.SpecPacketTime * (1 + Configurator.ConfigNodeList[Configurator.SpecPacketCPUId].Lambda) + 2;

  SetLength(Nodes, Length(Configurator.ConfigNodeList));
  for i := 0 to High(Nodes) do Nodes[i] := TNode.Init(Configurator.ConfigNodeList[i].Lambda, Configurator.ConfigNodeList[i].Distribution);

  SetLength(Nodes[0].Queue, Length(Nodes[0].Queue) + 1);
  Nodes[0].Queue[High(Nodes[0].Queue)].StartTime := Configurator.SpecPacketTime;
  Nodes[0].Queue[High(Nodes[0].Queue)].IsSpecPacket := true;

  SortQueue(Nodes[0].Queue);
end;

procedure TModeler.Takt;
var
  i: integer;
begin
  Time := Time + 1;
  for i := 0 to High(Nodes) do TaktNode(i);
end;

procedure TModeler.TaktNode(NodeId: integer);
begin
  if Nodes[NodeId].ServTaskId > 0
  then begin
    if Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId - 1].IsSpecPacket
    then begin
        if Time - Nodes[NodeId].ServStart >= 2
        then begin
          Time := Nodes[NodeId].ServStart + 2;
          SystemStopped := true;
        end
    end
    else begin
      if Time >= Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId].StartTime
      then begin
        if Nodes[NodeId].ServStart + 1 > Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId].StartTime
        then Nodes[NodeId].ServStart := Nodes[NodeId].ServStart + 1
        else Nodes[NodeId].ServStart := Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId].StartTime;

        Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId].ServStartTime := Nodes[NodeId].ServStart;

        Inc(Nodes[NodeId].ServTaskId);
      end
    end
  end
  else
  if Time >= Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId].StartTime
  then begin
    if Nodes[NodeId].ServStart + 1 > Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId].StartTime
    then Nodes[NodeId].ServStart := Nodes[NodeId].ServStart + 1
    else Nodes[NodeId].ServStart := Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId].StartTime;

    Nodes[NodeId].Queue[Nodes[NodeId].ServTaskId].ServStartTime := Nodes[NodeId].ServStart;

    Inc(Nodes[NodeId].ServTaskId);
  end;
end;

function TNode.CPUIsBusy: boolean;
begin
  Result := Time < ServStart + 1;
end;

function TNode.QueueLength: integer;
begin
  Result := ServTaskId;
  while (Queue[Result].StartTime <= Time) and (not Queue[Result].IsSpecPacket) do Inc(Result);
  Dec(Result, ServTaskId);
end;

function TNode.SpecPacketInQueue: boolean;
var
  i: integer;
begin
  Result := false;
  i := ServTaskId;
  while Queue[i].StartTime <= Time do
  begin
    Inc(i);
    if Queue[i].IsSpecPacket then Result := true;
  end;
end;

function TNode.QueueAfterSPLength: integer;
begin
  if SpecPacketInQueue or Queue[ServTaskId].IsSpecPacket
  then begin
    Result := ServTaskId + QueueLength + 1;
    while Queue[Result].StartTime <= Time do Inc(Result);
    Dec(Result, ServTaskId + QueueLength + 1);
  end
  else Result := 0;
end;

function TNode.ServedTasksCount: integer;
begin
  Result := ServTaskId;
  if CPUIsBusy then Dec(Result);
end;

function TNode.CPULoad: integer;
begin
  Result := Round(100 * ServedTasksCount / UnitModeler.Time);
end;

function TNode.MiddleTaskWaitTime: real;
var
  i: integer;
begin
    Result := 0;
  if ServTaskId > 0
  then begin
    for i := 0 to ServTaskId - 1 do Result := Result + Queue[i].ServStartTime - Queue[i].StartTime;
    Result := Result / ServTaskId;
  end;
end;

begin
  Modeler := TModeler.Create;
end.
