unit mtrx;

interface
type
  TMatrix = class
  Protected
    Matrix: array of byte;
    function GetValue(row, col: Integer): byte;
    procedure SetValue(row, col: Integer; Value: byte);
  Public
    Rows, Cols: Integer;
    constructor Create(Rows, Cols: Word);
    destructor Destroy; override;
    property Values[row, col: Integer]: byte read GetValue write SetValue;
  end;
implementation

{ TMatrix }

constructor TMatrix.Create(Rows, Cols: Word);
begin
  SetLength(Matrix, Rows * Cols * sizeof(byte));
  self.Rows := Rows; self.Cols := Cols;
end;

destructor TMatrix.Destroy;
begin
  SetLength(Matrix, 0);
end;

function TMatrix.GetValue(row, col: Integer): byte;
begin
  Result := 255;
  if (row > -1) and (row < Rows) then
    if (col > -1) and (col < Cols) then
      Result := Matrix[row*Cols+col];
end;

procedure TMatrix.SetValue(row, col: Integer; Value: byte);
begin
  if (row > -1) and (row < Rows) then
    if (col > -1) and (col < Cols) then
      Matrix[row*Cols+col] := Value;
end;

end.
