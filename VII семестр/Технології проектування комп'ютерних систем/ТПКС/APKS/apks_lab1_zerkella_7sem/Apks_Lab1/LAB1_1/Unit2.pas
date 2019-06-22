unit Unit2;

interface
  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls;
    const
      MaxV=100;
      MaxPath=100;
    type
      TPrev=array of integer;
      TPath=array of integer;

      TTabSv=array[0..MaxV-1,0..MaxV-1] of boolean;
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
      TableSv:TTabSv;
      VerCount,MaxVerNum :integer;
    procedure PathCycle;
    procedure CreateTabSv;
    function CorrectConnect:boolean;
    function AllInpath:boolean;
    function CycleCorrect:boolean;
    function TestConnect:boolean;
    function FindVer(Num:integer):integer;
    procedure ShowError(Text: string);
    procedure ShowInfo(Text: string);
    procedure ClearVerList;

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

procedure ClearVerList;
var
  I: Integer;
begin
  for I := 0 to MaxV do
  begin
    VerList[I].NextMain := -1;
    VerList[I].NextAlt := -1;    
  end;
end;

// Shows error message
procedure ShowError(Text: string);
begin
  Application.MessageBox(PChar(Text), PChar(Application.Title), MB_OK or MB_ICONERROR or MB_DEFBUTTON1 or MB_TASKMODAL);
end;

// Shows error message
procedure ShowInfo(Text: string);
begin
  Application.MessageBox(PChar(Text), PChar(Application.Title), MB_OK or MB_ICONASTERISK or MB_DEFBUTTON1 or MB_TASKMODAL);
end;

function FindVer(Num:integer):integer;
  var i:integer;
begin
  FindVer:=-1;
  for i:=0 to MaxVerNum do
    if VerList[i].num=Num then
    begin
      FindVer:=i;
      break
    end
end;

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
      begin
        TableSv[VerList[i].num,VerList[i].NextMain]:=true;
      end;
      if VerList[i].NextAlt<>-1 then
      begin
        TableSv[VerList[i].num,VerList[i].NextAlt]:=true;
      end
    end;

end;

function TestConnect:boolean;
  var i,j,l,EndVer:integer;
      flag:boolean;
      change:boolean;
      TabSv:TTabSv;
begin
  for i:=0 to MaxV-1 do
    for j:=0 to MaxV-1 do
      TabSv[i,j]:=TableSv[i,j];
  flag:=true;

  repeat
  change:=false;
  for i:=0 to  MaxVerNum do
    for j:=0 to  MaxVerNum do
      for l:=0 to MaxverNum do
        if (TabSv[i,l]=true) and (TabSv[l,j]=true) then
        begin
          if TabSv[i,j]=false then
            change:=true;
          TabSv[i,j]:=true;

        end;
  until not change;

   i:=0;
   while VerList[i].Vid<>k do
     i:=i+1;
   EndVer:=VerList[i].num;
   for i:=0 to MaxVerNum do
     if i<>EndVer then
       if not TabSv[i,EndVer]and (VerList[FindVer(i)].exist) then
       begin
         flag:=false;
         ShowError('Вершина '+IntToStr(i)+' никак не выходит на конечную вершину');
       end;
  TestConnect:=Flag;
end;{TestConnect}

function CorrectConnect:boolean;
  var i,j,ConCount,EndVerCount:integer;
begin
  CorrectConnect:=true;
  EndVerCount:=0;
  for i:=0 to MaxVerNum do
  begin
    ConCount:=0;
    for j:=0 to MaxVerNum do

      if TableSv[i,j] then
        ConCount:=ConCount+1;
    if VerList[Findver(i)].exist then
    begin
    case VerList[FindVer(i)].Vid of
      b:if ConCount<1 then
        begin
          ShowError('У начальной вершины нет связи в дальнейшем');
          CorrectConnect:=false
        end;
      o:if ConCount<1 then
        begin
          ShowError('Выход операторной вершины '+inttostr(i)+ ' не подключен');
          CorrectConnect:=false
        end;
      l:if ConCount<2 then
        if (VerList[i].NextMain=VerList[i].NextAlt)and(VerList[i].NextMain>-1) then
        begin
          ShowError(' Обе ветки вершины '+inttostr(i)+' ведут к вершине '+IntTostr(VerList[i].NextMain));
          CorrectConnect:=false
        end
        else
        begin
          ShowError('Один из выходов условной вершины '+inttostr(i)+ ' не подключен');
          CorrectConnect:=false
        end;
      k:EndVerCount:=EndVerCount+1
      end
    end
    end;
    if not Result then Exit;
    if EndVercount=0 then
    begin
     ShowError('Конечная вершина не найдена');
     CorrectConnect:=false
    end;
    if not Result then Exit;
    if EndVercount>1 then
    begin
     ShowMessage('Конечная вершина должна быть одна');
     CorrectConnect:=false
    end;

end; {CorrectConnect}

function AllInpath:boolean;
  var i,j,k:integer;
      InPath:boolean;
begin
//ShowMessage('ComplPathCount '+intToStr(ComplPathCount ));

   AllInPath:=true;
   for i:=1 to MaxVerNum do
   if VerList[i].exist then
   begin
     inPath:=false;
     for j:=0 to ComplPathCount-1 do
       for k:=0 to length(CompletePathArr[j])-1 do
     //  if verList[i].exist then
     //  begin
         if verlist[i].num=CompletePathArr[j,k] then
           InPath:=true;
     //  end;
     for j:=1 to CycleCount do
       for k:=0 to length(CycleArr[j])-1 do
         if VerList[i].num=CycleArr[j,k] then
           InPath:=true;

     if not InPath then
     begin
       AllInpath:=false;
       ShowError('Вершина '+IntToStr(VerList[i].num)+' не принадлежит ни одному пути или циклу')

     end
   end ;
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
      ShowError('Цикл '+intToStr(i)+' не содержит ни одного оператора, а соответственно замкнется сам на себя');
      CycleCorrect:=false;
    end;
    if not IsLog then
    begin
      ShowError('Цикл '+intToStr(i)+' не содержит ни одного условия, а соответственно замкнется сам на себя');
      CycleCorrect:=false
    end
  end ;
end;{CycleCorrect}

  procedure MakePath(PathNo:integer);
    var
      N,N1,N2,count:integer;
      finish:boolean;

    function NextN:integer;
      var i:integer;
    begin
      nextN:=0;
      for i:=0 to MaxVerNum do
      if VerList[Findver(i)].exist then
        if TableSv[N,i] then
          NextN:=i;
{if N=4 then
  if TableSv[4,0]then
    ShowMessage(' 0 true')
  else
    ShowMessage('0 false')
}
    end; {NextN}

    procedure TwoNext( var N1,N2:integer);
      var i:integer;
          flag:boolean;
    begin
      flag:=false;
      for i:=0 to maxVerNum do
      if VerList[Findver(i)].exist then
        if TableSv [N,i] then
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
      for i:=0 to count-2 do
        if PathArr[PathNo,i]=x then
          Alreadywas:=true
    end;{AlreadyWas}

    procedure AddInCycle(x,PathNo:integer);
      var i,j,k,tmp:integer;
          eqw:boolean;
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

    for k:=1 to length(CycleArr[CycleCount]) do
    begin
      for i:=1 to CycleCount-1 do
      begin
        eqw:=true;
        if length(CycleArr[i])<>length(CycleArr[CycleCount]) then
          eqw:=false
        else
           for j:=0 to length(CycleArr[i])-1 do
            if CycleArr[i,j]<>CycleArr[Cyclecount,j] then
              eqw:=false;
         if eqw then
         begin
           SetLength(CycleArr[CycleCount],0);
           CycleCount:=CycleCount-1;
           exit
         //  break
         end

      end;
        tmp:=CycleArr[CycleCount,0];
        for j:=1 to length(CycleArr[CycleCount])-1 do
          CycleArr[CycleCount,j-1]:=CycleArr[CycleCount,j];
        CycleArr[CycleCount,Length(CycleArr[CycleCount])-1]:=tmp;

{         if eqw then
         begin
           SetLength(CycleArr[CycleCount],0);
           CycleCount:=CycleCount-1;
           break
         end    }
       end;
    end; {AddInCycle}

    procedure InsInCompl(PathNo:integer);
    begin
       ComplPathCount:=ComplPathCount+1;
       SetLength(CompletePathArr[ComplPathCount-1],length(PathArr[PathNo]));
       CompletePathArr[ComplPathCount-1]:=PathArr[PathNo];
    end;{InsInCompl}



   begin {makePath}
      count:=length(PathArr[PathNo]);
      N:=PathArr[PathNo,count-1];
      finish:=false;
      repeat
      if VerList[FindVer(N)].exist then
        if VerList[FindVer(N)].Vid=k then
          finish:=true
        else
        begin
          count:=count+1;
          if (VerList[FindVer(N)].Vid=o)or (VerList[FindVer(N)].Vid=b) then
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
       if length(pathArr[PathNo])<>0 then
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
