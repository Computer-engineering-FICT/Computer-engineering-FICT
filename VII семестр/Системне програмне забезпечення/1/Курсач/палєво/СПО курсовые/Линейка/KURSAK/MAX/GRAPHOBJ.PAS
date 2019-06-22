unit GraphObj;

interface
 uses ListControl,graphics,windows,classes,Grids,SysUtils,StdCtrls,Math,SyntezUnit,
      StructSyntezUnit;
 type
   GraphElementType = (getBEG,getEND,getOPER,getCOND); // Тип вершины графа
   ConnectionType = (conHORZ,conVERT); // Тип соединения
   SelElemType = (selNONE,selGE,selCON); // Тип текущего элемента
   ErrorLoopSearch = (elsNONE,elsFoundGood,elsFoundError);
   ErrorGraphGood = (eggNONE,eggSIGNAL,eggCONN,eggREACH);

  {** Для переадресации при открытии файла **}
   PReaddress = ^Readdress;
   Readdress = record
     Old,New:pointer;
   end;

  {** Эл. списка вх/вых сигналов **}
   PSignal = ^Signal;
   Signal = record
    // Подпись
    sign : String[24];
   end;

  {** Эл. списка вх/вых сигналов вершины графа **}
   PgeSignal = ^geSignal;
   geSignal = record
    // Cсылка на атрибуты сигнала
    signal : PSignal;
    // True, если инверсный сигнал
    reverse : boolean;
   end;

  {** Эл. графа **}
   PGraphElement =^GraphElement;
   GraphElement = record
    // Уникальный номер вершины
    UPN:integer;
    // Достижимомть начала и конца
    ReachStart,ReachFinish:boolean;
    // Тип вершины
    GEType : GraphElementType;
    // Координаты центра
    X,Y:integer;
    // Длина/ширина блока
    W,H:integer;
    // Список сигналов
    Signals : TObjList;
    // Функциональные связи
    nextTrue,nextFalse : PGraphElement;
   end;

  {** Эл. графа **}
   ExportGraphElement = record
    // Тип вершины
    GEType : GraphElementType;
    // Список сигналов
    Signals : TObjList;
    // Функциональные связи
    nextTrue,nextFalse : PGraphElement;
   end;

  {** Соединение **}
   PConnection = ^Connection;
   Connection = record
     ConType : ConnectionType;
     StartPoint : PGraphElement;
     EndPoint : PGraphElement;
     W : extended; // смещение
     trueWay:boolean;
   end;

  {** выделенный элемент **}

  CurElement = record
    ceType : selElemType;
    element : pointer;
  end;

  {** Граф автомата **}
   Graph = class
     private
       MaxUPN:integer;
       ON_Addr : TObjList;
       InSignals : TObjList;
       OutSignals : TObjList;
       Points : TObjList;
       Connections : TObjList;
       Current : CurElement;
       MadedMura,MadedMili:boolean;
       SyntezMura:TSyntezMura;
       SyntezMili:TSyntezMili;
       StructTable:TStructSyntezTable;
       StructSyntez:TStructSyntez;
//       StructSyntezMili:TStructSyntezMili;
       function getFullTextWidth(C:TCanvas;PGE:PGraphElement):integer;
       procedure drawText(C:TCanvas;TW,TH:integer;PGE:PGraphElement);
       procedure drawBEG_END(C:TCanvas;PGE:PGraphElement;dAttach,dText,dReach:boolean);
       procedure drawOPER(C:TCanvas;PGE:PGraphElement;dAttach,dText,dReach:boolean);
       procedure drawCOND(C:TCanvas;PGE:PGraphElement;dAttach,dText,dReach:boolean);
       procedure drawSelGE(C:TCanvas);
       procedure drawConnection(C:TCanvas;PC:PConnection);
       procedure ChangeConnectionW(dX,dY:integer;PC:PConnection);
       function MouseOverElement(X,Y:integer):PGraphElement;
       function MouseOverConnection(X,Y:integer):PConnection;
       procedure SetPointReaches;
       // For SaveToFile
       procedure STF_Signal(var f:file;PS:PSignal);
       procedure STF_Point(var f:file;PGE:PGraphElement);
       procedure STF_Connection(var f:file;PC:PConnection);
       // For OpenFromFile
       procedure OFF_Signal(var f:file;InSignal:boolean);
       procedure OFF_Point(var f:file);
       procedure OFF_Connection(var f:file);
       procedure ReAddressAll;
       function GetNewAddr(oldaddr:pointer):pointer;
       procedure FindRemoveCon(PGE:PGraphElement);
       procedure FindRemoveConSP(PGE:PGraphElement);
       procedure FindRemoveConEP(PGE:PGraphElement);
       // For ExportToFile
//       function CheckExportError:boolean;
       procedure ETF_Signal(var f:file;PS:PSignal);
       procedure ETF_Point(var f:file;PGE:PGraphElement);
     public
       constructor Create;
       destructor Destroy;override;
       function add(GET:GraphElementType;X,Y,W,H:integer):PGraphElement;
       function addCon(CT:ConnectionType;W:extended;SP,EP:PGraphElement;TrueWay:boolean):PConnection;
       function addSignal(Sign:string;InSignal:boolean):PSignal;
       procedure drawGraph(C:TCanvas;FC,PC,BC:TColor;dReach,dNumbers:boolean);
       function MouseOver(X,Y:integer):CurElement;
       procedure moveOnTop;
       procedure ChangeCurAndDraw(dX,dY:integer;DrawOld,DrawNew:boolean;C:TCanvas;FC,PC,BC:TColor;SnapToGrid:word);
       function ErrorLoop(StartPoint,EndPoint:PGraphElement):boolean;
       function SignalGoFirst(InSignal:boolean):boolean;
       function SignalGetAndGoNext(var s:string;var SAddr:pointer;InSignal:boolean):boolean;
       function DeleteSignalByAddr(SAddr:PSignal;InSignal:boolean):boolean;
       procedure ClearSignals(InSignal:boolean);
       procedure DeleteCon(PC:PConnection);
       procedure DeleteGE(PGE:PGraphElement);
       procedure SaveToFile(fname:string);
       procedure OpenFromFile(fname:string);
       function ExportToFile(fname:string):boolean;
       function CheckExportError:ErrorGraphGood;
       procedure GetContent(var Grid:TStringGrid);
       procedure GetWays(var M:TMemo);
       procedure ResetUPNs;
       procedure SortBuUPNs;
       procedure MakeSyntez(var SG_X,SG_Y,SG_M,SG_M_min:TStringGrid;Mura:boolean);
       procedure MakeStructSyntez(var SG_M,SG_toY,SG_toQ:TStringGrid;M:TMemo;Mura,D_Trigger:boolean);
   end;

   function OverGraphElement(X,Y:integer;PGE:PGraphElement):boolean;
   function OverConnection(X,Y:integer;PC:PConnection):boolean;
   function GetAttachPoint(PGE:PGraphElement;TrueWay,Entry:boolean):TPoint;
   function MinInt(E1,E2:integer):integer;
   function MaxInt(E1,E2:integer):integer;
   procedure MinMaxInt(E1,E2:integer;var ResMin,ResMax:integer);
   procedure DrawReachSignal(C:TCanvas;X,Y:integer;IsReach,Start:boolean);
   function CanExchangePGE(p1,p2:pointer):boolean;

implementation
   const
     PointWidth = 100;
     PointHeight = 30;
     Radius = 10;
   type
     TCoord = record
      L,R,T,B:integer;
     end;

   function CanExchangePGE(p1,p2:pointer):boolean;
   begin
    Result:=PGraphElement(p1).UPN>PGraphElement(p2).UPN
   end;

   constructor Graph.Create;
   begin
     inherited Create;
     MaxUPN:=0;
     ON_Addr := TObjList.create(nil);
     Points := TObjList.create(CanExchangePGE);
     Connections := TObjList.create(nil);
     InSignals := TObjList.create(nil);
     OutSignals := TObjList.create(nil);
     SyntezMura:=TSyntezMura.create;
     SyntezMili:=TSyntezMili.create;
     StructTable:=TStructSyntezTable.create;
     StructSyntez:=TStructSyntez.create;
//     StructSyntezMili:=TStructSyntezMili.create;
   end;

   destructor Graph.Destroy;
   begin
     if Points.goFirst then
     repeat
       PGraphElement(Points.getCurrent).Signals.destroy;
     until not Points.goNext;
     Points.Destroy;
     Connections.Destroy;
     InSignals.Destroy;
     OutSignals.Destroy;
     ON_Addr.destroy;
     inherited Destroy;
   end;

   procedure Graph.MakeSyntez(var SG_X,SG_Y,SG_M,SG_M_min:TStringGrid;Mura:boolean);
   begin
     if Mura then
     begin
       SyntezMura.Syntez(Points,InSignals,OutSignals,SG_X,SG_Y,SG_M,SG_M_min);
       MadedMura:=true;
     end
     else
     begin
       SyntezMili.Syntez(Points,InSignals,OutSignals,SG_X,SG_Y,SG_M,SG_M_min);
       MadedMili:=true;
     end;
   end;

   procedure Graph.MakeStructSyntez(var SG_M,SG_toY,SG_toQ:TStringGrid;M:TMemo;Mura,D_Trigger:boolean);
   begin
     if Mura then
     begin
       if MadedMura then
       begin
         StructTable.SetTrigger(D_Trigger);
         StructSyntez.SetTrigger(D_Trigger);
         StructTable.SyntezMura(InSignals,OutSignals,SyntezMura.XAY,SyntezMura.A,SyntezMura.Y);
         StructTable.GetTable(SG_M);
         StructSyntez.SyntezMura(StructTable.InSignals,StructTable.OutSignals,StructTable.StructTable);
         StructSyntez.GetTable(SG_toY,SG_toQ);
         StructSyntez.GetMinimizedFunctions(M);
       end
     end
     else
     begin
       if MadedMili then
       begin
         StructTable.SetTrigger(D_Trigger);
         StructSyntez.SetTrigger(D_Trigger);
         StructTable.SyntezMili(InSignals,OutSignals,SyntezMili.XA,SyntezMili.XA,SyntezMili.A,SyntezMili.Y);
         StructTable.GetTable(SG_M);
         StructSyntez.SyntezMili(StructTable.InSignals,StructTable.OutSignals,StructTable.StructTable);
         StructSyntez.GetTable(SG_toY,SG_toQ);
         StructSyntez.GetMinimizedFunctions(M);
       end;  
     end;
   end;

   function Graph.add(GET:GraphElementType;X,Y,W,H:integer):PGraphElement;
   var PGE : PGraphElement;
   begin
     new(PGE);
     PGE.GEType:=GET;
     PGE.X:=X;
     PGE.Y:=Y;
     PGE.W:=W;
     PGE.H:=H;
     MaxUPN:=MaxUPN+1;
     PGE.UPN:=MaxUPN;
     PGE.Signals:=TObjList.create(nil);
     PGE.nextTrue:=nil;
     PGE.nextFalse:=nil;
     PGE.ReachStart:=GET=getBEG;
     PGE.ReachFinish:=GET=getEND;
     Points.add(PGE);
     Result:=PGE;
   end;

   function Graph.addCon(CT:ConnectionType;W:extended;SP,EP:PGraphElement;TrueWay:boolean):PConnection;
   var PC:PConnection;
   begin
     new(PC);
     PC.ConType:=CT;
     PC.W:=W;
     PC.StartPoint:=SP;
     PC.EndPoint:=EP;
     PC.trueWay:=TrueWay;
     if TrueWay then SP.nextTrue:=EP
                else SP.nextFalse:=EP;
     Connections.add(PC);
     SetPointReaches;
     Result:=PC
   end;

   function Graph.addSignal(Sign:string;InSignal:boolean):PSignal;
   var PS,Found,Cur:PSignal;
       Signals:TObjList;
   begin
     if InSignal then Signals:=InSignals else Signals:=OutSignals;
     Found:=nil;
     if Signals.goFirst then
     repeat
       Cur:=Signals.getCurrent;
       if Cur.sign=sign then Found:=Cur
     until (not Connections.goNext)or(Found<>nil);
     if Found=nil then
     begin
       new(PS);
       PS.sign:=sign;
       Signals.add(PS);
       Result:=PS;
     end
     else Result:=nil;  
   end;

   function Graph.getFullTextWidth(C:TCanvas;PGE:PGraphElement):integer;
   var s:string;
   begin
     s:='';
     if PGE.Signals.goFirst then
     repeat
       s:=s+PSignal(PgeSignal(PGE.Signals.getCurrent).signal).sign+',';
     until not PGE.Signals.goNext;
     if s<>'' then delete(s,length(s),1);
     Result:=C.TextWidth(s);
   end;

   procedure Graph.drawText(C:TCanvas;TW,TH:integer;PGE:PGraphElement);
   var CurX,CurY:integer;
       PGES:PgeSignal;
       LocalTW:integer;
       s:string;
       notFirst:boolean;
       ComaW:integer;
   begin
     if PGE.Signals.goFirst then
     begin
      CurX:=round(PGE.X-TW/2);
      CurY:=round(PGE.Y-TH/2);
      notFirst:=false;
      ComaW:=C.TextWidth(',');
      repeat
        if notFirst then
        begin
         C.moveto(curX,curY);
         C.textOut(curX,curY,',');
         CurX:=CurX+ComaW
        end;
        C.moveto(curX,curY);
        PGES:=PGESignal(PGE.Signals.getCurrent);
        s:=PSignal(PGES.signal).sign;
        C.textOut(curX,curY,s);
        LocalTW:=C.TextWidth(s);
        if PGES.reverse then
        begin
         C.moveto(curX,curY);
         C.lineto(curX+LocalTW,CurY);
        end;
        CurX:=CurX+LocalTW;
        NotFirst:=true
      until not PGE.Signals.goNext;
     end
     else
     begin
      LocalTW:=C.TextWidth('Нет сигналов');
      C.TextOut(PGE.X-round(LocalTW/2),PGE.Y-round(TH/2),'Нет сигналов')
     end
   end;

   procedure Graph.drawBEG_END(C:TCanvas;PGE:PGraphElement;dAttach,dText,dReach:boolean);
   var TW,TH:integer;
       Coord:TCoord;
       Text:string;
       XY:TPoint;
   begin
     // присоединения
     if dAttach then
     begin
      XY:=GetAttachPoint(PGE,false,false);
      C.moveto(XY.X,XY.Y);
      C.lineto(PGE.X,PGE.Y);
     end;
     // фигура
     Coord.L := round(PGE.X-PGE.W/2);
     Coord.R := Coord.L+PGE.W;
     Coord.T := round(PGE.Y-PGE.H/2);
     Coord.B := Coord.T+PGE.H;
     C.Ellipse(Coord.L,Coord.T,Coord.R,Coord.B);
     if dText then
     begin
      if PGE.GEType = getBEG then Text:='Начало'
                             else Text:='Конец';
      TW:=C.TextWidth(Text);
      TH:=C.TextHeight('A');
      C.textOut(round(PGE.X-TW/2),round(PGE.Y-TH/2),Text);
     end;
     if dReach then
     begin
      DrawReachSignal(C,Coord.R-15,Coord.T-5,PGE.ReachStart,true);
      DrawReachSignal(C,Coord.R-5,Coord.T-5,PGE.ReachFinish,false);
     end;
   end;

   procedure Graph.drawOPER(C:TCanvas;PGE:PGraphElement;dAttach,dText,dReach:boolean);
   var Coord:TCoord;
       TW,TH:integer;
       XY_T,XY_B:TPoint;
   begin
     if dAttach then
     begin
      // присоединение
      XY_T:= GetAttachPoint(PGE,false,true);
      XY_B:= GetAttachPoint(PGE,false,false);
      C.moveto(XY_T.X,XY_T.Y);
      C.lineto(XY_B.X,XY_B.Y);
     end;
     // фигура
     Coord.L := round(PGE.X-PGE.W/2);
     Coord.R := Coord.L+PGE.W;
     Coord.T := round(PGE.Y-PGE.H/2);
     Coord.B := Coord.T+PGE.H;
     C.Rectangle(Coord.L,Coord.T,Coord.R,Coord.B);
     if dText then
     begin
      TW:=getFullTextWidth(C,PGE);
      TH:=C.TextHeight('A');
      drawText(C,TW,TH,PGE);
     end;
     if dReach then
     begin
      DrawReachSignal(C,Coord.R-15,Coord.T-5,PGE.ReachStart,true);
      DrawReachSignal(C,Coord.R-5,Coord.T-5,PGE.ReachFinish,false);
     end;

   end;

   procedure Graph.drawCOND(C:TCanvas;PGE:PGraphElement;dAttach,dText,dReach:boolean);
   var Coord:TCoord;
       TW,TH:integer;
       Ar:Array[0..3] of TPoint;
       XY_L,XY_T,XY_R:Tpoint;
   begin
     // присоединения
     if dAttach then
     begin
      XY_L:= GetAttachPoint(PGE,false,false);
      XY_R:= GetAttachPoint(PGE,true,false);
      XY_T:= GetAttachPoint(PGE,false,true);
      C.moveto(XY_L.X,XY_L.Y);
      C.lineto(XY_R.X,XY_R.Y);
      C.moveto(XY_T.X,XY_T.Y);
      C.lineto(PGE.X,PGE.Y);
     end;
     // фигура
     Coord.L := round(PGE.X-PGE.W/2);
     Coord.R := Coord.L+PGE.W;
     Coord.T := round(PGE.Y-PGE.H/2);
     Coord.B := Coord.T+PGE.H;
     Ar[0].x:=Coord.L;
     Ar[0].y:=PGE.Y;
     Ar[1].x:=PGE.X;
     Ar[1].y:=Coord.T;
     Ar[2].x:=Coord.R;
     Ar[2].y:=PGE.Y;
     Ar[3].x:=PGE.X;
     Ar[3].y:=Coord.B;
     C.Polygon(Ar);
     if dText then
     begin
      TW:=getFullTextWidth(C,PGE);
      TH:=C.TextHeight('A');
      drawText(C,TW,TH,PGE);
      C.Brush.Style:=bsClear;
      C.TextOut(Coord.R,PGE.Y-TH,'Да');
      C.TextOut(Coord.L-C.TextWidth('Нет'),PGE.Y-TH,'Нет');
      C.Brush.Style:=bsSolid;
     end;
     if dReach then
     begin
      DrawReachSignal(C,Coord.R-15,Coord.T-5,PGE.ReachStart,true);
      DrawReachSignal(C,Coord.R-5,Coord.T-5,PGE.ReachFinish,false);
     end;
   end;

   procedure Graph.drawConnection(C:TCanvas;PC:PConnection);
   var XYB,XYE:TPoint;
       WXY:integer;
   begin
     XYB:=GetAttachPoint(PC.StartPoint,PC.TrueWay,false);
     XYE:=GetAttachPoint(PC.EndPoint,PC.TrueWay,true);
     C.MoveTo(XYB.X,XYB.y);
     if PC.ConType=conVERT then
     begin
       WXY:=round((XYE.X-XYB.X)*PC.W+XYB.X);
       C.lineto(WXY,XYB.Y);
       C.lineto(WXY,XYE.Y);
     end
     else
     begin
       WXY:=round((XYE.Y-XYB.Y)*PC.W+XYB.Y);
       C.lineto(XYB.X,WXY);
       C.lineto(XYE.X,WXY);
     end;
     C.LineTo(XYE.X,XYE.y);

   end;

   procedure Graph.drawGraph(C:TCanvas;FC,PC,BC:TColor;dReach,dNumbers:boolean);
   var PGE:PGraphElement;
       TH:integer;
   begin
     C.Font.Color:=FC;
     C.Pen.color:=PC;
     C.Brush.color:=BC;
     C.Pen.mode:=pmCopy;

     if Connections.goFirst then
     repeat
       drawConnection(C,Connections.getCurrent);
     until not Connections.goNext;

     TH:=C.TextHeight('9');
     if Points.goFirst then
     repeat
       PGE:=Points.getCurrent;
       case PGE.GEType of
         getBEG,getEND:drawBEG_END(C,PGE,true,true,dReach);
         getOPER:drawOPER(C,PGE,true,true,dReach);
         getCOND:drawCOND(C,PGE,true,true,dReach);
       end;
       if dNumbers then
       begin
         C.Brush.Style:=bsClear;
         C.Font.Style:=C.Font.Style + [fsBold];
         C.TextOut(PGE.X+10,round(PGE.Y-PGE.H/2-TH),inttostr(PGE.UPN));
         C.Font.Style:=C.Font.Style - [fsBold];
         C.Brush.Style:=bsSolid;
       end;
     until not Points.goNext;
   end;

   procedure Graph.drawSelGE(C:TCanvas);
   var PGE:PGraphElement;
   begin
     PGE:=PGraphElement(Current.element);
     case PGE.GEType of
       getBEG,getEND:drawBEG_END(C,PGE,false,false,false);
       getOPER:drawOPER(C,PGE,false,false,false);
       getCOND:drawCOND(C,PGE,false,false,false);
     end;
   end;

   function Graph.MouseOver(X,Y:integer):CurElement;
   begin
     current.element:=MouseOverElement(X,Y);
     if current.element<>nil then current.ceType:=selGE
     else
     begin
       current.element:=MouseOverConnection(X,Y);
       if current.element<>nil then current.ceType:=selCON
                               else current.ceType:=selNONE
     end;
     Result:=current;
   end;


   function Graph.MouseOverElement(X,Y:integer):PGraphElement;
   var p,cur:pointer;
   begin
     p:=nil;
     if Points.goLast then
     repeat
       cur:=Points.getCurrent;
       if OverGraphElement(X,Y,PGraphElement(cur)) then
       begin
        p:=cur;
        break;
       end;
     until (not Points.goPrev);
     if p=nil then Result:=nil
              else Result:=PGraphElement(p)
   end;

   function Graph.MouseOverConnection(X,Y:integer):PConnection;
   var p,cur:pointer;
   begin
     p:=nil;
     if Connections.goLast then
     repeat
       cur:=Connections.getCurrent;
       if OverConnection(X,Y,PConnection(cur)) then
       begin
        p:=cur;
        break;
       end;
     until (not Connections.goPrev);
     if p=nil then Result:=nil
              else Result:=PConnection(p)
   end;

   procedure Graph.moveOnTop;
   begin
    if Current.ceType = selGE then
    begin
     Points.setCurrent(Current.element);
     Points.moveToLast
    end;
   end;

   procedure Graph.ChangeConnectionW(dX,dY:integer;PC:PConnection);
   var WXY:integer;
       XYB,XYE:TPoint;
   begin
    XYB:=GetAttachPoint(PC.StartPoint,PC.TrueWay,false);
    XYE:=GetAttachPoint(PC.EndPoint,PC.TrueWay,true);
    if PC.ConType = conVERT then
    begin
      WXY:=round((XYE.X-XYB.X)*PC.W);
      WXY:=WXY+dX;
      if XYE.X<>XYB.X then PC.W:=WXY/(XYE.X-XYB.X);
    end
    else
    begin
      WXY:=round((XYE.Y-XYB.Y)*PC.W);
      WXY:=WXY+dY;
      if XYE.X<>XYB.X then PC.W:=WXY/(XYE.Y-XYB.Y);
    end;
   end;

   procedure Graph.ChangeCurAndDraw(dX,dY:integer;DrawOld,DrawNew:boolean;C:TCanvas;FC,PC,BC:TColor;SnapToGrid:word);
   begin
    if current.ceType<>selNONE then
    begin
      if SnapToGrid = 0 then SnapToGrid:=1;
      C.Font.Color:=FC;
      C.Pen.color:=PC;
      C.Brush.color:=BC;
      C.Brush.Style:=bsClear;
      C.Pen.mode:=pmNotXor;
      if current.ceType=selGE then
      begin
        if DrawOld then drawSelGE(C);
        with PGraphElement(current.element)^ do
        begin
          X:=SnapToGrid*round((X+dX)/SnapToGrid);
          Y:=SnapToGrid*round((Y+dY)/SnapToGrid)
        end;
        if DrawNew then drawSelGE(C);
      end
      else
      begin
        if DrawOld then drawConnection(C,PConnection(current.element));
        ChangeConnectionW(dX,dY,PConnection(current.element));
        if DrawNew then drawConnection(C,PConnection(current.element));

      end
    end;
   end;

   function LookStartPoint(CurPGE,EndPGE:PGraphElement;EndType:GraphElementType):ErrorLoopSearch;
   begin
      if CurPGE=nil then Result:=elsNONE
      else
      if(CurPGE=EndPGE)then
      begin
        if EndType=CurPGE.GEType then Result:=elsFoundError
                                 else Result:=elsFoundGood;
      end
      else
      if CurPGE.GEType<>EndType then Result:=elsNONE
      else
      if CurPGE.GEType = getOPER then Result:=LookStartPoint(CurPGE.nextTrue,EndPGE,EndType)
      else
//      if CurPGE.GEType = getCOND then
      begin
        Result:=LookStartPoint(CurPGE.nextTrue,EndPGE,EndType);
        if Result=elsNONE then
        Result:=LookStartPoint(CurPGE.nextFalse,EndPGE,EndType)
      end;
   end;

   function Graph.ErrorLoop(StartPoint,EndPoint:PGraphElement):boolean;
   begin
     if EndPoint=StartPoint then Result:=true
     else
     if EndPoint.GEType=getEND then Result:=false
     else
     if(EndPoint.nextTrue=nil)and(EndPoint.nextFalse=nil) then Result:=false
     else Result:= LookStartPoint(EndPoint,StartPoint,EndPoint.GEType) = elsFoundError;
   end;

   function Graph.SignalGoFirst(InSignal:boolean):boolean;
   var Signals:TObjList;
   begin
     if InSignal then Signals:=InSignals else Signals:=OutSignals;
     Result:=Signals.goFirst
   end;

   function Graph.SignalGetAndGoNext(var s:string;var SAddr:pointer;InSignal:boolean):boolean;
   var cur:PSignal;
       Signals:TObjList;
   begin
     if InSignal then Signals:=InSignals else Signals:=OutSignals;
     cur:=Signals.getCurrent;
     if cur<>nil then
     begin
      s:=cur.sign;
      SAddr:=cur
     end
     else
     begin
      s:='';
      SAddr:=nil
     end;
     Result:=Signals.goNext
   end;

   procedure Graph.ClearSignals(InSignal:boolean);
   var Signals:TObjList;
       PGE:PGraphElement;
   begin
     if InSignal then Signals:=InSignals else Signals:=OutSignals;
     Signals.Clear;
     if Points.goFirst then
     repeat
       PGE:=PGraphElement(Points.getCurrent);
       if (PGE.GEType=getCOND)=InSignal then PGE.Signals.clear;
     until not Points.goNext;
   end;

   function Graph.DeleteSignalByAddr(SAddr:PSignal;InSignal:boolean):boolean;
   var cur:PGraphElement;
       PgeS:PgeSignal;
       Signals:TObjList;
   begin
     if InSignal then Signals:=InSignals else Signals:=OutSignals;
     Result:=Signals.remove(SAddr);
     if Result then
     begin
     if Points.goFirst then
     repeat
       cur:=Points.getCurrent;
       if cur.Signals.goFirst then
       repeat
         PgeS:=cur.Signals.getCurrent;
         if PgeS.signal=SAddr then
         begin
          cur.Signals.removeCurrent;
          break
         end 
       until not cur.Signals.goNext;
     until not Points.goNext;

     end;
   end;

   procedure Graph.DeleteCon(PC:PConnection);
   begin
     if PC.trueWay then PC.StartPoint.nextTrue:=nil
                   else PC.StartPoint.nextFalse:=nil;
     Connections.remove(PC);
     SetPointReaches;
   end;

   procedure Graph.FindRemoveCon(PGE:PGraphElement);
   var Cur:PConnection;
       noChanged:boolean;
   begin
     repeat
      noChanged:=true;
      if Connections.goFirst then
      repeat
        Cur:=Connections.getCurrent;
        if(cur.StartPoint=PGE)or(cur.EndPoint=PGE) then
        begin
         DeleteCon(cur);
         noChanged:=false;
         break
        end;
      until not Connections.goNext;
     until noChanged;
   end;

   procedure Graph.FindRemoveConSP(PGE:PGraphElement);
   var Cur:PConnection;
       noChanged:boolean;
   begin
     repeat
      noChanged:=true;
      if Connections.goFirst then
      repeat
        Cur:=Connections.getCurrent;
        if cur.StartPoint=PGE then
        begin
         DeleteCon(cur);
         noChanged:=false;
         break
        end;
      until not Connections.goNext;
     until noChanged;
   end;

   procedure Graph.FindRemoveConEP(PGE:PGraphElement);
   var Cur:PConnection;
       noChanged:boolean;
   begin
     repeat
      noChanged:=true;
      if Connections.goFirst then
      repeat
        Cur:=Connections.getCurrent;
        if cur.EndPoint=PGE then
        begin
         DeleteCon(cur);
         noChanged:=false;
         break
        end;
      until not Connections.goNext;
     until noChanged;
   end;

   procedure Graph.DeleteGE(PGE:PGraphElement);
   begin
     PGE.Signals.Clear;
     FindRemoveCon(PGE);
     PGE.Signals.Destroy;
     Points.remove(PGE);
     SetPointReaches;
   end;

   // SFT //

   procedure Graph.STF_Signal(var f:file;PS:PSignal);
   begin
    BlockWrite(f,PS,SizeOf(PS));
    BlockWrite(f,PS.sign,25);
   end;

   procedure Graph.STF_Point(var f:file;PGE:PGraphElement);
   var NumOfSmth:integer;
       PGES:PGESignal;
   begin
    BlockWrite(f,PGE,SizeOf(PGE));
    BlockWrite(f,PGE.GEType,SizeOf(PGE.GEType));
    BlockWrite(f,PGE.X,SizeOf(PGE.X));
    BlockWrite(f,PGE.Y,SizeOf(PGE.Y));
    BlockWrite(f,PGE.W,SizeOf(PGE.W));
    BlockWrite(f,PGE.H,SizeOf(PGE.H));
    BlockWrite(f,PGE.UPN,SizeOf(PGE.UPN));
    BlockWrite(f,PGE.ReachStart,SizeOf(PGE.H));
    BlockWrite(f,PGE.ReachFinish,SizeOf(PGE.H));
    BlockWrite(f,PGE.nextTrue,SizeOf(PGE.nextTrue));
    BlockWrite(f,PGE.nextFalse,SizeOf(PGE.nextFalse));
    // Signals //
    NumOfSmth:=0;
    if PGE.Signals.goFirst then
    repeat
      NumOfSmth:=NumOfSmth+1
    until not PGE.Signals.goNext;
    PGE.Signals.goFirst;
    BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
    if PGE.Signals.goFirst then
    repeat
      PGES:=PGE.Signals.getCurrent;
      BlockWrite(f,PGES.signal,SizeOf(PGES.signal));
      BlockWrite(f,PGES.reverse,SizeOf(PGES.reverse));
    until not PGE.Signals.goNext;
   end;

   procedure Graph.STF_Connection(var f:file;PC:PConnection);
   begin
    BlockWrite(f,PC.ConType,SizeOf(PC.ConType));
    BlockWrite(f,PC.StartPoint,SizeOf(PC.StartPoint));
    BlockWrite(f,PC.EndPoint,SizeOf(PC.EndPoint));
    BlockWrite(f,PC.W,SizeOf(PC.W));
    BlockWrite(f,PC.trueWay,SizeOf(PC.TrueWay));
   end;

   procedure Graph.SaveToFile(fname:string);
   var f:file;
       NumOfSmth:integer;
   begin
    assign(f,fname);
    rewrite(f,1);
    // InSignals //
    NumOfSmth:=0;
    if InSignals.goFirst then
    repeat
      NumOfSmth:=NumOfSmth+1
    until not InSignals.goNext;
    BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
    if InSignals.goFirst then
    repeat
      STF_Signal(f,InSignals.getCurrent)
    until not InSignals.goNext;
    // OutSignals //
    NumOfSmth:=0;
    if OutSignals.goFirst then
    repeat
      NumOfSmth:=NumOfSmth+1
    until not OutSignals.goNext;
    BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
    if OutSignals.goFirst then
    repeat
      STF_Signal(f,OutSignals.getCurrent)
    until not OutSignals.goNext;
    // Points //
    NumOfSmth:=0;
    if Points.goFirst then
    repeat
      NumOfSmth:=NumOfSmth+1
    until not Points.goNext;
    BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
    if Points.goFirst then
    repeat
      STF_Point(f,Points.getCurrent)
    until not Points.goNext;
    // Connections //
    NumOfSmth:=0;
    if Connections.goFirst then
    repeat
      NumOfSmth:=NumOfSmth+1
    until not Connections.goNext;
    BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
    if Connections.goFirst then
    repeat
      STF_Connection(f,Connections.getCurrent)
    until not Connections.goNext;
    close(f);
   end;

   // OpenFromFile //

   procedure Graph.OFF_Signal(var f:file;InSignal:boolean);
   var PR:PReaddress;
       PS:PSignal;
   begin
    new(PR);
    ON_ADDR.add(PR);
    new(PS);
    PR.New:=PS;
    BlockRead(f,PR.old,SizeOf(PR.old)); // считываем старый адрес
    BlockRead(f,PS.sign,25);
    if InSignal then InSignals.add(PS)
                else OutSignals.add(PS);
   end;

   procedure Graph.OFF_Point(var f:file);
   var PR:PReaddress;
       PGE:PGraphElement;
       i,NumOfSmth:integer;
       PGES:PGESignal;
   begin
    New(PR);
    ON_ADDR.add(PR);
    BlockRead(f,PR.Old,SizeOf(PR.Old));
    new(PGE);
    PR.New:=PGE;
    BlockRead(f,PGE.GEType,SizeOf(PGE.GEType));
    BlockRead(f,PGE.X,SizeOf(PGE.X));
    BlockRead(f,PGE.Y,SizeOf(PGE.Y));
    BlockRead(f,PGE.W,SizeOf(PGE.W));
    BlockRead(f,PGE.H,SizeOf(PGE.H));
    BlockRead(f,PGE.UPN,SizeOf(PGE.UPN));
    if MaxUPN<PGE.UPN then MaxUPN:=PGE.UPN;
    BlockRead(f,PGE.ReachStart,SizeOf(PGE.H));
    BlockRead(f,PGE.ReachFinish,SizeOf(PGE.H));
    BlockRead(f,PGE.nextTrue,SizeOf(PGE.nextTrue));
    BlockRead(f,PGE.nextFalse,SizeOf(PGE.nextFalse));
    PGE.Signals:=TObjList.Create(nil);
    // Signals //
    BlockRead(f,NumOfSmth,SizeOf(NumOfSmth));
    for i:=1 to NumOfSmth do
    begin
      new(PGES);
      BlockRead(f,PGES.signal,SizeOf(PGES.signal));
      BlockRead(f,PGES.reverse,SizeOf(PGES.reverse));
      PGE.Signals.add(PGES);
    end;
    Points.add(PGE);
   end;

   procedure Graph.OFF_Connection(var f:file);
   var PC:PConnection;
   begin
    new(PC);
    BlockRead(f,PC.ConType,SizeOf(PC.ConType));
    BlockRead(f,PC.StartPoint,SizeOf(PC.StartPoint));
    BlockRead(f,PC.EndPoint,SizeOf(PC.EndPoint));
    BlockRead(f,PC.W,SizeOf(PC.W));
    BlockRead(f,PC.trueWay,SizeOf(PC.TrueWay));
    Connections.add(PC);
   end;

   procedure Graph.OpenFromFile(fname:string);
   var f:file;
       i,NumOfSmth:integer;
       PR:PReaddress;
   begin
     MaxUPN:=0;
     repeat
       PGraphElement(Points.getCurrent).Signals.Clear;
     until not Points.goNext;
     Points.Clear;
     Connections.Clear;
     InSignals.Clear;
     OutSignals.Clear;
     ON_Addr.Clear;
     new(PR);
     PR.old:=nil;
     PR.new:=nil;
     ON_Addr.add(PR);

     assign(f,fname);
     reset(f,1);
    // InSignals //
     BlockRead(f,NumOfSmth,SizeOf(NumOfSmth));
     for i:=1 to NumOfSmth do OFF_Signal(f,true);
    // OutSignals //
     BlockRead(f,NumOfSmth,SizeOf(NumOfSmth));
     for i:=1 to NumOfSmth do OFF_Signal(f,false);
    // Points //
     BlockRead(f,NumOfSmth,SizeOf(NumOfSmth));
     for i:=1 to NumOfSmth do OFF_Point(f);
    // Connections //
     BlockRead(f,NumOfSmth,SizeOf(NumOfSmth));
     for i:=1 to NumOfSmth do OFF_Connection(f);
    close(f);
    ReAddressAll
   end;

   procedure Graph.ReAddressAll;
   var PGE:PGraphElement;
       PGES:PgeSignal;
       PC:PConnection;
   begin
     if Points.goFirst then
     repeat
       PGE:=Points.getCurrent;
       PGE.nextTrue:=getNewAddr(PGE.nextTrue);
       PGE.nextFalse:=getNewAddr(PGE.nextFalse);
       if PGE.Signals.goFirst then
       repeat
         PGES:=PGE.Signals.getCurrent;
         PGES.signal:=getNewAddr(PGES.signal);
       until not PGE.Signals.goNext;
     until not Points.goNext;

     if Connections.goFirst then
     repeat
       PC:=Connections.getCurrent;
       PC.StartPoint:=getNewAddr(PC.StartPoint);
       PC.EndPoint:=getNewAddr(PC.EndPoint);
     until not Connections.goNext
   end;
   
   // EXPORT //

   procedure Graph.ETF_Signal(var f:file;PS:PSignal);
   begin
    BlockWrite(f,PS,SizeOf(PS));
    BlockWrite(f,PS.sign,25);
   end;

   procedure Graph.ETF_Point(var f:file;PGE:PGraphElement);
   var NumOfSmth:integer;
       PGES:PGESignal;
   begin
    BlockWrite(f,PGE,SizeOf(PGE));
    BlockWrite(f,PGE.GEType,SizeOf(PGE.GEType));
    BlockWrite(f,PGE.nextTrue,SizeOf(PGE.nextTrue));
    BlockWrite(f,PGE.nextFalse,SizeOf(PGE.nextFalse));
    // Signals //
    NumOfSmth:=0;
    if PGE.Signals.goFirst then
    repeat
      NumOfSmth:=NumOfSmth+1
    until not PGE.Signals.goNext;
    PGE.Signals.goFirst;
    BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
    if PGE.Signals.goFirst then
    repeat
      PGES:=PGE.Signals.getCurrent;
      BlockWrite(f,PGES.signal,SizeOf(PGES.signal));
      BlockWrite(f,PGES.reverse,SizeOf(PGES.reverse));
    until not PGE.Signals.goNext;
   end;

   function Graph.ExportToFile(fname:string):boolean;
   var f:file;
       NumOfSmth:integer;
   begin
     assign(f,fname);
     rewrite(f,1);
     // InSignals //
     NumOfSmth:=0;
     if InSignals.goFirst then
     repeat
       NumOfSmth:=NumOfSmth+1
     until not InSignals.goNext;
     BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
     if InSignals.goFirst then
     repeat
       ETF_Signal(f,InSignals.getCurrent)
     until not InSignals.goNext;
     // OutSignals //
     NumOfSmth:=0;
     if OutSignals.goFirst then
     repeat
       NumOfSmth:=NumOfSmth+1
     until not OutSignals.goNext;
     BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
     if OutSignals.goFirst then
     repeat
       ETF_Signal(f,OutSignals.getCurrent)
     until not OutSignals.goNext;
     // Points //
     NumOfSmth:=0;
     if Points.goFirst then
     repeat
       NumOfSmth:=NumOfSmth+1
     until not Points.goNext;
     BlockWrite(f,NumOfSmth,SizeOf(NumOfSmth));
     if Points.goFirst then
     repeat
       ETF_Point(f,Points.getCurrent)
     until not Points.goNext;
     close(f);
     Result:=true
   end;

   procedure Graph.SetPointReaches;
   var SomeChanged:boolean;
       i:integer;
       PGE:PGraphElement;

       procedure CheckThisFinish(PGE:PGraphElement;var SomeChanged:boolean);
       var CurState:boolean;
       begin
        if(PGE.ReachFinish)and(PGE.nextTrue=nil)and(PGE.nextFalse=nil)then
        begin
          PGE.ReachFinish:=false;
          SomeChanged:=true
        end
        else
        begin
          CurState:=(PGE.nextTrue<>nil)and(PGE.nextTrue.ReachFinish);
          CurState:=CurState or ((PGE.nextFalse<>nil)and(PGE.nextFalse.ReachFinish));
          if CurState<>PGE.ReachFinish then
          begin
            PGE.ReachFinish:=CurState;
            SomeChanged:=true
          end
        end;
       end;

       procedure CheckThisStart(PGEprev,PGE:PGraphElement;var SomeChanged:boolean);
       begin
         if(PGEprev.ReachStart)and(not PGE.ReachStart) then
         begin
           PGE.ReachStart:=true;
           SomeChanged:=true
         end
       end;

   begin
    for i:=0 to Points.ItemCount-1 do
    begin
     PGE:=PGraphElement(Points[i]);
     PGE.ReachStart:=PGE.GEType=getBEG;
     PGE.ReachFinish:=PGE.GEType=getEND;
    end;


    repeat
     SomeChanged:=false;
     for i:=0 to Points.ItemCount-1 do
     begin
       PGE:=PGraphElement(Points[i]);
       if PGE.GEType<>getEND  then CheckThisFinish(PGE,SomeChanged);
       if PGE.nextTrue<>nil then CheckThisStart(PGE,PGE.nextTrue,SomeChanged);
       if PGE.nextFalse<>nil then CheckThisStart(PGE,PGE.nextFalse,SomeChanged);
     end;
    until not SomeChanged
   end;

   function Graph.CheckExportError:ErrorGraphGood;
   var PGE:PGraphElement;
       PC,Cur:PConnection;
       err:ErrorGraphGood;
       i:integer;
   begin
     err:=eggNONE;
     if Points.goFirst then
     repeat
       PGE:=Points.getCurrent;
       if((PGE.GEType=getOPER)or(PGE.GEType=getBEG))and(PGE.nextTrue=nil)then err:=eggCONN
       else
       if(PGE.GEType=getCOND)and((PGE.nextTrue=nil)or(PGE.nextFalse=nil))then err:=eggCONN
       else
       if(PGE.GEType<>getBEG)then
       begin
          PC:=nil;
          if Connections.goFirst then
          repeat
            Cur:=Connections.getCurrent;
            if Cur.EndPoint=PGE then PC:=Cur;
          until(not Connections.goNext)or(PC<>nil);
          if PC=nil then err:=eggCONN
       end;
       if(err=eggNONE)and(PGE.GEType<>getBEG)and(PGE.GEType<>getEND)and
         (not PGE.Signals.goFirst) then err:=eggSIGNAL
     until(not Points.goNext)or(err<>eggNONE);
     if err=eggNONE then
     begin
       for i:=0 to Points.ItemCount-1 do
       begin
        PGE:=PGraphElement(Points[i]);
        if not (PGE.ReachStart and PGE.ReachFinish)then
        begin
          err:=eggREACH;
          break
        end;
       end;
     end;
     if (InSignals.ItemCount=0) or (OutSignals.ItemCount=0) then err:=eggSIGNAL;
     Result:=err;
   end;

   // READDRESS //

   function Graph.GetNewAddr(oldaddr:pointer):pointer;
   var PR:PReaddress;
   begin
     Result:=nil;
     if ON_Addr.goFirst then
     repeat
       PR:=ON_Addr.getCurrent;
       if oldaddr=PR.Old then
       begin
         Result:=PR.New;
         break
       end;
     until not ON_Addr.goNext
   end;

   procedure Graph.GetContent(var Grid:TStringGrid);
   var i,j:integer;
       PGE:PGraphElement;
       Sign:PGeSignal;
       s:string;
   begin
     Grid.RowCount:=1;
     for i:=0 to Points.ItemCount-1 do
     begin
       PGE:=Points[i];
       Grid.Cells[0,i+1]:=inttostr(PGE.UPN);
       Grid.RowCount:=Grid.RowCount+1;
       Case PGE.GEType of
         getBEG:Grid.Cells[1,i+1]:='Начало';
         getEND:Grid.Cells[1,i+1]:='Конец';
         getOPER:Grid.Cells[1,i+1]:='Операторная';
         getCOND:Grid.Cells[1,i+1]:='Условная';
       end;
       if PGE.ReachStart then Grid.Cells[2,i+1]:='True' else Grid.Cells[2,i+1]:='False';
       if PGE.ReachFinish then Grid.Cells[3,i+1]:='True' else Grid.Cells[3,i+1]:='False';
       Grid.Cells[4,i+1]:=inttostr(PGE.X);
       Grid.Cells[5,i+1]:=inttostr(PGE.Y);
       Grid.Cells[6,i+1]:=inttostr(PGE.W);
       Grid.Cells[7,i+1]:=inttostr(PGE.H);
       s:='';
       for j:=0 to PGE.Signals.ItemCount-1 do
       begin
         Sign:=PGE.Signals[j];
         s:=s+PSignal(Sign.signal).sign;
         if Sign.reverse then s:=s+'[о]';
         if j<>PGE.Signals.ItemCount-1 then s:=s+', '
       end;
       if s='' then s:='Нет сигналов';
       Grid.Cells[8,i+1]:=s;
       if PGE.nextTrue=nil  then Grid.Cells[9,i+1]:='Нет перехода'
                            else Grid.Cells[9,i+1]:='Переход на '+inttostr(PGE.nextTrue.UPN);
       if PGE.nextFalse=nil  then Grid.Cells[10,i+1]:='Нет перехода'
                             else Grid.Cells[10,i+1]:='Переход на '+inttostr(PGE.nextFalse.UPN);
     end;
     Grid.FixedRows:=1;
     Grid.Cells[0,0]:='№';
     Grid.Cells[1,0]:='Тип';
     Grid.Cells[2,0]:='Нач > Верш';
     Grid.Cells[3,0]:='Верш > Кон';
     Grid.Cells[4,0]:='X';
     Grid.Cells[5,0]:='Y';
     Grid.Cells[6,0]:='W';
     Grid.Cells[7,0]:='H';
     Grid.Cells[8,0]:='Сигналы';
     Grid.Cells[9,0]:='Путь "Да"';
     Grid.Cells[10,0]:='Путь "Нет"';
   end;

   function MatchLast(s1,s2:string):boolean;
   var i,len1,len2,minLen:integer;
   begin
     Result:=true;
     len1:=length(s1);
     len2:=length(s2);
     if len1<len2 then MinLen:=len1 else MinLen:=len2;
     for i:=0 to MinLen-1 do
      if s1[len1-i]<>s2[len2-i] then
      begin
        Result:=false;
        exit
      end;
   end;

   procedure Graph.GetWays(var M:TMemo);
   type
     PGW = ^TGW;
     TGW = record
       addr:pointer;
       onTrue:boolean;
     end;
   var s:string;
       Cicle:TList;
       pS:^string;
       i,j,num:longint;
       pCicle:longint;
       notOk,isThere:boolean;
       PGE,wasPGE:PgraphElement;
       GWs:TobjList;
       GW:PGW;
       MaxIter:word;
   begin
    Cicle:=Tlist.create;
    num:=0;
    notOk:=false;
    GWs:=TObjList.create(nil);
    if Points.goFirst then
    repeat
      PGE:=Points.getCurrent;
      if(not PGE.ReachStart)or
        (not PGE.ReachFinish)or
        ((PGE.nextTrue=nil)and(PGE.GEType in [getCond,getOper]))or
        ((PGE.nextFalse=nil)and(PGE.GEType=getCond)) then
      begin
       notOk:=true;
       break;
      end;
      if PGE.GEType = getCond then
      begin
        new(GW);
        GW.addr:=PGE;
        GW.onTrue:=false;
        GWs.add(GW);
        Num:=Num+1;
      end
    until not Points.goNext;
    M.lines.Clear;
    if notOk then  M.lines.add('Проблемы c графом!!!')
    else
    begin
      MaxIter:=1;
      for i:=1 to Num do MaxIter:=MaxIter*2;
      for i:=1 to MaxIter do
      begin
        s:='';
        Num:=i;
        if GWs.goFirst then
        repeat
          GW:=GWs.getCurrent;
          GW.onTrue := (Num mod 2) = 0;
          Num:=Num div 2;
        until not GWs.goNext;
        Points.goFirst;
        PGE:=Points.getCurrent;
        wasPGE:=PGE;
        while PGE.nextTrue<>nil do
        begin
          pCicle:=pos(','+inttostr(PGE.UPN)+',',s);
          if(pCicle<>0)and(wasPGE.GEType=getCOND)then
          begin
           new(pS);
           pS^:=copy(s,pCicle+1,length(s)-pCicle);
           delete(ps^,length(ps^),1);
           isThere:=false;
           for j:=1 to Cicle.Count do
           begin
            if pS^ = String(Cicle[j-1]^) then
            begin
              isThere:=true;
              break
            end;
           end; 
           if not isThere then Cicle.add(pS);
          end;
          s:=s+inttostr(PGE.UPN)+',';
          wasPGE:=PGE;
          if PGE.GEType = getCond then
          begin
            if GWs.goFirst then
            repeat
              GW:=GWs.getCurrent;
              if PGE = GW.addr then
              begin
                if GW.onTrue then PGE:=PGE.nextTrue
                             else PGE:=PGE.nextFalse;
                GW.onTrue:=not GW.onTrue;
                break;
              end;
            until not GWs.goNext;
          end
          else PGE:=PGE.nextTrue;
        end;
        s:=s+inttostr(PGE.UPN);
        M.lines.add(s);
      end;
    end;
    if Cicle.Count<>0 then
    begin
      M.lines.add('');
      M.lines.add('#--- Циклы ---#');
      M.lines.add('');
      for i:=0 to Cicle.Count-1 do M.lines.add(String(Cicle[i]^))
    end;
    GWs.clear;
    GWs.destroy;
    i:=Cicle.Count-1;
    while i>=0 do
    begin
     ps:=Cicle[i];
     Cicle.delete(i);
     ps^:='';
     dispose(ps);
     i:=i-1
    end;
    Cicle.destroy;
    if M.lines[0]<>'Проблемы c графом!!!' then
    begin
      M.Lines.Insert(0,'');
      M.lines.insert(0,'#--- Пути ---#');
      M.Lines.Insert(0,'');
      M.lines.delete(0);
    end;  

   end;

   procedure Graph.ResetUPNs;
   var PGE,fPGE:PGraphElement;
       notFound:boolean;
       MinUPN,MaxInt:integer;
   begin
    MaxUPN:=0;
    MaxInt:=$7FFFFFFF;
    if Points.goFirst then
    repeat
      MaxUPN:=MaxUPN+1;
      MinUPN:=MaxInt;
      notFound:=true;
      fPGE:=nil;
      if Points.goFirst then
      repeat
       PGE:=Points.getCurrent;
       if (PGE.UPN>=MaxUPN)and(PGE.UPN<MinUPN) then
       begin
         fPGE:=PGE;
         MinUPN:=PGE.UPN;
       end;
      until(not Points.goNext)or(MinUPN=MaxUPN);
      if fPGE<>nil then
      begin
       fPGE.UPN:=MaxUPN;
       notFound:=false;
      end;              
    until notFound;
   end;

   procedure Graph.SortBuUPNs;
   begin
     Points.Sort
   end;

   // ----------------------------//

   function MinInt(E1,E2:integer):integer;
   begin
    if E1<E2 then Result:=E1
             else Result:=E2
   end;

   function MaxInt(E1,E2:integer):integer;
   begin
    if E1>E2 then Result:=E1
             else Result:=E2
   end;

   procedure MinMaxInt(E1,E2:integer;var ResMin,ResMax:integer);
   begin
    if E1<E2 then
    begin
     ResMin:=E1;
     ResMax:=E2
    end
    else
    begin
     ResMin:=E2;
     ResMax:=E1
    end
   end;

   function OverGraphElement(X,Y:integer;PGE:PGraphElement):boolean;
   var K,B:extended;
   begin
     Result:=false;
     Case PGE.GEType of
       getBeg,getEND,getOPER: Result:=(X>=round(PGE.X-PGE.W/2))and(X<=round(PGE.X+PGE.W/2))and(Y>=round(PGE.Y-PGE.H/2))and(Y<=round(PGE.Y+PGE.H/2));
       getCond:
         begin
           K:=PGE.H/PGE.W;
           B:=PGE.H/2;
           X:=X-PGE.X;
           Y:=Y-PGE.Y;
           Result:=(Y>=-K*X-B)and(Y<=-K*X+B)and(Y>=K*X-B)and(Y<=K*X+B);
         end;
     end;
   end;

   function OverConnection(X,Y:integer;PC:PConnection):boolean;
   var WXY:integer;
       ML,MR,ML_T,ML_B,MR_T,MR_B:integer;
       MT,MB,MT_L,MT_R,MB_L,MB_R:integer;
       XYB,XYE:TPoint;
   begin
     Result:=false;
     XYB:=GetAttachPoint(PC.StartPoint,PC.TrueWay,false);
     XYE:=GetAttachPoint(PC.EndPoint,PC.TrueWay,true);
     Case PC.ConType of
       conVERT:
       begin
         WXY:=round((XYE.X-XYB.X)*PC.W+XYB.X);
         MinMaxInt(XYB.Y,XYE.Y,MT,MB);
         MinMaxInt(XYB.X,WXY,MT_L,MT_R);
         MinMaxInt(XYE.X,WXY,MB_L,MB_R);
         Result:=(X>=WXY-2)and(X<=WXY+2)and(Y>=MT)and(Y<=MB);
         Result:=Result or ((X>=MT_L)and(X<=MT_R)and(Y>=XYB.Y-2)and(Y<=XYB.Y+2));
         Result:=Result or ((X>=MB_L)and(X<=MB_R)and(Y>=XYE.Y-2)and(Y<=XYE.Y+2))
       end;
       conHORZ:
       begin
         WXY:=round((XYE.Y-XYB.Y)*PC.W+XYB.Y);
         MinMaxInt(XYB.X,XYE.X,ML,MR);
         MinMaxInt(XYB.Y,WXY,ML_T,ML_B);
         MinMaxInt(XYE.Y,WXY,MR_T,MR_B);
         Result:=(Y>=WXY-2)and(Y<=WXY+2)and(X>=ML)and(X<=MR);
         Result:=Result or ((Y>=ML_T)and(Y<=ML_B)and(X>=XYB.X-2)and(X<=XYB.X+2));
         Result:=Result or ((Y>=MR_T)and(Y<=MR_B)and(X>=XYE.X-2)and(X<=XYE.X+2));
         if Result then
          Result:=true;
       end;
     end;
   end;

   function GetAttachPoint(PGE:PGraphElement;TrueWay,Entry:boolean):TPoint;
   var X,Y,W,H:integer;
   begin
     X:=PGE.X;
     Y:=PGE.Y;
     W:=PGE.W;
     H:=PGE.H;
     case PGE.GEType of
       getBEG:
         begin
           Result.X := X;
           Result.Y := round(Y+H*3/4);
         end;
       getEND:
         begin
           Result.X := X;
           Result.Y := round(Y-H*3/4);
         end;
       getOPER:
         begin
           Result.X := X;
           if Entry then Result.Y := round(Y-H*3/4)
                    else Result.Y := round(Y+H*3/4);
         end;
       getCOND:
         begin
           if Entry then
           begin
             Result.Y := round(Y-H*3/4);
             Result.X := X;
           end
           else
           begin
//             Result.Y := round(Y+H/4);
             Result.Y := Y;
             if TrueWay
             then Result.X := X+round(w/2+H/4)
             else Result.X := X-round(w/2+H/4);
           end
         end;

     end;
   end;

   procedure DrawReachSignal(C:TCanvas;X,Y:integer;IsReach,Start:boolean);
   var WasPen,WasBrush:TColor;
       arrWX,arrWY:integer;
       arrow:array[0..3]of TPoint;
   begin
    WasPen:=C.pen.color;
    WasBrush:=C.Brush.color;
    C.pen.color:=clBlack;
    if IsReach then C.Brush.color:=clLime
               else C.Brush.color:=$008080FF;
    C.Ellipse(X-5,Y-5,X+6,Y+6);
    if Start then
    begin
     arrWX:=3;
     arrWY:=2
    end
    else
    begin
     arrWX:=-3;
     arrWY:=-2
    end;
    arrow[0].X:=X-arrWX;
    arrow[0].Y:=Y+arrWY;
    arrow[1].X:=X;
    arrow[1].Y:=Y-arrWY;
    arrow[2].X:=X+arrWX;
    arrow[2].Y:=Y+arrWY;
    arrow[3].X:=X;
    arrow[3].Y:=Y;
    C.pen.color:=clBlack;
    C.Brush.color:=clBlack;
    C.Polygon(arrow);
    C.pen.color:=WasPen;
    C.Brush.color:=WasBrush;
   end;


end.

