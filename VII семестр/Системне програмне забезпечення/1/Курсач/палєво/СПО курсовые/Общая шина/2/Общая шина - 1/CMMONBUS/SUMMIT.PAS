UNIT Summit;

INTERFACE

TYPE
 PSummit = ^OSummit;
 OSummit = object
{            private{}
                X,Y      : Integer; { кооодинаты }
                Value    : Integer; { длительность занятия процессора }
                Number   : Byte;    { порядковый номер вершины }
                LayerU   : ShortInt;{ предельный верхний ярус }
                LayerD   : ShortInt;{ предельный нижний ярус }
                NoProc   : Byte; {проц. на котором должна размещатся вершина}
                InProc   : Boolean; {размещена ли уже вершина на процессоре}
                InBus    : Boolean; {размещена ли уже вершина на ОШ (если
                                     вершина не занимает шину то "True"
                                     означает что вершина вроде бы занимает
                                     шину на 0 ед. времени)}
                StartProc: Integer; { время начала работы на процессоре }
                StartBus : Integer; { время начала занятия Общей Шины }
                Flag     : Boolean; {if Flag=False then под ним можно размещать}
            public
                Lines : record
                           Weight{вес}, ToSummit: String;
                        end;
                constructor Init( startX, startY: Integer );
                procedure   SetXY( newX, newY: Integer );
                procedure   GetXY( var currX, currY: Integer );
                procedure   ShowSummit;
                procedure   ShowLines( endNumber: Byte );
                procedure   ShowAllLines;
                function    GetValue: Integer;
                procedure   SetValue(newValue: Integer);
                function    GetNumber: Byte;
                procedure   SetNumber( newNumber: Byte);
                function    PresenceContactWithSummit(xNumber: Byte): Boolean;
                procedure   AddLines( newWeight{вес}, newToSummit: Byte );
                function    MouseInRegionSummit(i: Real): Boolean;
                function    MouseInRegionLine(var EndSummit: PSummit): Boolean;
                function    Index( xNumber: Byte ): Byte;
                function    ToSmmtToStr( Position: Byte ): String;
                function    WeightToStr( Position: Byte ): String;
                function    ToSmmtToInt( Position: Byte ): Integer;
                function    WeightToInt( Position: Byte ): Integer;
                function    LengthToSummit( NumberToSummit: Byte ): Integer;
                function    SummitAboveProgeny( newY: Integer): Boolean;
                function    SummitUnderAncestry( newY: Integer): Boolean;
                procedure   ShowMethod;
                function    SetLayerUInCurrStep: Boolean;
                function    SetLayerDInCurrStep: Boolean;
                function    GetLayerU: ShortInt;
                function    GetLayerD: ShortInt;
                procedure   SetNoProc( newProc: Byte );
                function    GetNoProc: Byte;
                procedure   SetInProc;
                function    GetInProc: Boolean;
                procedure   SetInBus;
                function    GetInBus: Boolean;
                function    FindBeginerValueVariableStartProc( start: Integer ): Integer;
                procedure   SetStartProc( newStartProc: Integer );
                function    GetStartProc: Integer;
                procedure   SetStartBus( newStartBus: Integer );
                function    GetStartBus: Integer;
                function    NumberArc: Byte;
                function    MaxInBus: Integer;
                function    UseBus: Boolean;
                function    AllOkToSetSummit: Boolean;
                procedure   SetFlag;
                function    GetFlag: Boolean;
                function    ToAttain( ToAttainSummit: PSummit ): Boolean;
                destructor  Done;
            end;

 PRecordSummit = ^TRecordSummit;
 TRecordSummit = record
                  Summit: PSummit;
                  NextRecord: PRecordSummit;
                 end;

              Procedure Help;
              Function  FindSummit(Number: Byte): PSummit;
              Function  AllOkToAddSummit: Boolean;
              Procedure AddSummit;
              Function  AllOkToChangeValueSummit: Boolean;
              Procedure ChangeValueSummit;
              Function  AllOkToNewLine(var BeginSummit,
                                           EndSummit: PSummit): Boolean;
              Procedure NewLine(BeginSummit, EndSummit: PSummit);
              Function  AllOkToChangeValueLine
                        (var BeginSummit, EndSummit: PSummit): Boolean;
              Procedure ChangeValueLine(BeginSummit, EndSummit: PSummit);
              Function  AllOkToDelSummit: Boolean;
              Procedure DelSummit;
              Function  AllOkToDelLine(var BeginSummit,
                                           EndSummit: PSummit): Boolean;
              Procedure DelLine(var BeginSummit, EndSummit: PSummit);
              Function  MouseInRegionLine(var BeginSummit,EndSummit: PSummit): Boolean;
              Procedure ShowAllAnew;
              Function  AllOkToMoveSummit: Boolean;
              Procedure MoveSummit;
              Procedure AllNew;
              Procedure DestroyAllObject_And_DisposeRecordSummit;
              Procedure Open;
              Procedure Save;
              Procedure Option;
              Procedure About;
              Function  ExitProgramm: Boolean;
              Function  AllOkToShowMethod: Boolean;
              Procedure ShowMethod;
              Procedure JPF_D;
              Procedure JPF_U;
              Procedure ShowJPF;
              Function  AmountSummitInLayerU( currLayerU: ShortInt ): ShortInt;
              Function  AmountSummitInLayerD( currLayerD: ShortInt ): ShortInt;
                        {кол-во вершин в текушем ярусе}
              Function  GetPointSummitInLayerU( currLayerU: ShortInt;
                                     NumberSummitInLayerU: Byte): PSummit;
              Function  GetPointSummitInLayerD( currLayerD: ShortInt;
                                     NumberSummitInLayerD: Byte): PSummit;
              Procedure AllSummitFree;
              Procedure FreeAllFlag;

Const
   Flag_ShowMethod = True;

{
Function  FindSummit(Number: Byte): PSummit;
Procedure ShowAllSummit;
Procedure NewLine(BeginSummit, EndSummit: PSummit);
Function  MouseInRegionSummit(i: Real): Boolean;
Function  AllOkToChangeValueSummit: Boolean;
Function  AllOkToAddSummit: Boolean;
Function  AllOkToNewLine(var BeginSummit, EndSummit: PSummit): Boolean;
Procedure AddSummit;
Procedure ChangeValueSummit;
Function  MouseInRegionLine(var BeginSummit,EndSummit: PSummit): Boolean;
Function  AllOkToChangeValueLine(var BeginSummit,EndSummit: PSummit): Boolean;
Procedure ChangeValueLine(BeginSummit, EndSummit: PSummit);
Procedure ShowAllAnew;
Function  AllOkToDelSummit: Boolean;
Procedure DelSummit;
Function  AllOkToDelLine(var BeginSummit, EndSummit: PSummit): Boolean;
Procedure DelLine(var BeginSummit, EndSummit: PSummit);
Function  AllOkToMoveSummit: Boolean;
Procedure MoveSummit;
Procedure DestroyAllObject_And_DisposeRecordSummit;
Procedure AllNew;
Procedure Help;
Procedure Open;
Procedure Save;
Procedure Option;
Procedure About;
Function  ExitProgramm: Boolean;
Function  AllOkToShowMethod: Boolean;
Procedure ShowMethod;
Procedure JPF_D;
Procedure JPF_U;
Procedure ShowJPF;
Function  AmountSummitInLayerU( currLayerU: ShortInt ): ShortInt;
Function  AmountSummitInLayerD( currLayerD: ShortInt ): ShortInt;
Function  GetPointSummitInLayerD( currLayer: ShortInt; NumberSummiInLayert: Byte): PSummit;
Procedure AllSummitFree;
{}
VAR Processor: Byte;
    MaxLayerD: ShortInt;
    MaxLayerU: ShortInt;
    StartPRecordSummit: PRecordSummit;
    EndNumberSummit: Integer;

IMPLEMENTATION

USES Crt, DOS, Graph, Mouse, Service;

CONST
   Radius = 15;
   ColorSummit = LightCyan;
   ColorLine   = White;
   LinesOnlyDown = True;
   divPoint = 4; divValueLines = 1.5;
   cX = 10; cY = 470;

VAR
   ToAllotSummit: PSummit;
   FileName: String;
    
{*********************}
   Procedure ShowAllSummit; forward;
{ OBJECT }

Constructor OSummit.Init( startX, startY: Integer );
Begin
   X:= startX;   Y:= startY;
   Lines.Weight:= '';
   Lines.ToSummit:= '';
   Value:= Random(10)+1;
End;

Function OSummit.Index( xNumber: Byte ): Byte;
Begin
   Index:= Pos( Chr(xNumber), Lines.ToSummit );
End;

Procedure OSummit.SetXY( newX, newY: Integer );
Begin
   X:= newX; Y:= newY
End;

Procedure OSummit.GetXY( var currX, currY: Integer );
Begin
   currX:= X; currY:= Y;
End;

Procedure OSummit.ShowSummit;
Begin
   {круг вершины}
   SetLineStyle(0,0,1);
   SetColor(ColorSummit);
   Circle(X,Y,Radius);
   {закраска вершины}
   SetFillStyle(0,ColorSummit);
   FloodFill(X,Y,ColorSummit);
   {вывод значения веса вершины}
   SetTextStyle(5,0,4);
   SetUserCharSize(1,3,1,4);
   SetTextJustify(CenterText,CenterText);
   SetColor(13);
   OutTextXY(X,Y+Radius div 4,IntToStr(Value));
   {вывод номера вершины}
   SetColor(10);
   OutTextXY(X,Y-Radius div 2,' '+IntToStr(Number));
   Line(x-8,y-3,x-8,y-8);
   Line(x-8,y-8,x-4,y-3);
   Line(x-4,y-3,x-4,y-12);
   PutPixel(x-2,y-11,10);
   PutPixel(x-1,y-12,10);
   PutPixel(x-0,y-11,10);
   PutPixel(x-1,y-10,10);
End;

Procedure OSummit.ShowLines( endNumber: Byte );
Var endSummit: PSummit;
    endX,endY: Integer;
Begin
   MouseHide;
   endSummit:= FindSummit( endNumber );
   endSummit^.GetXY(endX,endY);
   SetColor(ColorLine);
   SetLineStyle(0,0,1);
   Line(X,Y,endX,endY);
   if X > endX
   then PointLine( Trunc( endX - (endX-X) / divPoint),
                   Trunc( endY - (endY-Y) / divPoint),
                   arctan( (Y-endY) / (X-endX) ) )
   else if X = endX
        then PointLine( Trunc( endX - (endX-X) / divPoint ),
                        Trunc( endY - (endY-Y) / divPoint ),
                        (Y-endY) / abs(Y-endY)*Pi/2)
        else PointLine( Trunc( endX - (endX-X) / divPoint ),
                        Trunc( endY - (endY-Y) / divPoint ),
                        arctan( (Y-endY) / (X-endX) )-Pi );
   PutText( Trunc( endX - (endX-X) / divValueLines ),
            Trunc( endY - (endY-Y) / divValueLines ),14,
            Lines.Weight[ Index(endNumber) ]);
   ShowAllSummit;
   MouseShow;
End;

Procedure OSummit.ShowAllLines;
Var i: Byte;
Begin
   for i:=1 to NumberArc do ShowLines( ToSmmtToInt(i) );
End;

Function OSummit.GetValue: Integer;
Begin
   GetValue:= Value;
End;

Procedure OSummit.SetValue(newValue: Integer);
Begin
   Value:= newValue;
End;

Function OSummit.GetNumber: Byte;
Begin
   GetNumber:= Number;
End;

Procedure OSummit.SetNumber( newNumber: Byte);
Begin
   Number:= newNumber;
End;

Function OSummit.PresenceContactWithSummit( xNumber: Byte ): Boolean;
Var i: Byte;
Begin
   if Index( xNumber ) = 0 then PresenceContactWithSummit:= False
                           else PresenceContactWithSummit:= True;
End;

Procedure OSummit.AddLines(newWeight, newToSummit: Byte);
Begin
   Lines.ToSummit:= Lines.ToSummit + Chr( newToSummit );
   Lines.Weight  := Lines.Weight   + Chr( newWeight   );
End;

Function OSummit.MouseInRegionSummit(i: Real): Boolean;
Begin
   if (abs(MouseX-X) < i*Radius) and (abs(MouseY-Y) < i*Radius)
      then MouseInRegionSummit:= True
      else MouseInRegionSummit:= False;
End;

Function OSummit.MouseInRegionLine(var EndSummit: PSummit): Boolean;
Var Xo, Yo, endX, endY, deltaX: Integer;
    i: Byte;
Begin
   MouseInRegionLine:= False;
   for i:=1 to EndNumberSummit do
      if PresenceContactWithSummit(i) then
      begin
         EndSummit:= FindSummit(i);
         EndSummit^.GetXY(endX,endY);
         Xo:= Trunc( endX-(endX-X) / divValueLines );
         Yo:= Trunc( endY-(endY-Y) / divValueLines );
         deltaX:= 3*(Length( WeightToStr( Index(EndSummit^.GetNumber )))+1);
         if (MouseX <= Xo+deltaX) and (MouseX >= Xo-deltaX) and
            (MouseY <= Yo+3)      and (MouseY >= Yo-5) then
            begin
               MouseInRegionLine:= True;
               Break;
            end;
      end;
End;

Function OSummit.ToSmmtToStr( Position: Byte ): String;
Begin
   ToSmmtToStr:= IntToStr( Ord( Lines.ToSummit[ Position ]) );
End;

Function OSummit.WeightToStr( Position: Byte ): String;
Begin
   WeightToStr:= IntToStr( Ord( Lines.Weight[ Position ]) );
End;

Function OSummit.ToSmmtToInt( Position: Byte ): Integer;
Begin
   ToSmmtToInt:= Ord( Lines.ToSummit[ Position ]);
End;

Function OSummit.WeightToInt( Position: Byte ): Integer;
Begin
   WeightToInt:= Ord( Lines.Weight[ Position ]);
End;

Function OSummit.LengthToSummit( NumberToSummit: Byte ): Integer;
Begin
   LengthToSummit:= WeightToInt( Index( NumberToSummit ) );
End;

Function OSummit.SummitAboveProgeny( newY: Integer): Boolean;
Var i: Byte;
    currX, currY: Integer;
    CurrSummit: PSummit;
Begin
   SummitAboveProgeny:= True;
   for i:=1 to Length(Lines.ToSummit) do
   begin
      CurrSummit:= FindSummit( ToSmmtToInt(i) );
      CurrSummit^.GetXY(currX,currY);
      if newY >= currY then
      begin
         SummitAboveProgeny:= False;
         Break;
      end;
   end;
End;

Function OSummit.SummitUnderAncestry( newY: Integer): Boolean;
Var CurrPRecordSummit: PRecordSummit;
    currX, currY: Integer;
Begin
   SummitUnderAncestry:= True;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.PresenceContactWithSummit( Number ) then
      begin
         CurrPRecordSummit^.Summit^.GetXY( currX, currY );
         if newY <= currY then
         begin
            SummitUnderAncestry:= False;
            Break;
         end;
      end;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Procedure OSummit.ShowMethod;
Const DlinaX = 305; DlinaY = 75;
Var minX, minY, yy: Integer;
    P: Pointer;
    Size: Word;
Begin
   if X+DlinaX+Radius <= GetMaxX then minX:= X+Radius
                                 else minX:= X-Radius-DlinaX;
   if Y+DlinaY+Radius <= GetMaxY then minY:= Y+Radius
                                 else minY:= Y-Radius-DlinaY;
   Size:= ImageSize( minX, minY, minX+DlinaX, minY+DlinaY );
   GetMem(P,Size);
   MouseHide;
   GetImage( minX, minY, minX+DlinaX, minY+DlinaY, P^ );
   SetFillStyle(1,15);
   Bar(minX, minY, minX+DlinaX, minY+DlinaY);
   SetFillStyle(1,0);
   Bar(minX+1, minY+1, minX+DlinaX-1, minY+DlinaY-1);
   SetFillStyle(1,7);
   Bar(minX+2, minY+2, minX+DlinaX-2, minY+DlinaY-2);
   SetTextStyle(0,0,1);
   SetTextJustify( LeftText, CenterText );
   SetColor(0);
   yy:= minY+10;
   OutTextXY( minX+5,yy, 'Вершина находится на процессоре № '+IntToStr(NoProc));
   Inc(yy, TextHeight('H') + 5);
   OutTextXY( minX+5,yy, 'Время начала занятия процессора = '+IntToStr(StartProc));
   Inc(yy, TextHeight('H') + 1);
   OutTextXY( minX+5,yy, 'Длительность занятия процессора = '+IntToStr( Value ));
   Inc(yy, TextHeight('H') + 5);
   if UseBus then
   begin
      OutTextXY( minX+5,yy, 'Время начала занятия шины       = '+IntToStr(StartBus));
      Inc(yy, TextHeight('H') + 1);
      OutTextXY( minX+5,yy, 'Длительность занятия шины       = '+IntToStr(MaxInBus));
   end else
   begin
      OutTextXY( minX+5,yy, 'Время начала занятия шины       = ---');
      Inc(yy, TextHeight('H') + 1);
      OutTextXY( minX+5,yy, 'Длительность занятия шины       = ---');
   end;
   Inc(yy, TextHeight('H') + 5);
   OutTextXY( minX+5,yy, 'Располагаться может в ярусах № '
              + IntToStr(LayerU) + '..'
              + IntToStr(LayerD) );
   MouseShow;
   repeat until MouseMove or MousePress or KeyPressed;
   MouseHide;
   PutImage( minX, minY, P^, NormalPut );
   MouseShow;
End;

Function OSummit.SetLayerUInCurrStep: Boolean;
Var Summit: PSummit;
    i: Byte;
Begin
   SetLayerUInCurrStep:= False;
   if LayerU = 0 then
   begin
      LayerU:= 1;
      SetLayerUInCurrStep:= True;
   end;
   for i:=1 to Length( Lines.Weight ) do
   begin
      Summit:= FindSummit( ToSmmtToInt(i) );
      if Summit^.LayerU <= LayerU then
      begin
         Summit^.LayerU:= LayerU + 1;
         SetLayerUInCurrStep:= True;
      end;
   end;
End;

Function OSummit.SetLayerDInCurrStep: Boolean;
Var Summit: PSummit;
    i: Byte;
Begin
   SetLayerDInCurrStep:= False;
   if (LayerD = -1) and (Lines.ToSummit='') then Exit;
   if Lines.ToSummit = '' then
   begin
      LayerD:= -1;
      SetLayerDInCurrStep:= True;
      Exit
   end;
   for i:=1 to Length(Lines.Weight) do
   begin
      Summit:= FindSummit( ToSmmtToInt(i) );
      if Summit^.LayerD <= LayerD then
      begin
         LayerD:= Summit^.LayerD-1;
         SetLayerDInCurrStep:= True;
      end;
   end;
End;

Function OSummit.GetLayerU: ShortInt;
Begin
   GetLayerU:= LayerU;
End;

Function OSummit.GetLayerD: ShortInt;
Begin
   GetLayerD:= LayerD;
End;

Procedure OSummit.SetNoProc( newProc: Byte );
Begin
   NoProc:= newProc;
End;

Function OSummit.FindBeginerValueVariableStartProc( start: Integer ): Integer;
Var currSummit: PSummit;
    RecordSummit: PRecordSummit;
    find, curr: Integer;
    i: Byte;
Begin
   find:= start;
   RecordSummit:= StartPRecordSummit;
   while RecordSummit <> Nil do
   begin
      currSummit:= RecordSummit^.Summit;
      if currSummit^.PresenceContactWithSummit( Number ) then
      begin
         if not currSummit^.UseBus or ( currSummit^.GetNoProc = NoProc )
         then
            curr:= currSummit^.StartProc + currSummit^.Value
         else begin
            curr:= currSummit^.StartBus;
            for i:= 1 to currSummit^.NumberArc do
            begin
               if FindSummit( currSummit^.ToSmmtToInt(i) )^.GetNoProc <>
                  currSummit^.GetNoProc then
                  Inc( curr, currSummit^.WeightToInt(i) );
               if currSummit^.ToSmmtToInt(i) = Number then Break;
            end;
         end;
         if curr > find then find:= curr;
      end;
      RecordSummit:= RecordSummit^.NextRecord;
   end;
   FindBeginerValueVariableStartProc:= find;
End;

Procedure OSummit.SetStartProc( newStartProc: Integer );
Begin
   StartProc:= newStartProc;
End;

Function OSummit.GetStartProc: Integer;
Begin
   GetStartProc:= StartProc;
End;

Procedure OSummit.SetStartBus( newStartBus: Integer );
Begin
   StartBus:= newStartBus;
End;

Function OSummit.GetStartBus: Integer;
Begin
   GetStartBus:= StartBus;
End;

Function OSummit.GetNoProc: Byte;
Begin
   GetNoProc:= NoProc;
End;

Function OSummit.GetInProc: Boolean;
Begin
   GetInProc:= InProc;
End;

Procedure OSummit.SetInProc;
Begin
   InProc:= True;
End;

Function OSummit.GetInBus: Boolean;
Begin
   GetInBus:= InBus;
End;

Procedure OSummit.SetInBus;
Begin
   InBus:= True;
End;

Procedure OSummit.SetFlag;
Begin
   Flag:= True;
End;

Function OSummit.GetFlag: Boolean;
Begin
   GetFlag:= Flag;
End;

Function OSummit.NumberArc: Byte;
Begin
   NumberArc:= Length( Lines.Weight );
End;

Function OSummit.MaxInBus: Integer;
Var i: Byte;
    Result: Integer;
Begin
   Result:= 0;
   for i:= 1 to NumberArc do
      if FindSummit( ToSmmtToInt(i) )^.GetNoProc <> NoProc then
         Inc( Result, WeightToInt(i) );
   MaxInBus:= Result;
End;

Function OSummit.UseBus: Boolean;
Var i: Byte;
Begin
   UseBus:= False;
   for i:= 1 to NumberArc do
      if FindSummit( ToSmmtToInt(i) )^.GetNoProc <> NoProc then
      begin
         UseBus:= True;
         Break;
      end;
End;

Function OSummit.AllOkToSetSummit: Boolean;
Var RecordSummit: PRecordSummit;
    currSummit: PSummit;
Begin
   AllOkToSetSummit:= True;
   RecordSummit:= StartPRecordSummit;
   while RecordSummit <> Nil do
   begin
      currSummit:= RecordSummit^.Summit;
      if currSummit^.PresenceContactWithSummit( Number ) and
         ( not currSummit^.GetInProc or
          ( currSummit^.GetInProc and not currSummit^.GetInBus ) ) then
      begin
         AllOkToSetSummit:= False;
         Break;
      end;
      RecordSummit:= RecordSummit^.NextRecord;
   end;
End;

Function OSummit.ToAttain( ToAttainSummit: PSummit ): Boolean;
Var i: Byte;
    currSummit: PSummit;
Begin
   ToAttain:= False;
   for i:=1 to NumberArc do
   begin
      currSummit:= FindSummit( ToSmmtToInt(i) );
      if ( currSummit = ToAttainSummit ) or
           currSummit^.ToAttain( ToAttainSummit ) then
      begin
         ToAttain:= True;
         Break;
      end;
   end;
End;


Destructor OSummit.Done;
Begin
End;

{****** no OBJECT ******}

Function FindSummit(Number: Byte): PSummit;
Var CurrPRecordSummit: PRecordSummit;
Begin
   ShowLogo;{}
   FindSummit:= Nil;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.GetNumber = Number then
      begin
          FindSummit:= CurrPRecordSummit^.Summit;
          Break;
      end;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Procedure ShowAllSummit;
Var CurrPRecordSummit: PRecordSummit;
Begin
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrPRecordSummit^.Summit^.ShowSummit;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Procedure NewLine(BeginSummit, EndSummit: PSummit);
Var X1,X2,Y1,Y2: Integer;
Begin
   if BeginSummit^.PresenceContactWithSummit( EndSummit^.GetNumber ) then Beep
   else begin
      BeginSummit^.GetXY(x1,y1);
      EndSummit^.GetXY(x2,y2);
      if LinesOnlyDown and (y2 <= y1) then Beep
      else begin
         BeginSummit^.AddLines( Random(10)+1, EndSummit^.GetNumber );
         BeginSummit^.ShowLines( EndSummit^.GetNumber );
      end;
   end;
End;

Function MouseInRegionSummit(i: Real): Boolean;
Var CurrPRecordSummit: PRecordSummit;
Begin
   MouseInRegionSummit:= False;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.MouseInRegionSummit(i) then
      begin
         MouseInRegionSummit:= True;
         ToAllotSummit:= CurrPRecordSummit^.Summit;
         Break;
      end;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Function AllOkToChangeValueSummit: Boolean;
Begin
   if MouseInRegionSummit(1) and LeftDblClick
   then AllOkToChangeValueSummit:= True
   else AllOkToChangeValueSummit:= False;
End;

Function AllOkToAddSummit: Boolean;
Var Result: Boolean;
    NilSummit: PSummit;
Begin
   if MousePress then if Button1<>0 then Result:= True
                                    else Result:= False
                 else Result:= False;
   if (MouseX < minX_FieldCount+1.5*Radius) or
      (MouseX > maxX_FieldCount-1.5*Radius) or
      (MouseY < minY_FieldCount+Radius) or
      (MouseY > maxY_FieldCount-Radius) then Result:= False;
   if MouseInRegionSummit(3) then Result:= False;
   if MouseInRegionLine( NilSummit, NilSummit ) then Result:= False;
   AllOkToAddSummit:= Result;
End;

Function  AllOkToNewLine(var BeginSummit, EndSummit: PSummit): Boolean;
Begin
   AllOkToNewLine:= False;
   if (OldButton1 = 0) and (Button1 = 1) and MouseInRegionSummit(1) then
   begin
      BeginSummit:= ToAllotSummit;
      if LinesOnlyDown and (EndNumberSummit > 1)
      then
      begin
         repeat GetMouseStatus until not MouseInRegionSummit(1)
                                     or (Button1 = 0);
         SetTextStyle(0,0,1);
         SetTextJustify(LeftText,CenterText);
         SetColor(15);
         MouseHide;
         OutTextXY(cX,cY,'Связи только низпадаюшие');
         MouseShow;
      end;
      repeat GetMouseStatus until Button1 = 0;{}
      MouseHide;
      SetColor(0);
      SetTextStyle(0,0,1);
      SetTextJustify(LeftText,CenterText);
      OutTextXY(cX,cY,'Связи только низпадаюшие');
      MouseShow;
      MouseInRegionSummit(1);
      EndSummit:= ToAllotSummit;
      if BeginSummit <> EndSummit then AllOkToNewLine:= True;
   end;
End;

Procedure AddSummit;
Var Summit: PSummit;
    CurrPRecordSummit: PRecordSummit;
Begin
     if StartPRecordSummit = Nil
     then begin
             StartPRecordSummit:= New(PRecordSummit);
             New( Summit, Init(MouseX,MouseY) );
             StartPRecordSummit^.Summit:= Summit;
             StartPRecordSummit^.NextRecord:= Nil;
             EndNumberSummit:= 1;
             StartPRecordSummit^.Summit^.SetNumber(1);
             MouseHide;
             StartPRecordSummit^.Summit^.ShowSummit;
          end
     else begin
             CurrPRecordSummit:= StartPRecordSummit;
             while CurrPRecordSummit^.NextRecord <> Nil do
                   CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
             CurrPRecordSummit^.NextRecord:= New(PRecordSummit);
             CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
             New( Summit, Init(MouseX,MouseY) );
             CurrPRecordSummit^.Summit:= Summit;
             CurrPRecordSummit^.NextRecord:= Nil;
             Inc( EndNumberSummit );
             CurrPRecordSummit^.Summit^.SetNumber(EndNumberSummit);
             MouseHide;
             CurrPRecordSummit^.Summit^.ShowSummit;
          end;
     MouseShow;
End;

Procedure ChangeValueSummit;
Var X,Y,newValue: Integer;
Begin
   MouseHide;
   ToAllotSummit^.GetXY(X,Y);
   SetLineStyle(0,0,1);
   SetColor(LightRed);
   Circle(X,Y,Radius);
   { строка приглашения к вводу }
   SetTextStyle(0,0,1);
   SetTextJustify(LeftText,CenterText);
   SetColor(15);
   OutTextXY( cX, cY, 'Введите вес:');
   newValue:= InputNewValue(cX+100,cY,0,999);
   SetColor(0);
   OutTextXY( cX, cY, 'Введите вес:');
   if newValue >= 0 then ToAllotSummit^.SetValue(newValue);
   ToAllotSummit^.ShowSummit;
   MouseShow;
End;

Function MouseInRegionLine(var BeginSummit,EndSummit: PSummit): Boolean;
Var CurrPRecordSummit: PRecordSummit;
Begin
   MouseInRegionLine:= False;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      BeginSummit:= CurrPRecordSummit^.Summit;
      if BeginSummit^.MouseInRegionLine(EndSummit) then
      begin
         MouseInRegionLine:= True;
         Break;
      end;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Function AllOkToChangeValueLine(var BeginSummit,EndSummit: PSummit): Boolean;
Begin
   if MouseInRegionLine(BeginSummit,EndSummit) and LeftDblClick
   then AllOkToChangeValueLine:= True
   else AllOkToChangeValueLine:= False;
End;

Procedure ChangeValueLine(BeginSummit, EndSummit: PSummit);
Var beginX,beginY,endX,endY,Xo,Yo,deltaX: Integer;
    Position: Byte;
    newValue: Integer;
Begin
   MouseHide;
   BeginSummit^.GetXY(beginX,beginY);
   EndSummit^.GetXY(endX,endY);
   Xo:= Trunc( endX-(endX-beginX) / divValueLines );
   Yo:= Trunc( endY-(endY-beginY) / divValueLines );
   Position:= BeginSummit^.Index(EndSummit^.GetNumber);
   PutText(Xo,Yo, Red, BeginSummit^.Lines.Weight[ Position ]);
   SetTextStyle(0,0,1);
   SetTextJustify(LeftText,CenterText);
   SetColor(15);
   OutTextXY( cX, cY, 'Введите вес:');
   newValue:= InputNewValue(cX+100,cY,0,255);
   SetColor(0);
   OutTextXY( cX, cY, 'Введите вес:');
   if newValue >= 0 then
   begin
      BeginSummit^.Lines.Weight[ Position ]:= Chr(newValue);
      ShowAllAnew;
   end else PutText(Xo,Yo, 14, BeginSummit^.Lines.Weight[ Position ]);
   MouseShow;
End;

Procedure ShowAllAnew;
Var CurrPRecordSummit: PRecordSummit;
    NilKey: Char;
Begin
   while KeyPressed do NilKey:= ReadKey;
   MouseHide;
   FieldCount(8,15);
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrPRecordSummit^.Summit^.ShowAllLines;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   ShowAllSummit;
   MouseShow;
End;

Function  AllOkToDelSummit: Boolean;
Begin
   if MouseInRegionSummit(1) and RightDblClick
   then AllOkToDelSummit:= True
   else AllOkToDelSummit:= False;
End;

Procedure DelSummit;
Var DestroyPRecordSummit, CurrPRecordSummit: PRecordSummit;
    DestroySummit, CurrSummit: PSummit;
    DestroyNumber, i, Position: Byte;
    Key: Char;
Begin
   SetTextStyle(0,0,1);
   SetTextJustify(CenterText,CenterText);
   SetColor(LightRed);
   OutTextXY( GetMaxX div 2, cy ,'Подтвердите УДАЛЕНИЕ вершины (Y/N)');
   Delay(2000);
   repeat
      if KeyPressed then Key:= ReadKey else Key:= #0;
   until MousePress or (Key <> #0);
   SetColor(0);
   OutTextXY( GetMaxX div 2, cy ,'Подтвердите УДАЛЕНИЕ вершины (Y/N)');
   if MousePress or ((Key <> 'Y') and (Key <> 'y')) then
   begin
      while MousePress do;
      Exit;
   end;
   DestroySummit:= ToAllotSummit;
   DestroyNumber:= DestroySummit^.GetNumber;
   if StartPRecordSummit^.Summit = DestroySummit then
   begin
      DestroyPRecordSummit:= StartPRecordSummit;
      StartPRecordSummit:= StartPRecordSummit^.NextRecord;
      Dispose( DestroySummit, Done );
      Dispose( DestroyPRecordSummit );
   end
   else
   begin
      CurrPRecordSummit:= StartPRecordSummit;
      while CurrPRecordSummit <> Nil do
      begin
         if CurrPRecordSummit^.NextRecord^.Summit = DestroySummit then
         begin
           DestroyPRecordSummit:= CurrPRecordSummit^.NextRecord;
           CurrPRecordSummit^.NextRecord:=
              CurrPRecordSummit^.NextRecord^.NextRecord;
           Dispose( DestroySummit, Done );
           Dispose( DestroyPRecordSummit );
           Break;
         end;
         CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
      end;
   end;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrSummit:= CurrPRecordSummit^.Summit;
      Position:= 0;
      for i:=1 to Length(CurrSummit^.Lines.ToSummit) do
      begin
         if CurrSummit^.ToSmmtToInt(i) = DestroyNumber
         then Position:= i;
         if CurrSummit^.ToSmmtToInt(i) > DestroyNumber
         then Dec( CurrSummit^.Lines.ToSummit[i] );
      end;
      if Position <> 0 then
      begin
         Delete( CurrSummit^.Lines.ToSummit, Position, 1 );
         Delete( CurrSummit^.Lines.Weight  , Position, 1 );
      end;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrSummit:= CurrPRecordSummit^.Summit;
      if CurrSummit^.GetNumber > DestroyNumber then
         CurrSummit^.SetNumber( CurrSummit^.GetNumber - 1 );
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   Dec( EndNumberSummit );
   ShowAllAnew;
End;

Function  AllOkToDelLine(var BeginSummit, EndSummit: PSummit): Boolean;
Begin
   if MouseInRegionLine(BeginSummit, EndSummit) and RightDblClick
   then AllOkToDelLine:= True
   else AllOkToDelLine:= False;
End;

Procedure DelLine(var BeginSummit, EndSummit: PSummit);
Var Position: Byte;
Begin
   Position:= BeginSummit^.Index(EndSummit^.GetNumber);
   Delete(BeginSummit^.Lines.ToSummit, Position, 1);
   Delete(BeginSummit^.Lines.Weight  , Position, 1);
   ShowAllAnew;
End;

Function AllOkToMoveSummit: Boolean;
Begin
   if MouseInRegionSummit(1) and (Button2 <> 0)
   then AllOkToMoveSummit:= True
   else AllOkToMoveSummit:= False;
End;

Procedure MoveSummit;
Var Summit: PSummit;
    Flag: Boolean;
    dX, dY, X, Y: Integer;
    i: Byte;
    P: Pointer;
    Size: Word;
    predMouseX, predMouseY: Integer;
Begin
   if not MouseMove then Exit;
   Summit:= ToAllotSummit;
   Summit^.GetXY(X,Y);
   dX:= MouseX-X;  dY:= MouseY-Y;
   InitMouse( Trunc( minX_FieldCount+1.5*Radius+dX ),
              Trunc( minY_FieldCount+1.3*Radius+dY ),
              Trunc( maxX_FieldCount-1.5*Radius+dX ),
              Trunc( maxY_FieldCount-1.3*Radius+dY ),
              MouseX, MouseY );{}
   Flag:= True;
   Size:= ImageSize( X-Radius, Y-Radius, X+Radius, Y+Radius );
   GetMem(P,Size);
   MouseHide;
   SetColor(Yellow);
   Circle(X,Y,Radius);
   GetImage( X-Radius, Y-Radius, X+Radius, Y+Radius, P^ );
   MouseShow;
   predMouseX:= MouseX;
   predMouseY:= MouseY;
   SetLineStyle(3,0,1);
   repeat
      GetMouseStatus;
      {if MouseX-dX <    minX_FieldCount+1.5*Radius then
         MouseX:= Trunc(minX_FieldCount+1.5*Radius)+dX;
      if MouseX-dX >    maxX_FieldCount-1.5*Radius then
         MouseX:= Trunc(maxX_FieldCount-1.5*Radius)+dX;
      if MouseY-dY <    minY_FieldCount+1.3*Radius then
         MouseY:= Trunc(minY_FieldCount+1.3*Radius)+dY;
      if MouseY-dY >    maxY_FieldCount-1.3*Radius then
         MouseY:= Trunc(maxY_FieldCount-1.3*Radius)+dY;{}
      if MouseInRegionSummit(1) and (Summit <> ToAllotSummit)
         then Flag:= False else Flag:= True;
      for i:=1 to EndNumberSummit do
         if FindSummit(i) <> Summit then
            if FindSummit(i)^.MouseInRegionSummit(3) then
            begin
               Flag:= False;
               Break;
            end;
      if Summit^.SummitAboveProgeny(MouseY-dY)  then Flag:= Flag and True
                                                else Flag:= False;
      if Summit^.SummitUnderAncestry(MouseY-dY) then Flag:= Flag and True
                                                else Flag:= False;
      if MouseMove then
      begin
         MouseHide;
         PutImage( predMouseX-Radius-dX, predMouseY-Radius-dY,P^,NormalPut );
         GetImage(     MouseX-Radius-dX,     MouseY-Radius-dY,
                       MouseX+Radius-dX,     MouseY+Radius-dY, P^ );
         if Flag then SetColor(Green) else SetColor(Red);
         Circle(MouseX-dX,MouseY-dY,Radius);
         if Flag then begin
                         SetFillStyle(1,LightGreen);
                         FloodFill(MouseX-dX,MouseY-dY,Green)
                      end
                 else begin
                         SetFillStyle(1,LightRed);
                         FloodFill(MouseX-dX,MouseY-dY,Red);
                      end;
         MouseShow;
         predMouseX:= MouseX;
         predMouseY:= MouseY;
      end;
   until (Button2 = 0) or (Button1 <> 0);
   FreeMem(P,Size);
   if     Flag and (Button1 = 0) then Summit^.SetXY(MouseX-dX,MouseY-dY);
   if not Flag and (Button1 = 0) then Beep;
   ShowAllAnew;
   while MousePress do;
   InitMouse( 0, 0, GetMaxX-2, GetMaxY-2, MouseX, MouseY );{}
End;

Procedure DestroyAllObject_And_DisposeRecordSummit;
Var Summit: PSummit;
    CurrPRecordSummit, NewRecordSummit: PRecordSummit;
Begin
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
       Summit:= CurrPRecordSummit^.Summit;
       Dispose( Summit, Done );
       NewRecordSummit:= CurrPRecordSummit;
       CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
       Dispose( NewRecordSummit );
   end;
   StartPRecordSummit:= Nil;
End;

Procedure AllNew;
Begin
   FieldCount(8,15);
   DestroyAllObject_And_DisposeRecordSummit;
   EndNumberSummit:= 0;
End;

Procedure Help;
Var NilKey: Char;
Begin
   while KeyPressed do NilKey:= ReadKey;
   MouseHide;
   FieldCount(7,15);
   SetTextStyle(1,0,4);
   SetUserCharSize(1,1,1,1);
   SetTextJustify(CenterText,CenterText);
   SetColor(0);
   OutTextXY(300,40,'HELP');
   {линия}
   SetLineStyle(0,0,3);
   SetColor(0);
   Line(100,105,100,150);
   Line(100,150, 95,140);
   Line(100,150,105,140);
   SetFillStyle(1,14);
   Bar(90,110,110,120);
   {круг вершины}
   Circle(100,80,25);
   {закраска вершины}
   SetFillStyle(1,2);
   FloodFill(100,80,0);
   { вывод значений }
   SetTextStyle(0,0,1);
   SetTextJustify(LeftText,CenterText);
   OutTextXY(97,73 ,'2    - № вершины');
   OutTextXY(97,88 ,'3    - вес вершины ( время выполнения )');
   OutTextXY(97,116,'5    - вес дуги    ( время пересылки  )');
   { текст }
   OutTextXY(30,170 ,'Создание:');
   OutTextXY(40,180 ,'вершины - нажать левой кнопкой мыши на свободном месте;');
   OutTextXY(40,190 ,'дуги    - при нажатой левой кнопке мыши на начальной '+
                     'вершине переместить ');
   OutTextXY(120,200 ,'курсор мыши на конечную вершину.');

   OutTextXY(30,215 ,'Изменение веса:');
   OutTextXY(40,225 ,'вершины - двойное левое нажатие на вершине;');
   OutTextXY(40,235 ,'дуги    - двойное левое нажатие на весе дуги.');

   OutTextXY(30,250 ,'Удаление:');
   OutTextXY(40,260 ,'вершины - двойное правое нажатие на вершине;');
   OutTextXY(40,270 ,'дуги    - двойное правое нажатие на весе дуги.');

   OutTextXY(30,285 ,'Перемещение вершины - нажать правую кнопку мыши на '+
                     'вершине и переместить');
   OutTextXY(206,295,'вершину на новую позицию.');

   OutTextXY(30,310 ,'Переход в режим моделирования (погружения) графа на '+
                     'ОШ - клавиша <Tab>,');
   OutTextXY(20,320 ,'клавиша <Enter> и кнопка [Ok].');

   OutTextXY(30,335 ,'Кнопка [ЯПФ] - преобразование графа в ярусно-'+
                     'парралельную форму.');

   OutTextXY(30,350 ,'Погружение графа но ОШ осуществляется на заданом числе '+
                     'процессоров. Если');
   OutTextXY(20,360 ,'задать число процессоров равное числу вершин графа, '+
                     'то начальное погружение ');
   OutTextXY(20,370 ,'будет являтся базовым - каждая вершина графа '+
                     'располагается на отдельном');
   OutTextXY(20,380 ,'процессоре.');
   OutTextXY(30,395 ,'<F1>,[?] - эта помощь.              <Esc>,[X] - выход с подтверждением.');
   OutTextXY(30,410 ,'<С> - перерисовка графа.            <Alt+X> - выход без подтверждения.');
   OutTextXY(30,425 ,'[Open],<Ctrl+O> - загрузка файла.   <N>,[New] - для нового графа.');
   OutTextXY(30,440 ,'[Save],<Ctrl+S> - запись файла.     [About] - о программе.');
   MouseShow;
   repeat until KeyPressed or MousePress;
   while MousePress do;
   MouseHide;
   ShowAllAnew;
   Button(NminX,NminY,NmaxX,NmaxY,'New'        ,0 ,7,False);
   Button(LminX,LminY,LmaxX,LmaxY,'Open  Ctr+O',0 ,7,False);
   Button(SminX,SminY,SmaxX,SmaxY,'Save  Ctr+S',0 ,7,False);
   Button(CminX,CminY,CmaxX,CmaxY,'Option'     ,0 ,7,False);
   Button(AminX,AminY,AmaxX,AmaxY,'About'      ,0 ,7,False);
   Button(HminX,HminY,HmaxX,HmaxY,'?'          ,0 ,7,False);
   Button(XminX,XminY,XmaxX,XmaxY,'X'          ,0, 7,False);
   MouseShow;
End;

Procedure Save;
Type TRecord = record
              X,Y   : Integer;
              Value : Integer;
              Number: Byte;
              Weight, ToSummit: String;
           end;
Var FileName: String;
    F: File of TRecord;
    CurrRecord: TRecord;
    CurrPRecordSummit: PRecordSummit;
    CurrSummit: PSummit;
Begin
   SetTextStyle(0,0,1);
   SetTextJustify(LeftText,CenterText);
   SetColor(15);
   MouseHide;
   OutTextXY(cx,cy,'Введите имя файла:');
   MouseShow;
   FileName:= InputString(cX+148,cY,8);
   SetColor(0);
   MouseHide;
   OutTextXY(cx,cy,'Введите имя файла:');
   MouseShow;
   if FileName = '' then Exit
                    else FileName:= FileName+'.sav';
   Assign(F,FileName);
   ReWrite(F);
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrSummit:= CurrPRecordSummit^.Summit;
      CurrSummit^.GetXY(CurrRecord.X,CurrRecord.Y);
      CurrRecord.Value:= CurrSummit^.GetValue;
      CurrRecord.Number:= CurrSummit^.GetNumber;
      CurrRecord.Weight:= CurrSummit^.Lines.Weight;
      CurrRecord.ToSummit:= CurrSummit^.Lines.ToSummit;
      Write(F,CurrRecord);
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   Close(F);
End;

Procedure Open;
Type TRecord = record
              X,Y   : Integer;
              Value : Integer;
              Number: Byte;
              Weight, ToSummit: String;
           end;
Var F: File of TRecord;
    CurrRecord: TRecord;
    CurrPRecordSummit: PRecordSummit;
    CurrSummit: PSummit;
    NilKey: Char;
Begin
   if (ParamCount <> 0) and (FileName = '') then FileName:= ParamStr(1)
   else begin
      SetTextStyle(0,0,1);
      SetTextJustify(LeftText,CenterText);
      SetColor(15);
      MouseHide;
      OutTextXY(cx,cy,'Введите имя файла:');
      MouseShow;
      FileName:= InputString(cX+148,cY,8);
      SetColor(0);
      MouseHide;
      OutTextXY(cx,cy,'Введите имя файла:');
      MouseShow;
      if FileName = '' then Exit
                       else FileName:= FileName+'.sav';
   end;
   {$I-}
   Assign(F,FileName);
   ReSet(F);
   {$I+}
   if IOResult <> 0 then
   begin
      SetTextJustify( CenterText, CenterText );
      SetColor(LightRed);
      MouseHide;
      OutTextXY( GetMaxX div 2, cy, 'Ошибка открытия файла' );
      MouseShow;
      repeat until KeyPressed or MousePress;
      while MousePress do;
      SetColor(0);
      MouseHide;
      OutTextXY( GetMaxX div 2, cy, 'Ошибка открытия файла' );
      MouseShow;
      while MousePress do;
      while KeyPressed do NilKey:= ReadKey;
      Exit;
   end;
   AllNew;
   CurrPRecordSummit:= StartPRecordSummit;
   while not EOF(F) do
   begin
      Read(F,CurrRecord);
      if StartPRecordSummit = Nil
      then begin
         StartPRecordSummit:= New(PRecordSummit);
         New( CurrSummit, Init( CurrRecord.X,CurrRecord.Y ) );
         CurrSummit^.SetValue( CurrRecord.Value );
         CurrSummit^.SetNumber( CurrRecord.Number );
         CurrSummit^.Lines.Weight:= CurrRecord.Weight;
         CurrSummit^.Lines.ToSummit:= CurrRecord.ToSummit;
         StartPRecordSummit^.Summit:= CurrSummit;
         StartPRecordSummit^.NextRecord:= Nil;
         EndNumberSummit:= 1;
         StartPRecordSummit^.Summit^.SetNumber(1);
      end
      else begin
         CurrPRecordSummit:= StartPRecordSummit;
         while CurrPRecordSummit^.NextRecord <> Nil do
               CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
         CurrPRecordSummit^.NextRecord:= New(PRecordSummit);
         CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
         New( CurrSummit, Init(CurrRecord.X,CurrRecord.Y) );
         CurrSummit^.SetValue(CurrRecord.Value);
         CurrSummit^.SetNumber(CurrRecord.Number);
         CurrSummit^.Lines.Weight:= CurrRecord.Weight;
         CurrSummit^.Lines.ToSummit:= CurrRecord.ToSummit;
         CurrPRecordSummit^.Summit:= CurrSummit;
         CurrPRecordSummit^.NextRecord:= Nil;
         Inc( EndNumberSummit );
         CurrPRecordSummit^.Summit^.SetNumber(EndNumberSummit);
      end;
   end;
   Close(F);
   ShowAllAnew;
End;

Function ExitProgramm: Boolean;
Const minX=220; minY=150; maxX=420; maxY=200;
Var P: Pointer;
    Size: Word;
    Key: Char;
Begin
   Key:= #0;
   ExitProgramm:= False;
   Size:= ImageSize( minX, minY, maxX, maxY);
   GetMem(P,Size);
   MouseHide;
   GetImage( minX, minY, maxX, maxY, P^ );
   SetFillStyle(1,0);
   Bar(minX,minY,maxX,maxY);
   SetFillStyle(1,7);
   Bar(minX+3,minY+3,maxX-3,maxY-3);
   SetFillStyle(1,15);
   Bar(333,160,350,188);
   Bar(376,160,394,188);
   SetTextStyle(3,0,4);
   SetUserCharSize(1,1,1,1);
   SetTextJustify(CenterText,CenterText);
   SetColor(0);
   OutTextXY(minX+(maxX-minX)div 2,minY-7+(maxY-minY)div 2,'Exit? (Y/N)');
   MouseShow;
   InitMouse( 333, 160, 395, 188, 333, 160 );{}
   repeat
      if KeyPressed then begin Key:= ReadKey; Break; end;
      if MousePress then Break;
   until False;
   if MousePress then
   begin
      GetMouseStatus;
      if (MouseX >= 333) and (MouseX <= 350) and
         (MouseY >= 160) and (MouseY <= 188) then ExitProgramm:= True;
   end;
   InitMouse( 0, 0, GetMaxX-2, GetMaxY-2, MouseX, MouseY );{}
   while MousePress do;
   if (Key='y') or (Key='Y') or
      (Key='н') or (Key='Н') or (Key=#13) then ExitProgramm:= True;
   while KeyPressed do Key:= ReadKey;;
   MouseHide;
   PutImage( minX, minY,P^,NormalPut );
   MouseShow;
   FreeMem(P,Size);
End;

Procedure About;
Const minX=120; minY=50; maxX=520; maxY=300;
Begin
   MouseHide;
   SetFillStyle( 1, 0 );
   Bar(minX,minY,maxX,maxY);
   SetFillStyle( 1, 7 );
   Bar( minX+3, minY+3, maxX-3, maxY-3 );
   SetTextStyle( 0, 0, 2 );
   SetTextJustify( CenterText, CenterText );
   SetColor(0);
   OutTextXY( GetMaxX div 2, 70, 'Моделирование' );
   OutTextXY( GetMaxX div 2, 90, 'Общей Шины' );
   SetTextStyle( 0, 0, 1 );
   OutTextXY( GetMaxX div 2, 120, 'Национальный Технический Университет Украины' );
   OutTextXY( GetMaxX div 2, 130, '(Киевский Политехнический Институт)' );
   OutTextXY( GetMaxX div 2, 150, 'Факультет Информатики и Вычислительной Техники' );
   OutTextXY( GetMaxX div 2, 170, 'Кафедра Вычислительной Техники' );
   OutTextXY( GetMaxX div 2, 190, 'Бакалаврская работа' );
   OutTextXY( GetMaxX div 2, 220, 'Разработано студентом' );
   OutTextXY( GetMaxX div 2, 230, 'гр. ИВ-63' );
   OutTextXY( GetMaxX div 2, 240, 'Кривулей Сергеем Николаевичем' );
   OutTextXY( GetMaxX div 2, 250, 'специально для' );
   OutTextXY( GetMaxX div 2, 260, 'Симоненко Валерия Павловича' );
   OutTextXY( GetMaxX div 2, 280, 'Киев  2000г.' );
   MouseShow;
   repeat until KeyPressed or MousePress;
   while MousePress do;
   ShowAllAnew;
End;

Procedure Option;
Var newValue: Integer;
Begin
   if EndNumberSummit = 0 then Exit;
   if Processor > EndNumberSummit then Processor:= EndNumberSummit;
   SetTextStyle(0,0,1);
   SetTextJustify(LeftText,CenterText);
   SetColor(15);
   OutTextXY( cX, cY, 'Количество процессоров( 1..'+IntToStr(EndNumberSummit)+
             ' ):      (текущее значение = ' + IntToStr( Processor ) + ')' );
   newValue:= InputNewValue(cX+260,cY,1, EndNumberSummit );
   SetColor(0);
   OutTextXY( cX, cY, 'Количество процессоров( 1..'+IntToStr(EndNumberSummit)+
             ' ):      (текущее значение = ' + IntToStr( Processor ) + ')' );
   if newValue = 0 then Beep;
   if ( newValue > 0 ) and ( newValue <> Processor ) then
   begin
      Processor:= newValue;
   end;
End;

Function  AllOkToShowMethod: Boolean;
Var h,m,s,ss,ns: Word;
Begin
   AllOkToShowMethod:= False;
   if not Flag_ShowMethod then Exit;
   if MouseInRegionSummit(1) then
   begin
      GetTime(h,m,s,ss);
      repeat
         GetTime(h,m,ns,ss);
         if s+0 < ns then
         begin
            AllOkToShowMethod:= True;
            Break;
         end;
      until MouseMove or MousePress or KeyPressed;
   end;
End;

Procedure ShowMethod;
Begin
   ToAllotSummit^.ShowMethod;
End;

Procedure JPF_D;{Ярусно-паралельная форма}
Var CurrPRecordSummit: PRecordSummit;
    Flag: Boolean;
Begin
   {обнуляю яруса}
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrPRecordSummit^.Summit^.LayerD:= 0;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   {определяю яруса}
   repeat
      Flag:= False;
      CurrPRecordSummit:= StartPRecordSummit;
      while CurrPRecordSummit <> Nil do
      begin
         Flag:= Flag or CurrPRecordSummit^.Summit^.SetLayerDInCurrStep;
         CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
      end;
   until Flag = False;
   { определяю количество ярусов }
   MaxLayerD:= 0;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.LayerD < MaxLayerD then
         MaxLayerD:= CurrPRecordSummit^.Summit^.LayerD;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   MaxLayerD:= abs(MaxLayerD);
   { делаю яруса положительными }
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrPRecordSummit^.Summit^.LayerD:=
         CurrPRecordSummit^.Summit^.LayerD+1+MaxLayerD;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Procedure JPF_U;
Var CurrPRecordSummit: PRecordSummit;
    Flag: Boolean;
Begin
   {обнуляю яруса}
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrPRecordSummit^.Summit^.LayerU:= 0;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   {определяю яруса}
   repeat
      Flag:= False;
      CurrPRecordSummit:= StartPRecordSummit;
      while CurrPRecordSummit <> Nil do
      begin
         Flag:= Flag or CurrPRecordSummit^.Summit^.SetLayerUInCurrStep;
         CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
      end;
   until Flag = False;
   { определяю количество ярусов }
   MaxLayerU:= 0;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.LayerU > MaxLayerU then
         MaxLayerU:= CurrPRecordSummit^.Summit^.LayerU;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Procedure ShowJPF;
Var i,j: Byte;
    NumberSummit, CurrNumberSummit: Byte;
    CurrPRecordSummit: PRecordSummit;
    dX,dY: Real;
Begin
   if EndNumberSummit = 0 then Exit;
   while MousePress do;
   MouseHide;
   Button(JminX, JminY, JminX+(JmaxX-JminX) div 2,JmaxY,#25,15,0,False);
   Button(JminX+(JmaxX-JminX) div 2, JminY, JmaxX,JmaxY,#24,15,0,False);
   MouseShow;
   InitMouse( JminX, JminY, JmaxX, JmaxY, MouseX, MouseY );
   repeat
      GetMouseStatus;
      if AllOkToPressButton( JminX, JminY, JminX+(JmaxX-JminX) div 2,
         JmaxY,#25,15,0) then begin j:=1; break end;
      if AllOkToPressButton( JminX+(JmaxX-JminX) div 2, JminY, JmaxX,
         JmaxY,#24,15,0) then begin j:=2; break end;
   until False;
   InitMouse( 0, 0, GetMaxX-2, GetMaxY-2, MouseX, MouseY );
   if j = 1 then
   begin
      JPF_U;
      for i:=1 to MaxLayerU do
      begin
         {определяю кол-во вершин, входящих в ярус}
         NumberSummit:= AmountSummitInLayerU(i);
         {меняю координаты вершин}
         dX:= (maxX_FieldCount-minX_FieldCount)/NumberSummit;
         dY:= (maxY_FieldCount-minY_FieldCount)/MaxLayerU;
         CurrNumberSummit:= 0;
         CurrPRecordSummit:= StartPRecordSummit;
         while CurrPRecordSummit <> Nil do
         begin
            if CurrPRecordSummit^.Summit^.LayerU = i then
            begin
               CurrPRecordSummit^.Summit^.SetXY(
                  minX_FieldCount+Trunc(CurrNumberSummit*dX+dX/2),
                  minY_FieldCount+Trunc(               i*dY-dY/2) );
               Inc(CurrNumberSummit);
            end;
            CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
            end;
      end;
   end
   else begin
      JPF_D;
      for i:=1 to MaxLayerD do
      begin
         {определяю кол-во вершин, входящих в ярус}
         NumberSummit:= AmountSummitInLayerD(i);
         {меняю координаты вершин}
         dX:= (maxX_FieldCount-minX_FieldCount)/NumberSummit;
         dY:= (maxY_FieldCount-minY_FieldCount)/MaxLayerD;
         CurrNumberSummit:= 0;
         CurrPRecordSummit:= StartPRecordSummit;
         while CurrPRecordSummit <> Nil do
         begin
            if CurrPRecordSummit^.Summit^.LayerD = i then
            begin
               CurrPRecordSummit^.Summit^.SetXY(
                  minX_FieldCount+Trunc(CurrNumberSummit*dX+dX/2),
                  minY_FieldCount+Trunc(               i*dY-dY/2) );
               Inc(CurrNumberSummit);
            end;
            CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
            end;
      end;
   end;
   MouseHide;
   Button(JminX,JminY,JmaxX,JmaxY,'ЯПФ'        ,15,0,False);
   MouseShow;{}
   ShowAllAnew;
End;

Function AmountSummitInLayerU( currLayerU: ShortInt ): ShortInt;
Var AmountSummit: Byte;
    CurrPRecordSummit: PRecordSummit;
Begin
   {определяю кол-во вершин, входящих в заданный ярус}
   AmountSummit:= 0;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.LayerU = currLayerU then Inc(AmountSummit);
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   AmountSummitInLayerU:= AmountSummit;
End;

Function AmountSummitInLayerD( currLayerD: ShortInt ): ShortInt;
Var AmountSummit: Byte;
    CurrPRecordSummit: PRecordSummit;
Begin
   {определяю кол-во вершин, входящих в заданный ярус}
   AmountSummit:= 0;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.LayerD = currLayerD then Inc(AmountSummit);
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
   AmountSummitInLayerD:= AmountSummit;
End;

Function GetPointSummitInLayerU( currLayerU: ShortInt;
                                NumberSummitInLayerU: Byte): PSummit;
Var CurrPRecordSummit: PRecordSummit;
    i: Byte;
Begin
   GetPointSummitInLayerU:= Nil;
   i:= 0;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.LayerU = currLayerU then
      begin
         Inc(i);
         if i = NumberSummitInLayerU then
         begin
            GetPointSummitInLayerU:= CurrPRecordSummit^.Summit;
            Break;
         end;
      end;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Function GetPointSummitInLayerD( currLayerD: ShortInt;
                                NumberSummitInLayerD: Byte): PSummit;
Var CurrPRecordSummit: PRecordSummit;
    i: Byte;
Begin
   GetPointSummitInLayerD:= Nil;
   i:= 0;
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      if CurrPRecordSummit^.Summit^.LayerD = currLayerD then
      begin
         Inc(i);
         if i = NumberSummitInLayerD then
         begin
            GetPointSummitInLayerD:= CurrPRecordSummit^.Summit;
            Break;
         end;
      end;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Procedure AllSummitFree;
Var CurrPRecordSummit: PRecordSummit;
Begin
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrPRecordSummit^.Summit^.InProc:= False;
      CurrPRecordSummit^.Summit^.InBus:= False;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

Procedure FreeAllFlag;
Var CurrPRecordSummit: PRecordSummit;
Begin
   CurrPRecordSummit:= StartPRecordSummit;
   while CurrPRecordSummit <> Nil do
   begin
      CurrPRecordSummit^.Summit^.Flag:= False;
      CurrPRecordSummit:= CurrPRecordSummit^.NextRecord;
   end;
End;

BEGIN
   StartPRecordSummit:= Nil;
   EndNumberSummit:= 0;
   Processor:= 3;
   FileName:= '';
END.
