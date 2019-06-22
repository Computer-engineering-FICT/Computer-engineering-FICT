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
         MessageDLg('Point with the number '+IntToStr(i)+'has no connection with the End ',mtInformation,[mbok],0);
         //         ShowMessage('Point with the number'+IntToStr(i)+' has no connection with the End');
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
      MessageDlg('Begin has no connection with any points',mtInformation,[mbok],0);
 //       ShowMessage('Begin has no connection !');
          CorrectConnect:=false
        end;
      o:if ConCount<1 then
        begin
            MessageDLg('Point with the number '+IntToStr(i)+' has no connections',mtInformation,[mbok],0);
          //ShowMessage('Point with the number'+inttostr(i)+ ' has no connections !!');
          CorrectConnect:=false
        end;
      l:if ConCount<2 then
        if (VerList[i].NextMain=VerList[i].NextAlt)and(VerList[i].NextMain>-1) then
        begin
         MessageDlg('Both branches of point '+inttostr(i)+' connect with the point '+IntTostr(VerList[i].NextMain),mtWarning,[mbok],0);
          //ShowMessage('Both branches of point '+inttostr(i)+' connect with the point ¹ '+IntTostr(VerList[i].NextMain));
          CorrectConnect:=false
        end
        else
        begin
          MessageDlg('Point with the number '+inttostr(i)+ 'has no connections.Maybe one of the branches is free!',mtWarning,[mbok],0);


          CorrectConnect:=false
        end;
      k:EndVerCount:=EndVerCount+1
      end
    end
    end;
    if EndVercount=0 then
    begin
     MessageDlg('There is no any point of END in this graph',mtWarning,[mbok],0);
     CorrectConnect:=false
    end;
    if EndVercount>1 then
    begin
     MessageDlg('Point of End is not one.It should be one',mtWarning,[mbok],0);

     CorrectConnect:=false
    end;

end; {CorrectConnect}

function AllInpath:boolean;
  var i,j,k:integer;
      InPath:boolean;
begin
   AllInPath:=true;
   for i:=1 to MaxVerNum do
   if VerList[i].exist then
   begin
     inPath:=false;
     for j:=0 to ComplPathCount-1 do
       for k:=0 to length(CompletePathArr[j])-1 do

         if verlist[i].num=CompletePathArr[j,k] then
           InPath:=true;

     for j:=1 to CycleCount do
       for k:=0 to length(CycleArr[j])-1 do
         if VerList[i].num=CycleArr[j,k] then
           InPath:=true;

     if not InPath then
     begin
       AllInpath:=false;
       MessageDlg('Point with the number '+IntToStr(VerList[i].num)+' not belong to any path or circle ,'+' becouse we can not get to her '+' or it has not connaction with Begin or End',mtInformation,[mbok],0) ;
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
      MessageDlg('Cycle with the number '+intToStr(i)+'has no points of operators ',mtWarning,[mbok],0);
      CycleCorrect:=false;
    end;
    if not IsLog then
    begin
      MessageDlg('Cycle with the number '+intToStr(i)+'has no points of conditition',mtWarning,[mbok],0);
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
        messageDlg('Array is overfloat',mtWarning,[mbok],0);
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
         end

      end;
        tmp:=CycleArr[CycleCount,0];
        for j:=1 to length(CycleArr[CycleCount])-1 do
          CycleArr[CycleCount,j-1]:=CycleArr[CycleCount,j];
        CycleArr[CycleCount,Length(CycleArr[CycleCount])-1]:=tmp;

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
