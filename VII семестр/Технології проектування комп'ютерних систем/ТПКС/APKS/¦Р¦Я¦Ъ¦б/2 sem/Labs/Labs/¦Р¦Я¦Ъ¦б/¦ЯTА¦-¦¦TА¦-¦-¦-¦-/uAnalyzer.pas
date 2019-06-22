unit uAnalyzer;

interface
uses
  uTypes,
  Dialogs, SysUtils;

type
  TAnalyzer = class
    Alhoritm, FileName: string;
    Nodes: TNodes;
    Conn: TConn;
    Ways: TWays;
    Cycles: TCycles;
    Status: String;
    procedure Analyze;
    procedure FindWays;
    function CheckH: boolean;
    function CheckK: boolean;
    function CheckCycles: integer;
    function GetCycleStart(WayId: integer): integer;
    function IsCycle(WayId: integer): boolean;
    function IsCorrectCycle(CycleId: integer): boolean;
    function CycleToStr(CycleId: integer): string;
  end;

var
  Analyzer: TAnalyzer;
implementation

procedure TAnalyzer.Analyze;
var
  CharId, LinkId, i: integer;
  AllowedChars: set of Char;
  Links: array of integer;
procedure AllocateLink;
var
  i: integer;
begin
  i := Length(Links);
  SetLength(Links, LinkId + 1);
  for i := i to LinkId do Links[i] := -1;
end;
begin
  SetLength(Nodes, 0);
  SetLength(Conn, 0);
  SetLength(Links, 0);

  if not CheckH
  then begin
    if InputQuery('Ошибка в алгоритме: Символ №1', 'ЛСА должен начинаться с символа "H".', Alhoritm)
    then Status := 'Repeat'
    else Status := 'Cancel';
    Exit;
  end;

  SetLength(Nodes, 1);
  Nodes[0].Name := 'H';
  SetLength(Conn, 1);
  SetLength(Conn[0], 1);
  Conn[0][0] := 1;

  if not CheckK
  then begin
    if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(Length(Alhoritm)), 'ЛСА должен заканчиваться символом "K".', Alhoritm)
    then Status := 'Repeat'
    else Status := 'Cancel';
    Exit;
  end;

  CharId := 2;
  AllowedChars := ['x', 'X', 'y', 'Y', 'V'];
  while Alhoritm[CharId] <> 'K' do
  begin
    if not (Alhoritm[CharId] in AllowedChars)
    then begin
      if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Символ "' + Alhoritm[CharId] + '" здесь не допустим.', Alhoritm)
      then Status := 'Repeat'
      else Status := 'Cancel';
      Exit;
    end;
    case Alhoritm[CharId] of
      'x', 'X': begin
        Inc(CharId);
        if not (Alhoritm[CharId] in ['0'..'9'])
        then begin
          if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Ожидается индекс.', Alhoritm)
          then Status := 'Repeat'
          else Status := 'Cancel';
          Exit;
        end;

        SetLength(Nodes, Length(Nodes) + 1);
        Nodes[High(Nodes)].Name := 'x';
        repeat
          Nodes[Length(Nodes) - 1].Name := Nodes[Length(Nodes) - 1].Name + Alhoritm[CharId];
          Inc(CharId);
        until not (Alhoritm[CharId] in ['0'..'9']);

        if not (Alhoritm[CharId] = '^')
        then begin
          if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Ожидается символ перехода "^".' , Alhoritm)
          then Status := 'Repeat'
          else Status := 'Cancel';
          Exit;
        end;

        Inc(CharId);

        if not (Alhoritm[CharId] in ['0'..'9'])
        then begin
          if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Ожидается индекс.', Alhoritm)
          then Status := 'Repeat'
          else Status := 'Cancel';
          Exit;
        end;

        SetLength(Conn, Length(Conn) + 1);
        SetLength(Conn[Length(Conn) - 1], 2);
        Conn[Length(Conn) - 1][0] := 0;
        repeat
          Conn[Length(Conn) - 1][0] := Conn[Length(Conn) - 1][0] * 10 + StrToInt(Alhoritm[CharId]);
          Inc(CharId);
        until not (Alhoritm[CharId] in ['0'..'9']);
        Conn[Length(Conn) - 1][0] := - Conn[Length(Conn) - 1][0];
        Conn[Length(Conn) - 1][1] := Length(Nodes);

        AllowedChars := ['x', 'X', 'y', 'Y', 'V', 'v'];
      end;
      'y', 'Y': begin
        Inc(CharId);
        if not (Alhoritm[CharId] in ['0'..'9'])
        then begin
          if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Ожидается индекс.', Alhoritm)
          then Status := 'Repeat'
          else Status := 'Cancel';
          Exit;
        end;

        SetLength(Nodes, Length(Nodes) + 1);
        Nodes[Length(Nodes) - 1].Name := 'y';
        repeat
          Nodes[Length(Nodes) - 1].Name := Nodes[Length(Nodes) - 1].Name + Alhoritm[CharId];
          Inc(CharId);
        until not (Alhoritm[CharId] in ['0'..'9']);

        SetLength(Conn, Length(Conn) + 1);
        SetLength(Conn[Length(Conn) - 1], 1);
        Conn[Length(Conn) - 1][0] := Length(Nodes);

        AllowedChars := ['x', 'X', 'y', 'Y', 'V', 'v', '^'];
      end;
      '^': begin
        Inc(CharId);
        if not (Alhoritm[CharId] in ['0'..'9'])
        then begin
          if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Ожидается индекс.', Alhoritm)
          then Status := 'Repeat'
          else Status := 'Cancel';
          Exit;
        end;

        Conn[Length(Conn) - 1][Length(Conn[Length(Conn) - 1]) - 1] := 0;
        repeat
          Conn[Length(Conn) - 1][Length(Conn[Length(Conn) - 1]) - 1] := Conn[Length(Conn) - 1][Length(Conn[Length(Conn) - 1]) - 1] * 10 + StrToInt(Alhoritm[CharId]);
          Inc(CharId);
        until not (Alhoritm[CharId] in ['0'..'9']);
        Conn[Length(Conn) - 1][Length(Conn[Length(Conn) - 1]) - 1] := - Conn[Length(Conn) - 1][Length(Conn[Length(Conn) - 1]) - 1];

        AllowedChars := ['V', 'v'];
      end;
      'v', 'V': begin
        Inc(CharId);
        if not (Alhoritm[CharId] in ['0'..'9'])
        then begin
          if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Ожидается индекс.', Alhoritm)
          then Status := 'Repeat'
          else Status := 'Cancel';
          Exit;
        end;

        LinkId := 0;
        repeat
          LinkId := LinkId * 10 + StrToInt(Alhoritm[CharId]);
          Inc(CharId);
        until not (Alhoritm[CharId] in ['0'..'9']);

        if High(Links) < LinkId then AllocateLink;
        if Links[LinkId] > 0
        then begin
          if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Повторное использование метки.', Alhoritm)
          then Status := 'Repeat'
          else Status := 'Cancel';
          Exit;
        end;

        Links[LinkId] := Length(Nodes);

        AllowedChars := ['x', 'X', 'y', 'Y', 'V'];
      end;
      else begin
        if InputQuery('Ошибка в алгоритме: Символ №' + IntToStr(CharId), 'Данный символ здесь недопустим.', Alhoritm)
        then Status := 'Repeat'
        else Status := 'Cancel';
        Exit;
      end;
    end;
  end;

  SetLength(Nodes, Length(Nodes) + 1);
  Nodes[High(Nodes)].Name := 'K';

  for i := 0 to high(Conn) do
  begin
    if Conn[i][0] < 0 then Conn[i][0] := Links[- Conn[i][0]];
    if Conn[i][1] < 0 then Conn[i][1] := Links[- Conn[i][1]];
  end;
  Links := nil;

  FindWays;

  i := CheckCycles;
  if i >= 0
  then begin
    if InputQuery('Ошибка в алгоритме', 'Данный цикл не является корректным:' + CycleToStr(i), Alhoritm)
    then Status := 'Repeat'
    else Status := 'Cancel';
    Exit;
  end;

  Status := 'Success';
end;

function TAnalyzer.CheckH: boolean;
begin
  Result := (Alhoritm[1] = 'H');
end;

function TAnalyzer.CheckK: boolean;
begin
  Result := Alhoritm[Length(Alhoritm)] = 'K';
end;

procedure TAnalyzer.FindWays;
var
  WayId: integer;
procedure CopyWay(var Src, Dst: TWay);
var
  i: integer;
begin
  SetLength(Src, Length(Dst));
  for i := 0 to High(Dst) do Src[i] := Dst[i];
end;
function AlreadyInWay(Way: TWay): boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to high(Way) - 1 do if Way[i] = Way[High(Way)] then Result := true;
end;
begin
  Cycles := nil;
  SetLength(Ways, 1);
  SetLength(Ways[0], 1);
  WayId := 0;
  Ways[0][0] := 0;

  while WayId <= High(Ways) do
  begin
    while Nodes[Ways[WayId][High(Ways[WayId])]].Name <> 'K' do
    begin
      if AlreadyInWay(Ways[WayId])
      then begin
        SetLength(Cycles, Length(Cycles) + 1);
        Cycles[High(Cycles)] := WayId;

        Break;
      end;

      if Length(Conn[Ways[WayId][High(Ways[WayId])]]) = 2
      then begin
        SetLength(Ways, Length(Ways) + 1);
        CopyWay(Ways[High(Ways)], Ways[WayId]);
        SetLength(Ways[High(Ways)], Length(Ways[High(Ways)]) + 1);
        Ways[High(Ways)][High(Ways[High(Ways)])] := Conn[Ways[WayId][High(Ways[WayId])]][1];
      end;

      SetLength(Ways[WayId], Length(Ways[WayId]) + 1);
      Ways[WayId][High(Ways[WayId])] := Conn[Ways[WayId][High(Ways[WayId]) - 1]][0];
    end;
    Inc(WayId);
  end;
end;

function TAnalyzer.GetCycleStart(WayId: integer): integer;
begin
  Result := 0;
  while Ways[WayId][Result] <> Ways[WayId][High(Ways[WayId])] do Inc(Result);
end;

function TAnalyzer.CheckCycles: integer;
var
  i: integer;
begin
  Result := -1;
  if Length(Cycles) > 0 then for i := High(Cycles) downto 0 do if not IsCorrectCycle(i) then Result := i;
end;

function TAnalyzer.IsCorrectCycle(CycleId: integer): boolean;
var
  HasOperatorNode, HasConditionNode: boolean;
  i: integer;
function IsOperatorNode(NodeId: integer): boolean;
begin
  Result := Nodes[NodeId].Name[1] = 'y';
end;
function IsConditionNode(NodeId: integer): boolean;
begin
  Result := Nodes[NodeId].Name[1] = 'x';
end;
function HasExit(CycleId: integer): boolean;
var
  i: integer;
function BelongsToWay(NodeId: integer): boolean;
var
  WayId, i: integer;
begin
  Result := false;
  for WayId := 0 to High(Ways) do
    if not IsCycle(WayId) then
      for i := 0 to High(Ways[WayId]) do if Ways[WayId][i] = NodeId then Result := true;
end;
begin
  Result := false;
  for i := GetCycleStart(CycleId) to high(Ways[Cycles[CycleId]]) - 1 do
    if IsConditionNode(Ways[Cycles[CycleId]][i]) and BelongsToWay(Ways[Cycles[CycleId]][i]) then Result := true;
end;
begin
  HasOperatorNode := false;
  HasConditionNode := false;
  for i := GetCycleStart(CycleId) to high(Ways[Cycles[CycleId]]) - 1 do
  begin
    if IsOperatorNode(Ways[Cycles[CycleId]][i]) then HasOperatorNode := true;
    if IsConditionNode(Ways[Cycles[CycleId]][i]) then HasConditionNode := true;
  end;
  Result := HasOperatorNode and HasConditionNode and HasExit(CycleId);
end;

function TAnalyzer.CycleToStr(CycleId: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := GetCycleStart(CycleId) to High(Ways[Cycles[CycleId]]) do Result := Result + Nodes[Ways[Cycles[CycleId]][i]].Name;
end;

function TAnalyzer.IsCycle(WayId: integer): boolean;
var
  i: integer;
begin
  Result := false;
  if Length(Cycles) > 0
  then begin
    for i := 0 to High(Cycles) do if Cycles[i] = WayId then Result := true; 
  end;
end;

end.
