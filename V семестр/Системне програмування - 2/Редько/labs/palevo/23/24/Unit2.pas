unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, grph, math;
const
  PEAKSIZE = 25;
  PEAKRAD = PEAKSIZE div 2;
  SPACE = PEAKSIZE * 2;

type
  TGraphView = class(TForm)
    Image: TImage;
  private
    { Private declarations }
    Graph: TGraph;
    Peaks: array of TPoint;
    grWidth, grHeight: Longint;
  public
    { Public declarations }
    procedure DrawGraph( );
    constructor CreateParented(ParentWindow: HWnd; grph: TGraph = Nil);
    destructor Destroy( ); override;
  end;

implementation

{$R *.DFM}

{ TGraphView }

constructor TGraphView.CreateParented(ParentWindow: HWnd; grph: TGraph = Nil);
var
  tmpRow: TRow;
  tmpPeak: TPeak;
  CurRow: Integer;
  CurPeak: Integer;
  Delta: Integer;
begin
  inherited CreateParented(ParentWindow);
  if grph <> Nil then
  begin
    Graph := grph;
    grWidth := 0;
    SetLength(Peaks, Graph.TotalPeaks);
    CurRow := SPACE;
    tmpRow := Graph.Rows;
    while tmpRow <> Nil do
    begin
      Delta := (tmpRow.PeaksCount-1) * SPACE;
      if Delta > grWidth then
        grWidth := Delta;
      CurPeak := - Delta div 2;
      tmpPeak := tmpRow.Peaks;
      while tmpPeak <> Nil do
      begin
        Peaks[tmpPeak.num].x := CurPeak;
        Peaks[tmpPeak.num].y := CurRow;
        CurPeak := CurPeak + SPACE;
        tmpPeak := tmpPeak.next;
      end;
      CurRow := CurRow + SPACE;
      tmpRow := tmpRow.next;
    end;
    grHeight := CurRow + SPACE;
    grWidth := grWidth + 4*SPACE;
    Image.ClientWidth := grWidth;
    Image.ClientHeight := grHeight;
    Image.Width := grWidth;
    Image.Height := grHeight;
    Image.Update;
  end;
end;

destructor TGraphView.Destroy;
begin
  Graph.Free( );
  inherited;
end;

procedure TGraphView.DrawGraph( );
var
  x, y, x1, x2, x3, x4, y1, y2, y3, y4, delta: Integer;
  tmpRow: TRow;
  tmpPeak: TPeak;
  tmpLink: TLink;
begin
  if Graph = Nil then
    exit;
  x := grWidth div 2;
  y := SPACE div 2;
  tmpRow := Graph.Rows;
  while tmpRow <> Nil do
  begin
    tmpPeak := tmpRow.Peaks;
    while tmpPeak <> Nil do
    begin
      tmpLink := tmpPeak.Links;
      with Image.Canvas do
      begin
        delta := 1;
        while tmpLink <> Nil do
        begin
          y1 := Peaks[tmpPeak.num].y;
          y2 := 2 * Peaks[tmpLink.link].y - Peaks[tmpPeak.num].y;
          x3 := max(Peaks[tmpPeak.num].x, Peaks[tmpLink.link].x);
          x4 := min(Peaks[tmpPeak.num].x, Peaks[tmpLink.link].x);
          if Peaks[tmpPeak.num].x > Peaks[tmpLink.link].x then
          begin // x1 > x2
            x1 := Peaks[tmpLink.link].x;
            x2 := 2 * Peaks[tmpPeak.num].x - Peaks[tmpLink.link].x;
            y3 := Peaks[tmpPeak.num].y;
            y4 := Peaks[tmpLink.link].y;
          end
          else if Peaks[tmpPeak.num].x < Peaks[tmpLink.link].x then
          begin // x2 > x1
            x1 := 2 * Peaks[tmpPeak.num].x - Peaks[tmpLink.link].x;
            x2 := Peaks[tmpLink.link].x;
            y3 := Peaks[tmpLink.link].y;
            y4 := Peaks[tmpPeak.num].y;
          end
          else //x1 = x2
          begin
            y2 := Peaks[tmpLink.link].y;
            x1 := Peaks[tmpPeak.num].x - SPACE;
            x2 := Peaks[tmpPeak.num].x + SPACE;
            x3 := Peaks[tmpPeak.num].x;
            x4 := Peaks[tmpLink.link].x;
            if Delta > 0 then
            begin
              y3 := Peaks[tmpPeak.num].y;
              y4 := Peaks[tmpLink.link].y;
            end
            else
            begin
              y3 := Peaks[tmpLink.link].y;
              y4 := Peaks[tmpPeak.num].y;
            end;
          end;
          Arc(x1+x, y1+y, x2+x, y2+y, x3+x, y3+y, x4+x, y4+y);
          Delta := -Delta;
          tmpLink := tmpLink.next;
        end;
        tmpPeak := tmpPeak.next;
      end;
    end;
    tmpPeak := tmpRow.Peaks;
    while tmpPeak <> Nil do
    begin
      with Image.Canvas do
      begin
        Ellipse(Peaks[tmpPeak.num].x+x-PEAKRAD, Peaks[tmpPeak.num].y+y-PEAKRAD,
          Peaks[tmpPeak.num].x+x+PEAKRAD, Peaks[tmpPeak.num].y+y+PEAKRAD);
        TextOut(Peaks[tmpPeak.num].x+x-8, Peaks[tmpPeak.num].y+y-8,
          Format('%2d', [tmpPeak.num]));
      end;
      tmpPeak := tmpPeak.next;
    end;
    tmpRow := tmpRow.next;
  end;
end;

end.
