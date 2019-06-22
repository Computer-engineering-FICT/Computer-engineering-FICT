unit UnitStatForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, ComCtrls;

type
  TFormStat = class(TForm)
    PageControl1: TPageControl;
    TabSheetDistribution: TTabSheet;
    ChartDistribution: TChart;
    SeriesQueue1: TLineSeries;
    SeriesQueue2: TLineSeries;
    SeriesQueue3: TLineSeries;
    SeriesQueue4: TLineSeries;
    TabSheetCPULoad: TTabSheet;
    ChartCPULoad: TChart;
    SeriesCPULoad1: TLineSeries;
    SeriesCPULoad2: TLineSeries;
    SeriesCPULoad3: TLineSeries;
    SeriesCPULoad4: TLineSeries;
    TabSheetTasksServed: TTabSheet;
    ChartTasksServed: TChart;
    SeriesTasksServed1: TLineSeries;
    SeriesTasksServed2: TLineSeries;
    SeriesTasksServed3: TLineSeries;
    SeriesTasksServed4: TLineSeries;
    TabSheetQueueLength: TTabSheet;
    ChartQueueLength: TChart;
    SeriesQueueLength1: TLineSeries;
    SeriesQueueLength2: TLineSeries;
    SeriesQueueLength3: TLineSeries;
    SeriesQueueLength4: TLineSeries;
    TabSheetTaskWait: TTabSheet;
    Chart1: TChart;
    SeriesTaskWait1: TLineSeries;
    SeriesTaskWait2: TLineSeries;
    SeriesTaskWait3: TLineSeries;
    SeriesTaskWait4: TLineSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStat: TFormStat;

implementation

{$R *.DFM}

end.
