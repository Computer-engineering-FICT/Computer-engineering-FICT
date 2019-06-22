UNIT Imitate;

INTERFACE

USES Summit;

TYPE
   TConfigurationEVM = record
                          MaxInProc : Integer;
                          MaxInBus  : Integer;
                          StrSummit : String;
                          StrForProc: String;
                       end;
   {******************************}
   OProc = object
              private
                 NoProc: Byte;
                 SummitInProc: String;
              public
                 constructor Init( No: Byte );
                 function    FindMaxTime: Integer;
                 procedure   Add( newSummit: PSummit );
                 procedure   SetSummitInProc( SetSummit: PSummit );
                 procedure   ShowAllocationInProc;
                 function    MouseClickInRegionSummit: Boolean;
                 function    MouseClickInRegionBus( var Index: Byte ): Boolean;
                 function    MouseClickInRegionBtnProc: Boolean;
                 destructor  Done;
           end;
   {******************************}
   PRecAllProc = ^TRecAllProc;
   PProc= ^OProc;
   TRecAllProc = record
                    Proc: PProc;
                    Next: PRecAllProc;
                 end;
   O_EVM = object
              private
                 AllProc: PRecAllProc;
                 SummitInBus: String;
              public
                 constructor Init;
                 function    Find( findProc: Byte ): PProc;{возвр-ет pointer на объект OProc с номером No=FindProc}
                 procedure   FindMaxTime;
                 function    AllSummitInProc: Boolean;
                 procedure   SetAllSummit;
                 procedure   ShowRack;
                 procedure   ShowAllocationInAllProc;
                 function    MouseClickInRegionSummit: Boolean;
                 function    MouseClickInRegionBus( var Index: Byte ): Boolean;
                 function    MouseClickInRegionBtnProc(var ClickNoProc: Byte): Boolean;
                 procedure   ChangeProc;
                 procedure   ChangeInBus( Index: Byte );
                 function    AddProcessor: Boolean;
                 function    DelProcessor: Boolean;
                 procedure   SetOneBestSummitInBus;
                 destructor  Done;
                 function    GetStatusBusInTakt( Takt: Real ): Boolean;
                 function    GetStatusBusInIntervalTime( min,
                                max: Integer ): Boolean;
                 procedure   AddToBus( newSummit: PSummit );
                 procedure   ShowOthersInBus;
                 procedure   ShowAllocationInBus;
                 procedure   ShowLineInBus;
                 procedure   SetAllFlagUp( SetSummit: PSummit; var StrBtn: String );
                 procedure   SetAllFlagDown( SetSummit: PSummit );
                 procedure   BeginerAllocation;
                 procedure   AutoAllocation;
                 function    AutoAllocation2: Boolean;
                 function    BaseAllocation: Boolean;
                 procedure   SaveConfigurationEVM( var ConfigurationEVM: TConfigurationEVM );
                 procedure   SaveBestConfigurationEVM;
                 procedure   LoadConfigurationEVM( ConfigurationEVM: TConfigurationEVM );
                 function    MaxInBus: Integer;
                 procedure   BestSet(firstClickNoProc: Byte);
                 procedure   BestSetSummitInProc      ( setSummitPtr: PSummit; newNoProc: Byte );
                 procedure   BestSetSummitInOtherProc ( setSummitPtr: PSummit; Vers: Byte );
                 procedure   BestSetKlasterInProc     ( setKlaster: String; newNoProc: Byte );
                 procedure   BestSetKlasterInOtherProc( setKlaster: String );
                 procedure   BestSetProcInProc     ( startNoProc, newNoProc: Byte );
                 procedure   BestSetProcInOtherProc( startNoProc: Byte );
              end;
   {******************************}

Function Modelirovanie: Boolean;

IMPLEMENTATION

USES CRT, Graph, Mouse, Service;

CONST Alloc_maxX = maxX_FieldCount-20; Alloc_maxY = maxY_FieldCount-10;
      Alloc_minX = minX_FieldCount+20; Alloc_minY = minY_FieldCount+30;
      AddXmin= maxX_FieldCount-28; AddYmin= minY_FieldCount+ 4;
      AddXmax= maxX_FieldCount-16; AddYmax= minY_FieldCount+14;
      DelXmin= maxX_FieldCount-14; DelYmin= AddYmin;
      DelXmax= maxX_FieldCount- 2; DelYmax= AddYmax;
      cColorSummit     = {15;{}15;{} cColorFrameSummit     = {00;{}00;{}
      cColorSending    = {15;{}02;{} cColorFrameSending    = {00;{}00;{}
      cColorWaiting    = {15;{}14;{} cColorFrameWaiting    = {00;{}00;{}
      cColorButtonProc = {15;{}06;{} cColorFrameButtonProc = {00;{}00;{}
      cColorField      = {15;{}07;{} cColorFrameField      = {00;{}15;{}
      cColorTextRack   = {00;{}00;{}
      cColorLineConect = {00;{}00;{}
      cColorTouchLine  = {00;{}15;{}

VAR MyEVM: O_EVM;
    maxTime: Integer;
    PointerInToAllotSummit: PSummit;
    dX: Integer;
    sSaveConfigurationEVM, BestConfigurationEVM: TConfigurationEVM;
    AutoDel: Boolean;

{*********************}
Procedure ShowAllocation; forward;

Constructor OProc.Init( No: Byte );
Begin
   NoProc:= No;
   SummitInProc:= '';
End;

Procedure OProc.SetSummitInProc( SetSummit: PSummit );
Var beginerProc: Integer;
    Position: Byte;
    SummitUp: Psummit;
    NumberSummitUp: Byte;
Begin
   if ( SetSummit^.GetNoProc <> NoProc ) or
    not SetSummit^.AllOkToSetSummit or
        SetSummit^.GetInProc
        then Exit;
   Position:= Pos( Chr(SetSummit^.GetNumber), SummitInProc );
   if Position = 1 then beginerProc:= 0 else
   begin
      NumberSummitUp:= Ord( SummitInProc[Position-1] );
      SummitUp:= FindSummit( NumberSummitUp );
      beginerProc:= SummitUp^.GetStartProc + SummitUp^.GetValue;
   end;
   beginerProc:= SetSummit^.FindBeginerValueVariableStartProc( beginerProc );
   SetSummit^.SetStartProc( beginerProc );
   SetSummit^.SetInProc;
End;

Function OProc.FindMaxTime: Integer;
Var endNumberSummitInProc: Byte;
    endSummitInProc: PSummit;
Begin
   if SummitInProc = '' then
   begin
      FindMaxTime:= 0;
      Exit;
   end;
   endNumberSummitInProc:= Ord( SummitInProc[ Length(SummitInProc) ] );
   endSummitInProc:= FindSummit( endNumberSummitInProc );
   FindMaxTime:= endSummitInProc^.GetStartProc + endSummitInProc^.GetValue;
End;

Procedure OProc.Add( newSummit: PSummit );
Begin
   SummitInProc:= SummitInProc + Chr( newSummit^.GetNumber );
End;

Procedure OProc.ShowAllocationInProc;
Var currSummitInProc: PSummit;
    x, y, y1, y2: Integer;
    i, j: Byte;
Begin
   x:= Trunc(Alloc_minX+NoProc * (Alloc_maxX-Alloc_minX)/(Processor+2));
   Button( X-dX, Alloc_minY-25, X+dX, Alloc_minY-10,
           'Пр'+IntToStr(NoProc), cColorFrameButtonProc, cColorButtonProc, False );
   SetColor(cColorLineConect);
   SetLineStyle(0,0,1);
   { рисую линии связей, находящихся на одном процессоре }
   for j:= 1 to Length( SummitInProc ) do
   begin
      currSummitInProc:= FindSummit( Ord(SummitInProc[j]) );
      for i:= 1 to currSummitInProc^.NumberArc do
         if FindSummit(currSummitInProc^.ToSmmtToInt(i))^.GetNoProc = NoProc
         then
         begin
            y1:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY )/
                        maxTime*currSummitInProc^.GetStartProc);
            y2:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY )/
                        maxTime*FindSummit(
                        currSummitInProc^.ToSmmtToInt(i) )^.GetStartProc);
            Line( x, y1, x, y2);
         end;
   end;
   { рисую занятие вершинами процессора }
   SetFillStyle(1,cColorSummit);
   SetColor(cColorFrameSummit);
   SetLineStyle(0,0,1);
   SetTextStyle(0,0,1);
   SetTextJustify(CenterText,CenterText);
   for j:= 1 to Length( SummitInProc ) do
   begin
      currSummitInProc:= FindSummit( Ord(SummitInProc[j]) );
      y1:= Trunc( Alloc_minY + ( Alloc_maxY-Alloc_minY )/
                  maxTime * currSummitInProc^.GetStartProc );
      y2:= Trunc( Alloc_minY + ( Alloc_maxY-Alloc_minY )/
                  maxTime *( currSummitInProc^.GetStartProc +
                  currSummitInProc^.GetValue));
      Bar( x - dX, y1, x + dX, y2);
      Rectangle( x - dX, y1, x + dX, y2);
      y:= y1+(y2-y1) div 2;
      OutTextXY( x, y, IntToStr(currSummitInProc^.GetNumber) );
   end;
End;

Function OProc.MouseClickInRegionSummit: Boolean;
         { если MouseInRegionSummit будет равен True тогда
           PointerInToAllotSummit указывает на эту вершину }
Var X, Y1, Y2: Integer;
    i: Byte;
    currSummit: PSummit;
Begin
   MouseClickInRegionSummit:= False;
   if SummitInProc = '' then Exit;
   x:= Trunc(Alloc_minX + NoProc * (Alloc_maxX-Alloc_minX)/(Processor+2));
   if ( MouseX < X-dX ) or ( MouseX > X+dX ) then Exit;
   for i:= 1 to Length( SummitInProc ) do
   begin
      CurrSummit:= FindSummit( Ord(SummitInProc[i]) );
      Y1:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY ) / maxTime *
           currSummit^.GetStartProc );
      Y2:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY ) / maxTime *
           ( currSummit^.GetStartProc + currSummit^.GetValue) );
      if ( Y1 < MouseY ) and ( Y2 > MouseY ) then
      begin
         MouseClickInRegionSummit:= True;
         PointerInToAllotSummit:= currSummit;
         Exit;
      end;
   end;
End;

Function OProc.MouseClickInRegionBus( var Index: Byte ): Boolean;
         { если MouseInRegionBus будет равен True тогда
           PointerInToAllotSummit указывает на эту вершину }
Var Xbus, Xproc, Y1, Y2: Integer;
    i, j: Byte;
    currSummit: PSummit;
    ProcDownSummit: Byte;
Begin
   MouseClickInRegionBus:= False;
   if SummitInproc = '' then Exit;
   Xproc:= Trunc(Alloc_minX+NoProc * (Alloc_maxX-Alloc_minX)/(Processor+2));
   Xbus:= Trunc( Alloc_minX + (Processor+1)*
               ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
   if (( MouseX < Xproc-3*dX ) or ( MouseX > Xproc+3*dX )) and
      (( MouseX < Xbus-dX    ) or ( MouseX > Xbus+dX    )) then Exit;
   for i:= 1 to Length( SummitInProc ) do
   begin
      CurrSummit:= FindSummit( Ord(SummitInProc[i]) );
      Y1:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY ) / maxTime *
           currSummit^.GetStartBus );
      for j:= 1 to currSummit^.NumberArc do
      begin
         ProcDownSummit:= FindSummit( currSummit^.ToSmmtToInt(j) )^.
                          GetNoProc;
         if ProcDownSummit = NoProc then Continue;
         Y2:= Y1;
         Y2:= Y2+Trunc( ( Alloc_maxY-Alloc_minY ) / maxTime *
           currSummit^.WeightToInt(j) );
         if ProcDownSummit < NoProc then
         begin
            if (( Xproc-3*dX < MouseX ) and ( Xproc-dX > MouseX ) or
                ( Xbus-dX    < MouseX ) and ( Xbus +dX > MouseX )) and
               ( Y1 < MouseY ) and ( Y2 > MouseY ) then
            begin
               MouseClickInRegionBus:= True;
               PointerInToAllotSummit:= currSummit;
               Index:= j;
               Exit;
            end;
         end
         else begin
            if (( Xproc+dX < MouseX ) and ( Xproc+3*dX > MouseX ) or
                ( Xbus-dX  < MouseX ) and ( Xbus+dX    > MouseX )) and
               ( Y1 < MouseY ) and ( Y2 > MouseY ) then
            begin
               MouseClickInRegionBus:= True;
               PointerInToAllotSummit:= currSummit;
               Index:= j;
               Exit;
            end;
         end;
         Y1:= Y2;
      end;
   end;
End;

Function OProc.MouseClickInRegionBtnProc: Boolean;
Var X: Integer;
Begin
   MouseClickInRegionBtnProc:= False;
   X:= Trunc(Alloc_minX +  NoProc * (Alloc_maxX-Alloc_minX)/(Processor+2));
   if AllOkToPressButton( X-dX, Alloc_minY-25, X+dX, Alloc_minY-10,
      'Пр'+IntToStr( NoProc ), cColorFrameButtonProc, cColorButtonProc )
      then MouseClickInRegionBtnProc:= True;
End;

Destructor OProc.Done;
Begin
End;

{*********************}

Constructor O_EVM.Init;
Var RecAllProc: PRecAllProc;
    i: Integer;
Begin
   SummitInBus:= '';
   AllProc:= New( PRecAllProc );
   AllProc^.Proc:= New( PProc, Init(1) );
   AllProc^.Next:= Nil;
   RecAllProc:= AllProc;
   for i:=2 to Processor do
   begin
      RecAllProc^.Next:= New( PRecAllProc );
      RecAllProc:= RecAllProc^.Next;
      RecAllProc^.Proc:= New( PProc, Init(i) );
      RecAllProc^.Next:= Nil;
   end;
End;

Function O_EVM.Find( findProc: Byte ): PProc;
Var RecAllProc: PRecAllProc;
Begin
   ShowLogo;{}
   RecAllProc:= AllProc;
   while True do
   begin
      if RecAllProc^.Proc^.NoProc = findProc then
      begin
         Find:= RecAllProc^.Proc;
         Break;
      end;
      RecAllProc:= RecAllProc^.Next;
   end;
End;

Procedure O_EVM.FindMaxTime;
Var curr: Integer;
    RecAllProc: PRecAllProc;
Begin
   maxTime:= 0;
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      curr:= RecAllProc^.Proc^.FindMaxTime;
      if maxTime < curr then maxTime:= curr;
      RecAllProc:= RecAllProc^.Next;
   end;
End;

Function O_EVM.AllSummitInProc: Boolean;
Var RecordSummit: PRecordSummit;
Begin
   AllSummitInProc:= True;
   RecordSummit:= StartPRecordSummit;
   while RecordSummit <> Nil do
   begin
      if RecordSummit^.Summit^.GetInProc = False then
      begin
         AllSummitInProc:= False;
         Break;
      end;
      RecordSummit:= RecordSummit^.NextRecord;
   end;
End;

Procedure O_EVM.SetAllSummit;
Var RecAllProc: PRecAllProc;
    i: Byte;
    CurrSummit: PSummit;
    CurrProc: PProc;
Begin
   AllSummitFree;
   SummitInBus:= '';
   repeat
      RecAllProc:= AllProc;
      while RecAllProc <> Nil do
      begin
         CurrProc:= RecAllProc^.Proc;
         for i:= 1 to Length( CurrProc^.SummitInProc ) do
         begin
            CurrSummit:= FindSummit( Ord( CurrProc^.SummitInProc[i] ) );
            CurrProc^.SetSummitInProc( CurrSummit );
            if CurrSummit^.GetInProc = False then Break;
         end;
         RecAllProc:= RecAllProc^.Next;
      end;
      SetOneBestSummitInBus;
   until AllSummitInProc;
   { нахожу max время работы всей системы }
   FindMaxTime;
End;

Procedure O_EVM.ShowRack;
Var RecordSummit: PRecordSummit;
    ofSummit, toSummit: PSummit;
    y1,y2: Real;
    i, j: Byte;
Begin
   SetLineStyle(3,0,1);
   SetTextStyle(5,0,4);
   SetUserCharSize(1,4,1,3);
   SetTextJustify(CenterText,CenterText);
   if maxTime = 0 then maxTime:= 1;
   RecordSummit:= StartPRecordSummit;
   while RecordSummit <> Nil do
   begin
      y1:= Alloc_minY + ( Alloc_maxY-Alloc_minY )/maxTime
           * RecordSummit^.Summit^.GetStartProc;
      y2:= Alloc_minY + ( Alloc_maxY-Alloc_minY )/maxTime
           * ( RecordSummit^.Summit^.GetStartProc +
               RecordSummit^.Summit^.GetValue );
      SetColor(cColorTouchLine);
      Line( Alloc_minX+20, Trunc( y1 ), Alloc_maxX-20, Trunc( y1 ) );
      Line( Alloc_minX+20, Trunc( y2 ), Alloc_maxX-20, Trunc( y2 ) );
      SetColor(cColorTextRack);
      OutTextXY( Alloc_minX, Trunc( y1 ),
                 IntToStr( RecordSummit^.Summit^.GetStartProc ) );
      OutTextXY( Alloc_maxX, Trunc( y1 ),
                 IntToStr( RecordSummit^.Summit^.GetStartProc ) );
      OutTextXY( Alloc_minX, Trunc( y2 ),
                 IntToStr( RecordSummit^.Summit^.GetStartProc+
                           RecordSummit^.Summit^.GetValue ) );
      OutTextXY( Alloc_maxX, Trunc( y2 ),
                 IntToStr( RecordSummit^.Summit^.GetStartProc+
                           RecordSummit^.Summit^.GetValue ) );
      RecordSummit:= RecordSummit^.NextRecord;
   end;
   for j:= 1 to Length( SummitInBus ) do
   begin
      OfSummit:= FindSummit( Ord(SummitInBus[j]) );
      y1:= OfSummit^.GetStartBus;
      y2:= Alloc_minY + ( Alloc_maxY - Alloc_minY ) / maxTime * y1;
      SetColor(cColorTouchLine);
      Line( Alloc_minX+20, Trunc( y2 ), Alloc_maxX-20, Trunc( y2 ) );
      SetColor(cColorTextRack);
      OutTextXY( Alloc_minX, Trunc( y2 ), IntToStr( Trunc( y1 ) ) );
      OutTextXY( Alloc_maxX, Trunc( y2 ), IntToStr( Trunc( y1 ) ) );
      for i:= 1 to OfSummit^.NumberArc do
      begin
         toSummit:= FindSummit( OfSummit^.ToSmmtToInt(i) );
         if toSummit^.GetNoProc = OfSummit^.GetNoProc then Continue;
         y1:= y1 + OfSummit^.WeightToInt(i);
         y2:= Alloc_minY + ( Alloc_maxY - Alloc_minY ) / maxTime * y1;
         SetColor(cColorTouchLine);
         Line( Alloc_minX+20, Trunc( y2 ), Alloc_maxX-20, Trunc( y2 ) );
         SetColor(cColorTextRack);
         OutTextXY( Alloc_minX, Trunc( y2 ), IntToStr( Trunc( y1 ) ) );
         OutTextXY( Alloc_maxX, Trunc( y2 ), IntToStr( Trunc( y1 ) ) );
      end;
   end;
End;

Procedure O_EVM.ShowAllocationInAllProc;
Var RecAllPRoc: PRecAllPRoc;
Begin
   RecAllPRoc:= AllProc;
   while RecAllPRoc <> Nil do
   begin
      RecAllPRoc^.Proc^.ShowAllocationInProc;
      RecAllPRoc:= RecAllPRoc^.Next;
   end;{}
End;

Function O_EVM.MouseClickInRegionSummit: Boolean;
Var RecAllProc: PRecAllProc;
Begin
   MouseClickInRegionSummit:= False;
   if not MousePress then Exit;
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      if RecAllProc^.Proc^.MouseClickInRegionSummit then
      begin
         MouseClickInRegionSummit:= True;
         Exit;
      end;
      RecAllProc:= RecAllProc^.Next;
   end;
End;

Function O_EVM.MouseClickInRegionBus( var Index: Byte ): Boolean;
Var RecAlLProc: PRecAlLProc;
Begin
   MouseClickInRegionBus:= False;
   if not MousePress then Exit;
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      if RecAllProc^.Proc^.MouseClickInRegionBus(Index) then
      begin
         MouseClickInRegionBus:= True;
         Exit;
      end;
      RecAllProc:= RecAllProc^.Next;
   end;
End;

Procedure O_EVM.SetAllFlagDown( SetSummit: PSummit );
Var SummitDown: PSummit;
    ProcSummitDown: PProc;
    i, j, position: Byte;
Begin
   for i:= 1 to Length( SetSummit^.Lines.ToSummit ) do
   begin
      SummitDown:= FindSummit( Ord( SetSummit^.Lines.ToSummit[i] ) );
      SummitDown^.SetFlag;
      SetAllFlagDown( SummitDown );
      ProcSummitDown:= Find(SummitDown^.GetNoProc);
      position:= Pos( Chr( SummitDown^.GetNumber ),
                      ProcSummitDown^.SummitInProc );
      for j:= position+1 to Length( ProcSummitDown^.SummitInProc ) do
      begin
         FindSummit( Ord( ProcSummitDown^.SummitInProc[j] ) )^.SetFlag;
         SetAllFlagDown( FindSummit(Ord( ProcSummitDown^.SummitInProc[j] )));
      end
   end;
End;

Procedure O_EVM.SetAllFlagUp( SetSummit: PSummit; var StrBtn: String );
          Procedure SetFlagInAllSummitUp( xSummit: PSummit );
          Var currProc: PProc;
              currSummit, SummitWithArc: PSummit;
              RecordSummit: PRecordSummit;
              i: Byte;
          Begin
             StrBtn[ xSummit^.GetNoProc ]:= '8';
             currProc:= Find( xSummit^.GetNoProc );
             for i:= 1 to Length( currProc^.SummitInProc ) do
             begin
                currSummit:= FindSummit( Ord( currProc^.SummitInProc[i] ) );
                RecordSummit:= StartPRecordSummit;
                while RecordSummit <> Nil do
                begin
                   SummitWithArc:= RecordSummit^.Summit;
                   if SummitWithArc^.PresenceContactWithSummit(
                                     currSummit^.GetNumber )
                   then SetFlagInAllSummitUp(SummitWithArc);
                   RecordSummit:= RecordSummit^.NextRecord;
                end;
                if currSummit = xSummit then Break;
                currSummit^.SetFlag;
             end;
          End;
Var SummitUp, First: PSummit;
    RecordSummit: PRecordSummit;
Begin
   StrBtn:= '';
   repeat StrBtn:= StrBtn+' '; until Length( StrBtn ) = Processor;
   First:= SetSummit;
   RecordSummit:= StartPRecordSummit;
   while RecordSummit <> Nil do
   begin
      SummitUp:= RecordSummit^.Summit;
      if SummitUp^.PresenceContactWithSummit( SetSummit^.GetNumber )
      then SetFlagInAllSummitUp( SummitUp );
      RecordSummit:= RecordSummit^.NextRecord;
   end;
End;

Procedure O_EVM.ChangeProc;
Var StrBtn: String; {if StrBtn[i] = ' ' then под кнопкой можно  разместить
                     if StrBtn[i]<> ' ' then под кнопкой нельзя разместить
                     Разместить под кнопкой - разместить выше всех}
          {-----}
          Procedure Change( ChangeSummit: PSummit; Position: Byte;
                            SetProc: PProc );
          Var DelProc: PProc;{проц с которого убирается вершина}
              StrIns, StrDel: String;
              DelAndIns: Char;
              Index: Byte;
          Begin
             DelAndIns:= Chr(ChangeSummit^.GetNumber);
             DelProc:= Find(ChangeSummit^.GetNoProc);
             if DelProc <> SetProc then
             begin
                StrDel:= DelProc^.SummitInProc;
                StrIns:= SetProc^.SummitInProc;
                Delete( StrDel, Pos( DelAndIns, StrDel ), 1 );
                Insert( DelAndIns, StrIns, Position );
                DelProc^.SummitInProc:= StrDel;
                SetProc^.SummitInProc:= StrIns;
                ChangeSummit^.SetNoProc( SetProc^.NoProc );
             end
             else begin
                StrDel:= DelProc^.SummitInProc;
                Index:= Pos( DelAndIns, StrDel );
                if ( Index = Position ) or ( Index+1 = Position ) then Exit;
                if Position > Index then Dec( Position );
                Delete( StrDel, Pos( DelAndIns, StrDel ), 1 );
                Insert( DelAndIns, StrDel, Position );
                DelProc^.SummitInProc:= StrDel;
             end;
          End;
         {-----}
          Procedure ShowFrame( currSummit: PSummit );
          Var X, Y1, Y2: Integer;
          Begin
            x:= Trunc(Alloc_minX + currSummit^.GetNoProc *
                (Alloc_maxX-Alloc_minX)/(Processor+2));
            y1:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY )/
                        maxTime * currSummit^.GetStartProc);
            y2:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY )/
                        maxTime * ( currSummit^.GetStartProc +
                                    currSummit^.Getvalue ) );
            SetColor( Blue );
            SetLineStyle(0,0,3);
            MouseHide;
            Rectangle( x - dX, y1, x + dX, y2);
            MouseShow;
          End;
         {-----}
          Function PressInBtnProc( var InProc: PProc ): Boolean;
          Var RecAllProc: PRecAllProc;
              X: Integer;
              C1, C2: Byte;
          Begin
             PressInBtnProc:= False;
             RecAllProc:= AllProc;
             while RecAllProc <> Nil do
             begin
                X:= Trunc(Alloc_minX + RecAllProc^.Proc^.NoProc *
                    (Alloc_maxX-Alloc_minX)/(Processor+2));
                if StrBtn[RecAllProc^.Proc^.NoProc] = ' '
                   then begin C1:= Blue;  C2:= cColorButtonProc; end
                   else begin C1:= cColorFrameButtonProc; C2:= cColorButtonProc;  end;
                if AllOkToPressButton( X-dX,Alloc_minY-25,X+dX,Alloc_minY-10,
                   'Пр'+IntToStr( RecAllProc^.Proc^.NoProc ), C1, C2) then
                begin
                   PressInBtnProc:= True;
                   InProc:= RecAllProc^.Proc;
                   Exit;
                end;
                RecAllProc:= RecAllProc^.Next;
             end;
          End;
         {-----}
Var X, Y1, Y2: Integer;
    ChangeSummit, UpSummit: PSummit;
    SetProc: PProc;
    Position: Byte;
    i: Byte;
    RecordSummit: PRecordSummit;
    NilKey: Char;
    Flag: Boolean;
    SetKlaster: String;
          {-----}
          Procedure SortSummit;
          Var ProcPtr: PProc;
              i, count: Byte;
              str: String;
          Begin
             ProcPtr:= Find( FindSummit(Ord(SetKlaster[1]))^.GetNoProc);
             count:= 0;
             str:= ProcPtr^.SummitInProc;
             for i:=1 to Length(str) do
                if MyPos(SetKlaster, str[i]) <> 0 then
                begin
                  Inc(count);
                  Delete( SetKlaster, MyPos(SetKlaster, str[i]), 1 );
                  Insert(str[i], SetKlaster, count );
                end;
          End;
          {-----}
Begin
   SaveConfigurationEVM( BestConfigurationEVM );{}
   Flag:= False;
   ChangeSummit:= PointerInToAllotSummit;
   X:= Trunc( Alloc_minX + ChangeSummit^.GetNoProc *
            ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
   Y1:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY ) / maxTime *
               ChangeSummit^.GetStartProc );
   Y2:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY ) / maxTime *
             ( ChangeSummit^.GetStartProc +
               ChangeSummit^.GetValue) );
   SetFillStyle( 1, LightRed );
   SetColor( 0 );
   SetLineStyle( 0, 0, 1 );
   MouseHide;
   Bar( X - dX, Y1, X + dX, Y2 );
   Rectangle( X - dX, Y1, X + dX, Y2 );
   SetTextStyle( 0, 0, 1 );
   SetTextJustify( CenterText, CenterText );
   OutTextXY( X, Y1+(Y2-Y1) div 2,
              IntToStr(PointerInToAllotSummit^.GetNumber));
   MouseShow;
   if (Button2 <> 0) then
   begin { выделение группы вершин (кластера) }
      CaptionMenu( 'Выделите кластер из группы вершин и погрузите его' );
      while MousePress do;
      SetKlaster:= Chr(ChangeSummit^.GetNumber );
      { выделил кнопку шины }
      X:= Trunc( Alloc_minX + (Processor+1)*
          ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
      Button( X-dX, Alloc_minY-25, X+dX, Alloc_minY-10,
             'BUS', Blue, 15, False);
      { выделил кнопки всех проц-ов }
      for i:= 1 to Processor do
      begin
         X:= Trunc(Alloc_minX + i * (Alloc_maxX-Alloc_minX)/(Processor+2));
         Button( X-dX, Alloc_minY-25, X+dX, Alloc_minY-10,
                 'Пр'+IntToStr( i ), Blue, 15, False );
      end;
      { выделил рамкой всё содержимое проц-ра }
      X:= Trunc( Alloc_minX + ChangeSummit^.GetNoProc *
               ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
      Y1:= Trunc( Alloc_minY );
      Y2:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY ) );
      SetColor( 9{Green{} );
      SetLineStyle(0,0,3);
      MouseHide;
      Rectangle( x - dX-2, y1, x + dX+2, y2);
      MouseShow;
      {}
      SetColor( 0 );
      SetLineStyle( 0, 0, 1 );
      repeat
         GetMouseStatus;
         if MouseClickInRegionSummit then
            if ( PointerInToAllotSummit^.GetNoProc =
                 FindSummit(Ord(SetKlaster[1]))^.NoProc ) and
               ( MyPos( SetKlaster,
                        Chr(PointerInToAllotSummit^.GetNumber)) = 0 ) then
            begin
               ChangeSummit:= PointerInToAllotSummit;
               SetKlaster:= SetKlaster + Chr(ChangeSummit^.GetNumber );
               X:= Trunc( Alloc_minX + ChangeSummit^.GetNoProc *
                        ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
               Y1:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY ) / maxTime *
                           ChangeSummit^.GetStartProc );
               Y2:= Trunc( Alloc_minY+( Alloc_maxY-Alloc_minY ) / maxTime *
                         ( ChangeSummit^.GetStartProc +
                           ChangeSummit^.GetValue) );
               MouseHide;
               Bar( X - dX, Y1, X + dX, Y2 );
               Rectangle( X - dX, Y1, X + dX, Y2 );
               OutTextXY( X, Y1+(Y2-Y1) div 2,
                          IntToStr(PointerInToAllotSummit^.GetNumber));
               MouseShow;
               while MousePress do;
            end else
            begin
               Beep;
               while MousePress do;
            end;
         if PressInBtnProc( SetProc ) then
         begin
            CaptionMenu( 'Погружение кластера на процессор...' );
            if FindSummit(Ord(SetKlaster[1]))^.GetNoProc <>
               SetProc^.NoProc then
            begin
               {Beep;{}
               SortSummit;
               BestSetKlasterInProc( SetKlaster, SetProc^.NoProc );{}
            end;
            Break;
         end;
         X:= Trunc( Alloc_minX + (Processor+1)*
             ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
         if AllOkToPressButton( X-dX, Alloc_minY-25, X+dX, Alloc_minY-10,
             'BUS', Blue, 15 ) then
         begin
            CaptionMenu( 'Лучшее погружение кластера...' );
            {Beep;{}
            SortSummit;
            BestSetKlasterInOtherProc( SetKlaster );{}
            Break;
         end;
         if KeyPressed then
         begin
            Beep;
            if KeyPressed and (ReadKey = #27) then Break;
         end;
         SetFillStyle( 1, LightRed );
      until False;
      if AutoDel then
         while MyEVM.DelProcessor do;
      ShowAllocation;
      while KeyPressed do NilKey:= ReadKey;
      while MousePress do;{}
      Exit;{}
   end { end: выделение группы вершин - кластера }
   else begin{ погружение отдельно взятой вершины }
      CaptionMenu( 'Погрузите вершину' );
      while MousePress do;
      FreeAllFlag;
      SetAllFlagUp( ChangeSummit, StrBtn );
      SetAllFlagDown( ChangeSummit );
      RecordSummit:= StartPRecordSummit;
      while RecordSummit <> Nil do
      begin
         if not RecordSummit^.Summit^.GetFlag then
            ShowFrame( RecordSummit^.Summit );
         RecordSummit:= RecordSummit^.NextRecord;
      end;
      for i:= 1 to Processor do
         if StrBtn[i] = ' ' then
         begin
            X:= Trunc(Alloc_minX + i * (Alloc_maxX-Alloc_minX)/(Processor+2));
            Button( X-dX, Alloc_minY-25, X+dX, Alloc_minY-10,
                    'Пр'+IntToStr( i ), Blue, 15, False );
         end;
   end; { end: погружение отдельно взятой вершины }
   repeat
      GetMouseStatus;
      if (Button2 = 2) and MouseClickInRegionSummit and
      (ChangeSummit = PointerInToAllotSummit) then
      begin
         CaptionMenu( 'Лучшее погружение вершины...' );
         Flag:= True;
         Break;
      end;
      if ((Button1 = 1) and MouseClickInRegionSummit) or
         ((Button2 = 2) and MouseClickInRegionSummit and
          (ChangeSummit <> PointerInToAllotSummit)) then
      begin
         CaptionMenu( 'Погружение вершины...' );
         UpSummit:= PointerInToAllotSummit;
         SetProc:= Find( UpSummit^.GetNoProc );
         Position:= Pos( Chr(UpSummit^.GetNumber), SetProc^.SummitInProc )+1;
         Break;
      end;
      if PressInBtnProc( SetProc ) then
      begin
         CaptionMenu( 'Погружение вершины...' );
         Position:= 1;
         Break;
      end;
      if KeyPressed then
      begin
         while KeyPressed do NilKey:= ReadKey;
         Beep;
         if NilKey = #27 then Break else NilKey:= #0;
      end;
   until False;
   if Flag then
      BestSetSummitInOtherProc( ChangeSummit, 1 ){}
   else if NilKey <> #27 then begin
      if Position = 1 then
      begin
         if StrBtn[SetProc^.NoProc] = ' ' then
            Change( ChangeSummit, Position, SetProc )
         else Beep;
      end
      else begin
         if UpSummit^.GetFlag = False then
            Change( ChangeSummit, Position, SetProc )
         else Beep;
      end;
      SummitInBus:= '';
      SetAllSummit;
      SaveConfigurationEVM( BestConfigurationEVM );{}
   end;
   while MousePress do;
   if AutoDel then
      while MyEVM.DelProcessor do;
   ShowAllocation;
   while KeyPressed do NilKey:= ReadKey;
End;

Procedure O_EVM.ChangeInBus( Index: Byte );
Var SetSummit: PSummit;
    SetProc, ProcSummitDown: PProc;
    i, newIndex: Byte;
    Xbus, xF1, xF2, Xproc: Integer;
    yF, Y1, Y2: Real;
    copyToSummit, copyWeight: Byte;
    Ch: Char;
Begin
   CaptionMenu( 'Измените порядок пересылoк' );
   SetSummit:= PointerInToAllotSummit;
   SetProc:= Find( SetSummit^.GetNoProc );
   MouseHide;
   SetColor( Blue );
   SetLineStyle( 0, 0, 3 );
   SetTextStyle( 5, 0, 4 );
   SetUserCharSize( 1, 3, 1, 3 );
   SetTextJustify( CenterText, CenterText );
   Xproc:= Trunc(Alloc_minX+SetProc^.NoProc * (Alloc_maxX-Alloc_minX) /
       (Processor+2));
   Xbus:= Trunc( Alloc_minX + (Processor+1)*
               ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
   Y1:= Alloc_minY+( Alloc_maxY-Alloc_minY ) / maxTime *
        SetSummit^.GetStartBus;
   yF:= Y1;
   SetFillStyle( 1, 6 );
   if FindSummit(SetSummit^.ToSmmtToInt(index))^.GetNoProc <
      SetSummit^.GetNoProc
      then begin
         xF1:= Xproc - 3*dX;
         xF2:= Xproc - dX;
      end else begin
         xF1:= Xproc + dX;
         xF2:= Xproc + 3*dX;
      end;
   Bar      ( xF1, Trunc(Y1-10), xF2, Trunc(Y1) );
   Rectangle( xF1, Trunc(Y1-10), xF2, Trunc(Y1) );
   Bar      ( Xbus-dX, Trunc(Y1-10), Xbus+dX, Trunc(Y1) );
   Rectangle( Xbus-dX, Trunc(Y1-10), Xbus+dX, Trunc(Y1) );
   SetFillStyle(1, LightRed );
   for i:= 1 to SetSummit^.NumberArc do
   begin
      ProcSummitDown:= Find(FindSummit(SetSummit^.ToSmmtToInt(i))^.GetNoProc);
      if ProcSummitDown = SetProc then Continue;
      Y2:= Y1;
      Y2:= Y2 + ( Alloc_maxY-Alloc_minY ) / maxTime *
           SetSummit^.WeightToInt(i);
      if ProcSummitDown^.NoProc < SetProc^.NoProc then
      begin
         if i = Index then
         begin
            Bar( Xproc-3*dX, Trunc(Y1), Xproc-dX, Trunc(Y2) );
            Bar( Xbus-dX, Trunc(Y1), Xbus+dX, Trunc(Y2) );
            SetColor(0);
            OutTextXY( Xproc-2*dX, Trunc(Y1+(Y2-Y1)/2),
                       IntToStr( SetSummit^.GetNumber ) + '-' +
                       IntToStr( FindSummit(SetSummit^.
                                 ToSmmtToInt(i))^.GetNumber));
            OutTextXY( Xbus, Trunc(Y1+(Y2-Y1)/2),
                       IntToStr( SetSummit^.GetNumber ) + '-' +
                       IntToStr( FindSummit(SetSummit^.
                                 ToSmmtToInt(i))^.GetNumber));
            SetColor(Blue);
         end;
         Rectangle( Xproc - 3*dX, Trunc(Y1), Xproc - dX, Trunc(Y2) );
         Rectangle( Xbus-dX, Trunc(Y1), Xbus+dX, Trunc(Y2) );
      end
      else begin
         if i = Index then
         begin
            Bar( Xproc + dX, Trunc(Y1), Xproc + 3*dX, Trunc(Y2) );
            Bar( Xbus-dX, Trunc(Y1), Xbus+dX, Trunc(Y2) );
            SetColor(0);
            OutTextXY( Xproc+2*dX, Trunc(Y1+(Y2-Y1)/2),
                       IntToStr( SetSummit^.GetNumber ) + '-' +
                       IntToStr( FindSummit(SetSummit^.
                                 ToSmmtToInt(i))^.GetNumber));
            OutTextXY( Xbus, Trunc(Y1+(Y2-Y1)/2),
                       IntToStr( SetSummit^.GetNumber ) + '-' +
                       IntToStr( FindSummit(SetSummit^.
                                 ToSmmtToInt(i))^.GetNumber));
            SetColor(Blue);
         end;
         Rectangle( Xproc + dX, Trunc(Y1), Xproc + 3*dX, Trunc(Y2) );
         Rectangle( Xbus-dX, Trunc(Y1), Xbus+dX, Trunc(Y2) );
      end;
      Y1:= Y2;
   end;
   MouseShow;
   while MousePress do;
   repeat
      GetMouseStatus;
      if MousePress and(( xF1     < MouseX ) and ( xF2     > MouseX )
                    and ( yF-10   < MouseY ) and ( yF      > MouseY ) or
                        ( Xbus-dX < MouseX ) and ( Xbus+dX > MouseX )
                    and ( yF-10   < MouseY ) and ( yF      > MouseY )) then
      begin
         CaptionMenu( 'Изменение порядка пересылок...' );
         newIndex:= 1;
         Break;
      end;
      if MyEVM.MouseClickInRegionBus( newIndex ) then
         if PointerInToAllotSummit <> SetSummit
         then begin Beep; while MousePress do; end
         else begin
            CaptionMenu( 'Изменение порядка пересылок...' );
            Inc(newIndex); Break;
         end;
      if KeyPressed then
      begin
         Beep;
         newIndex:= Index;
         if KeyPressed and (ReadKey = #27) then Break;
      end;
   until False;
   while MousePress do;
   if Index <> newIndex then
   begin
      copyToSummit:= SetSummit^.ToSmmtToInt(Index);
      copyWeight  := SetSummit^.WeightToInt(Index);
      if newIndex > Index then Dec(newIndex);
      Delete( SetSummit^.Lines.ToSummit, Index, 1 );
      Delete( SetSummit^.Lines.Weight  , Index, 1 );
      Insert( Chr(copyToSummit), SetSummit^.Lines.ToSummit, newIndex );
      Insert( Chr(copyWeight  ), SetSummit^.Lines.Weight  , newIndex );
   end;
   SummitInBus:= '';
   SetAllSummit;
   ShowAllocation;
   while KeyPressed do Ch:= ReadKey;
End;

Function O_EVM.AddProcessor: Boolean;
Var RecAllProc: PRecAllProc;
    Ch: Char;
Begin
   AddProcessor:= False;
   if Processor >= EndNumberSummit then Exit;
   Inc(Processor);
   RecAllProc:= AllProc;
   while RecAllProc^.Next <> Nil do RecAllProc:= RecAllProc^.Next;
   RecAllProc^.Next:= New( PRecAllProc );
   RecAllProc:= RecAllProc^.Next;
   RecAllProc^.Proc:= New( PProc, Init(Processor) );
   RecAllProc^.Next:= Nil;
   AddProcessor:= True;
   dX:= Trunc((Alloc_maxX-Alloc_minX)/(Processor+2)/8);
   while KeyPressed do Ch:= ReadKey;
End;

Function O_EVM.DelProcessor: Boolean;
Var RecAllProc, DelRAP: PRecAllProc;
    RecordSummit: PRecordSummit;
    Del: Boolean;
    NumberDelProc: Byte;
    Ch: Char;
Begin
   Del:= False;
   NumberDelProc:= 0;
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      if RecAllProc^.Proc^.SummitInProc = '' then
      begin
         Del:= True;
         NumberDelProc:= RecAllProc^.Proc^.NoProc;
         Dec(Processor);
         Break;
      end;
     RecAllProc:= RecAllProc^.Next;
   end;
   DelProcessor:= Del;
   if not Del then Exit else
      if NumberDelProc = 1 then
      begin
         DelRAP:= AllProc;
         AllProc:= AllProc^.Next;
         Dispose( DelRAP^.Proc, Done );
         Dispose( DelRAP );
      end else
      begin
         RecAllProc:= AllProc;
         while RecAllProc <> Nil do
         begin
             if RecAllProc^.Proc^.NoProc = NumberDelProc-1 then
             begin
                DelRAP:= RecAllProc^.Next;
                RecAllProc^.Next:= DelRAP^.Next;
                Dispose( DelRAP^.Proc, Done );
                Dispose( DelRAP );
                Break;
             end;
             RecAllProc:= RecAllProc^.Next;
         end;
      end;
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      if RecAllProc^.Proc^.NoProc > NumberDelProc then
         Dec( RecAllProc^.Proc^.NoProc );
      RecAllProc:= RecAllProc^.Next;
   end;
   RecordSummit:= StartPRecordSummit;
   while RecordSummit <> Nil do
   begin
      if RecordSummit^.Summit^.GetNoProc >= NumberDelProc then
         RecordSummit^.Summit^.SetNoProc( RecordSummit^.Summit^.GetNoProc-1 );
      RecordSummit:= RecordSummit^.NextRecord;
   end;
   dX:= Trunc((Alloc_maxX-Alloc_minX)/(Processor+2)/8);
   while KeyPressed do Ch:= ReadKey;
End;

Procedure O_EVM.SetOneBestSummitInBus;
Var RecAllProc: PRecAllProc;
    i: Byte;
    SetSummit, CurrSummit: PSummit;
    CurrProc: PProc;
    best, beginerBus: Integer;
Begin
   best:= 32767;
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      CurrProc:= RecAllProc^.Proc;
      for i:= 1 to Length( CurrProc^.SummitInProc ) do
      begin
         CurrSummit:= FindSummit( Ord( CurrProc^.SummitInProc[i] ) );
         if CurrSummit^.GetInBus or not CurrSummit^.GetInProc
         then Continue
         else begin
            beginerBus:= CurrSummit^.GetStartProc + CurrSummit^.GetValue;
            while not GetStatusBusInIntervalTime( beginerBus,
                                               beginerBus+CurrSummit^.MaxInBus )
               do Inc( beginerBus );
            if beginerBus < best then
            begin
               SetSummit:= CurrSummit;
               best:= beginerBus;
            end;
         end;
      end;
      RecAllProc:= RecAllProc^.Next;
   end;
   while not GetStatusBusInIntervalTime( best, best+SetSummit^.MaxInBus )
      do Inc( best );
   SetSummit^.SetStartBus( best );
   SetSummit^.SetInBus;
   AddToBus( SetSummit );
End;

Destructor O_EVM.Done;
Var RecAllProc: PRecAllProc;
Begin
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      Dispose( RecAllProc^.Proc, Done );
      AllProc:= RecAllProc^.Next;
      Dispose(RecAllProc);
      RecAllProc:= AllProc;
   end;
End;

Function O_EVM.MouseClickInRegionBtnProc(var ClickNoProc: Byte): Boolean;
Var RecAllProc: PRecAllProc;
Begin
   MouseClickInRegionBtnProc:= False;
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      if RecAllProc^.Proc^.MouseClickInRegionBtnProc then
      begin
         MouseClickInRegionBtnProc:= True;
         ClickNoProc:= RecAllProc^.Proc^.NoProc;
         Exit;
      end;
      RecAllProc:= RecAllProc^.Next;
   end;
End;

Procedure O_EVM.BestSet( firstClickNoProc: Byte );
Var i, nextClickNoProc: Byte;
    X, Xbus: Integer;
    Str: String;
    NilKey: Char;
Begin
   CaptionMenu( 'Операции с кластером из всех вершин процессора №'+
                IntToStr(firstClickNoProc) );
   MouseHide;
   Xbus:= Trunc( Alloc_minX + (Processor+1)*
          ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
   Button( Xbus-dX, Alloc_minY-25, Xbus+dX, Alloc_minY-10,
           'BUS', Blue, 15, False);
   for i:= 1 to Processor do
   begin
      X:= Trunc(Alloc_minX + i * (Alloc_maxX-Alloc_minX)/(Processor+2));
      Button( X-dX, Alloc_minY-25, X+dX, Alloc_minY-10,
              'Пр'+IntToStr(i), Blue, 15, False);
   end;
   MouseShow;
   repeat
      GetMouseStatus;
      { обмен процессоров }
      if (Button1 <> 0) and MouseClickInRegionBtnProc( nextClickNoProc ) then
      begin
         CaptionMenu( 'Обмен процессоров...' );
         for i:= 1 to Length( Find(firstClickNoProc)^.SummitInProc ) do
            FindSummit( Ord(Find(firstClickNoProc)^.SummitInProc[i]) )^.SetNoProc( nextClickNoProc );
         for i:= 1 to Length( Find(nextClickNoProc)^.SummitInProc ) do
            FindSummit( Ord(Find(nextClickNoProc)^.SummitInProc[i]) )^.SetNoProc( firstClickNoProc );
         Str:= Find(nextClickNoProc)^.SummitInProc;
         Find(nextClickNoProc)^.SummitInProc:= Find(firstClickNoProc)^.SummitInProc;
         Find(firstClickNoProc)^.SummitInProc:= Str;
         SetAllSummit;
         Break;
      end;
      { кластеризация содeржимого двух процессоров }
      if (Button2 <> 0) and MouseClickInRegionBtnProc( nextClickNoProc ) then
      begin
         CaptionMenu( 'Кластеризация двух процессоров...' );
         BestSetProcInProc( firstClickNoProc, nextClickNoProc );
         Break;
      end;
      { лучшая кластеризация проц-ра firstClickNoProc с одним из др. проц-ов}
      if AllOkToPressButton( Xbus-dX, Alloc_minY-25, Xbus+dX, Alloc_minY-10,
                             'BUS', 0, cColorSending) then
      begin
         CaptionMenu( 'Лучшая кластеризация двух процессоров...' );
         BestSetProcInOtherProc( firstClickNoProc );{}
         Break;
      end;
      if KeyPressed then
      begin
         Beep;
         if KeyPressed and (ReadKey = #27) then Break;
      end;
   until False;
   if AutoDel then
      while MyEVM.DelProcessor do;
   while KeyPressed do NilKey:= ReadKey;
   ShowAllocation;
End;

Function O_EVM.GetStatusBusInTakt( Takt: Real ): Boolean;
         { True - свободен, False - занят }
Var currSummit: PSummit;
    i: Byte;
Begin
   GetStatusBusInTakt:= True;
   for i:= 1 to Length( SummitInBus ) do
   begin
      currSummit:= FindSummit( Ord(SummitInBus[i]) );
      if ( currSummit^.GetStartBus < Takt) and
         ( currSummit^.GetStartBus + currSummit^.MaxInBus > Takt) then
         begin
            GetStatusBusInTakt:= False;
            Break;
         end;
   end;
End;

Function O_EVM.GetStatusBusInIntervalTime( min, max: Integer ): Boolean;
Var i: Integer;
Begin
   GetStatusBusInIntervalTime:= True;
   for i:= min to max-1 do
      if GetStatusBusInTakt(i + 0.5) = False then
      begin
         GetStatusBusInIntervalTime:= False;
         Break;
      end;
End;

Procedure O_EVM.AddToBus( newSummit: PSummit );
Var i: Byte;
Begin
   if newSummit^.UseBus then
      SummitInBus:= SummitInBus + Chr(newSummit^.GetNumber);
End;

Procedure O_EVM.ShowOthersInBus;
Var ofX: Integer;
    y1, y2: Real;
    OfSummit, ToSummit: PSummit;
    i, j: Byte;
Begin
   SetFillStyle( 1, cColorWaiting );
   SetLineStyle( 0, 0, 1 );
   SetColor( cColorFrameWaiting );
   for j:= 1 to Length( SummitInBus ) do
   begin
      OfSummit:= FindSummit( Ord(SummitInBus[j]) );
      y1:= Alloc_minY + ( Alloc_maxY - Alloc_minY ) / maxTime *
           ( OfSummit^.GetStartProc + OfSummit^.GetValue );
      y2:= Alloc_minY + ( Alloc_maxY - Alloc_minY ) / maxTime *
           OfSummit^.GetStartBus;
      ofX:= Trunc( Alloc_minX + OfSummit^.GetNoProc*
                 ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
      for i:= 1 to OfSummit^.NumberArc do
      begin
         ToSummit:= FindSummit( OfSummit^.ToSmmtToInt(i) );
         if OfSummit^.GetNoProc = ToSummit^.GetNoProc then Continue;
         y2:= y2 + ( Alloc_maxY - Alloc_minY ) / maxTime *
              OfSummit^.WeightToInt(i);
         if OfSummit^.GetNoProc < ToSummit^.GetNoProc then
         begin
            Bar      ( ofX + dX, Trunc(y1), ofX + 3*dX, Trunc(y2) );
            Rectangle( ofX + dX, Trunc(y1), ofX + 3*dX, Trunc(y2) );
         end
         else  begin
            Bar      ( ofX - 3*dX, Trunc(y1), ofX - dX, Trunc(y2) );
            Rectangle( ofX - 3*dX, Trunc(y1), ofX - dX, Trunc(y2) );
         end;
      end;
   end;
End;

Procedure O_EVM.ShowAllocationInBus;
Var Xbus, ofX: Integer;
    y, y1, y2: Real;
    OfSummit, ToSummit: PSummit;
    i, j: Byte;
Begin
   Xbus:= Trunc( Alloc_minX + (Processor+1)*
              ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
   SetFillStyle( 1, cColorSending );
   SetTextStyle( 5, 0, 4 );
   SetUserCharSize( 1, 3, 1, 3 );
   SetTextJustify( CenterText, CenterText );
   SetLineStyle( 0, 0, 1 );
   SetColor( cColorFrameSending );
   for j:= 1 to Length( SummitInBus ) do
   begin
      OfSummit:= FindSummit( Ord(SummitInBus[j]) );
      y1:= Alloc_minY + ( Alloc_maxY - Alloc_minY ) / maxTime *
           OfSummit^.GetStartBus;
      y2:= y1;
      ofX:= Trunc( Alloc_minX + OfSummit^.GetNoProc*
                 ( Alloc_maxX-Alloc_minX ) / ( Processor+2 ) );
      for i:= 1 to OfSummit^.NumberArc do
      begin
         ToSummit:= FindSummit( OfSummit^.ToSmmtToInt(i) );
         if OfSummit^.GetNoProc = ToSummit^.GetNoProc then Continue;
         y2:= y2 + ( Alloc_maxY - Alloc_minY ) / maxTime *
              OfSummit^.WeightToInt(i);
         y:= y1+(y2-y1) / 2;
         if OfSummit^.GetNoProc < ToSummit^.GetNoProc then
         begin
            Bar      ( ofX + dX, Trunc(y1), ofX + 3*dX, Trunc(y2) );
            Rectangle( ofX + dX, Trunc(y1), ofX + 3*dX, Trunc(y2) );
            OutTextXY( ofX + 2*dX, Trunc(y),
                       IntToStr( OfSummit^.GetNumber ) + '-' +
                       IntToStr( ToSummit^.GetNumber ) );
         end
         else  begin
            Bar      ( ofX - 3*dX, Trunc(y1), ofX - dX, Trunc(y2) );
            Rectangle( ofX - 3*dX, Trunc(y1), ofX - dX, Trunc(y2) );
            OutTextXY( ofX - 2*dX, Trunc(y),
                       IntToStr( OfSummit^.GetNumber ) + '-' +
                       IntToStr( ToSummit^.GetNumber ) );
         end;
         Bar      ( Xbus + dX, Trunc(y1), Xbus - dX, Trunc(y2) );
         Rectangle( Xbus + dX, Trunc(y1), Xbus - dX, Trunc(y2) );
         OutTextXY( Xbus     , Trunc(y),
                    IntToStr( OfSummit^.GetNumber ) + '-' +
                    IntToStr( ToSummit^.GetNumber ) );
         y1:= y2;
      end;
   end;
   Button( Xbus-dX, Alloc_minY-25, Xbus+dX, Alloc_minY-10,
           'BUS', 0, cColorSending, False );
   Rectangle( Xbus + dX, Alloc_maxY, Xbus - dX, Alloc_minY );
End;

Procedure O_EVM.ShowLineInBus;
Var ofY: Real;
    ofX, toX, toY: Integer;
    OfSummit, ToSummit: PSummit;
    i, j: Byte;
Begin
   SetColor(cColorLineConect);
   for j:= 1 to Length( SummitInBus ) do
   begin
      OfSummit:= FindSummit( Ord(SummitInBus[j]) );
      ofY:= Alloc_minY + ( Alloc_maxY - Alloc_minY ) /
            maxTime * OfSummit^.GetStartBus;
      ofX:= Trunc( Alloc_minX + OfSummit^.GetNoProc*
                 ( Alloc_maxX - Alloc_minX ) / ( Processor+2 ) );
      for i:= 1 to OfSummit^.NumberArc do
      begin
         ToSummit:= FindSummit( OfSummit^.ToSmmtToInt(i) );
         if OfSummit^.GetNoProc = ToSummit^.GetNoProc then Continue;
         toX:= Trunc( Alloc_minX + ToSummit^.GetNoProc *
                    ( Alloc_maxX - Alloc_minX ) / ( Processor+2 ) );
         toY:= Trunc( Alloc_minY + ( Alloc_maxY-Alloc_minY ) / maxTime *
                      ToSummit^.GetStartProc );
         if OfSummit^.GetNoProc < ToSummit^.GetNoProc then
              Line( ofX + 3*dX, Trunc( ofY ) , toX - dX, toY )
         else Line( ofX - 3*dX, Trunc( ofY ) , toX + dX, toY );
         ofY:= ofY + ( Alloc_maxY - Alloc_minY ) / maxTime *
               OfSummit^.WeightToInt(i);
      end;
   end;
End;

Procedure O_EVM.BeginerAllocation;
Var k,i,j: Byte;
    currProc: Byte;
Begin
   k:= 0;
   for i:=1 to MaxLayerU do
      for j:=1 to AmountSummitInLayerU(i) do
      begin
         currProc:= 1 + k mod Processor;
         Find( currProc )^.Add( GetPointSummitInLayerU(i,j) );
         GetPointSummitInLayerU(i,j)^.SetNoProc( currProc );
         Inc(k);
         {ShowLogo;{}
      end;
   SaveConfigurationEVM( BestConfigurationEVM );{}
End;

Function O_EVM.BaseAllocation: Boolean;
Var i, j: Byte;
    ProcPtr, nextProc: PProc;
    currSummitPtr, nextSummitPtr: PSummit;
    buffer: Char;
    NilKey: Char;{}
Begin
   BaseAllocation:= True;
   Done;
   Processor:= EndNumberSummit;
   dX:= Trunc((Alloc_maxX-Alloc_minX)/(Processor+2)/8);
   Init;
   JPF_U;  JPF_D;
   BeginerAllocation;
   SetAllSummit;
   {Beep;{
   i:= 1;
   repeat
      if KeyPressed then
      begin
         NilKey:= ReadKey;
         if NilKey = #27 then
         begin
            BaseAllocation:= False;
            Exit;
         end;
      end;
      ProcPtr:= Find(i);
      currSummitPtr:= FindSummit(Ord(ProcPtr^.SummitInProc[1]));
      if currSummitPtr^.NumberArc < 2 then
      begin
         Inc(i);
         Continue;
      end;
      for j:= 2 to currSummitPtr^.NumberArc do
         if FindSummit(currSummitPtr^.ToSmmtToInt(j-1))^.GetStartProc >
            FindSummit(currSummitPtr^.ToSmmtToInt( j ))^.GetStartProc then
         begin
            buffer:= currSummitPtr^.Lines.Weight[j-1];
            currSummitPtr^.Lines.Weight[j-1]:= currSummitPtr^.Lines.Weight[j];
            currSummitPtr^.Lines.Weight[j]:= buffer;
            buffer:= currSummitPtr^.Lines.ToSummit[j-1];
            currSummitPtr^.Lines.ToSummit[j-1]:= currSummitPtr^.Lines.ToSummit[j];
            currSummitPtr^.Lines.ToSummit[j]:= buffer;
            SetAllSummit;
            Continue;
         end;
      Inc(i);
   until i > Processor;
   {Beep;{}
   {выравниваю "ступенькой"}
   i:= 2;
   if Processor > 1 then
   repeat
      if KeyPressed then
      begin
         NilKey:= ReadKey;
         if NilKey = #27 then
         begin
            BaseAllocation:= False;
            Exit;
         end;
      end;
      ProcPtr:= Find(i-1);
      nextProc:= Find(i);
      currSummitPtr:= FindSummit(Ord(ProcPtr ^.SummitInProc[1]));
      nextSummitPtr:= FindSummit(Ord(nextProc^.SummitInProc[1]));
      if (currSummitPtr^.StartProc > nextSummitPtr^.StartProc) or
         ((currSummitPtr^.StartProc = nextSummitPtr^.StartProc) and
          (currSummitPtr^.Value > nextSummitPtr^.Value)) then
      begin (* обмен процессоров *)
         currSummitPtr^.SetNoProc( nextProc^.NoProc );
         nextSummitPtr^.SetNoProc( ProcPtr^.NoProc );
         buffer:= ProcPtr^.SummitInProc[1];
         ProcPtr^.SummitInProc[1]:= nextProc^.SummitInProc[1];
         nextProc^.SummitInProc[1]:= buffer;
         SetAllSummit;
         if i>2 then Dec(i);{}
         {i:= 2;{}
         Continue;
      end;
      Inc(i);
   until i > Processor;
   {Beep;{}
   SaveConfigurationEVM( BestConfigurationEVM );{}
End;

Function O_EVM.AutoAllocation2: Boolean;
Var i: Byte;
    currProc: PProc;
    currSummit: PSummit;
    theConfigurationEVM: TConfigurationEVM;
    NilKey: Char;{}
Begin
   AutoAllocation2:= True;
   CaptionMenu( 'Автоматическое моделирование...' );
   if not BaseAllocation then
   begin
      AutoAllocation2:= False;
      Exit;
   end;
   SaveConfigurationEVM( BestConfigurationEVM );
   for i:= Processor downto 1 do
   begin
      if KeyPressed then
      begin
         NilKey:= ReadKey;
         if NilKey = #27 then
         begin
            AutoAllocation2:= False;
            Exit;
         end;
      end;
      currProc:= Find(i);
      if Length(currProc^.SummitInProc) <> 1 then Continue
      else begin
         currSummit:= FindSummit( Ord(currProc^.SummitInProc[1]) );
         BestSetSummitInOtherProc( currSummit, 2 );
      end;
      LoadConfigurationEVM( BestConfigurationEVM );
      SetAllSummit;
   end;
   {}
   if AutoDel then
      while MyEVM.DelProcessor do;
   SaveConfigurationEVM( BestConfigurationEVM );
   {}
   currProc:= Find(Processor);
   theConfigurationEVM:= BestConfigurationEVM;
   repeat
      if KeyPressed then
      begin
         NilKey:= ReadKey;
         if NilKey = #27 then
         begin
            AutoAllocation2:= False;
            Exit;
         end;
      end;
      BestSetProcInOtherProc(currProc^.NoProc);
      if ( theConfigurationEVM.MaxInProc  = BestConfigurationEVM.MaxInProc  ) and
         ( theConfigurationEVM.MaxInBus   = BestConfigurationEVM.MaxInBus   ) and
         ( theConfigurationEVM.StrSummit  = BestConfigurationEVM.StrSummit  ) and
         ( theConfigurationEVM.StrForProc = BestConfigurationEVM.StrForProc ) then
      begin
         if currProc^.NoProc > 1 then
            currProc:= Find(currProc^.NoProc-1)
         else Break;
      end
      else begin
         theConfigurationEVM:= BestConfigurationEVM;
         currProc:= Find(Processor);
      end
   until False;
   {}
   if AutoDel then
      while MyEVM.DelProcessor do;
   SaveConfigurationEVM( BestConfigurationEVM );
   {}
   currSummit:= FindSummit(1);
   theConfigurationEVM:= BestConfigurationEVM;
   if Processor > 1 then
   repeat
      if KeyPressed then
      begin
         NilKey:= ReadKey;
         if NilKey = #27 then
         begin
            AutoAllocation2:= False;
            Exit;
         end;
      end;
      BestSetSummitInOtherProc( currSummit, 1 );
      if ( theConfigurationEVM.MaxInProc  = BestConfigurationEVM.MaxInProc  ) and
         ( theConfigurationEVM.MaxInBus   = BestConfigurationEVM.MaxInBus   ) and
         ( theConfigurationEVM.StrSummit  = BestConfigurationEVM.StrSummit  ) and
         ( theConfigurationEVM.StrForProc = BestConfigurationEVM.StrForProc ) then
      begin
         if currSummit^.GetNumber < EndNumberSummit then
            currSummit:= FindSummit( currSummit^.GetNumber+1 )
         else Break;
      end
      else begin
         theConfigurationEVM:= BestConfigurationEVM;
         currSummit:= FindSummit(1);
      end;
      if Processor = 1 then Break;
   until False;
   {}
   if AutoDel then
      while MyEVM.DelProcessor do;
   SaveConfigurationEVM( BestConfigurationEVM );
   {}
   CaptionMenu( 'Режим ручного моделирования' );
   MouseShow;{}
   SaveConfigurationEVM( BestConfigurationEVM );{}
End;

Procedure O_EVM.AutoAllocation;
Var i: Byte;
    currProc: PProc;
    currSummit: PSummit;
Begin
   CaptionMenu( 'Автоматическое моделирование...' );
   BaseAllocation;
   SaveConfigurationEVM( BestConfigurationEVM );
   {
   ShowAllocation;
   repeat
      GetMouseStatus;
   until AllOkToPressButton(OminX,OminY,OmaxX,OmaxY,'Cancel',15,0);
   {}
   for i:= Processor downto 1 do
   begin
      currProc:= Find(i);
      if Length(currProc^.SummitInProc) <> 1 then Continue
      else begin
         currSummit:= FindSummit( Ord(currProc^.SummitInProc[1]) );
         BestSetSummitInOtherProc( currSummit, 2 );
      end;
      LoadConfigurationEVM( BestConfigurationEVM );
      SetAllSummit;
      {
      ShowAllocation;
      repeat
         GetMouseStatus;
      until AllOkToPressButton(OminX,OminY,OmaxX,OmaxY,'Cancel',15,0);
      {}
   end;
   {}
   if AutoDel then
      while MyEVM.DelProcessor do;
   OutTextXY( GetMaxX div 2, 10, 'Режим ручного моделирования' );
   SaveConfigurationEVM( BestConfigurationEVM );{}
End;

Procedure O_EVM.SaveConfigurationEVM( var ConfigurationEVM: TConfigurationEVM );
Var RecAllProc: PRecAllProc;
Begin
   ConfigurationEVM.MaxInProc:= maxTime;
   ConfigurationEVM.MaxInBus:= MaxInBus;
   ConfigurationEVM.StrSummit:= '';
   ConfigurationEVM.StrForProc:= '';
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      ConfigurationEVM.StrSummit:= ConfigurationEVM.StrSummit +
                                   RecAllProc^.Proc^.SummitInProc;
      ConfigurationEVM.StrForProc:= ConfigurationEVM.StrForProc +
                            Chr( Length(RecAllProc^.Proc^.SummitInProc) );
      RecAllProc:= RecAllProc^.Next;
   end;
End;

Procedure O_EVM.SaveBestConfigurationEVM;
Var i: Byte;
    StrForProc: String;
    RecAllProc: PRecAllProc;
    n1, n2: Byte;
Begin
   StrForProc:= '';
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      StrForProc:= StrForProc + Chr( Length(RecAllProc^.Proc^.SummitInProc) );
      RecAllProc:= RecAllProc^.Next;
   end;
   n1:= NumberChar(BestConfigurationEVM.StrForProc, Chr (0) );
   n2:= NumberChar(StrForProc, Chr (0) );
   if (BestConfigurationEVM.MaxInProc >= maxTime) and
      (n1 < n2) then
       begin
          SaveConfigurationEVM( BestConfigurationEVM );
          Exit;
       end;{}
   if  BestConfigurationEVM.MaxInProc > maxTime
       then SaveConfigurationEVM( BestConfigurationEVM );
   if (BestConfigurationEVM.MaxInProc = maxTime) and
      (BestConfigurationEVM.MaxInBus  > MaxInBus)
      then SaveConfigurationEVM( BestConfigurationEVM );
End;

Procedure O_EVM.LoadConfigurationEVM( ConfigurationEVM: TConfigurationEVM );
Var i,j: Byte;
    currProc: PProc;
    RecAllProc: PRecAllProc;
    currSummit: PSummit;
Begin
   j:= 1;
   for i:= 1 to Length(ConfigurationEVM.StrForProc) do
   begin
      currProc:= Find(i);
      currProc^.SummitInProc:= Copy( ConfigurationEVM.StrSummit, j,
                                    Ord(ConfigurationEVM.StrForProc[i]));
      Inc( j, Ord(ConfigurationEVM.StrForProc[i]) );
   end;
   RecAllProc:= AllProc;
   while RecAllProc <> Nil do
   begin
      currProc:= RecAllProc^.Proc;
      for i:= 1 to Length( currProc^.SummitInProc ) do
      begin
         currSummit:= FindSummit( Ord(currProc^.SummitInProc[i]) );
         currSummit^.SetNoProc( currProc^.NoProc );
      end;
      RecAllProc:= RecAllProc^.Next;
   end;
End;

Function O_EVM.MaxInBus: Integer;
Var Result, i: Integer;
Begin
   Result:= 0;
   for i:= 0 to maxTime-1 do
      if not GetStatusBusInTakt(i+0.5) then Inc(Result);
   MaxInBus:= Result;
End;

Procedure O_EVM.BestSetSummitInProc( setSummitPtr: PSummit; newNoProc: Byte );
          { Перемещает вершину на заданный процессор c поиском лутшего
            расположения этой вершины на процессоре }
Var StrBtn: String;
    theFirstConfiguration, theBestConfiguration: TConfigurationEVM;
    best: Integer;
    setProc: PProc;
    startPos, endPos: Byte;
    j: Byte;
    NilKey: Char;{}
Begin
   FreeAllFlag;
   SetAllFlagUp( setSummitPtr, StrBtn );
   SetAllFlagDown( setSummitPtr );
   setProc:= Find( newNoProc );
   if StrBtn[ newNoProc ] = ' ' then startPos:= 1 else
      for j:= 1 to Length( setProc^.SummitInProc) do
         if not FindSummit( Ord( setProc^.SummitInProc[j]) )^.GetFlag then
         begin
            startPos:= j+1;
            Break;
         end;
   endPos:= Length(setProc^.SummitInProc)+1;
   for j:= Length(setProc^.SummitInProc) downto 1 do
      if FindSummit( Ord(setProc^.SummitInProc[j]) )^.GetFlag
         then endPos:= j
         else Break;
   best:= -1;
   SaveConfigurationEVM( theFirstConfiguration );
   for j:= startPos to endPos do
   begin
      Delete( Find(setSummitPtr^.GetNoProc )^.SummitInProc,
              MyPos( Find( setSummitPtr^.GetNoProc )^.SummitInProc,
                   Chr ( setSummitPtr^.GetNumber )),
              1 );
      Insert( Chr(setSummitPtr^.GetNumber),
              setProc^.SummitInProc,
              j );
      FindSummit( setSummitPtr^.GetNumber )^.SetNoProc( setProc^.NoProc );
      SetAllSummit;
      if ( 0 > best )or( Find(setSummitPtr^.GetNoProc )^.FindMaxTime < best )
      then begin
         SaveConfigurationEVM( theBestConfiguration );
         best:= Find(setSummitPtr^.GetNoProc )^.FindMaxTime;
      end;
      LoadConfigurationEVM( theFirstConfiguration );
      {SetAllSummit;{}
   end;
   LoadConfigurationEVM( theBestConfiguration );
   SetAllSummit;
End;

Procedure O_EVM.BestSetSummitInOtherProc( setSummitPtr: PSummit; Vers: Byte );
          { Перемещает вершину на др. процессоры и находит такой процессор и
            такую на нём позицию, чтобы время работы ЭВМ было min }
Var StrBtn: String;
    setProc: PProc;
    OldConfigurationEVM: TConfigurationEVM;
   Procedure InternalProcedure;
   Var j: Byte;
       startPos, endPos: Byte;
   Begin
      if StrBtn[setProc^.NoProc] = ' ' then startPos:= 1 else
         for j:= 1 to Length(setProc^.SummitInProc) do
            if not FindSummit( Ord(setProc^.SummitInProc[j]) )^.GetFlag then
            begin
               startPos:= j+1;
               Break;
            end;
      endPos:= Length(setProc^.SummitInProc)+1;
      for j:= Length(setProc^.SummitInProc) downto 1 do
         if FindSummit( Ord(setProc^.SummitInProc[j]) )^.GetFlag
            then endPos:= j
            else Break;{}
      for j:= startPos to endPos do
      begin
         Delete( Find(setSummitPtr^.GetNoProc )^.SummitInProc,
                 MyPos( Find(setSummitPtr^.GetNoProc)^.SummitInProc,
                        Chr(setSummitPtr^.GetNumber)),
                 1 );
         Insert( Chr(setSummitPtr^.GetNumber),
                 setProc^.SummitInProc,
                 j );
         setSummitPtr^.SetNoProc( setProc^.NoProc );
         SetAllSummit;
         SaveBestConfigurationEVM;
         LoadConfigurationEVM( OldConfigurationEVM );
         SetAllSummit;
      end;
   End;
Var i: Byte;
    CurrPRecordSummit: PRecordSummit;
Begin
   FreeAllFlag;
   SetAllFlagUp( setSummitPtr, StrBtn );
   SetAllFlagDown( setSummitPtr );
   OldConfigurationEVM:= BestConfigurationEVM;
   if Vers = 1 then (* все варианты *)
      for i:= 1 to Processor do
         if setSummitPtr^.GetNoProc <> i then
         begin
            setProc:= Find( i );
            InternalProcedure;
         end;{}
   if Vers = 2 then (* все варианты *)
   begin (* лишь те варианты где есть связи *)
      (*Down*)
      if setSummitPtr^.UseBus then
         for i:= 1 to setSummitPtr^.NumberArc do
         begin
            setProc:= Find( FindSummit( setSummitPtr^.ToSmmtToInt(i))^.GetNoProc );
            if setSummitPtr^.GetNoProc = setProc^.NoProc then Continue;
            InternalProcedure;
         end;
      (*Up*)
      CurrPRecordSummit:= StartPRecordSummit;
      while CurrPRecordSummit <> Nil do
      begin
         if not CurrPRecordSummit^.Summit^.
            PresenceContactWithSummit( setSummitPtr^.GetNumber ) then
         begin
            CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
            Continue;
         end;
         setProc:= Find( CurrPRecordSummit^.Summit^.GetNoProc );
         if setSummitPtr^.GetNoProc = setProc^.NoProc then
         begin
            CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
            Continue;
         end;
         InternalProcedure;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
      end;
   end;{}
   LoadConfigurationEVM( BestConfigurationEVM );
   SetAllSummit;
End;

Procedure O_EVM.BestSetKlasterInProc( setKlaster: String; newNoProc: Byte );
          { Перемещает кластер на заданный процессор c поиском лутшего
            расположения этой вершины на процессоре }
Var i: Byte;
Begin
   for i:= 1 to Length(setKlaster) do
      BestSetSummitInProc( FindSummit( Ord(setKlaster[i]) ), newNoProc );
End;

Procedure O_EVM.BestSetKlasterInOtherProc( setKlaster: String );
          { Перемещает кластер на др. процессоры и находит такой процессор и
            такое на нём размещение, чтобы время работы ЭВМ было min }
Var j, i: Byte;
    theOldConfiguration: TConfigurationEVM;
Begin
   if setKlaster = '' then Exit;
   SaveConfigurationEVM( theOldConfiguration );
   SaveConfigurationEVM( BestConfigurationEVM );{}
   for j:= 1 to Processor do
      if FindSummit( Ord( setKlaster[1] ) )^.GetNoProc <> j then
      begin
         BestSetKlasterInProc( setKlaster, j );
         SaveBestConfigurationEVM;
         LoadConfigurationEVM( theOldConfiguration );
         SetAllSummit;
      end;
   LoadConfigurationEVM( BestConfigurationEVM );
   SetAllSummit;
End;

Procedure O_EVM.BestSetProcInProc( startNoProc, newNoProc: Byte );
          { Перемещение кластера (всех вершин с проц-ра startNoProc) на
            проц-р newNoProc c лучшим их размещением }
Begin
   if startNoProc = newNoProc then Exit;
   BestSetKlasterInProc( Find(startNoProc)^.SummitInProc, newNoProc );
End;

Procedure O_EVM.BestSetProcInOtherProc( startNoProc: Byte );
          { Перемещает кластер (все вершины с проц-ра startNoProc) на
            др. процессоры и находит такой процессор и
            такое на нём размещение, чтобы время работы ЭВМ было min }
Begin
   BestSetKlasterInOtherProc( Find(startNoProc)^.SummitInProc );
End;

{*********************}

Procedure ShowAllocation;
Begin
   MouseHide;
   Menu;
   Button( XminX, XminY, XmaxX, XmaxY, 'X'      , 0 , 7, False);
   Button( HminX, HminY, HmaxX, HmaxY, '?'      , 0 , 7, False);
   Button( OminX, OminY, OmaxX, OmaxY, 'Cancel' , 15, 0, False );
   Button( JminX, JminY, JmaxX, JmaxY, 'Граф'   , 15, 0, False );
   if AutoDel then Button( ADminX, ADminY, ADmaxX, ADmaxY, '*  AutoDelProc', 15, 0, False )
              else Button( ADminX, ADminY, ADmaxX, ADmaxY, '   AutoDelProc', 15, 0, False );
   Button( SEVMminX, SEVMminY, SEVMmaxX, SEVMmaxY, 'S', 15, 0, False );
   Button( LEVMminX, LEVMminY, LEVMmaxX, LEVMmaxY, 'L', 15, 0, False );
   Button( MminX, MminY, MmaxX, MmaxY, 'Авто'   , 15, 0, False );
   Button( BminX, BminY, BmaxX, BmaxY, 'Базовое', 15, 0, False );
   SetTextStyle(0,0,1);
   SetTextJustify( CenterText, CenterText );
   SetColor(0);
   OutTextXY( GetMaxX div 2, 10, 'Режим ручного моделирования' );
   { рисую рабочее поле }
   FieldCount( cColorField, cColorFrameField );
   Button( AddXmin, AddYmin, AddXmax, AddYmax, '+', 0 ,15, False );
   Button( DelXmin, DelYmin, DelXmax, DelYmax, '-', 0 ,15, False );
   { рисую сетку }
   MyEVM.ShowRack;
   { рисую распределение (всё то что на проц-ах) и связи на одном проц-ре }
   MyEVM.ShowAllocationInAllProc;
   { рисую распределение (всё то что на шине) }
   MyEVM.ShowOthersInBus;
   MyEVM.ShowAllocationInBus;
   { рисую связи между разл. проц-ми }
   MyEVM.ShowLineInBus;
   MouseShow;
End;

Function Modelirovanie: Boolean;
          Procedure HelpAlloc;
          Var NilKey: Char;
          Const Color = 12;
          Begin
             while KeyPressed do NilKey:= ReadKey;
             repeat
                MouseHide;
                FieldCount(7,15);
                Button( 100, 65, 140, 80, 'Пр1', cColorFrameButtonProc, cColorButtonProc, False );
                Button( 220, 65, 260, 80, 'Пр2', cColorFrameButtonProc, cColorButtonProc, False );
                Button( 520, 65, 560, 80, 'Bus', cColorFrameButtonProc, cColorButtonProc, False );
                SetColor(0);
                SetLineStyle(0,0,1);
                SetTextStyle(0,0,1);
                SetTextJustify(CenterText,CenterText);
                SetFillStyle(1,White);
                Circle( 120, 100, 1 ); PutPixel( 120, 100, 0 );
                Circle( 120, 105, 1 ); PutPixel( 120, 105, 0 );
                Circle( 120, 110, 1 ); PutPixel( 120, 110, 0 );
                Bar( 100, 115, 140, 175 );
                Rectangle( 100, 115, 140, 175 );
                OutTextXY( 120, 145, '3' );
                Circle( 120, 180, 1 ); PutPixel( 120, 180, 0 );
                Circle( 120, 185, 1 ); PutPixel( 120, 185, 0 );
                Circle( 120, 190, 1 ); PutPixel( 120, 190, 0 );
                Circle( 240, 210, 1 ); PutPixel( 240, 210, 0 );
                Circle( 240, 215, 1 ); PutPixel( 240, 215, 0 );
                Circle( 240, 220, 1 ); PutPixel( 240, 220, 0 );
                Bar      ( 220, 225, 260, 275 );
                Rectangle( 220, 225, 260, 275 );
                OutTextXY( 240, 250, '5' );
                Circle( 240, 280, 1 ); PutPixel( 240, 280, 0 );
                Circle( 240, 285, 1 ); PutPixel( 240, 285, 0 );
                Circle( 240, 290, 1 ); PutPixel( 240, 290, 0 );
                SetFillStyle(1,Yellow);
                Bar      ( 140, 175, 180, 195 );
                Rectangle( 140, 175, 180, 195 );
                SetFillStyle(1,Green);
                Bar      ( 140, 195, 180, 225 );
                Rectangle( 140, 195, 180, 225 );
                OutTextXY( 160, 210, '3-5' );
                Bar( 520, 195, 560, 225 );
                Circle( 540, 180, 1 ); PutPixel( 540, 180, 0 );
                Circle( 540, 185, 1 ); PutPixel( 540, 185, 0 );
                Circle( 540, 190, 1 ); PutPixel( 540, 190, 0 );
                Rectangle( 520, 195, 560, 225 );
                OutTextXY( 540, 210, '3-5' );
                Line( 180, 200, 220, 230 );
                Circle( 540, 230, 1 ); PutPixel( 540, 230, 0 );
                Circle( 540, 235, 1 ); PutPixel( 540, 235, 0 );
                Circle( 540, 240, 1 ); PutPixel( 540, 240, 0 );
                SetColor(DarkGray);
                Line( 520,  75, 330, 105 );
                Line( 130,  80, 245, 115 );
                Line( 140, 155, 245, 125 );
                Line( 160, 175, 245, 135 );
                Line( 180, 205, 245, 145 );
                Line( 520, 205, 485, 145 );
                SetTextStyle(1,0,4);
                SetUserCharSize(1,1,1,1);
                SetTextJustify(CenterText,CenterText);
                SetColor(0);
                OutTextXY(300,40,'HELP');
                SetTextStyle(0,0,1);
                SetTextJustify(LeftText,CenterText);
                OutTextXY(250,105,'Общая шина');
                OutTextXY(250,115,'Процессор');
                OutTextXY(250,125,'Выполнение вершины на процессоре');
                OutTextXY(250,135,'Ожидание освобождения общей шины');
                OutTextXY(250,145,'Передача данных по общей шине');
                OutTextXY(30,300,'Переход в режим создания  графа: [Cancel], <Esc>. При этом погружение');
                OutTextXY(20,310,'графа не сохраняется.');
                OutTextXY(30,325,'Переход в режим просмотра графа: [Граф], <Enter> , <Tab>. При этом');
                OutTextXY(20,335,'погружение графа сохраняется.');
                OutTextXY(30,350,'Изменение числа процессоров (если это возможно): <+>,[+],<->,[-].');
                OutTextXY(30,365,'<A>, [Авто] - автоматичское погружение графа.');
                OutTextXY(30,380,'<B>, [Базовое] - базовое погружение графа.');
                OutTextXY(30,395,'<D>, [AutoDelProc] - вкл/выкл автоматическое '+
                                 'удаление процессоров при');
                OutTextXY(20,405,'погружении графа.');
                OutTextXY(30,420,'<S>, [S] - сохранить текущее состояние.');
                OutTextXY(30,435,'<L>, [L] - считать сохранённое состояние.');
                OutTextXY(30,450,'<Alt+X> - выход из программы без подтверждения.');
                Button( PgminX, PgminY, PgmaxX, PgmaxY, 'Page 2 >',
                        0, Color, False );
                MouseShow;
                repeat GetMouseStatus until KeyPressed or MousePress;
                if not AllOkToPressButton( PgminX, PgminY,
                   PgmaxX, PgmaxY, 'Page 2 >', 0, Color ) then Break;
                MouseHide;
                FieldCount(7,15);
                SetTextStyle(1,0,4);
                SetUserCharSize(1,1,1,1);
                SetTextJustify(CenterText,CenterText);
                SetColor(0);
                OutTextXY(300,40,'HELP');
                SetTextStyle(0,0,1);
                SetTextJustify(LeftText,CenterText);
                OutTextXY(30, 70,'Выделенные рамкой объекты (кнопки, вершины, пересылки) - это те объекты,');
                OutTextXY(20, 80,'непосредственно под которые (вершинa, пересылкa) или на которые (конкретный');
                OutTextXY(20, 90,'процессор - кнопка [Пр..], вся ЭВМ - кнопка [BUS]) можно размещать исходный');
                OutTextXY(20,100,'перемещаемый объект (кластер вершин, отдельную  вершину, пересылку).');
                OutTextXY(10,115,'ВЕРШИНЫ:');
                OutTextXY(30,130,'Непосредственное перемещение вершины:');
                OutTextXY(20,140,'1) выделить левой кнопкой мыши '+
                                 'перемещаемую вершину;');
                OutTextXY(20,150,'2) нажать на одном выделеных рамкой '+
                                 'обектов - разместить под ним вершину.');
                OutTextXY(30,165,'Автоматическое размещение вершины:');
                OutTextXY(20,175,'1) выделить левой кнопкой мыши '+
                                 'перемещаемую вершину;');
                OutTextXY(20,185,'2) нажать правой кнопкой мыши на этой же вершине.');
                OutTextXY(10,200,'КЛАСТЕРА - множество вершин с одного процессора:');
                OutTextXY(30,215,'Непосредственное перемещение кластера:');
                OutTextXY(20,225,'1) выделить правой кнопкой мыши вершины '+
                                 'входящие в кластер;');
                OutTextXY(20,235,'2) переместить на др. процессор - нажать на '+
                                 'кнопку этого процессора.');
                OutTextXY(30,250,'Автоматическое размещение кластера:');
                OutTextXY(20,260,'1) выделить правой кнопкой мыши вершины '+
                                 'входящие в кластер;');
                OutTextXY(20,270,'2) нажать на кнопку [BUS].');
                OutTextXY(10,285,'ПРОЦЕССОР, как кластер из всех вершин этого прoцессора:');
                OutTextXY(30,300,'Непосредственное перемещение кластера (объеденение 2х процессоров):');
                OutTextXY(20,310,'1) нажать на кнoпке перемещаемого процессора;');
                OutTextXY(20,320,'2) правое нажатие мыши на кнопке др. процессора.');
                OutTextXY(30,335,'Автоматическое размещение кластера (поиск лутшего объеденения 2х проц-ов):');
                OutTextXY(20,345,'1) нажать на кнoпке перемещаемого процессора;');
                OutTextXY(20,355,'2) нажать на кнопку [BUS].');
                OutTextXY(30,370,'Обмен содержимого 2х процессоров:');
                OutTextXY(20,380,'1) нажать на кнoпке первого процессора;');
                OutTextXY(20,390,'2) левое нажатие мыши на кнопке др. процессора.');
                OutTextXY(10,405,'ПЕРЕСЫЛКИ - предача данных по общей шине:');
                OutTextXY(30,420,'Непосредственное перемещение пересылки:');
                OutTextXY(20,430,'1) нажать на перемещаемой пересылке;');
                OutTextXY(20,440,'2) нажать на одном выделеных рамкой '+
                                 'обектов - разместить под');
                OutTextXY(20,450,'   ним пересылку.');
                Button( PgminX, PgminY, PgmaxX, PgmaxY, '< Page 1',
                        0, Color, False );
                MouseShow;
                repeat GetMouseStatus until KeyPressed or MousePress;
                if not AllOkToPressButton( PgminX, PgminY,
                   PgmaxX, PgmaxY, '< Page 1', 0, Color ) then Break;
             until False;
             repeat until KeyPressed or MousePress;
             while MousePress do;
             while KeyPressed do NilKey:= ReadKey;
             MouseHide;
             ShowAllocation;
             MouseShow;
          End;
          Procedure SeeCount;
          Var NilKey: Char;
          Begin
             Menu;
             SetTextStyle(0,0,1);
             SetTextJustify( CenterText, CenterText );
             OutTextXY( GetMaxX div 2, 10, 'Режим просмотра графа' );
             while KeyPressed do NilKey:= ReadKey;
             MouseHide;
             ShowAllAnew;
             MouseShow;
             repeat
                GetMouseStatus;
                if AllOkToShowMethod then ShowMethod;
             until KeyPressed or MousePress;
             while MousePress do;
             while KeyPressed do NilKey:= ReadKey;
             MouseHide;
             ShowAllocation;
             MouseShow;
          End;
Var Key: Char;
    index: Byte;
Begin
   Modelirovanie:= False;
   if Processor > EndNumberSummit then  Processor:= EndNumberSummit;
   dX:= Trunc((Alloc_maxX-Alloc_minX)/(Processor+2)/8);
   MyEVM.Init;
   JPF_U;  JPF_D;
   {******************}
   MyEVM.BeginerAllocation;
   MyEVM.SetAllSummit;
   MyEVM.SaveConfigurationEVM( sSaveConfigurationEVM );
   MyEVM.SaveConfigurationEVM( BestConfigurationEVM );
   ShowAllocation;
   repeat
      GetMouseStatus;
      if MyEVM.MouseClickInRegionSummit then MyEVM.ChangeProc;
      if MyEVM.MouseClickInRegionBus(index) then MyEVM.ChangeInBus(index);
      if MyEVM.MouseClickInRegionBtnProc(index) then MyEVM.BestSet(index);
      if AllOkToPressButton( HminX,HminY,HmaxX,HmaxY, '?', 0, 7 ) or
                           (Key = #59) then HelpAlloc;
      if AllOkToPressButton( AddXmin, AddYmin, AddXmax, AddYmax, '+', 0 ,15 )
         or (Key= #43) or (Key= #61) then
         begin
            if MyEVM.AddProcessor then ShowAllocation else Beep;
         end;
      if AllOkToPressButton( DelXmin, DelYmin, DelXmax, DelYmax, '-', 0 ,15 )
         or (Key= #45) then
         begin
            if MyEVM.DelProcessor then ShowAllocation else Beep ;
         end;
      if AllOkToPressButton( JminX,JminY,JmaxX,JmaxY, 'Граф', 15, 0 ) or
         (Key = #9) or (Key = #13) then SeeCount;
      if AllOkToPressButton( MminX,MminY,MmaxX,MmaxY, 'Авто', 15, 0 ) or
         (Key = 'a') or (Key = 'A') then
         begin
            if not MyEVM.AutoAllocation2 then Beep;
            ShowAllocation;
         end;
      if AllOkToPressButton( BminX,BminY,BmaxX,BmaxY, 'Базовое', 15, 0 ) or
         (Key = 'b') or (Key = 'B') then
         begin
            CaptionMenu( 'Базовое погружение...' );
            if not MyEVM.BaseAllocation then Beep;
            ShowAllocation;
         end;
      if AllOkToPressButton( ADminX, ADminY, ADmaxX, ADmaxY,
         '?  AutoDelProc', 15, 0 ) or (Key = 'd') or (Key = 'D')  then
      begin
         MouseHide;
         AutoDel:= not AutoDel;
         if AutoDel then
         begin
                  while MyEVM.DelProcessor do;
                  ShowAllocation;
                  Button( ADminX, ADminY, ADmaxX, ADmaxY, '*  AutoDelProc', 15, 0, False )
         end else Button( ADminX, ADminY, ADmaxX, ADmaxY, '   AutoDelProc', 15, 0, False );
         MouseShow;
      end;
      if KeyPressed then Key:= ReadKey else Key:= #255;
      if (AllOkToPressButton(OminX,OminY,OmaxX,OmaxY,'Cancel',15,0) or
          AllOkToPressButton(XminX,XminY,XmaxX,XmaxY,'X',0,7) or (Key = #27))
         and ExitProgramm then Break;
      if AllOkToPressButton( SEVMminX, SEVMminY, SEVMmaxX, SEVMmaxY, 'S', 15, 0 )
         or (Key = 'S') or (Key = 's' )
         then MyEVM.SaveConfigurationEVM( sSaveConfigurationEVM );
      if AllOkToPressButton( LEVMminX, LEVMminY, LEVMmaxX, LEVMmaxY, 'L', 15, 0 )
         or (Key = 'L') or (Key = 'l' )
      then begin
         Processor:= EndNumberSummit;
         BestConfigurationEVM:= sSaveConfigurationEVM;
         MyEVM.Done;{}
         MyEVM.Init;
         MyEVM.LoadConfigurationEVM( sSaveConfigurationEVM );
         MyEVM.SetAllSummit;
         if AutoDel then
            while MyEVM.DelProcessor do;
         dX:= Trunc((Alloc_maxX-Alloc_minX)/(Processor+2)/8);
         ShowAllocation;
      end;
      if Key = #0 then
      begin
         Key:= ReadKey;
         if Key = #45 then
         begin
            Modelirovanie:= True;
            Break;
         end;
      end;{}
   until False;
   {******************}
   MyEVM.Done;{}
   MouseHide;
   Menu;
   Button( NminX, NminY, NmaxX, NmaxY, 'New'        , 0 , 7, False );
   Button( LminX, LminY, LmaxX, LmaxY, 'Open  Ctr+O', 0 , 7, False );
   Button( SminX, SminY, SmaxX, SmaxY, 'Save  Ctr+S', 0 , 7, False );
   Button( CminX, CminY, CmaxX, CmaxY, 'Option'     , 0 , 7, False );
   Button( AminX, AminY, AmaxX, AmaxY, 'About'      , 0 , 7, False );
   Button( HminX, HminY, HmaxX, HmaxY, '?'          , 0 , 7, False );
   Button( XminX, XminY, XmaxX, XmaxY, 'X'          , 0 , 7, False );
   Button( JminX, JminY, JmaxX, JmaxY, 'ЯПФ'        , 15, 0, False );
   Button( OminX, OminY, OmaxX, OmaxY, 'Ok'         , 15, 0, False );
   Button( MminX, MminY, MmaxX, MmaxY, 'Авто'       , 0 , 0, False );
   Button( BminX, BminY, BmaxX, BmaxY, 'Базовое'    , 0 , 0, False );
   Button( SEVMminX, SEVMminY, SEVMmaxX, SEVMmaxY, 'S', 0, 0, False );
   Button( LEVMminX, LEVMminY, LEVMmaxX, LEVMmaxY, 'L', 0, 0, False );
   if AutoDel then Button( ADminX, ADminY, ADmaxX, ADmaxY, '*  AutoDelProc', 0, 0, False )
              else Button( ADminX, ADminY, ADmaxX, ADmaxY, '   AutoDelProc', 0, 0, False );
   MouseShow;
   if Key <> #45 then ShowAllAnew;
End;

BEGIN
   MaxTime:= 0;
   PointerInToAllotSummit:= Nil;
   AutoDel:= True;
END.
