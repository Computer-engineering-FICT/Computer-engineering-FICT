unit uMarker;

interface
uses
  utypes,
  Math;
type
  TRS = class
    R, S: char;
    procedure GetRS(QIn, QOut: boolean);
  end;

  TIOTable = array of string;

  TNodeMarks = array of integer;

  TTableRec = record
    Source, Dest: integer;
    Input, Output: array of boolean;
  end;

  TTable = array of TTableRec;

  TAutomat = class
    NodeMarks: TNodeMarks;
    StatesCount: integer;
    Table: TTable;
    procedure MarkNodes(Nodes: TNodes; Conn: TConn); virtual; abstract;
    procedure FillTable(Nodes: TNodes; Conn: TConn; XTable: TIOTable; YTable: TIOTable); virtual; abstract;
  end;

  TMili = class(TAutomat)
    procedure MarkNodes(Nodes: TNodes; Conn: TConn); override;
    procedure FillTable(Nodes: TNodes; Conn: TConn; XTable: TIOTable; YTable: TIOTable); override;
    function CodeCount: integer;
  end;

  TMur = class(TAutomat)
    procedure MarkNodes(Nodes: TNodes; Conn: TConn); override;
    procedure FillTable(Nodes: TNodes; Conn: TConn; XTable: TIOTable; YTable: TIOTable); override;
  end;

  TMarker = class
    Mili: TMili;
    Mur: TMur;
    Nodes: TNodes;
    Conn: TConn;
    XTable, YTable: TIOtable;
    procedure Mark;
    procedure BuildTable(var Table: TIOTable; Operator: char);
  end;
var
  Marker: TMarker;
  RS: TRS;
implementation

procedure TMarker.Mark;
begin
  Mili.MarkNodes(Nodes, Conn);
  Mur.MarkNodes(Nodes, Conn);

  BuildTable(XTable, 'x');
  BuildTable(YTable, 'y');

  Mili.FillTable(Nodes, Conn, XTable, YTable);
  Mur.FillTable(Nodes, Conn, XTable, YTable);
end;

procedure TMili.MarkNodes(Nodes: TNodes; Conn: TConn);
var
  i, j, MaxNodeMark: integer;
begin
  SetLength(NodeMarks, Length(Nodes));
  for i := 0 to High(NodeMarks) do NodeMarks[i] := 0;
  NodeMarks[1] := 1;
  NodeMarks[High(NodeMarks)] := 1;

  MaxNodeMark := 1;

  for i := 0 to High(NodeMarks) - 1 do
    if Nodes[i].Name[1] = 'y'
    then for j := 0 to High(Conn[i]) do
      if NodeMarks[Conn[i][j]] = 0
      then begin
        Inc(MaxNodeMark);
        NodeMarks[Conn[i][j]] := MaxNodeMark;
      end;

  StatesCount := MaxNodeMark;
end;

procedure TMur.MarkNodes(Nodes: TNodes; Conn: TConn);
begin

end;

procedure TMili.FillTable(Nodes: TNodes; Conn: TConn; XTable: TIOTable; YTable: TIOTable);
var
  NodeMarkId, DirId: integer;
  Directions: array of array of integer;
procedure GetDierctions(NodeMarkId: integer);
var
  DirId: integer;
procedure AddDir(LastNode: integer);
var
  i: integer;
begin
  SetLength(Directions, Length(Directions) + 1);
  SetLength(Directions[High(Directions)], Length(Directions[DirId]));
  for i := 0 to High(Directions[DirId]) - 1 do Directions[High(Directions)][i] := Directions[DirId][i];
  Directions[High(Directions)][High(Directions[High(Directions)])] := LastNode; 
end;
begin
  SetLength(Directions, 1);
  SetLength(Directions[0], 1);
  Directions[0][0] := NodeMarks[NodeMarkId];

  DirId := 0;
  while DirId <= High(Directions) do
  begin
    repeat
      SetLength(Directions[DirId], Length(Directions[DirId]) + 1);
      Directions[DirId][High(Directions[DirId])] := Conn[Directions[DirId][High(Directions[DirId]) - 1]][0];

      if Length(Conn[Directions[DirId][High(Directions[DirId]) - 1]]) > 1 then AddDir(Conn[Directions[DirId][High(Directions[DirId]) - 1]][1]);

    until NodeMarks[Directions[DirId][High(Directions[DirId])]] > 0;
    Inc(DirId);
  end;
end;
procedure FillIO(var Input, Output: array of boolean);
var
  NodeId: integer;
function GetId(Table: TIOTable; Pattern: string): integer;
begin
  Result := 0;
  while Table[Result] <> Pattern do Inc(Result);
end;
begin
  for NodeId := 0 to High(Directions[DirId]) - 1 do
    case Nodes[Directions[DirId][NodeId]].Name[1] of
      'x': Input[GetId(XTable, Nodes[Directions[DirId][NodeId]].Name)] := (Conn[Directions[DirId][NodeId]][0] = Directions[DirId][NodeId + 1]);
      'y': Output[GetId(YTable, Nodes[Directions[DirId][NodeId]].Name)] := true;
    end;
end;
begin
  Table := nil;
  for NodeMarkId := 1 to StatesCount do
  begin
    GetDierctions(NodeMarkId);
    for DirId := 0 to High(Directions) do
    begin
      SetLength(Table, Length(Table) + 1);
      Table[High(Table)].Source := NodeMarkId;
      Table[High(Table)].Dest := NodeMarks[Directions[DirId][High(Directions[DirId])]];
      SetLength(Table[High(Table)].Input, Length(XTable));
      SetLength(Table[High(Table)].Output, Length(YTable));
      FillIO(Table[High(Table)].Input, Table[High(Table)].Output);
    end;

  end;
end;

procedure TMur.FillTable(Nodes: TNodes; Conn: TConn; XTable: TIOTable; YTable: TIOTable);
begin

end;

procedure TMarker.BuildTable(var Table: TIOTable; Operator: char);
var
  i: integer;
function IsNew(NodeId: integer): boolean;
var
  i: integer;
begin
  Result := true;

  for i := 0 to High(Table) do
    if table[i] = Nodes[NodeId].Name then Result := false;
end;
begin
  Table := nil;

  for i := 1 to High(Nodes) do
    if (Nodes[i].Name[1] = Operator) and IsNew(i)
    then begin
      SetLength(Table, Length(Table) + 1);
      Table[High(Table)] := Nodes[i].Name;
    end;
end;

function TMili.CodeCount: integer;
begin
  Result := Ceil(Ln(StatesCount) / Ln(2));
end;

procedure TRS.GetRS(QIn, QOut: boolean);
begin
  S := '0';
  if QOut
  then if QIn
    then S := '-'
    else S := '1';

  R := '0';
  if not QOut
  then if QIn
    then R := '1'
    else R := '-';
end;

begin
  RS := TRS.Create;

end.
