unit PeakLinesDraw;

interface

type
  TPeakLinesDraw = class(TObject)
  private
    FSquare : Integer;
    procedure PutSquare(ASquare : Integer);
  public
    property Square : Integer write PutSquare;
  end;

implementation

//PRIVATE TPeakLinesDraw
procedure PutSquare(ASquare : Integer);
begin
  FSquare:= ASquare;
end;

end.
