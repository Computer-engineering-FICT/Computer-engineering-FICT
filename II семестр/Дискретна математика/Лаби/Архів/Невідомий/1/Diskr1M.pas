Program Diskr1_Sol;

type
 TIndex=1..20;
 TArray=array [TIndex] of integer;
 TSet=record
        Element:TArray;
        Length:TIndex;
      end;

var
 SetA,SetB,SetResult,SetElse,SetUni,SetCross:TSet;

procedure ReadSet(var XSet:TSet);

 var
  i:integer;

 begin
  read(XSet.Length);
  for i:=1 to XSet.Length do
   read(XSet.Element[i]);
 end;

procedure Crossing(var XSet,YSet,RSet:TSet);

 var
  i,j:integer;
  Cross:boolean;

 begin
  RSet.Length:=0;
  Cross:=False;
  for i:=1 to XSet.Length do
   begin
    for j:=1 to YSet.Length do
     if XSet.Element[i]=YSet.Element[j] then Cross:=True;
    if Cross then
     begin
      RSet.Length:=RSet.Length+1;
      RSet.Element[RSet.Length]:=XSet.Element[i];
     end;
    Cross:=False;
   end;
 end;

procedure Difference(var XSet,YSet,RSet:TSet);

 var
  i,j:integer;
  Dif:boolean;
  TempSet:TSet;

 begin
  Crossing(XSet,YSet,TempSet);
  RSet.Length:=0;
  Dif:=False;
  for i:=1 to XSet.Length do
   begin
    for j:=1 to TempSet.Length do
     if XSet.Element[i]=TempSet.Element[j] then Dif:=True;
    if not Dif then
     begin
      RSet.Length:=RSet.Length+1;
      RSet.Element[RSet.Length]:=XSet.Element[i];
     end;
    Min:=False;
   end;
 end;

procedure MakeUniversum(var XSet,YSet,OSet,RSet:TSet);

 var
  i:integer;

 begin
  RSet.Length:=0;
  for i:=1 to XSet.Length do
   begin
    RSet.Length:=RSet.Length+1;
    RSet.Element[RSet.Length]:=XSet.Element[i];
   end;
  for i:=1 to YSet.Length do
   begin
    RSet.Length:=RSet.Length+1;
    RSet.Element[RSet.Length]:=YSet.Element[i];
   end;
  for i:=1 to OSet.Length do
   begin
    RSet.Length:=RSet.Length+1;
    RSet.Element[RSet.Length]:=OSet.Element[i];
   end;
 end;

procedure WriteSet(RSet:TSet);

 var
  i:integer;

 begin
  for i:=1 to RSet.Length do
   write(RSet.Element[i],' ');
 end;

Begin
 ReadSet(SetA);
 ReadSet(SetB);
 ReadSet(SetElse);
 MakeUniversum(SetA,SetB,SetElse,SetUni);
 Crossing(SetA,SetB,SetCross);
 Difference(SetUni,SetCross,SetResult);
 WriteSet(SetResult);
End.