unit FormStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ComCtrls,
  UnitGenerators, StdCtrls;

type
  TStatForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    c1: TChart;
    Series1: TLineSeries;
    c2: TChart;
    LineSeries1: TLineSeries;
    c3: TChart;
    LineSeries2: TLineSeries;
    c4: TChart;
    LineSeries3: TLineSeries;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  public
    lambda : real;
    procedure Reset;
end;

var
  StatForm: TStatForm;

implementation

{$R *.dfm}

procedure TStatForm.Reset;
var
  Gen: TGenerator;
  i: integer;
begin
  Gen := TGenerator.Create;
  Gen.Setup(DistCongruent, lambda);
  c1.SeriesList[0].Clear;
  for i:=0 to 100 do c1.SeriesList[0].AddXY(i,Gen.Generate);
  Gen.Setup(DistErlango, lambda);
  c2.SeriesList[0].Clear;
  for i:=0 to 100 do c2.SeriesList[0].AddXY(i,Gen.Generate);
  Gen.Setup(DistExp, lambda);
  c3.SeriesList[0].Clear;
  for i:=0 to 100 do c3.SeriesList[0].AddXY(i,Gen.Generate);
end;

procedure TStatForm.FormCreate(Sender: TObject);
begin
  Lambda := 0.5;
end;

procedure TStatForm.Button1Click(Sender: TObject);
begin
  lambda := StrToFloat(Edit1.Text);
  Reset;
end;

end.
