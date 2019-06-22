unit Tab;

interface

uses
  Grids,GSA,Checking,Razmetka,SysUtils,StdCtrls;

var
  SortedCond : array of TText;
  SortedIDs,SortedIdxs,SortedCodes : array of Integer;
  BitsCount : Integer;
  Ready22 : Integer;

procedure FillCodes(AStringGrid : TStringGrid);
procedure BuildTableRS(AStringGrid1,AStringGrid2 : TStringGrid; AMemo : TMemo);
procedure BuildTableD(AStringGrid1,AStringGrid2 : TStringGrid; AMemo : TMemo);

implementation

uses
  Math;

function Binar(ANum,ABits : Integer) : String;
var
  S : String;
  I : Integer;
begin
  S:= S;
  for I:= 0 to ABits-1 do
  begin
    S:= IntToStr(ANum mod 2)+S;
    ANum:= ANum div 2;
  end;
  Result:= S;
end;

function Dec(AStr : String; ABits : Integer; var ADec : Integer) : Boolean;
var
  I : Integer;
begin
  Result:= False;
  if Length(AStr) <> ABits then Exit;
  Result:= True;
  ADec:= 0;
  for I:= 1 to ABits do
  begin
    ADec:= ADec*2;
    case AStr[I] of
    '0' : begin end;
    '1' : Inc(ADec);
    else Result:= False;
    end;
  end;
end;

procedure FillCodes(AStringGrid : TStringGrid);
var
  I,J,T : Integer;
  TmpCond : TText;
begin
  if Ready2 <> 1 then Exit;
  SetLength(SortedCond,CondCount);
  SetLength(SortedIDs,CondCount);
  SetLength(SortedIdxs,CondCount);
  J:= 0;
  for I:= 0 to PCount-1 do
  if Cond[I] <> '' then
  begin
    SortedCond[J]:= Cond[I];
    SortedIDs[J]:= IDs[I];
    SortedIdxs[J]:= Idxs[I];
    Inc(J);
  end;
  for I:= 0 to CondCount-1 do
    for J:= I+1 to CondCount-1 do
      if SortedCond[J] < SortedCond[I] then
      begin
        TmpCond:= SortedCond[J];
        SortedCond[J]:= SortedCond[I];
        SortedCond[I]:= TmpCond;
        T:= SortedIDs[J];
        SortedIDs[J]:= SortedIDs[I];
        SortedIDs[I]:= T;
        T:= SortedIdxs[J];
        SortedIdxs[J]:= SortedIdxs[I];
        SortedIdxs[I]:= T;
      end;
  with AStringGrid do
  begin
    RowCount:= CondCount+1;
    ColCount:= 3;
    FixedRows:= 1;
    FixedCols:= 2;
    Cells[0,0]:= 'Состояние';
    Cells[1,0]:= 'Вершина';
    Cells[2,0]:= 'Код';
    BitsCount:= Trunc(log2(CondCount))+1;
    for I:= 0 to CondCount-1 do
    begin
      Cells[0,I+1]:= SortedCond[I];
      Cells[1,I+1]:= IntToStr(SortedIDs[I]);
      Cells[2,I+1]:= Binar(I,BitsCount);
    end;
    AStringGrid.Visible:= True;
  end;
end;

procedure Mess(AMemo : TMemo; const S : String);
begin
  AMemo.Lines.Add(S);
end;

function Check(AStringGrid : TStringGrid; AMemo : TMemo) : Boolean;
var
  I,DecValue : Integer;
begin
  Result:= True;
  for I:= 0 to CondCount-1 do
    if not Dec(AStringGrid.Cells[2,I+1],BitsCount,DecValue) then
    begin
      Mess(AMemo,'Ошибка : Не удается распознать код состояния '+AStringGrid.Cells[0,I+1]);
      Result:= False;
    end;
end;

function Check2(AStringGrid : TStringGrid; AMemo : TMemo) : Boolean;
var
  I,J,DecValue1,DecValue2 : Integer;
begin
  Result:= True;
  for I:= 0 to CondCount-1 do
    for J:= I+1 to CondCount-1 do
    begin
      Dec(AStringGrid.Cells[2,I+1],BitsCount,DecValue1);
      Dec(AStringGrid.Cells[2,J+1],BitsCount,DecValue2);
      if DecValue1 = DecValue2 then
      begin
        Mess(AMemo,'Ошибка : Одинаковые коды состояний '+AStringGrid.Cells[0,I+1]+','+AStringGrid.Cells[0,J+1]);
        Result:= False;
      end;
    end;
end;

procedure FillSorted(AStringGrid : TStringGrid);
var
  I,DecValue : Integer;
begin
  SetLength(SortedCodes,CondCount);
  for I:= 0 to CondCount-1 do
  begin
    Dec(AStringGrid.Cells[2,I+1],BitsCount,DecValue);
    SortedCodes[I]:= DecValue;
  end;
end;

procedure MakeHead(AStringGrid1 : TStringGrid; ForTriggers : Integer);
var
  I,J : Integer;
begin
  with AStringGrid1 do
  begin
    RowCount:= 2;
    ColCount:= 4+SignalsIn.Count+SignalsOut.Count+ForTriggers;
    FixedRows:= 1;
    FixedCols:= 0;
    ColWidths[0]:= 40;
    ColWidths[1]:= 60;
    ColWidths[2]:= 40;
    ColWidths[3]:= 60;
    for I:= 4 to ColCount-1 do ColWidths[I]:= 40;
//    for I:= 4 to 3+SignalsIn.Count+SignalsOut.Count do ColWidths[I]:= 40;
    Cells[0,0]:= 'ИС';
    Cells[1,0]:= 'Код ИС';
    Cells[2,0]:= 'СП';
    Cells[3,0]:= 'Код СП';
    for I:= 0 to SignalsIn.Count-1 do
      Cells[4+I,0]:= SignalsIn.Strings[I];
    J:= 4+SignalsIn.Count;
    for I:= 0 to SignalsOut.Count-1 do
      Cells[J+I,0]:= SignalsOut.Strings[I];
  end;
end;

procedure FillTable(AStringGrid : TStringGrid);
begin
end;

procedure BuildTableRS(AStringGrid1,AStringGrid2 : TStringGrid; AMemo : TMemo);
begin
  if Ready2 <> 1 then Exit;
  AMemo.Clear;
  if not Check(AStringGrid1,AMemo) then Exit;
  if not Check2(AStringGrid1,AMemo) then Exit;
  FillSorted(AStringGrid1);
  MakeHead(AStringGrid2,BitsCount*2);
  FillTable(AStringGrid2);
  Ready22:= 1;
end;

procedure BuildTableD(AStringGrid1,AStringGrid2 : TStringGrid; AMemo : TMemo);
begin
  if Ready2 <> 1 then Exit;
end;

begin
  Ready22:= -1;
end.
