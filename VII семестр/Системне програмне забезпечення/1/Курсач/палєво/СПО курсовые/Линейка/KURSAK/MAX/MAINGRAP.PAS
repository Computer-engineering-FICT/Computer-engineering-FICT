unit MainGraphUnit;

interface
uses Windows,Classes,Graphics,SysUtils,StdCtrls,Math,Grids, ListControl, Forms;
type

   SelType = (stNONE,stPOINT,stCON); // Тип текущего элемента

   // Вершина графа
   PPoint = ^TPoint;
   TPoint = record
      UIN   : integer;
      Value : integer;
      X,Y   : integer;
   end;

   // Соединение в графе
   PConnection = ^TConnection;
   TConnection = record
      toPoint   : PPoint;
      fromPoint : PPoint;
      Value     : integer;
   end;

   // Выделенный элемент
   CurElement = record
     ceType : SelType;
     element : pointer;
   end;

   // Граф
   TGraph = class
      private
        WasChanged : boolean;
        ChangedAfter : boolean;
        PointRadius : integer;
        MaxUIN : integer;
        Points : TList;
        Connections : TList;
        Selected,Current : CurElement;
        function CheckCicle(FP,TP:PPoint):boolean;
        function MouseOverPoint(X,Y:integer):PPoint;
        function MouseOverConnection(X,Y:integer):PConnection;
        procedure DrawConnections(C:TCanvas;minW,minH,maxW,maxH:integer);
        procedure DrawPoints(C:TCanvas;minW,minH,maxW,maxH:integer);
        procedure Clear;
      public
        constructor Create;
        destructor Destroy;override;

        function MouseOver(X,Y:integer):CurElement;
        function DeleteSelected:boolean;

        procedure DrawGraph(C:TCanvas;minW,minH,maxW,maxH:integer);
        procedure AddPoint(X,Y:integer;Value:integer);
        function AddConnection(fromPoint,toPoint:PPoint;Value:integer):boolean;

        procedure ChangeCur(dX,dY:integer);
        procedure ChangeCurAndDrawContur(X,Y,GridDelta:integer;C:TCanvas;DrawFirst,DrawSecond:boolean);
        procedure GetDeltaOfCurrent(X,Y:integer;var dX,dY:integer);

        procedure SaveToFile(filename:string);
        procedure OpenFromFile(filename:string);
        procedure SelectCurrent;
        procedure DeselectCurrent;
        procedure MoveOnTop;
        function IsChanged:boolean;
        function WasChangedAfter:boolean;
        function GetPoints:TList;
        function GetConnections:TList;
        function GetPointByID(ID:integer):PPoint;
        procedure ZoomOn(coef:extended);
        procedure ZoomOff(coef:extended);
        procedure ChangeValue(Elem:CurElement;Value:integer);
        function GetConsCount:integer;
        function GetPointsCount:integer;
   end;

   // Погружение

   PProcCon = ^TProcCon;
   PProcPoint = ^TProcPoint;

   TProcCon = record
     Value : integer;
     toPoint : PProcPoint;
     Next : PProcCon;
   end;

   TProcPoint = record
      UIN   : integer;
      Value : integer;
      Merged : boolean;
      UBorder,DBorder : integer;
      UCon,DCon : integer;
      UFixed,DFixed : boolean;
      Prev,Next : PProcCon;
   end;

   PWay = ^TWay;
   TWay = record
     Numbers : string;
     Length  : integer;
     Weight  : integer;
     Current : PProcPoint;
   end;

   PLinkTask = ^TLinkTask;
   PProcTask = ^TProcTask;

   PHolder = ^THolder;
   THolder = record
     Task : PProcTask;
     Link : PLinkTask;
     Next : PHolder;
   end;


   TProcTask = record
     UIN : integer;
     ProcNum : integer;
     StartTime : integer;
     Length : integer;
     // ссылки
     Prev : PHolder;
     // Режим оптимизации
     MayBeBefore : boolean;
     MayBeAfter : boolean;
     // исп-ся на нач. этапе
     Ready : integer;
   end;

   TLinkTask = record
     fromUIN : integer;
     toUIN : integer;
     fromProc : integer;
     toProc : integer;
     fromTask : PProcTask;
     toTask   : PProcTask;
     StartTime : integer;
     Length : integer;
     PrevLink : PLinkTask;
     PrevTask : PProcTask;
   end;

   PPossibleMove = ^TPossibleMove;
   TPossibleMove = record
     UIN : integer;
     processor : integer;
     afterUIN  : integer;
     ProcCount,Time:integer;
     CurrentState : boolean;
   end;

   TSubMerger = class
     private
       Selected : PProcTask;
       MinProcNum:integer;
       MaxProcNum:integer;
       Points : TList;
       Procs  : TList;
       Links  : TList;
       AllProcTasks : Tlist;
       function GetProcPointByUIN(UIN:integer):PProcPoint;
       function GetProcTaskByUIN(UIN:integer):PProcTask;
       procedure Clear;
       procedure ClearProcs(FreeElements:boolean);
       procedure ClearLinks(FreeElements:boolean);
       procedure FormLinkTasksAndSetTimes(NumOfProcs:integer);
       // -- Optimization -- //
       procedure ClearPossibleMoves(var List:TList);
       function GetPossibleMoves(UIN:integer):TList;
       function GetTime:integer;
       function GetProcCount:integer;
       procedure SaveBackUp(var List:Tlist);
       procedure RestoreBackUp(var List:Tlist;NOP:integer;ClearCurrent:boolean);
     public
       constructor Create;
       procedure Init(GPoints,GConnections:TList);
       procedure DoBazovoe;
       procedure SelectTask(UIN:integer);
       procedure DeselectTask;
       procedure MoveSelectedAfter(ProcNum,UIN:integer);
       procedure ShowSubMerging(SG:TStringGrid);
       function IncNumOfProc:boolean;
       function DecNumOfProc:boolean;
       function OptimizeOneStep(L1,L2:TLabel):boolean;
       procedure OptimizeAuto(Form:TForm;L1,L2:TLabel);
   end;

   // --- --- --- //

   function MinInt(I1,I2:integer):integer;
   function MaxInt(I1,I2:integer):integer;
   procedure MinMaxInt(I1,I2:integer;Var Min,Max:integer);

implementation

// -- Native functions -- //

function MinInt(I1,I2:integer):integer;
begin
  if I1<I2 then Result:=I1 else Result:=I2
end;

function MaxInt(I1,I2:integer):integer;
begin
  if I1>I2 then Result:=I1 else Result:=I2
end;

procedure MinMaxInt(I1,I2:integer;Var Min,Max:integer);
begin
  if I1<I2 then
  begin
    Min:=I1;
    Max:=I2
  end
  else
  begin
   Min:=I2;
   Max:=I1
  end
end;


// -- Objects -- //

function TGraph.GetConsCount:integer;
begin
  Result:=Connections.Count
end;

function TGraph.GetPointsCount:integer;
begin
  Result:=Points.Count
end;

procedure TGraph.ZoomOn(coef:extended);
var PP:PPoint;
    i:integer;
begin
  for i:=0 to Points.Count-1 do
  begin
    PP:=Points[i];
    PP.X:=round(PP.X*coef);
    PP.Y:=round(PP.Y*coef);
  end;
end;

procedure TGraph.ZoomOff(coef:extended);
var PP:PPoint;
    i:integer;
begin
  for i:=0 to Points.Count-1 do
  begin
    PP:=Points[i];
    PP.X:=round(PP.X/coef);
    PP.Y:=round(PP.Y/coef);
  end;
end;

constructor TGraph.Create;
begin
  inherited Create;
  MaxUIN:=0;
  Points:=TList.Create;
  Connections:=TList.Create;
  Current.ceType := stNONE;
  Current.element := nil;
  Selected.ceType := stNONE;
  Selected.element := nil;
  PointRadius := 15;
  WasChanged := false;
  ChangedAfter := false;
end;

destructor TGraph.Destroy;
begin
  Clear;
  Points.Destroy;
  Connections.Destroy;
  inherited Destroy
end;

procedure TGraph.Clear;
begin
  while Points.Count<>0 do
  begin
    dispose(PPoint(Points.first));
    Points.delete(0);
  end;
  while Connections.Count<>0 do
  begin
    dispose(PConnection(Connections.first));
    Connections.delete(0);
  end;
  MaxUIN:=0;
  Current.ceType := stNONE;
  Current.element := nil;
  Selected.ceType := stNONE;
  Selected.element := nil;
end;

function TGraph.DeleteSelected:boolean;
var i:integer;
    PP:PPoint;
    PC:PConnection;
begin
 if Selected.ceType = stNONE
 then Result:=false
 else
 begin
   WasChanged:=true;
   ChangedAfter:=true;
   Result:=true;
   if Selected.ceType = stCON then
   begin
     PC:=Selected.element;
     for i:=0 to Connections.Count-1 do
     begin
       if Connections[i] = PC then
       begin
         Connections.delete(i);
         break
       end;
     end;
     dispose(PC);
   end
   else
   begin
     PP:=Selected.element;
     for i:=0 to Points.Count-1 do
     begin
       if Points[i] = PP then
       begin
         Points.delete(i);
         break
       end;
     end;
     i:=0;
     while i<Connections.Count do
     begin
       PC:=Connections[i];
       if(PC.toPoint=PP)or(PC.fromPoint=PP)then
       begin
         Connections.delete(i);
         dispose(PC)
       end
       else
        i:=i+1
     end;
     dispose(PP)
   end;
   Selected.ceType:=stNONE;
   Selected.element:=nil
 end;

end;

procedure TGraph.MoveOnTop;
var PP:PPoint;
    num:integer;
begin
  if Current.ceType = stPoint then
  begin
    WasChanged:=true;
//    ChangedAfter:=true;
    PP:=Current.element;
    num:=0;
    while num<Points.count do
    begin
      if Points[num]=PP then break;
      num:=num+1
    end;
    Points.delete(num);
    Points.add(PP)
  end;
end;

procedure TGraph.SelectCurrent;
begin
  Selected:=Current
end;

procedure TGraph.DeselectCurrent;
begin
  Selected.ceType:=stNONE;
  Selected.element:=nil
end;

function TGraph.MouseOverPoint(X,Y:integer):PPoint;
var PP:PPoint;
    d,i:integer;
begin
  Result:=nil;
  for i:=Points.Count-1 downto 0 do
  begin
    PP:=Points[i];
    d := round(sqrt((X-PP.X)*(X-PP.X)+(Y-PP.Y)*(Y-PP.Y)));
    if d<=15 then
    begin
      Result:=Points[i];
      break
    end;
  end;
end;

function TGraph.MouseOverConnection(X,Y:integer):PConnection;
var PC:PConnection;
    i:integer;
    TX,TY,FX,FY,d:integer;
begin
  Result:=nil;
  for i:=Connections.Count-1 downto 0 do
  begin
    PC:=Connections[i];
    if MinInt(PC.fromPoint.X,PC.toPoint.X) = PC.fromPoint.X then
    begin
      FX:=PC.fromPoint.X;
      FY:=PC.fromPoint.Y;
      TX:=PC.toPoint.X;
      TY:=PC.toPoint.Y
    end
    else
    begin
      FX:=PC.toPoint.X;
      FY:=PC.toPoint.Y;
      TX:=PC.fromPoint.X;
      TY:=PC.fromPoint.Y
    end;
    if (X>=FX-5)and(X<=TX+5)then
    begin
      d := (TY-FY)*X + (FX-TX)*Y + TX*FY - FX*TY;
      d := abs(round(d/sqrt((TY-FY)*(TY-FY)+(FX-TX)*(FX-TX))));
      if d<=5 then
      begin
        Result:=Connections[i];
        break
      end
    end
  end
end;

function TGraph.MouseOver(X,Y:integer):CurElement;
begin
  current.element:=MouseOverPoint(X,Y);
  if current.element<>nil then current.ceType:=stPOINT
  else
  begin
    current.element:=MouseOverConnection(X,Y);
    if current.element<>nil then current.ceType:=stCON
                            else current.ceType:=stNONE
  end;
  Result:=current;
end;

procedure TGraph.GetDeltaOfCurrent(X,Y:integer;var dX,dY:integer);
var PP:PPoint;
begin
  PP:=current.element;
  if PP<>nil then
  begin
    dX:=X - PP.X;
    dY:=Y - PP.Y
  end
  else
  begin
    dX:=0;
    dY:=0
  end;
end;

procedure TGraph.ChangeCur(dX,dY:integer);
var PP:PPoint;
begin
  WasChanged:=true;
//  ChangedAfter:=true;
  PP:=current.element;
  if PP<>nil then
  begin
    PP.X:=PP.X+dx;
    PP.Y:=PP.Y+dy
  end
end;

procedure TGraph.ChangeCurAndDrawContur(X,Y,GridDelta:integer;C:TCanvas;DrawFirst,DrawSecond:boolean);
var PP:PPoint;
begin
  WasChanged:=true;
//  ChangedAfter:=true;
  if current.ceType<>stNONE then
  begin
    PP:=current.element;
    C.Brush.Style:=bsClear;
    C.Pen.Mode := pmNotXor;
    C.Pen.Color:=clBlack;
    C.Pen.Width:=1;
    if DrawFirst then C.Ellipse(PP.X-PointRadius,PP.Y-PointRadius,PP.X+PointRadius,PP.Y+PointRadius);
    if GridDelta>1 then
    begin
      PP.X:=round(X/GridDelta)*GridDelta;
      PP.Y:=round(Y/GridDelta)*GridDelta
    end
    else
    begin
      PP.X:=X;
      PP.Y:=Y
    end;
    if DrawSecond then C.Ellipse(PP.X-PointRadius,PP.Y-PointRadius,PP.X+PointRadius,PP.Y+PointRadius);
    C.Pen.Mode := pmCopy;
    C.Brush.Style:=bsSolid;
  end;
end;

procedure getArrowCoord(Fx,Fy,Tx,Ty:integer;R,Alpha:Integer;var Ar1X,Ar1Y,Ar2X,Ar2Y:integer);
var CosV,SinV,D,CosAd2:extended;
    a,b,c,Descr:extended;
    y1,y2,x1,x2:extended;
    RCosAd2,RSinAd2:integer;
begin
  D := sqrt((FX-TX)*(FX-TX)+(FY-TY)*(FY-TY));
  if D<>0 then CosV := (FX-TX) / D else CosV:=0;
  if CosV = 0 then
  begin
    RCosAd2 := round(R*Cos(Pi*Alpha/360));
    RSinAd2 := round(R*Sin(Pi*Alpha/360));
    Ar1X := TX + RSinAd2;
    Ar2X := TX - RSinAd2;
    if TY>FY then Ar1Y := TY - RCosAd2
             else Ar1Y := TY + RCosAd2;
    Ar2Y := Ar1Y;
  end
  else
  begin
    SinV := (FY-TY) / D;
    CosAd2 := Cos(Pi*Alpha/360);
    a:=1;
    b:=-2*CosAd2*SinV;
    c:=CosAd2*CosAd2-CosV*CosV;
    Descr := b*b - 4*a*c;
    y1 := (-b - sqrt(Descr))/(2*a);
    y2 := (-b + sqrt(Descr))/(2*a);
    x1 := (cosAd2 - sinV*y1) / cosV;
    x2 := (cosAd2 - sinV*y2) / cosV;
    Ar1X:=round(x1*R)+Tx;
    Ar2X:=round(x2*R)+Tx;
    Ar1Y:=round(y1*R)+Ty;
    Ar2Y:=round(y2*R)+Ty;
  end
end;

procedure TGraph.DrawConnections(C:TCanvas;minW,minH,maxW,maxH:integer);
var i:integer;
    PC:PConnection;
    Ar1X,Ar1Y,Ar2X,Ar2Y:integer;
    Poly:array[0..2]of Windows.TPoint;
    D:extended;
    FX,FY,TX,TY:integer;
    s:string;
    W,H,X,Y:integer;
begin
  C.Pen.Color := clBlue;
  for i:=0 to Connections.Count-1 do
  begin
    C.Brush.Color := clBlue;
    PC:=Connections[i];
    if Selected.element = PC then C.Pen.Width:=2
                             else C.Pen.Width:=1;
    C.moveto(PC.fromPoint.X,PC.fromPoint.Y);
    C.lineto(PC.toPoint.X,PC.toPoint.Y);
    FX:=PC.fromPoint.X;
    FY:=PC.fromPoint.Y;
    TX:=PC.toPoint.X;
    TY:=PC.toPoint.Y;
    D := sqrt((FX-TX)*(FX-TX)+(FY-TY)*(FY-TY));
    if D<>0 then
    begin
      TX := round( TX - PointRadius*(TX-FX)/D );
      TY := round( TY - PointRadius*(TY-FY)/D );
    end;  
    getArrowCoord(FX,FY,TX,TY,10,45,Ar1X,Ar1Y,Ar2X,Ar2Y);
//    getArrowCoord(PC.fromPoint.X,PC.fromPoint.Y,PC.toPoint.X,PC.toPoint.Y,PointRadius,10,45,Ar1X,Ar1Y,Ar2X,Ar2Y);
    Poly[0].x := TX;
    Poly[0].y := TY;
    Poly[1].x := Ar1X;
    Poly[1].y := Ar1Y;
    Poly[2].x := Ar2X;
    Poly[2].y := Ar2Y;
    C.Polygon(Poly);
    s:=inttostr(PC.Value);
    H:=C.TextHeight('A');
    W:=C.TextWidth(s);
    X:=round((FX+TX-W)/2)-3;
    Y:=round((FY+TY-H)/2)-1;
    C.Brush.Color := clWhite;
    C.Rectangle(X,Y,X+W+7,Y+H+2);
    C.Brush.style:=bsClear;
    C.TextOut(X+3,Y+1,s);
    C.Brush.style:=bsSolid;
{    C.moveto(Ar1X,Ar1Y);
    C.lineto(PC.toPoint.X,PC.toPoint.Y);
    C.moveto(Ar2X,Ar2Y);
    C.lineto(PC.toPoint.X,PC.toPoint.Y);
}
  end
end;

procedure TGraph.DrawPoints(C:TCanvas;minW,minH,maxW,maxH:integer);
var i:integer;
    PP:PPoint;
    H,W:integer;
    X1,X2,Y1,Y2:integer;
    s:string;
begin
  C.Brush.Style := bsSolid;
  C.Brush.Color := clWhite;
  C.Pen.Color := clBlack;
  for i:=0 to Points.Count-1 do
  begin
    PP:=Points[i];
    if Selected.element = PP then C.Pen.Width:=2
                             else C.Pen.Width:=1;
//    C.Ellipse(PP.X-PointRadius,PP.Y-PointRadius,PP.X+PointRadius,PP.Y+PointRadius+10);
    X1:=PP.X-PointRadius;
    Y1:=PP.Y-PointRadius;
    X2:=PP.X+PointRadius;
    Y2:=PP.Y+PointRadius;
    if(X1<maxW)and(Y2<=maxH)and(X2>minW)and(Y2>minH)then C.Ellipse(X1,Y1,X2,Y2);
    s:=inttostr(PP.Value);
    H:=C.TextHeight('A');
    W:=C.TextWidth(s);
    C.TextOut(round(PP.X-W/2),round(PP.Y-H/2),s)
  end;
  C.Brush.Style := bsClear;
  C.Font.Color:=clBlack;
  C.Font.Style:=[fsBold];
  for i:=0 to Points.Count-1 do
  begin
    PP:=Points[i];
    s:=inttostr(PP.UIN);
    H:=C.TextHeight('A');
    W:=C.TextWidth(s);
    C.TextOut(round(PP.X+PointRadius-W/2),PP.Y-PointRadius-H-1,s)
  end;
  C.Font.Style:=[];
  C.Brush.Style := bsSolid;
  
end;

procedure TGraph.DrawGraph(C:TCanvas;minW,minH,maxW,maxH:integer);
begin
  DrawConnections(C,minW,minH,maxW,maxH);
  DrawPoints(C,minW,minH,maxW,maxH);
end;

procedure TGraph.AddPoint(X,Y:integer;Value:integer);
var PP:PPoint;
begin
  WasChanged:=true;
  ChangedAfter:=true;
  MaxUIN:=MaxUIN+1;
  new(PP);
  PP.UIN:=MaxUIN;
  PP.X:=X;
  PP.Y:=Y;
  PP.Value:=Value;
  Points.Add(PP);
end;

function TGraph.CheckCicle(FP,TP:PPoint):boolean;
var List : TList;
    PC:PConnection;
    CurP:PPoint;
    i:integer;
begin
  Result:=true;
  List:= TList.create;
  List.add(TP);
  while List.Count<>0 do
  begin
    CurP:=List.first;
    List.delete(0);
    if CurP = FP then
    begin
      Result:=false;
      break
    end;
    for i:=0 to Connections.Count-1 do
    begin
      PC:=Connections[i];
      if PC.fromPoint = CurP then List.Add(PC.toPoint)
    end
  end;
  List.clear;
  List.Destroy
end;

function TGraph.AddConnection(fromPoint,toPoint:PPoint;Value:integer):boolean;
var PC:PConnection;
begin
  if(fromPoint<>toPoint) and CheckCicle(fromPoint,toPoint) then
  begin
    WasChanged:=true;
    ChangedAfter:=true;
    new(PC);
    PC.fromPoint:=fromPoint;
    PC.toPoint:=toPoint;
    PC.Value:=Value;
    Connections.Add(PC);
    Result:=true
  end
  else
  Result:=false
end;

procedure TGraph.SaveToFile(filename:string);
var f:file;
    PP:PPoint;
    PC:PConnection;
    i:integer;
begin
  assign(f,filename);
  rewrite(f,1);
  BlockWrite(f,Points.Count,SizeOf(integer));
  BlockWrite(f,Connections.Count,SizeOf(integer));
  for i:=0 to Points.Count-1 do
  begin
    PP:=Points[i];
    BlockWrite(f,PP,SizeOf(PP));
    BlockWrite(f,PP^,SizeOf(PP^));
  end;
  for i:=0 to Connections.Count-1 do
  begin
    PC:=Connections[i];
//    BlockWrite(f,PC,SizeOf(PC));
    BlockWrite(f,PC^,SizeOf(PC^));
  end;
  close(f);
end;

procedure TGraph.OpenFromFile(filename:string);
type
    PAddr = ^TAddr;
    TAddr = record
      Old,New:pointer;
    end;
var f:file;
    Addresses:TList;
    PA:PAddr;
    PP:PPoint;
    PC:PConnection;
    p:pointer;
    i,NOP,NOC:integer;

    procedure SetNewAddr(iOld,iNew:pointer);
    var PA:PAddr;
    begin
      new(PA);
      PA.Old:=iOld;
      Pa.New:=iNew;
      Addresses.add(PA)
    end;

    function GetNewAddr(Old:pointer):pointer;
    var i:integer;
    begin
      Result:=nil;
      for i:=0 to Addresses.Count-1 do
        if PAddr(Addresses[i]).Old = Old then
        begin
          Result:=PAddr(Addresses[i]).New;
          Break
        end;
    end;

begin
  MaxUIN:=0;
  Clear;
  WasChanged:=false;
  ChangedAfter:=false;
  Addresses:=TList.Create;
  assign(f,filename);
  reset(f,1);
  BlockRead(f,NOP,SizeOf(integer));
  BlockRead(f,NOC,SizeOf(integer));
  for i:=0 to NOP-1 do
  begin
    new(PP);
    BlockRead(f,p,SizeOf(p));
    BlockRead(f,PP^,SizeOf(PP^));
    Points.Add(PP);
    SetNewAddr(p,PP);
    If MaxUIN < PP.UIN then MaxUIN:=PP.UIN
  end;
  for i:=0 to NOC-1 do
  begin
    new(PC);
    BlockRead(f,PC^,SizeOf(PC^));
    PC.toPoint:=GetNewAddr(PC.toPoint);
    PC.fromPoint:=GetNewAddr(PC.fromPoint);
    Connections.Add(PC);
  end;
  close(f);
  while Addresses.Count<>0 do
  begin
    PA:=Addresses.first;
    Addresses.Delete(0);
    dispose(PA);
  end;
  Addresses.Destroy
end;

function TGraph.IsChanged:boolean;
begin
  Result:=WasChanged
end;

function TGraph.WasChangedAfter:boolean;
begin
  Result:=ChangedAfter;
  ChangedAfter:=false;
end;

function TGraph.GetPointByID(ID:integer):PPoint;
var PP:PPoint;
    i:integer;
begin
  Result:=nil;
  for i:=0 to Points.Count-1 do
  begin
    PP:=Points[i];
    if PP.UIN=ID then
    begin
      Result:=PP;
      break
    end;
  end;
end;

function TGraph.GetPoints:TList;
begin
  Result:=Points
end;

function TGraph.GetConnections:TList;
begin
  Result:=Connections
end;

procedure TGraph.ChangeValue(Elem:CurElement;Value:integer);
begin
 if Elem.element<>nil then
 begin
   case Elem.ceType of
     stPOINT:PPoint(Elem.element).Value:=Value;
     stCON  :PConnection(Elem.element).Value:=Value;
   end;
   WasChanged:=true;
   ChangedAfter:=true
 end  
end;

// --- SubMerger --- //

constructor TSubMerger.Create;
begin
  Points := TList.Create;
  AllProcTasks := TList.Create;
  Procs:=TList.Create;
  Links:=TList.Create
end;

procedure TSubMerger.ClearProcs(FreeElements:boolean);
var PPT:PProcTask;
    PH:PHolder;
    tmpPoint:pointer;
    List:TList;
begin
  Selected:=nil;
  while Procs.Count<>0 do
  begin
    List:=Procs.first;
    Procs.delete(0);
    while List.Count<>0 do
    begin
      PPT:=List.first;
      List.delete(0);
      PH:=PPT.Prev;
      while PH<>nil do
      begin
        tmpPoint:=PH.Next;
        dispose(PH);
        PH:=tmpPoint
      end;
      PPT.Prev:=nil;
      PPT.MayBeAfter:=false;
      PPT.MayBeBefore:=false;
      if FreeElements then dispose(PPT);
    end;
    List.destroy;
  end;
  if FreeElements then AllProcTasks.clear;
end;

procedure TSubMerger.ClearLinks(FreeElements:boolean);
var PLT:PLinkTask;
    List:TList;
begin
  while Links.Count<>0 do
  begin
    List:=Links.first;
    Links.delete(0);
    while List.Count<>0 do
    begin
      PLT:=List.first;
      List.delete(0);
      PLT.PrevLink:=nil;
      PLT.PrevTask:=nil;
      if FreeElements then dispose(PLT);
    end;
    List.destroy;
  end;
end;

procedure TSubMerger.Clear;
var PPP:PProcPoint;
    PPC:PProcCon;
begin
  while Points.Count<>0 do
  begin
    PPP:=Points.first;
    Points.delete(0);
    while PPP.Prev<>nil do
    begin
      PPC:=PPP.Prev.Next;
      dispose(PPP.Prev);
      PPP.Prev:=PPC
    end;
    while PPP.Next<>nil do
    begin
      PPC:=PPP.Next.Next;
      dispose(PPP.Next);
      PPP.Next:=PPC
    end;
    dispose(PPP)
  end;
  ClearLinks(true);
  ClearProcs(true);
  AllProcTasks.Clear;
{
  while FProcTasks.Count<>0 do
  begin
    PPT:=FProcTasks.first;
    FProcTasks.delete(0);
    dispose(PPT)
  end;
  while FLinkTasks.Count<>0 do
  begin
    PLT:=FLinkTasks.first;
    FLinkTasks.delete(0);
    dispose(PLT)
  end;
}
end;

function TSubMerger.GetProcPointByUIN(UIN:integer):PProcPoint;
var i:integer;
begin
  Result:=nil;
  for i:=0 to Points.Count-1 do
   if PProcPoint(Points[i]).UIN = UIN then
   begin
     Result:=Points[i];
     break
   end;
end;

function TSubMerger.GetProcTaskByUIN(UIN:integer):PProcTask;
var i:integer;
begin
  Result:=nil;
  for i:=0 to AllProcTasks.Count-1 do
   if PProcTask(AllProcTasks[i]).UIN = UIN then
   begin
     Result:=AllProcTasks[i];
     break
   end;
end;

procedure TSubMerger.Init(GPoints,GConnections:TList);
var i:integer;
    PP:PPoint;
    PC:PConnection;
    PPP:PProcPoint;
    PPC:PProcCon;
begin
  Clear;
  for i:=0 to GPoints.Count-1 do
  begin
    PP:=GPoints[i];
    new(PPP);
    PPP.UIN := PP.Uin;
    PPP.Value := PP.Value;
    PPP.UBorder:=0;
    PPP.DBorder:=$8FFFFFFF;
    PPP.UFixed:=false;
    PPP.DFixed:=false;
    PPP.UCon:=0;
    PPP.DCon:=0;
    PPP.Prev:=nil;
    PPP.Next:=nil;
    Points.Add(PPP);
  end;

  for i:=0 to GConnections.Count-1 do
  begin
    PC:=GConnections[i];
    PPP := GetProcPointByUIN(PC.fromPoint.UIN);
    new(PPC);
    PPC.Value := PC.Value;
    PPC.toPoint := GetProcPointByUIN(PC.toPoint.UIN);
    PPC.Next := PPP.Next;
    PPP.Next := PPC;

    PPP := GetProcPointByUIN(PC.toPoint.UIN);
    new(PPC);
    PPC.Value := PC.Value;
    PPC.toPoint := GetProcPointByUIN(PC.fromPoint.UIN);
    PPC.Next := PPP.Prev;
    PPP.Prev := PPC;
  end;
end;

procedure SetUBorderToPPP(PPP:PProcPoint;Value:integer);
var PPC:PProcCon;
    Fix:boolean;
begin
  if PPP.UBorder < Value then PPP.UBorder := Value;
  PPC:=PPP.Prev;
  Fix:=true;
  while PPC<>nil do
  begin
    if not PPC.toPoint.DFixed then
    begin
      Fix:=false;
      Break
    end;
    PPC:=PPC.Next
  end;
  PPP.UFixed:=Fix
end;

procedure SetDBorderToPPP(PPP:PProcPoint;Value:integer);
var PPC:PProcCon;
    Fix:boolean;
begin
  if PPP.DBorder > Value then PPP.DBorder := Value;
  PPC:=PPP.Next;
  Fix:=true;
  while PPC<>nil do
  begin
    if not PPC.toPoint.UFixed then
    begin
      Fix:=false;
      Break
    end;
    PPC:=PPC.Next
  end;
  PPP.DFixed:=Fix
end;

procedure SetUBorderDown(PPP:PProcPoint;Value:integer);
var PPC:PProcCon;
    workPPP:PProcPoint;
    List:TList;
begin
  List:=TList.create;
  if PPP.UBorder < Value then
  begin
    PPP.UBorder := Value;
    List.Add(PPP);
    while List.Count<>0 do
    begin
      workPPP:=List[0];
      List.delete(0);
      PPC:=workPPP.Next;
      while PPC<>nil do
      begin
        if PPC.toPoint.UBorder < workPPP.UBorder+1 then
        begin
          PPC.toPoint.UBorder:=workPPP.UBorder+1;
          List.Add(PPC.toPoint)
        end;
        PPC:=PPC.Next
      end;
    end;
  end;
  List.Destroy;
end;

procedure SetDBorderUp(PPP:PProcPoint;Value:integer);
var PPC:PProcCon;
    workPPP:PProcPoint;
    List:TList;
begin
  List:=TList.create;
  if PPP.DBorder > Value then
  begin
    PPP.DBorder := Value;
    List.Add(PPP);
    while List.Count<>0 do
    begin
      workPPP:=List[0];
      List.delete(0);
      PPC:=workPPP.Prev;
      while PPC<>nil do
      begin
        if PPC.toPoint.DBorder > workPPP.DBorder-1 then
        begin
          PPC.toPoint.DBorder:=workPPP.DBorder-1;
          List.Add(PPC.toPoint)
        end;
        PPC:=PPC.Next
      end;
    end;
  end;
  List.Destroy;
end;

procedure SetProcToPPP(PPP:PProcPoint;Value:integer);
var PPC:PProcCon;
begin
  PPP.UBorder:=Value;
  PPP.DBorder:=Value;
  PPP.UFixed:=true;
  PPP.DFixed:=true;
  PPP.Merged:=true;
  PPC:=PPP.Prev;
  while PPC<>nil do
  begin
    if not PPC.toPoint.Merged then
    begin
      //if PPC.toPoint.DBorder>PPP.UBorder-1 then SetDBorderToPPP(PPC.toPoint,PPP.UBorder-1);
      SetDBorderToPPP(PPC.toPoint,PPP.UBorder-1);
      PPC.toPoint.DCon:=PPC.toPoint.DCon+PPC.Value;
    end;  
    PPC:=PPC.Next;
  end;
  PPC:=PPP.Next;
  while PPC<>nil do
  begin
    if not PPC.toPoint.Merged then
    begin
      //if PPC.toPoint.UBorder<PPP.DBorder+1 then SetUBorderToPPP(PPC.toPoint,PPP.DBorder+1);
      SetUBorderToPPP(PPC.toPoint,PPP.DBorder+1);
      PPC.toPoint.UCon:=PPC.toPoint.UCon+PPC.Value;
    end;  
    PPC:=PPC.Next;
  end;
end;

procedure TSubMerger.DoBazovoe;
var i,j,p:integer;
    PPP:PProcPoint;
    PPC:PProcCon;
    PW,newPW:PWay;
    WorkList : TList;
    WaysList : TList;
    MaxWayLength : integer;
    s : string;
    //-->>
    Pretender:PProcPoint;
    NoChange:boolean;
    PretenderCon : integer;
    //-->>
    PPT:PProcTask;
begin
  ClearLinks(true);
  ClearProcs(true);
  AllProcTasks.Clear;
  WaysList := TList.Create;
  WorkList := TList.Create;
  for i:=0 to Points.Count-1 do
  begin
    PPP:=Points[i];
    PPP.UBorder:=0;
    PPP.DBorder:=$7FFFFFFF;
    PPP.UCon:=0;
    PPP.DCon:=0;
    PPP.UFixed:=false;
    PPP.DFixed:=false;
    PPP.Merged:=false;
    WorkList.Add(PPP)
  end;

  // >> Нахождение Макс. пути //

  for i:=0 to Points.Count-1 do
  begin
    PPP:=Points[i];
    PPC:=PPP.Next;
    while PPC<>nil do
    begin
      for j:=0 to WorkList.Count-1 do
        if PPC.toPoint = WorkList[j] then
        begin
          WorkList.delete(j);
          break
        end;
      PPC:=PPC.Next
    end;
  end;

  for i:=0 to WorkList.Count-1 do
  begin
    PPP:=WorkList[i];
    new(PW);
    PW.Length:=1;
    PW.Numbers:=inttostr(PPP.UIN)+',';
    PW.Weight:=PPP.Value;
    PW.Current:=PPP;
    WorkList[i]:=PW
  end;

  while WorkList.Count<>0 do
  begin
    PW:=WorkList.first;
    WorkList.delete(0);
    if PW.Current.Next=nil then WaysList.Add(PW)
    else
    begin
      PPC:=PW.Current.Next;
      while PPC<>nil do
      begin
        new(newPW);
        newPW.Length:=PW.Length+1;
        newPW.Weight:=PW.Weight+PPC.Value+PPC.toPoint.Value;
        newPW.Numbers:=PW.Numbers+inttostr(PPC.toPoint.UIN)+',';
        newPW.Current:=PPC.toPoint;
        WorkList.Add(newPW);
        PPC:=PPC.Next
      end;
      dispose(PW)
    end;
  end;

  MaxWayLength := 0;
  for i:=0 to WaysList.Count-1 do
  begin
    PW:=WaysList[i];
    if PW.Length > MaxWayLength then MaxWayLength:=PW.Length
  end;

  // >> Назначение на процессоры //

  for i:=0 to Points.Count-1 do
  begin
    PPP:=Points[i];
    if PPP.Prev = nil then SetUBorderDown(PPP,1);
    if PPP.Next = nil then SetDBorderUp(PPP,MaxWayLength);
  end;
  
  for i:=0 to Points.Count-1 do
  begin
    PPP:=Points[i];
    if PPP.UBorder = PPP.DBorder then SetProcToPPP(PPP,PPP.UBorder);
  end;

  Pretender:=nil;
  PretenderCon:=0;
  repeat
    NoChange:=true;
    for i:=0 to Points.Count-1 do
    begin
      PPP:=Points[i];
      if not PPP.merged then
      begin
        if PPP.UFixed and PPP.DFixed then
        begin
          if PPP.UCon > PPP.DCon then SetProcToPPP(PPP,PPP.UBorder)
                                 else SetProcToPPP(PPP,PPP.DBorder);
          Pretender:=nil;
          NoChange:=false;
          break
        end
        else
        begin
          if PPP.UFixed then
          begin
            if(Pretender = nil)or(PretenderCon < PPP.UCon) then
            begin
              Pretender:=PPP;
              PretenderCon := PPP.UCon
            end;
          end
          else
          if PPP.DFixed then
          begin
            if(Pretender = nil)or(PretenderCon < PPP.DCon) then
            begin
              Pretender:=PPP;
              PretenderCon := PPP.DCon
            end;
          end;
        end;
      end;
    end;

    if Pretender<>nil then
    begin
      if Pretender.UFixed then SetProcToPPP(Pretender,Pretender.UBorder)
                          else SetProcToPPP(Pretender,Pretender.DBorder);
      Pretender:=nil;
      PretenderCon:=0;
      NoChange:=false;
    end;
  until NoChange;

    // >> Размещение во времени //

    // Создание списка заданиё на процессоры
    for i:=0 to Points.Count-1 do
    begin
      PPP:=Points[i];
      new(PPT);
      PPT.ProcNum:=PPP.UBorder;
      PPT.ProcNum:=PPP.DBorder;
      PPT.Ready:=0;
      PPT.UIN:=PPP.UIN;
      PPT.StartTime:=0;
      PPT.Length:=PPP.Value;
      PPT.Prev:=nil;
      PPT.MayBeAfter:=false;
      PPT.MayBeBefore:=false;
      PPC:=PPP.Prev;
      while PPC<>nil do
      begin
        PPT.Ready:=PPT.Ready+1;
        PPC:=PPC.next
      end;
      j:=0;
      while j<=AllProcTasks.Count-1 do
      begin
        if PProcTask(AllProcTasks[j]).Ready > PPT.Ready then break;
        j:=j+1;
      end;
      AllProcTasks.Add(PPT);
    end;

    FormLinkTasksAndSetTimes(MaxWayLength);
end;

procedure SetProcTimes(List:TList);
var i,j:integer;
    PPT:PProcTask;
    PH:PHolder;
    Time,dTime:integer;
begin
  Time:=1;
  for i:=0 to List.Count-1 do
  begin
    PPT:=List[i];
    PPT.StartTime:=Time;
    Time:=Time+PPT.Length;
  end;

  for i:=0 to List.Count-1 do
  begin
    PPT:=List[i];
    Time:=PPT.StartTime;
    PH:=PPT.Prev;
    while PH<>nil do
    begin
      if PH.Task<>nil then
      begin
        if Time < PH.Task.StartTime+PH.Task.Length then
           Time:= PH.Task.StartTime+PH.Task.Length
      end
      else
      begin
        if Time < PH.Link.StartTime+PH.Link.Length then
           Time:= PH.Link.StartTime+PH.Link.Length
      end;
      PH:=PH.Next
    end;
    if Time > PPT.StartTime then
    begin
      dTime:=Time-PPT.StartTime;
      PPT.StartTime:=Time;
      for j:=i+1 to List.Count-1 do PProcTask(List[j]).StartTime:=PProcTask(List[j]).StartTime+dTime
    end;
  end;

end;

procedure SetProcStartTimes(List:TList);
var i:integer;
    PPT:PProcTask;
    Time:integer;
begin
  Time:=1;
  for i:=0 to List.Count-1 do
  begin
    PPT:=List[i];
    PPT.StartTime:=Time;
    Time:=Time+PPT.Length;
  end;
end;

function PLT_TimeCompare(I1,I2:Pointer):integer;
var D1,D2:integer;
    Item1,Item2:PLinkTask;
begin
  Item1:=I1;
  Item2:=I2;
  if Item1.StartTime<Item2.StartTime then Result:=-1
  else
  if Item1.StartTime>Item2.StartTime then Result:=1
  else
  begin
    if Item1.toProc = Item2.toProc then
    begin
      if Item1.toTask.StartTime<Item2.toTask.StartTime then Result:=-1
      else
      if Item1.toTask.StartTime>Item2.toTask.StartTime then Result:=1
                                                       else Result:=0
    end
    else
    begin
      D1:=Item1.toProc - Item1.fromProc;
      D2:=Item2.toProc - Item2.fromProc;
      if D1>D2 then Result:=1
      else
      if D1<D2 then Result:=-1
      else
      begin
        if Item1.toProc<Item2.toProc then Result:=-1
        else
        if Item1.toProc>Item2.toProc then Result:=1
        else
        Result:=0
      end;
    end;
  end;
end;

procedure SetLinkTimes(List:TList);
var i:integer;
    PLT:PLinkTask;
    Time:integer;
begin
  for i:=0 to List.Count-1 do
  begin
    PLT:=List[i];
    if PLT.PrevTask<>nil then
      Time:= PLT.PrevTask.StartTime+PLT.PrevTask.Length
    else
      Time:= PLT.PrevLink.StartTime+PLT.PrevLink.Length;
    PLT.StartTime:=Time;
  end;

  List.Sort(PLT_TimeCompare);
  Time:=1;
  for i:=0 to List.Count-1 do
  begin
    PLT:=List[i];
    if Time>PLT.StartTime then PLT.StartTime:=Time;
    Time:=PLT.StartTime+PLT.Length;
  end;

end;

procedure TSubMerger.FormLinkTasksAndSetTimes(NumOfProcs:integer);
var i,j,k:integer;
    PPT,toPPT:PProcTask;
    PLT:PLinkTask;
    PPP:PProcPoint;
    PPC:PProcCon;
    PH:PHolder;
    tmpPoint : pointer;
    List:TList;
begin
  // Сброс состояния системы
  ClearLinks(true);
  ClearProcs(false);
  if NumOfProcs<>0 then
  begin
    List:=TList.Create;;
    Procs.Add(list);
    for i:=1 to NumOfProcs-1 do
    begin
      List:=TList.Create;;
      Procs.Add(list);
      List:=TList.Create;
      Links.Add(List)
    end;
  end;

  // >>>Конструирование состояние системы

  // Сброс состояния заданий
  for i:=0 to AllProcTasks.Count-1 do
  begin
    PPT:=AllProcTasks[i];
    List:=Procs[PPT.ProcNum-1];
    List.Add(PPT);
  end;

  // Формированик Линков

  for i:=1 to Procs.Count-1 do
  begin
    List:=Procs[i];
    for j:=0 to List.Count-1 do
    begin
      PPT:=List[j];
      PPP:=GetProcPointByUIN(PPT.UIN);
      PPC:=PPP.Prev;
      while PPC<>nil do
      begin
        toPPT:=GetProcTaskByUIN(PPC.toPoint.UIN);
        if toPPT.ProcNum = PPT.ProcNum then
        begin
          new(PH);
          PH.Task:=toPPT;
          PH.Link:=nil;
          PH.Next:=PPT.Prev;
          PPT.Prev:=PH;
        end
        else
        begin
          new(PLT);
          PLT.length:=PPC.Value;
          PLT.fromUIN:=toPPT.UIN;
          PLT.fromProc:=toPPT.ProcNum;
          PLT.toUIN:=PPT.UIN;
          PLT.toProc:=PPT.ProcNum;
          PLT.fromTask:=toPPT;
          PLT.toTask:=PPT;
          PLT.StartTime:=0;
          PLT.PrevTask:=toPPT;
          PLT.PrevLink:=nil;
          Tlist(Links[toPPT.ProcNum-1]).Add(PLT);
          tmpPoint:=PLT;
          for k:=toPPT.ProcNum to PPT.ProcNum-2 do
          begin
            new(PLT);
            PLT.length:=PPC.Value;
            PLT.fromUIN:=toPPT.UIN;
            PLT.fromProc:=toPPT.ProcNum;
            PLT.toUIN:=PPT.UIN;
            PLT.toProc:=PPT.ProcNum;
            PLT.fromTask:=toPPT;
            PLT.toTask:=PPT;
            PLT.StartTime:=0;
            PLT.PrevTask:=nil;
            PLT.PrevLink:=tmpPoint;
            Tlist(Links[k]).Add(PLT);
            tmpPoint:=PLT
          end;
          new(PH);
          PH.Task:=nil;
          PH.Link:=tmpPoint;
          PH.Next:=PPT.Prev;
          PPT.Prev:=PH;
        end; 
        PPC:=PPC.next
      end;

    end;

  end;

  // Попроцессорное уточнение времён

  for i:=0 to Procs.Count-1 do
    SetProcStartTimes(Procs[i]);
  for i:=0 to Procs.Count+Links.Count-1 do
    if i mod 2 = 0 then SetProcTimes(Procs[i div 2])
                   else SetLinkTimes(Links[i div 2])

end;

procedure TSubMerger.ShowSubMerging(SG:TStringGrid);
var i,j,k:integer;
    NumOfRows:integer;
    List:TList;
    PPT:PProcTask;
    PLT:PLinkTask;
begin
  NumOfRows:=1;
  for i:=0 to Procs.Count-1 do
  begin
    List:=Procs[i];
    if List.Count<>0 then
    begin
      PPT:=List.last;
      if NumOfRows<PPT.StartTime+PPT.Length then NumOfRows:=PPT.StartTime+PPT.Length;
    end;
  end;
  for i:=0 to Links.Count-1 do
  begin
    List:=Links[i];
    if List.Count<>0 then
    begin
      PLT:=List.last;
      if NumOfRows<PLT.StartTime+PLT.Length then NumOfRows:=PLT.StartTime+PLT.Length;
    end;  
  end;
  // Чистим сетку //
  SG.RowCount:=NumOfRows;
  if Procs.Count<>0 then SG.ColCount:=2*Procs.Count
                    else SG.ColCount:=0;
  for i:=1 to SG.RowCount-1 do
    for j:=1 to SG.ColCount-1 do SG.Cells[j,i]:='';
  for i:=1 to SG.RowCount-1 do
    SG.Cells[0,i]:=inttostr(i);
  for i:=1 to SG.ColCount-1 do
    if i mod 2 = 1 then SG.Cells[i,0]:=inttostr((i div 2)+1)
                   else SG.Cells[i,0]:='->';
  if Selected<>nil then
  for i:=MinProcNum-1 to MaxProcNum-1 do
  begin
    List:=Procs[i];
    if List.Count<>0 then
    begin
      if(PProcTask(List.first).MayBeBefore)or(Selected=List.first)then
       SG.Cells[2*i+1,0]:='m'+SG.Cells[2*i+1,0]
    end   
    else
       SG.Cells[2*i+1,0]:='m'+SG.Cells[2*i+1,0]
  end;

  SG.Cells[0,0]:='';
  if SG.ColCount<>1 then
  begin
    SG.FixedCols:=1;
    SG.FixedRows:=1;
  end;
  // Вывод
  for i:=0 to Procs.Count-1 do
  begin
    List:=Procs[i];
    for j:=0 to List.Count-1 do
    begin
      PPT:=List[j];
      for k:=PPT.StartTime to PPT.StartTime+PPT.Length-1 do
      begin
        SG.Cells[2*i+1,k]:=inttostr(PPT.UIN);
        if Selected = PPT then SG.Cells[2*i+1,k]:='s'+SG.Cells[2*i+1,k]
        else
        if PPT.MayBeAfter then SG.Cells[2*i+1,k]:='m'+SG.Cells[2*i+1,k]
      end  
    end;
  end;

  for i:=0 to Links.Count-1 do
  begin
    List:=Links[i];
    for j:=0 to List.Count-1 do
    begin
      PLT:=List[j];
      for k:=PLT.StartTime to PLT.StartTime+PLT.Length-1 do
        SG.Cells[2*i+2,k]:=inttostr(PLT.fromUIN)+':'+inttostr(PLT.toUIN);
    end;
  end;
end;

procedure TSubMerger.SelectTask(UIN:integer);
var i,j:integer;
    PPP,tmpPPP:PProcPoint;
    PPC,prevPPC:PProcCon;
    PPT:PProcTask;
    PH:PHolder;
    List:TList;
    newStartIndex,StartIndex,EndIndex:integer;
    Reset:boolean;
begin
  Selected:=GetProcTaskByUIN(UIN);
  for i:=0 to AllProcTasks.Count-1 do
  begin
    PPT:=AllProcTasks[i];
    PPT.MayBeAfter:= PPT.UIN<>UIN;
    PPT.MayBeBefore:=PPT.MayBeAfter
  end;
  //--- Находим Мин. и Макс. номер процессора ---//
  List:=TList.Create;
  MinProcNum:=1;
  MaxProcNum:=Procs.Count;
  PPP:=GetProcPointByUIN(UIN);
  PPC:=PPP.Prev;
  while PPC<>nil do
  begin
    PPT:=GetProcTaskByUIN(PPC.toPoint.UIN);
    if PPT.ProcNum > MinProcNum then MinProcNum:=PPT.ProcNum;
    PPC:=PPC.Next
  end;
  PPC:=PPP.Next;
  while PPC<>nil do
  begin
    PPT:=GetProcTaskByUIN(PPC.toPoint.UIN);
    if PPT.ProcNum < MaxProcNum then MaxProcNum:=PPT.ProcNum;
    PPC:=PPC.Next
  end;

  //--- Сбрасываем всех потомков ---//
  PPC:=PPP.Next;
  while PPC<>nil do
  begin
    List.Add(PPC.toPoint);
    PPC:=PPC.Next
  end;

  while List.Count<>0 do
  begin
    tmpPPP:=List.first;
    GetProcTaskByUIN(tmpPPP.UIN).MayBeAfter:=false;
    List.Delete(0);
    PPC:=tmpPPP.Next;
    while PPC<>nil do
    begin
      List.Add(PPC.toPoint);
      PPC:=PPC.next
    end;
  end;

  //--- Сбрасываем всех предков ---//
  PPC:=PPP.Prev;
  while PPC<>nil do
  begin
    List.Add(PPC.toPoint);
    PPC:=PPC.Next
  end;
  while List.Count<>0 do
  begin
    tmpPPP:=List.first;
    GetProcTaskByUIN(tmpPPP.UIN).MayBeBefore:=false;
    List.Delete(0);
    PPC:=tmpPPP.Prev;
    while PPC<>nil do
    begin
      List.Add(PPC.toPoint);
      PPC:=PPC.next
    end;
  end;

  //--- Урезаем по номерам процессоров ---//
{  PPC:=PPP.Prev;
  while PPC<>nil do
  begin
    PPT:=GetProcTaskByUIN(PPC.toPoint.UIN);
    PPT.MayBeAfter:= not (PPT.ProcNum < MinProcNum);
    prevPPC:=PPC.toPoint.Prev;
    while prevPPC<>nil do
    begin
      List.Add(prevPPC.toPoint);
      prevPPC:=prevPPC.Next
    end;
    PPC:=PPC.Next
  end;

  while List.Count<>0 do
  begin
    tmpPPP:=List.First;
    List.delete(0);
    PPT:=GetProcTaskByUIN(tmpPPP.UIN);
    PPT.MayBeAfter:=false;
    PPC:=tmpPPP.Prev;
    while PPC<>nil do
    begin
      List.Add(PPC.toPoint);
      PPC:=PPC.Next
    end;
  end;

  //<<<

  PPC:=PPP.Next;
  while PPC<>nil do
  begin
    PPT:=GetProcTaskByUIN(PPC.toPoint.UIN);
    PPT.MayBeBefore:= not (PPT.ProcNum > MaxProcNum);
    prevPPC:=PPC.toPoint.Next;
    while prevPPC<>nil do
    begin
      List.Add(prevPPC.toPoint);
      prevPPC:=prevPPC.Next
    end;
    PPC:=PPC.Next
  end;

  while List.Count<>0 do
  begin
    tmpPPP:=List.First;
    List.delete(0);
    PPT:=GetProcTaskByUIN(tmpPPP.UIN);
    PPT.MayBeBefore:=false;
    PPC:=tmpPPP.Next;
    while PPC<>nil do
    begin
      List.Add(PPC.toPoint);
      PPC:=PPC.Next
    end;
  end;
}
  List.Destroy;

  //--- Сбрасываем по границам процессоров ---//

  for i:=1 to MinProcNum-1 do
  begin
    List:=Procs[i-1];
    for j:=0 to List.Count-1 do
    begin
      PPT:= PProcTask(List[j]);
      PPT.MayBeAfter:=false;
      PPT.MayBeBefore:=false
    end;
  end;

  for i:=MaxProcNum+1 to Procs.Count do
  begin
    List:=Procs[i-1];
    for j:=0 to List.Count-1 do
    begin
      PPT:= PProcTask(List[j]);
      PPT.MayBeAfter:=false;
      PPT.MayBeBefore:=false
    end;
  end;

   for i:=MinProcNum to MaxProcNum do
   begin
     List:=Procs[i-1];

     Reset:=false;
     for j:=0 to List.Count-1 do
     if Selected<>List[j] then
     begin
       if Reset then
       begin
        PPT:=PProcTask(List[j]);
        PPT.MayBeAfter:=false;
       end
       else Reset:=not PProcTask(List[j]).MayBeAfter
     end;

     Reset:=false;
     for j:=List.Count-1 downto 0 do
     if Selected<>List[j] then
     begin
       if Reset then
       begin
        PPT:=PProcTask(List[j]);
        PPT.MayBeAfter:=false;
        PPT.MayBeBefore:=false;
       end
       else Reset:=not PProcTask(List[j]).MayBeBefore
     end;
   end;
end;

procedure TSubMerger.DeselectTask;
var i:integer;
    PPT:PProcTask;
begin
  Selected:=nil;
  for i:=0 to AllProcTasks.Count-1 do
  begin
    PPT:=AllProcTasks[i];
    PPT.MayBeAfter:= false;
    PPT.MayBeBefore:=false;
  end;
end;

procedure TSubMerger.MoveSelectedAfter(ProcNum,UIN:integer);
var i:integer;
    PPT:PProcTask;
begin
  if Selected<>nil then
  begin
    if UIN<>-1 then
    begin
      PPT:=GetProcTaskByUIN(UIN);
      if PPT.MayBeAfter then
      begin
        Selected.ProcNum:=PPT.ProcNum;
        AllProcTasks.delete(AllProcTasks.IndexOf(Selected));
        AllProcTasks.insert(AllProcTasks.IndexOf(PPT)+1,Selected);
        FormLinkTasksAndSetTimes(Procs.Count);
      end;
    end
    else
    begin
      Selected.ProcNum:=ProcNum;
      AllProcTasks.delete(AllProcTasks.IndexOf(Selected));
      i:=0;
      while i<AllProcTasks.Count do
      begin
        if PProcTask(AllProcTasks[i]).ProcNum=ProcNum then break;
        i:=i+1
      end;
      AllProcTasks.insert(i,Selected);
    end;
    FormLinkTasksAndSetTimes(Procs.Count);
  end;
end;

function TSubMerger.IncNumOfProc:boolean;
var List:TList;
begin
  if Procs.Count<>0 then
  begin
    List:=TList.Create;
    Procs.Add(List);
    List:=TList.Create;
    Links.Add(List);
    List:=nil;
    Result:=true
  end
  else Result:=false
end;

function TSubMerger.DecNumOfProc:boolean;
var i,FoundNum:integer;
    PPT:PProcTask;
begin
  FoundNum:=0;
  while FoundNum<Procs.Count do
  begin
    if TList(Procs[FoundNum]).Count=0 then break;
    FoundNum:=FoundNum+1
  end;
  if FoundNum<Procs.Count then
  begin
    Procs.Delete(FoundNum);
    for i:=0 to AllProcTasks.Count-1 do
    begin
     PPT:=AllProcTasks[i];
     if PPT.ProcNum>FoundNum then PPT.ProcNum:=PPT.ProcNum-1;
    end;
    FormLinkTasksAndSetTimes(Procs.Count);
    Result:=true
  end
  else Result:=false;
end;

procedure TSubMerger.ClearPossibleMoves(var List:TList);
var PMT:PPossibleMove;
begin
  while List.Count<>0 do
  begin
    PMT:=List.first;
    List.delete(0);
    dispose(PMT)
  end;
  List.Destroy
end;

function TSubMerger.GetPossibleMoves(UIN:integer):TList;
var i:integer;
    PMT:PPossibleMove;
    PPT:PProcTask;
    List:TList;
begin
  Result:=TList.Create;
  SelectTask(UIN);
  for i:=MinProcNum-1 to MaxProcNum-1 do
  begin
    List:=Procs[i];
    if(List.Count=0)or((List.Count<>0)and(PProcTask(List.first).MayBeBefore)or(Selected=List.first))then
    begin
      new(PMT);
      PMT.UIN:=UIN;
      PMT.processor:=i+1;
      PMT.afterUIN:=-1;
      PMT.Time:=$7FFFFFFF;
      PMT.ProcCount:=$7FFFFFFF;
      PMT.CurrentState:=false;
      Result.Add(PMT);
    end;
  end;
  for i:=0 to AllProcTasks.Count-1 do
  begin
    PPT:=AllProcTasks[i];
    if PPT.MayBeAfter then
    begin
      new(PMT);
      PMT.UIN:=UIN;
      PMT.processor:=PPT.ProcNum;
      PMT.afterUIN:=PPT.UIN;
      PMT.Time:=$7FFFFFFF;
      PMT.ProcCount:=$7FFFFFFF;
      PMT.CurrentState:=false;
      Result.Add(PMT);
    end;
  end;
  DeselectTask;
end;

function TSubMerger.GetTime:integer;
var i:integer;
    PPT:PProcTask;
    List:TList;
begin
  Result:=0;
  for i:=0 to Procs.Count-1 do
  begin
    List:=Procs[i];
    if List.Count<>0 then
    begin
      PPT:=List.Last;
      if Result < PPT.StartTime+PPT.Length-1 then Result := PPT.StartTime+PPT.Length-1
    end;
  end;
end;

function TSubMerger.GetProcCount:integer;
var i:integer;
begin
  Result:=0;
  for i:=0 to Procs.Count-1 do
    if TList(Procs[i]).Count<>0 then Result:=Result+1
end;

function TSubMerger.OptimizeOneStep(L1,L2:TLabel):boolean;
var i,j:integer;
    List,AllMoves:TList;
    PPM,bestPPM,workPPM:PPossibleMove;
    PPT:PProcTask;
    BackUpList:TList;
    BackUpNOP:integer;
    BestFit:integer;
    CurProcCount,CurTime:integer;
    MinTime:integer;
    Unique:boolean;
    PH:PHolder;
    CurUIN,MinProcessor:integer;
begin
  DeselectTask;
  AllMoves:=TList.create;
  for i:=0 to AllProcTasks.Count-1 do
  begin
    PPT:=AllProcTasks[i];
    List:=GetPossibleMoves(PPT.UIN);
    for j:=0 to List.Count-1 do AllMoves.add(List[j]);
    List.clear;
    List.Destroy;
  end;

  CurProcCount:=GetProcCount;
  CurTime:=GetTime;

  BackUpNOP:=Procs.Count;
  SaveBackUp(BackUpList);

  for i:=0 to AllMoves.Count-1 do
  begin
    PPM:=AllMoves[i];
    Selected:=GetProcTaskByUIN(PPM.UIN);
    Unique:=true;
    if Selected.ProcNum = PPM.processor then
    begin
      List:=Procs[Selected.ProcNum-1];
      PPT:=nil;
      for j:=0 to List.Count-1 do
      begin
        if PProcTask(List[j]).UIN = PPM.UIN then break;
        PPT:=List[j];
      end;
      if((PPT<>nil)and(PPT.UIN=PPM.afterUIN))or
        ((PPT=nil)and(PPM.afterUIN=-1))then Unique:=false;
    end;

    PPM.CurrentState := not Unique;
    if Unique then
    begin
      if PPM.afterUIN<>-1 then (GetProcTaskByUIN(PPM.afterUIN)).MayBeAfter:=true;
      MoveSelectedAfter(PPM.processor,PPM.afterUIN);
      while GetProcCount<>Procs.Count do DecNumOfProc;
      PPM.Time:=GetTime;
      PPM.ProcCount:=Procs.Count;
      RestoreBackUp(BackUpList,BackUpNOP,false);
    end
    else
    begin
      PPM.Time:=CurTime;
      PPM.ProcCount:=CurProcCount;
    end;
  end;
  Selected:=nil;

  RestoreBackUp(BackUpList,BackUpNOP,true); //??

  MinTime:=$7FFFFFFF;
  for i:=0 to AllMoves.Count-1 do
    if MinTime>PPossibleMove(AllMoves[i]).Time then MinTime:=PPossibleMove(AllMoves[i]).Time;

//-->>
{  Memo.Lines.Clear;
  for i:=0 to AllMoves.Count-1 do
  begin
    PPM:=AllMoves[i];
    Memo.Lines.Add(inttostr(PPM.UIN)+' <> '+inttostr(PPM.processor)+':'+inttostr(PPM.afterUIN)+' Time= '+inttostr(PPM.Time)+' PC='+inttostr(PPM.ProcCount));
    if PPM.CurrentState then Memo.Lines.Add('Was current state!')
  end;}
//<<--
  // выделяем минимальные времена
  i:=0;
  while i<>AllMoves.Count do
  begin
    PPM:=AllMoves[i];
    if PPM.Time > MinTime then
    begin
      AllMoves.delete(i);
      dispose(PPM);
    end
    else i:=i+1
  end;
  // выделяем минимальные кол-ва процессоров
  MinProcessor:=$7FFFFFFF;
  for i:=0 to AllMoves.Count-1 do
    if MinProcessor>PPossibleMove(AllMoves[i]).ProcCount then MinProcessor:=PPossibleMove(AllMoves[i]).ProcCount;
  i:=0;
  while i<>AllMoves.Count do
  begin
    PPM:=AllMoves[i];
    if PPM.ProcCount > MinProcessor then
    begin
      AllMoves.delete(i);
      dispose(PPM);
    end
    else i:=i+1
  end;

  // теперь выделяем с минимальными процессорами и с одинаковыми UIN
  i:=0;
  CurUIN:=0;
  MinProcessor:=0;
  while i<>AllMoves.Count do
  begin
    PPM:=AllMoves[i];
    if PPM.UIN<>CurUIN then
    begin
      CurUIN:=PPM.UIN;
      MinProcessor:=PPM.processor;
      j:=i+1;
      while j<>AllMoves.Count do
      begin
        workPPM:=AllMoves[j];
        if workPPM.UIN<>CurUIN then break;
        if workPPM.processor<MinProcessor then MinProcessor:=workPPM.processor;
        j:=j+1;
      end;
    end;

    if (PPM.CurrentState)or(PPM.processor>MinProcessor)
    then
    begin
      AllMoves.delete(i);
      dispose(PPM);
    end
    else i:=i+1
  end;

  // теперь удаляем ненужные перестановки на процессоре
  i:=0;
  if MinTime = CurTime then
  while i<AllMoves.Count do
  begin
    PPM:=AllMoves[i];
    PPT:=GetProcTaskByUIN(PPM.UIN);
    if PPM.processor = PPT.ProcNum then
    begin
      AllMoves.delete(i);
      dispose(PPM);
    end
    else i:=i+1
  end;               

  BestFit:=AllMoves.Count-1;
  for i:=0 to AllMoves.Count-2 do
  begin
    PPM:=AllMoves[i];
    bestPPM:=AllMoves[BestFit];
    if(PPM.Time<bestPPM.Time)or
      ((PPM.Time=bestPPM.Time)and(PPM.ProcCount<bestPPM.ProcCount))
      then BestFit:=i
  end;
  if BestFit<>-1 then
  begin
    bestPPM:=AllMoves[BestFit];
    Selected:=GetProcTaskByUIN(bestPPM.UIN);
    if bestPPM.afterUIN<>-1 then (GetProcTaskByUIN(bestPPM.afterUIN)).MayBeAfter:=true;
    MoveSelectedAfter(bestPPM.processor,bestPPM.afterUIN);
    while GetProcCount<>Procs.Count do DecNumOfProc;
    if L1<>nil then L1.Caption:=inttostr(bestPPM.Time);
    if L2<>nil then L2.Caption:=inttostr(bestPPM.ProcCount);
    Result:=true
  end
  else Result:=false;


//-->>
{  Memo.Lines.Add('');
  Memo.Lines.Add('--- Min ---');
  Memo.Lines.Add('');
  for i:=0 to AllMoves.Count-1 do
  begin
    PPM:=AllMoves[i];
    Memo.Lines.Add(inttostr(PPM.UIN)+' <> '+inttostr(PPM.processor)+':'+inttostr(PPM.afterUIN)+' Time= '+inttostr(PPM.Time)+' PC='+inttostr(PPM.ProcCount));
    if PPM.CurrentState then Memo.Lines.Add('Was current state!')
  end;}
//<<--

  ClearPossibleMoves(AllMoves);
  DeselectTask;
end;

function ComparePPT(Item1, Item2: Pointer): Integer;
begin
  if PProcTask(Item1).StartTime<PProcTask(Item2).StartTime then Result:=-1
  else
  if PProcTask(Item1).StartTime>PProcTask(Item2).StartTime then Result:=1
  else Result:=0
end;

procedure TSubMerger.OptimizeAuto(Form:TForm;L1,L2:TLabel);
var i,j,k:integer;
    List,UINList:TList;
    PPT,nextPPT:PProcTask;
    Time:integer;
    MatchError:boolean;
    NewProc:TList;
    NOP:integer;
    NoChange:boolean;
    StartFrom,NewStartFrom:integer;
    BackList:TList;
    BackTime:integer;
begin
  while OptimizeOneStep(L1,L2) do Form.Update;
  // Пытаемся соединить некоторые процессоры
  Time:=GetTime;
  UINList:=TList.Create;
  NewStartFrom:=0;
  repeat
   StartFrom:=NewStartFrom;
   NoChange:=true;
   for i:=0 to Procs.Count-2 do
   begin
    NewStartFrom:=i+1;
    List:=Procs[i];
    for j:=0 to List.Count-1 do UINList.Add(List[j]);
    List:=Procs[i+1];
    for j:=0 to List.Count-1 do UINList.Add(List[j]);

    UINList.Sort(ComparePPT);
    MatchError:=false;
    PPT:=UINList.first;
    for j:=1 to UINList.Count-1 do
    begin
      nextPPT:=UINList[j];
      if (PPT.StartTime = nextPPT.StartTime) or
         (PPT.StartTime+PPT.Length>nextPPT.StartTime) then
      begin
        MatchError:=true;
        break
      end;
      PPT:=nextPPT;
    end;
    if not MatchError then
    begin
      SaveBackUp(BackList);
      BackTime:=GetTime;

      NOP:=Procs.Count-1;
      ClearLinks(true);
      ClearProcs(false);
      for j:=0 to UINList.Count-1 do
      begin
        PPT:=UINList[j];
        PPT.ProcNum:=i+1;
        AllProcTasks.delete(AllProcTasks.indexOf(PPT));
      end;
      for j:=0 to AllProcTasks.Count-1 do
      begin
        PPT:=AllProcTasks[j];
        if PPT.ProcNum>i+1 then PPT.ProcNum:=PPT.ProcNum-1
      end;
      for j:=0 to UINList.Count-1 do AllProcTasks.add(UINList[j]);

      FormLinkTasksAndSetTimes(NOP);
      if BackTime>=GetTime then
      begin
        NoChange:=false;
        NewStartFrom:=0;
        while BackList.Count<>0 do
        begin
           PPT:=BackList.first;
           BackList.delete(0);
           dispose(PPT)
        end;
      end
      else RestoreBackUp(BackList,NOP+1,true);
      break;
    end;
    UINList.Clear;
   end;
   UINList.Clear;
  until NoChange;
  UINList.Destroy;
end;

procedure TSubMerger.SaveBackUp(var List:Tlist);
var backPPT,PPT:PProcTask;
    i:integer;
begin
  List:=TList.Create;
  for i:=0 to AllProcTasks.Count-1 do
  begin
    PPT:=AllProcTasks[i];
    new(backPPT);
    backPPT^:=PPT^;
    backPPT.Prev:=nil;
    List.add(backPPT);
  end;
end;

procedure TSubMerger.RestoreBackUp(var List:Tlist;NOP:integer;ClearCurrent:boolean);
var backPPT,PPT:PProcTask;
    i:integer;
begin
  Selected:=nil;
  ClearLinks(true);
  ClearProcs(true);
  for i:=0 to List.Count-1 do
  begin
    backPPT:=List[i];
    new(PPT);
    PPT^:=backPPT^;
    AllProcTasks.add(PPT);
    if ClearCurrent then dispose(backPPT);
  end;
  if ClearCurrent then List.Destroy;
  FormLinkTasksAndSetTimes(NOP);
end;

end.
