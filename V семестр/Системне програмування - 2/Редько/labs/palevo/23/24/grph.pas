unit grph;
interface
uses mtrx;
type
  TLink = class
  Public
    link: Integer;
    next: TLink;
    constructor Create(num: Word);
    destructor Destroy( ); override;
  end;

  TPeak = class
  Public
    num: Integer;
    Links: TLink;
    LinksCount: Integer;
    next: TPeak;
    constructor Create( );
    destructor Destroy( ); override;
    procedure Add(link: TLink);
  end;

  TRow = class
  Public
    Peaks: TPeak;
    PeaksCount: Integer;
    next: TRow;
    constructor Create( );
    destructor Destroy( ); override;
    procedure Add(peak: TPeak);
  end;

  TGraph = class
  Public
    Rows: TRow;
    TotalPeaks: Integer;
    TotalLinks: Integer;
    TotalRows: Integer;
    constructor Create( ); overload;
    constructor Create(mtrx: TMatrix); overload;
    destructor Destroy( ); override;
    procedure Add(row: TRow);
  end;

implementation

{ TLink }

constructor TLink.Create;
begin
  next := Nil;
  link := num;
end;

destructor TLink.Destroy;
begin
  if next <> Nil then
    next.Destroy;
  inherited;
end;

{ TPeak }

procedure TPeak.Add(link: TLink);
var
  tmp: TLink;
begin
  if Links = Nil then
    Links := link
  else
  begin
    tmp := Links;
    while tmp.next <> Nil do
      tmp := tmp.next;
    tmp.next := link;
  end;
end;

constructor TPeak.Create;
begin
  Links := Nil;
  LinksCount := 0;
  next := Nil;
end;

destructor TPeak.Destroy;
begin
  if Links <> Nil then
    Links.Destroy( );
  if next <> Nil then
    next.Destroy( );
  inherited;
end;

{ TRow }

procedure TRow.Add(peak: TPeak);
var
  tmp: TPeak;
begin
  if Peaks = Nil then
    Peaks := peak
  else
  begin
    tmp := Peaks;
    while tmp.next <> Nil do
      tmp := tmp.next;
    tmp.next := peak;
  end;
end;

constructor TRow.Create;
begin
  Peaks := Nil;
  PeaksCount := 0;
  next := Nil;
end;

destructor TRow.Destroy;
begin
  if Peaks <> Nil then
    Peaks.Destroy( );
  if next <> Nil then
    next.Destroy( );
  inherited;
end;

{ TGraph }

procedure TGraph.Add(row: TRow);
var
  tmp: TRow;
begin
  if Rows = Nil then
    Rows := row
  else
  begin
    tmp := Rows;
    while tmp.next <> Nil do
      tmp := tmp.next;
    tmp.next := row;
  end;
end;

constructor TGraph.Create;
begin
  Rows := Nil;
  TotalPeaks := 0;
  TotalLinks := 0;
end;

constructor TGraph.Create(mtrx: TMatrix);
var
  CurCol, i: Integer;
  tmpRow: TRow;
  tmpPeak: TPeak;

  function IsColEmpty(col: Integer): byte;
  var
    i: Integer;
  begin
    if mtrx.Values[col, col] > 0 then
      Result := mtrx.Values[col, col]
    else
    begin
      for i := 0 to mtrx.Rows-1 do
        if ((mtrx.Values[i, col] = 1)
        and (mtrx.Values[i, i] <= (255 - TotalRows))
        ) then
          break;
      if i = mtrx.Rows then
        Result := 0
      else
        Result := 1;
    end;
  end;
begin
  TotalRows := 0;
  TotalPeaks := 0;
  repeat
    CurCol := 0;
    tmpRow := TRow.Create( );
    while CurCol < mtrx.Cols do
    begin
      if IsColEmpty(CurCol) = 0 then
      begin
        tmpPeak := TPeak.Create( );
        tmpPeak.num := CurCol;
        mtrx.Values[CurCol, CurCol] := 255 - TotalRows;
        for i := 0 to mtrx.Cols-1 do
          if mtrx.Values[CurCol, i] = 1 then
          begin
            tmpPeak.Add(TLink.Create(i));
            tmpPeak.LinksCount := tmpPeak.LinksCount + 1;
          end;
        tmpRow.Add(tmpPeak);
        tmpRow.PeaksCount := tmpRow.PeaksCount + 1;
      end;
      CurCol := CurCol + 1;
    end;
    TotalPeaks := TotalPeaks + tmpRow.PeaksCount;
    TotalRows := TotalRows + 1;
    if tmpRow.Peaks <> Nil then
      Add(tmpRow);
  until tmpRow.Peaks = Nil;
  if TotalPeaks < mtrx.Cols then
  begin
    Rows.Free( );
    Rows := Nil;
  end;
  for i := 0 to mtrx.Cols do
    mtrx.Values[i, i] := 0;
end;

destructor TGraph.Destroy;
begin
  if Rows <> Nil then
    Rows.Destroy( );
  inherited;
end;

end.
