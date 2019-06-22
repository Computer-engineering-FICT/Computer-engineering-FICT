unit Unit2;

interface
  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls;
    const
      MaxV=50;
      MaxPath=50;
    type
      TPrev=array of integer;
      TPath=array of integer;
      TVid=(b,k,o,l);
      TVerList=record
        num:integer;
        Vid:TVid;
        Value:string [10];
        Prev:TPrev;
        NextMain,NextAlt:integer;
        Col,Row:integer;
        exist:boolean;
      end;

    var
      VerList:array[0..MaxV] of TVerList;
      ComplPathCount,CycleCount:integer;
      CompletePathArr,CycleArr:array[0..MaxPath-1] of TPath;
      TableSv:array[0..MaxV-1,0..MaxV-1] of boolean;
      VerCount,MaxVerNum :integer;
    procedure PathCycle;
    procedure CreateTabSv;
    function CorrectConnect:boolean;
    function AllInpath:boolean;
    function CycleCorrect:boolean;
    function TestConnect:boolean;

implementation
  Type
    TVidVer=record
      Num:integer;
      Vid:TVid;
      Value:string
    end;

  var
    PathArr:array[0..MaxPath-1] of TPath;
    PathCount:integer;

procedure CreateTabSv;
  var i,j:integer;
begin
  for i:=0 to maxV-1 do
    for j:=0 to MaxV-1 do
      TableSv[i,j]:=false;
  for i:=0 to MaxVerNum do
    if VerList[i].exist then
    begin
      if VerList[i].NextMain<>-1 then

        TableSv[i,VerList[i].NextMain]:=true;
      if VerList[i].NextAlt<>-1 then
        TableSv[i,VerList[i].NextAlt]:=true;
    end
end;

function TestConnect:boolean;
  var i,j,l,EndVer:integer;
      flag:boolean;
begin
  flag:=true;
  for i:=0 to VerCount-1 do
    for j:=0 to VerCount-1 do
      for l:=0 to VerCount-1 do
        if (TableSv[i,l]=true) and (TableSv[l,j]=true) then
          TableSv[i,j]:=true;
   i:=0;
   while VerList[i].Vid<>k do
    i:=i+1;
   EndVer:=VerList[i].num;
 //  ShowMessage(intToStr(Endver));
   for i:=0 to VerCount-1 do
     if i<>EndVer then
       if not TableSv[i,EndVer] then
       begin
         flag:=false;
         ShowMessage('Вершина №'+IntToStr(i)+'не имеет связи с конечной вершиной ');
       end;
  TestConnect:=Flag;
end;{TestConnect}

function CorrectConnect:boolean;
  var i,j,ConCount,EndVerCount:integer;
begin
  CorrectConnect:=true;
  EndVerCount:=0;
  for i:=0 to VerCount-1 do
  begin
    ConCount:=0;
    for j:=0 to VerCount do
      if TableSv[i,j] then
        ConCount:=ConCount+1;
    if VerList[i].exist then
    begin
    case VerList[i].Vid of
      b:if ConCount<1 then
        begin
          ShowMessage('Начальная вершина не имеет связи !');
          CorrectConnect:=false
        end;
      o:if ConCount<1 then
        begin
          ShowMessage('Вершина №'+inttostr(i)+ 'не имеет связи !');
          CorrectConnect:=false
        end;
      l:if ConCount<2 then
        if VerList[i].NextMain=VerList[i].NextAlt then
          ShowMessage('Обе ветви вершины №'+inttostr(i)+' ведут в вершину №'+IntTostr(VerList[i].NextMain))
        else
        begin
          ShowMessage('Вершина №'+inttostr(i)+ 'не имеет связи !');
          CorrectConnect:=false
        end;
      k:EndVerCount:=EndVerCount+1
      end
    end
    end;
    if EndVercount=0 then
    begin
     ShowMessage('Нет конечной вершины');
     CorrectConnect:=false
    end;
    if EndVercount>1 then
    begin
     ShowMessage('Лишние конечные вершины');
     CorrectConnect:=false
    end;

end; {CorrectConnect}

function AllInpath:boolean;
  var i,j,k:integer;
      InPath:boolean;
begin
   AllInPath:=true;
   for i:=1 to VerCount-1 do
   if VerList[i].exist then
   begin
     inPath:=false;
     for j:=1 to ComplpathCount do
       for k:=0 to length(CompletePathArr[j])-1 do
       if verList[i].exist then
       begin
         if i=CompletepathArr[j,k] then
           InPath:=true;
       end;
     for j:=1 to CycleCount do
       for k:=0 to length(CycleArr[j])-1 do
         if i=CycleArr[j,k] then
           InPath:=true;

     if not InPath then
     begin
       AllInpath:=false;
       ShowMessage('Вершина № '+IntToStr(i)+'не входит в путь')
     end
   end
end;{AllInpath}


function CycleCorrect:boolean;
  var i,j:integer;
      IsOp,IsLog:boolean;
begin
  CycleCorrect:=true;
  for i:=1 to CycleCount do
  begin
    IsOp:=false;
    IsLog:=false;
    for j:=0 to length(CycleArr[i])-1 do
    begin
      if VerList[CycleArr[i,j]].Vid=o then
        IsOp:=true;
      if VerList[CycleArr[i,j]].Vid=l then
        IsLog:=true;
    end;
    if not IsOp then
    begin
      ShowMessage('Цикл №'+intToStr(i)+'не содержит операторных вершин');
      CycleCorrect:=false;
    end;
    if not IsLog then
    begin
      ShowMessage('Цикл №'+intToStr(i)+'не содержит условных вершин');
      CycleCorrect:=false
    end
  end
end;{CycleCorrect}

  procedure MakePath(PathNo:integer);
    var
      N,N1,N2,count:integer;
      finish:boolean;

    function NextN:integer;
      var i:integer;
    begin
      nextN:=0;
      for i:=0 to VerCount-1 do
        if TableSv[N,i] then
          NextN:=i;
    end; {NextN}

    procedure TwoNext( var N1,N2:integer);
      var i:integer;
          flag:boolean;
    begin
      flag:=false;
      for i:=0 to VerCount-1 do
        if tableSv [N,i] then
          if flag then
            N2:=i
          else
          begin
            N1:=i;
            flag:=true
          end;
    end;{twoNext}

    procedure CreatePath(N2:integer);
      var i,j:integer;
    begin
      PathCount:=pathCount+1;
      if PathCount<= MaxPath then
      begin
        for i:=0 to MaxPath-1 do
          if length(PathArr[i])=0 then
          begin
            Setlength(PathArr[i],count);
            for j:=0 to count-2 do
              pathArr[i,j]:=pathArr[PathNo,j];
            pathArr[i,count-1]:=N2;
            break
          end
      end
      else
        showmessage('overload');
    end;{createpath}

    function AlreadyWas(x:integer):boolean;
      var i:integer;
    begin
      AlreadyWas:=false;
      for i:=0 to count-1 do
        if PathArr[PathNo,i]=x then
          Alreadywas:=true
    end;{AlreadyWas}

    procedure AddInCycle(x,PathNo:integer);
      var i,j:integer;
    begin
      CycleCount:=CycleCount+1;
      i:=0;
      while PathArr[PathNo,i]<>x do
        i:=i+1;
      j:=0;
      repeat
        setlength(CycleArr[CycleCount],j+1);
        CycleArr[CycleCount,j]:=PathArr[PathNo,i+j];
        j:=j+1
      until j+i>length(PathArr[PathNo])-1;

      {in this point must be testing if this ccycle already took place or not}
    end; {AddInCycle}

    procedure InsInCompl(PathNo:integer);
    begin
       ComplPathCount:=ComplPathCount+1;
       SetLength(CompletePathArr[ComplPathCount],length(PathArr[PathNo]));
       CompletePathArr[ComplPathCount]:=PathArr[PathNo];
    end;{InsInCompl}



    begin {makePath}
      count:=length(PathArr[PathNo]);
      N:=PathArr[PathNo,count-1];
      finish:=false;
      repeat
      if VerList[N].exist then
        if VerList[N].Vid=k then
          finish:=true
        else
        begin
          count:=count+1;
          if (VerList[N].Vid=o)or (VerList[N].Vid=b) then
          begin
          N1:=NextN;
            if AlreadyWas(N1) then
            begin
                AddInCycle(N1,PathNo);
                SetLength(pathArr[PathNo],0);
                finish:=true
            end
            else
              N:=N1
          end
          else
          begin
            TwoNext(N1,N2);
            if AlreadyWas(N1) then
            begin
              AddInCycle(N1,PathNo);
              if AlreadyWas(N2) then
              begin
                AddInCycle(N2,PathNo);
                SetLength(pathArr[PathNo],0);
                finish:=true
              end
              else
                N:=N2
           end
           else
           begin
             if AlreadyWas(N2) then
               AddInCycle(N2,pathNo)
             else
               CreatePath(N2);
             N:=N1
           end
         end
       end;
       if not finish then
        begin
         SetLength(PathArr[PathNo],count);
         PathArr[PathNo,count-1]:=N;
        end;
       until finish;

       InsInCompl(PathNo);
       SetLength(PathArr[pathNo],0);

  end;{MakePath}

  procedure PathCycle;
    var PN,i:integer;
        empty:boolean;
  begin
    ComplPathCount:=0;
    PathCount:=0;
    CycleCount:=0;
    for i:=0 to MaxPath-1 do
    begin
       SetLength(CycleArr[i],0);
       SetLength(CompletePathArr[i],0);
       SetLength(PathArr[i],0);
    end;
    SetLength(PathArr[0],1);
    PathArr[0,0]:=0;
    Pn:=0;
    pathCount:=1;
    Makepath(Pn);
   repeat
      empty:=true;
      for i:=0 to PathCount-1 do
        if length (PathArr[i])>0 then
        begin
          MakePath(i);
          empty:=false
        end
    until empty  ;
  end ;{PathCycle}
end.
