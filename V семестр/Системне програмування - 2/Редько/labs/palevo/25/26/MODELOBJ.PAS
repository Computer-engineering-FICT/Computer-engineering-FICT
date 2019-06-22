{$A+,B-,E-,F-,G+,N+,O-,P-,T-,V+,X+}

{$DEFINE Debugging}
{$IFDEF Debugging} {$D+,I+,L+,Q+,R+,S+,Y+}
          {$ELSE}  {$D-,I-,L-,Q-,R-,S-,Y-}
          {$ENDIF}

unit ModelObj;
interface
uses crt,objects;

const
    TaskCount         = 21;
    MaxDataRequired   = 5;
    GraphMaxPoint     = 21;
    MaxProcessorCount = 4;

type
    TBusState     = (FreeBUS, BusyBUS);
    TAccessReq    = (WriteData,ReadData,HighZ);
    TDataReady    = array[1..MaxDataRequired] of byte;
    TGraph        = array[1..GraphMaxPoint,1..GraphMaxPoint] of byte;
    TGraphWeight  = array[1..GraphMaxPoint] of byte;

    PData  =  ^TData;
    TData  =  object(TObject)
       DataRequired   : integer;
       DataReadySn    : TDataReady;
       CurrentDataNum : integer;
       ID             : integer;
       constructor  Init(aDataRequired, aID:integer);
       function     DataReady : boolean;
    end;

    PTask =^ TTask;
    TTask = object(Tobject)
       IDNumber           : word;
       Weight             : integer;
       InputData          : PData;
       OutData            : TCollection;
       constructor 	Init(aIDNumber,aWeight : integer;aInputData : PData);
       destructor	Done;virtual;
    end;

    TTaskStream  = array [1..TaskCount] of PTask;


    PProcessor = ^TProcessor;
    TProcessor = object
       Tasks        : TCollection;
       Number       : byte;
       CurrentTask  : PTask;
       Time, TaskTM : integer;
       AccessMode   : TAccessReq;
       LockCPU      : boolean;
       procedure   SimulateTime(aTm : integer);
       procedure   ClockBUSEnd;
       procedure   ReadAccess;
       procedure   WriteAccess;
       procedure   DisplayInfo(x,y : integer);
       constructor Init(aID : integer);
       destructor  Done;
    end;

     TBusRAM = object(TCollection)
       State        : TBusState;
       CurrentCPU   : PProcessor;
       constructor Init;
       procedure AccessBUS(aCPU : PProcessor);
       procedure ClockBUSrun(aTime : integer);
       procedure ClockBUSEnd;
       procedure DisplayInfo(x,y : integer);
     end;

   TDataStream  = array[1..TaskCount] of PData;
Var
    BUS                                 : TBusRAM;
    t                                   : text;
{$I Graph}         {Graph, WeightVec}

IMPLEMENTATION

constructor TData.Init(aDataRequired,aID:integer);
begin
  inherited Init;
  FillChar(DataReadySn, SizeOf(DataReadySn),#0);
  DataRequired:=aDataRequired; CurrentDataNum:=0;ID:=aID
end;


function TData.DataReady : boolean;
var i : integer;
begin
  DataReady := CurrentDataNum>=DataRequired
end;

constructor TProcessor.Init(aID : integer);
begin
  Time := 0;  TaskTM:=0;
  Number := aID;  AccessMode:=HighZ;
  CurrentTask := nil;
  Tasks.Init(10,10)
end;

procedure TProcessor.SimulateTime(aTm : integer);
var P : PTask;
begin
  Inc(Time,aTm);
  if LockCPU then exit;
  Inc(TaskTM,aTm);
  AccessMode := HighZ;
  if (CurrentTask<>nil) and (CurrentTask^.Weight <= TaskTM) then
  begin
   AccessMode := WriteData;
   BUS.AccessBUS(@Self)
  end;
  if (CurrentTask=nil) and (Tasks.Count>0) then
  begin
    P := Tasks.At(0);
    if P^.InputData^.DataReady then
     begin
      AccessMode := ReadData;
      BUS.AccessBUS(@Self);
      CurrentTask :=P;
      Tasks.Delete(P)
     end
  end
end;

procedure TProcessor.ClockBUSEnd;
begin
  if (CurrentTask<>nil) and (CurrentTask^.Weight <= TaskTM) and (not LockCPU) then CurrentTask:=nil;
end;

procedure TProcessor.WriteAccess;
var  i : integer;
     P : PData;
begin
  with CurrentTask^.OutData do
   if Count>0 then
   begin
    for i:=0 to Count-1 do
    begin
     P := At(i);
     Inc(P^.CurrentDataNum)
    end
   end
end;

procedure TProcessor.ReadAccess;
begin
  TaskTM:=0;
end;

procedure TProcessor.DisplayInfo(x,y : integer);
const
 B1 = 'Шинный Интерфейс: ';
 Space = '                ';
var S : String;
begin
  GotoXY(x,y);
  Writeln('Процессор ',Number);GotoXY(X,WhereY);
  if AccessMode=HighZ then
  begin
   S:=B1+'Отключён от шины';
   Write(t,' Z             ')
  end;

  if LockCPU then
   case AccessMode of
    WriteData :
     begin
      S:=B1+' Ожидание, запись';
      Write(t,' Stand by (W)  ');
     end;
    ReadData  :
     begin
      S:=B1+' Ожидание, чтение';
      Write(t,' Stand by (R)  ')
     end
   end
  else
   case AccessMode of
    WriteData :
     begin
      S:=B1+' Запись  (W)';
      Write(t,' Writing       ')
     end;
    ReadData  :
     begin
      S:=B1+' Чтение  (R)';
      Write(t,' Reading       ')
     end
   end;
  Writeln(S,Space);
  write(Space,#13);
  if CurrentTask<> nil then
   begin
    Write('Задача ',CurrentTask^.IDNumber,'  Осталось Тактов ' ,CurrentTask^.Weight-TaskTM);
    Write(t,CurrentTask^.IDNumber,'         ')
   end
   else
    begin
     Write('Nil');
     Write(t,'None      ' )
    end;
  write(Space)
end;

destructor TProcessor.Done;
begin
  Tasks.Done;
end;

constructor TTask.Init(aIDNumber,aWeight : integer;aInputData : PData);
begin
  inherited Init;
  IDNumber := aIDNumber;
  Weight :=  aWeight;
  InputData :=  aInputData;
  OutData.Init(10,10)
end;

destructor TTask.Done;
begin
  OutData.Done;
  inherited Done
end;


constructor TBusRAM.Init;
begin
 inherited Init(20,20);
 State := FreeBUS; CurrentCPU:=nil
end;

procedure TBusRAM.DisplayInfo(x,y : integer);
const
 B1 = 'Статус шины: ';
 Space = '                ';
var  i : integer;  P : PProcessor;
begin
 GotoXY(x,y);
 If State = FreeBUS then
  begin
   Writeln(B1,' свободна');
   Write(t, ' Free')
  end
   else
  begin
   GotoXY(X,WhereY);
   Writeln(B1,' занята');
   Write(t, ' Busy');
   Writeln(' Длина очереди :',Count);
   Write(' Процессоры в очереди: ');
   for i:=0 to Count-1 do
   begin
    P := At(i);
    Write(P^.Number,'  ')
   end;
    Write(Space)
  end
end;

procedure TBusRAM.AccessBUS(aCPU : PProcessor);
begin
 aCPU^.LockCPU := True;
 Insert(aCPU);
 State := BusyBUS;
end;

procedure TBusRAM.ClockBUSrun(aTime : integer);
var  i : integer;
     P : PProcessor;
begin
  for i:=1 to aTime do
   if Count>0 then
    begin
     P := At(0);
     with P^ do
     case AccessMode of
      WriteData : begin  WriteAccess; LockCPU := False end;
      ReadData  : begin  ReadAccess;  LockCPU := False end;
     end;
     CurrentCPU:=P;
    end
   else Break;
  if Count=0 then State := FreeBUS
end;

procedure TBusRAM.ClockBUSEnd;
begin
   if CurrentCPU<>nil then Delete(CurrentCPU); CurrentCPU:=nil
end;

begin
 BUS.Init
END.