{$A+,B-,E-,F-,G+,N+,O-,P-,T-,V+,X+}
{$DEFINE Debugging}
{$IFDEF Debugging} {$D+,I+,L+,Q+,R+,S+,Y+}         {Debug session}
          {$ELSE}  {$D-,I-,L-,Q-,R-,S-,Y-}
          {$ENDIF}

program SharedMemory;
uses ModelObj,Crt;

var
   TaskStream                           : TTaskStream;
   DataStream                           : TDataStream;
   Processors                           : array [1..MaxProcessorCount] of TProcessor;
   SystemTimer                          : longint;


procedure Init;
var  i, j, k, S : integer;
     DataPtr    : PData;
begin
  for i:=1 to High(Processors) do Processors[i].Init(i);
  for i:=1 to High(TaskStream) do
  begin
    S := 0;
    for j:=1 to GraphMaxPoint do Inc(S,Graph[j,i]);
    DataStream[i]:=New(PData,Init(S,i))
  end;
  DataStream[1]^.DataRequired:=0;

  for i:=1 to High(TaskStream) do
  begin
    TaskStream[i]:=New(PTask, Init(i,WeightVec[i],DataStream[i]));
    for j:=1 to GraphMaxPoint do
     if Graph[i,j]=1 then TaskStream[i]^.OutData.Insert(DataStream[j]);
  end;

  for i:=1 to High(TaskStream) do
  begin
     S:=(i mod High(Processors))+1;
    Processors[(i mod High(Processors))+1].Tasks.Insert(TaskStream[i])
  end;
  SystemTimer:=0;
end;

function AllFree:boolean;
var i : integer;
begin
  AllFree:=true;
  for i:=1 to High(Processors) do
   if not((Processors[i].Tasks.Count=0) and (Processors[i].CurrentTask=nil)) then
   begin
    AllFree:=false;
    Break
   end
end;

procedure WriteTacktInfo;
var  S : string;
begin
  Write(t,SystemTimer,'  ');
end;

var
  Y1, i : integer;
begin
  ClrScr;
  Writeln('Общая память, 4 процессора'); Y1 := WhereY;
  Writeln('Такт : ');
  Init;
  assign(t,'Out.txt');rewrite(t);
  while not AllFree do
  begin
    GotoXY(9,2); Writeln(SystemTimer);
    Write(t,SystemTimer,'  ');
    for i:=1 to High(Processors) do Processors[i].SimulateTime(1);
    BUS.ClockBUSrun(1);
    for i:=1 to High(Processors) do Processors[i].DisplayInfo(1,5*(i-1)+5);
    BUS.DisplayInfo(1,23);   Writeln(t,'');
    BUS.ClockBUSEnd;
    for i:=1 to High(Processors) do Processors[i].ClockBUSEnd;
    Inc(SystemTimer);
    Readkey
  end;
  Close(t);
end.