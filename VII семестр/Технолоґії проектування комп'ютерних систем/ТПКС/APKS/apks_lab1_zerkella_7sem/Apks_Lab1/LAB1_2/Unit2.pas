unit Unit2;

interface
  uses   Dialogs,SysUtils;
  const MaxN=2500;
        MaxV=1000;
  type TVect=array[0..MaxN-1] of integer;
       TStrVect=array[0..MaxN-1] of string;
      TVid=(b,k,o,l);
      TVerList=record
        num:integer;
        Vid:TVid;
        Value:string [10];
        NextMain,NextAlt:integer;
        Col,Row:integer;
        exist:boolean;
      end;
      TTrigger1=array [0..3] of integer;
      TTrigger2=array [0..1,0..3] of integer;

var  VerList:array[0..MaxV] of TVerList;
  X,Y:TStrVect;
  Sost:TVect;
  TabPer,TabVyhMili,TabVyhMura,ISost,SostP,TabTrigger:array[0..MaxN,0..MaxN] of integer;
  TabIst,CodeTab:array[0..MaxN,0..MaxN] of integer;
  XCnt,YCnt,SostCnt,VerCnt,MaxVerNum:integer;
  Trigger1:TTrigger1;
  Trigger2:TTrigger2;
  N:integer;
  IsMURA:boolean;
  TrigSize,TrigCnt:integer;
const
  D:TTrigger1=(0,1,0,1);
  T:TTrigger1=(0,1,1,0);
  RS:TTrigger2=((2,0,1,0),(0,1,0,2));
  JK:TTrigger2=((2,2,1,0),(0,1,2,2));
  procedure MakeX;
  procedure MakeY;
  procedure Mura;
  procedure Mili;
  procedure MakeTabIst;
  function Stepin(X:integer):integer; {2^x}
  procedure MakeTabPer;
  procedure CodeSost;
  procedure MakeStructTab;
  procedure TriggerFunc1;
  procedure TriggerFunc2;
  function FindVer(Num:integer):integer;
implementation

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


procedure DivideStr(S:string;var First,Last:string);
  var i:integer;
      flag:boolean;
begin
  Last:='';
  First:='';
  flag:=true;
  for i:=1 to Length(S) do
    if flag and((S[i]=' ')or (S[i]=',')or (S[i]=';')) then
      flag:=false
    else
      if flag then
        First:=First+S[i]
      else
        Last:=Last+S[i]
end; {Devidestr}

function FindInt(A:TVect;item,cnt:integer;var pos:integer):boolean;
  var i:integer;
begin
  FindInt:=false;
  for i:=0 to Cnt-1 do
    if A[i]=item then
    begin
      FindInt:=true;
      pos:=i;
    end
end;{Find}

function Find(A:TStrVect;item:string;cnt:integer;var pos:integer):boolean;
  var i:integer;
  last,first:string;
begin
  Find:=false;
  for i:=0 to Cnt-1 do
  begin
    Last:=A[i];
    repeat
      DivideStr(Last,First,Last);
      if First=item   then
      begin
        Find:=true;
        pos:=i
      end;
    until Last='';
  end
end;{Find}


procedure MakeX;
  var pos,i:integer;
      Last,First:string;
begin
  XCnt:=0;
  for i:=1 to VerCnt-1 do
    if VerList[i].Vid=l then
    begin
      Last:=VerList[i].Value;
    repeat
      DivideStr(Last,First,Last);
      if not Find(X,First,XCnt,pos) then
      begin
        X[XCnt]:=First;
        XCnt:=XCnt+1;
      end
    until Last='';
    end
end;{MakeX}

procedure MakeY;
  var pos,i:integer;
     Last,First:string;
begin
  YCnt:=0;
  for i:=1 to VerCnt-1 do
    if VerList[i].Vid=o then
    begin
      Last:=VerList[i].Value;
      repeat
        DivideStr(Last,First,Last);
        if not Find(Y,First,YCnt,pos) then
        begin
          Y[YCnt]:=First;
          YCnt:=YCnt+1
        end
      until Last='';
    end
end;{MakeY}

procedure Mura;
  var i:integer;
begin
  SostCnt:=1;
  for i:=1 to VerCnt-1 do
  begin
    if Verlist[i].Vid=o then
    begin
      Sost[SostCnt]:=i;
      SostCnt:=SostCnt+1
    end;
    if VerList[i].Vid=k then
       Sost[0]:=i
  end
end;{Mura}

procedure Mili;
  var i,pos:integer;
begin
  SostCnt:=1;
  Sost[0]:=VerList[0].NextMain;
  for i:=1 to VerCnt-1 do
    if VerList[i].Vid=o then
      if (not FindInt(Sost,VerList[i].NextMain,Sostcnt,pos))
         and (VerList[VerList[i].NextMain].Vid<>k) then
      begin
        Sost[SostCnt]:=VerList[i].NextMain;
        SostCnt:=SostCnt+1
      end;

  for i:=1 to Vercnt-1 do
    if VerList[i].Vid=k then
      Sost[SostCnt]:=i;
end;{Mili}

function Stepin(X:integer):integer; {2^x}
  var i:integer;
      St:integer;
begin
  St:=1;
  for i:=1 to x do
    St:=St*2;
  Stepin:=St
end;{Stepin}

procedure MakeTabIst;
  var i,j,m:integer;

begin
  for i:=0 to Stepin(XCnt)-1 do
    for j:=0 to XCnt-1 do
      TabIst[i,j]:=0;
  for j:=0 to Stepin(XCnt)-1 do
  begin
    m:= j;
    i:=0;
    while m>0 do
    begin
      TabIst[j,XCnt-i-1]:=m mod 2;
      m:=m div 2;
      i:=i+1
    end
  end
end;{MakeTabIst}

function NextSost (CurSost,j:integer):integer;
  var V,pos,Xres,CurVer:integer;
      First,Last:string;
begin
  NextSost:=0;
  if CurSost=0 then
    if isMura then
      CurVer:=0
    else
      Curver:=VerList[0].NextMain
  else
    CurVer:=Sost[CurSost];
  if IsMURA then
    V:=VerList[findVer(CurVer)].NextMain
  else V:=CurVer;             ///FindVer
  while VerList[FindVer(V)].Vid=l do
  begin
    Xres:=1;
    Last:=VerList[FindVer(V)].Value;
    repeat
      DivideStr(Last,First,Last);
      if  Find(X,First,XCnt,pos) then
        Xres:=Xres*tabIst[j,pos]
    until Last='';
    if Xres=1 then
      V:=VerList[FindVer(V)].NextMain
    else
      V:=VerList[FindVer(V)].NextAlt
  end;
  if VerList[FindVer(V)].Vid=k then
    NextSost:=0
  else
    if IsMURA then
    begin
      if FindInt(Sost,V,SostCnt,pos) then
        NextSost:=pos;
    end
    else // MILI
    begin
      if FindInt(Sost,VerList[V].NextMain,SostCnt,pos) then
        NextSost:=pos;
    end ;
    if not IsMura then
      TabVyhMili[j,CurSost]:=V
end;{NextSost}

procedure MakeTabPer;
  var i,j:integer;
begin
  for i:=0 to SostCnt-1 do
    for j:=0 to Stepin(XCnt)-1 do
      TabPer[j,i]:=NextSost(i,j)
end; {MakeTabPer}

procedure CodeSost;
  var i,j,m:integer;
begin
  N:=1;
  while Stepin(N)<SostCnt do
    N:=N+1;
  for i:=0 to SostCnt-1 do
    for j:=0 to N-1 do
      CodeTab[i,j]:=0;

 for j:=0 to SostCnt-1 do
  begin
    m:= j;
    i:=0;
    while m>0 do
    begin
      CodeTab[j,N-i-1]:=m mod 2;
      m:=m div 2;
      i:=i+1
    end
  end
end; {CodeSost}

procedure MakeStructTab;
   var i,j,k:integer;
       Last,First:string;
begin
   for i:=0 to MaxN do
     for j:=0 to MaxN do
       TabVyhMura[i,j]:=0;

   for i:=0 to SostCnt-1 do
     for j:=0 to Stepin(XCnt)-1 do
     begin
       for k:=0 to N-1 do
       begin
         ISost[i*Stepin(XCnt)+j,k]:=CodeTab[i,k];
         SostP[i*Stepin(XCnt)+j,k]:=CodeTab[TabPer[j,i],k]
       end;

         if IsMura then
           Last:=VerList[Sost[i]].value
        else
           Last:=VerList[TabVyhMili[j,i]].Value;
         repeat
           DivideStr(Last,First,Last);
           for k:=0 to YCnt-1 do
             if First=Y[k] then
               TabVyhMura[i*Stepin(XCnt)+j,k]:=1
//             else
//               TabVyhMura[i*Stepin(XCnt)+j,k]:=0
         until Last=''
       //end
     end
end;{MakeStructTab}

procedure TriggerFunc1;
  var i,j:integer;
begin
  for i:=0 to Stepin(XCnt)*SostCnt-1 do
    for j:=0 to N-1 do
    begin
      if (ISost[i,j]=0)and(SostP[i,j]=0)then
        TabTrigger[i,j]:=Trigger1[0];
      if (ISost[i,j]=0)and(SostP[i,j]=1)then
        TabTrigger[i,j]:=Trigger1[1];
      if (ISost[i,j]=1)and(SostP[i,j]=0)then
        TabTrigger[i,j]:=Trigger1[2];
      if (ISost[i,j]=1)and(SostP[i,j]=1)then
        TabTrigger[i,j]:=Trigger1[3];
    end ;
    TrigCnt:=N;
end; {TriggerFunc1}

procedure TriggerFunc2;
  var i,j:integer;
begin
  for i:=0 to Stepin(XCnt)*SostCnt-1 do
    for j:=0 to N-1 do
    begin
      if (ISost[i,j]=0)and(SostP[i,j]=0)then
      begin
        TabTrigger[i,j*2]:=Trigger2[0,0];
        TabTrigger[i,j*2+1]:=Trigger2[1,0];
      end;
      if (ISost[i,j]=0)and(SostP[i,j]=1)then
      begin
        TabTrigger[i,j*2]:=Trigger2[0,1];
        TabTrigger[i,j*2+1]:=Trigger2[1,1];
      end;
      if (ISost[i,j]=1)and(SostP[i,j]=0)then
      begin
        TabTrigger[i,j*2]:=Trigger2[0,2];
        TabTrigger[i,j*2+1]:=Trigger2[1,2];
      end;
      if (ISost[i,j]=1)and(SostP[i,j]=1)then
      begin
        TabTrigger[i,j*2]:=Trigger2[0,3];
        TabTrigger[i,j*2+1]:=Trigger2[1,3];
      end
    end;
    TrigCnt:=2*N
end; {TriggerFunc2}

end.
