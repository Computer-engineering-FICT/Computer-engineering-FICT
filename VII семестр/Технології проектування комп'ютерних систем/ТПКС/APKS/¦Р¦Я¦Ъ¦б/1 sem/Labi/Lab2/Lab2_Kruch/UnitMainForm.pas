unit UnitMainForm;

interface

uses
  UnitModeler, UnitStatForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls;

type
  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    GroupBox4: TGroupBox;
    GroupBox1: TGroupBox;
    LabelCPUMode1: TLabel;
    Image1: TImage;
    GroupBoxQueue1: TGroupBox;
    Label1: TLabel;
    LabelQueue1: TLabel;
    LabelQueueAfterSP: TLabel;
    Label4: TLabel;
    CheckBoxSpecPacket: TCheckBox;
    GroupBox5: TGroupBox;
    GroupBox3: TGroupBox;
    LabelCPUMode2: TLabel;
    Image2: TImage;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    LabelQueue2: TLabel;
    GroupBox6: TGroupBox;
    Image3: TImage;
    GroupBox7: TGroupBox;
    LabelCPUMode3: TLabel;
    GroupBox8: TGroupBox;
    Label9: TLabel;
    LabelQueue3: TLabel;
    GroupBox9: TGroupBox;
    Image4: TImage;
    GroupBox10: TGroupBox;
    LabelCPUMode4: TLabel;
    GroupBox11: TGroupBox;
    Label13: TLabel;
    LabelQueue4: TLabel;
    Label15: TLabel;
    ComboBox1: TComboBox;
    Label19: TLabel;
    Edit1: TEdit;
    Label16: TLabel;
    ComboBox2: TComboBox;
    Label20: TLabel;
    Edit2: TEdit;
    Label17: TLabel;
    ComboBox3: TComboBox;
    Label21: TLabel;
    Edit3: TEdit;
    Label18: TLabel;
    ComboBox4: TComboBox;
    Label22: TLabel;
    Edit4: TEdit;
    GroupBox12: TGroupBox;
    ButtonStart: TButton;
    ButtonTakt: TButton;
    Label23: TLabel;
    LabelTakt: TLabel;
    ButtonRun: TButton;
    ButtonStat: TButton;
    Label25: TLabel;
    EditSpecLambda: TEdit;
    Label2: TLabel;
    LabelServed1: TLabel;
    Label5: TLabel;
    LabelCPULoad1: TLabel;
    Label8: TLabel;
    LabelServed2: TLabel;
    Label11: TLabel;
    LabelCPULoad2: TLabel;
    Label14: TLabel;
    LabelServed3: TLabel;
    Label26: TLabel;
    LabelCPULoad3: TLabel;
    Label28: TLabel;
    LabelServed4: TLabel;
    Label30: TLabel;
    LabelCPULoad4: TLabel;
    Label3: TLabel;
    LabelTaskWait1: TLabel;
    Label10: TLabel;
    LabelTaskWait2: TLabel;
    Label24: TLabel;
    LabelTaskWait3: TLabel;
    Label29: TLabel;
    LabelTaskWait4: TLabel;
    procedure ButtonStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonTaktClick(Sender: TObject);
    procedure ButtonStatClick(Sender: TObject);
    procedure ButtonRunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.DFM}

procedure TFormMain.ButtonStartClick(Sender: TObject);
procedure ClearAll;
begin
  FormStat.SeriesQueue1.Clear;
  FormStat.SeriesQueue2.Clear;
  FormStat.SeriesQueue3.Clear;
  FormStat.SeriesQueue4.Clear;

  FormStat.SeriesCPULoad1.Clear;
  FormStat.SeriesCPULoad2.Clear;
  FormStat.SeriesCPULoad3.Clear;
  FormStat.SeriesCPULoad4.Clear;

  FormStat.SeriesTasksServed1.Clear;
  FormStat.SeriesTasksServed2.Clear;
  FormStat.SeriesTasksServed3.Clear;
  FormStat.SeriesTasksServed4.Clear;

  FormStat.SeriesQueueLength1.Clear;
  FormStat.SeriesQueueLength2.Clear;
  FormStat.SeriesQueueLength3.Clear;
  FormStat.SeriesQueueLength4.Clear;

  FormStat.SeriesTaskWait1.Clear;
  FormStat.SeriesTaskWait2.Clear;
  FormStat.SeriesTaskWait3.Clear;
  FormStat.SeriesTaskWait4.Clear;

  LabelCPUMode1.Caption := 'Ожидание';
  LabelCPUMode2.Caption := 'Ожидание';
  LabelCPUMode3.Caption := 'Ожидание';
  LabelCPUMode4.Caption := 'Ожидание';

  LabelQueue1.Caption := '0';
  LabelQueue2.Caption := '0';
  LabelQueue3.Caption := '0';
  LabelQueue4.Caption := '0';

  LabelQueueAfterSP.Caption := '0';
  LabelTakt.Caption := '0';

  ButtonTakt.Enabled := true;
  ButtonRun.Enabled := true;
end;
begin
  ClearAll;

  Configurator.SpecPacketCPUId := 0;
  Configurator.SpecPacketTime := 1/StrToFloat(EditSpecLambda.Text);
  SetLength(Configurator.ConfigNodeList, 4);

  Configurator.ConfigNodeList[0].Lambda := StrToFloat(Edit1.Text);
  Configurator.ConfigNodeList[0].Distribution := ComboBox1.ItemIndex;

  Configurator.ConfigNodeList[1].Lambda := StrToFloat(Edit2.Text);
  Configurator.ConfigNodeList[1].Distribution := ComboBox2.ItemIndex;

  Configurator.ConfigNodeList[2].Lambda := StrToFloat(Edit3.Text);
  Configurator.ConfigNodeList[2].Distribution := ComboBox3.ItemIndex;

  Configurator.ConfigNodeList[3].Lambda := StrToFloat(Edit4.Text);
  Configurator.ConfigNodeList[3].Distribution := ComboBox4.ItemIndex;

  Modeler.Model;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 1;
  ComboBox3.ItemIndex := 2;
  ComboBox4.ItemIndex := 3;
end;

procedure TFormMain.ButtonTaktClick(Sender: TObject);
procedure UpdateChartCPULoad;
begin
  FormStat.SeriesCPULoad1.AddXY(UnitModeler.Time, Modeler.Nodes[0].CPULoad);
  FormStat.SeriesCPULoad2.AddXY(UnitModeler.Time, Modeler.Nodes[1].CPULoad);
  FormStat.SeriesCPULoad3.AddXY(UnitModeler.Time, Modeler.Nodes[2].CPULoad);
  FormStat.SeriesCPULoad4.AddXY(UnitModeler.Time, Modeler.Nodes[3].CPULoad);
end;
procedure UpdateChartTasksServed;
begin
  FormStat.SeriesTasksServed1.AddXY(UnitModeler.Time, Modeler.Nodes[0].ServedTasksCount);
  FormStat.SeriesTasksServed2.AddXY(UnitModeler.Time, Modeler.Nodes[1].ServedTasksCount);
  FormStat.SeriesTasksServed3.AddXY(UnitModeler.Time, Modeler.Nodes[2].ServedTasksCount);
  FormStat.SeriesTasksServed4.AddXY(UnitModeler.Time, Modeler.Nodes[3].ServedTasksCount);
end;
procedure UpdateChartQueueLength;
begin
  FormStat.SeriesQueueLength1.AddXY(UnitModeler.Time, Modeler.Nodes[0].QueueLength + Modeler.Nodes[0].QueueAfterSPLength);
  FormStat.SeriesQueueLength2.AddXY(UnitModeler.Time, Modeler.Nodes[1].QueueLength);
  FormStat.SeriesQueueLength3.AddXY(UnitModeler.Time, Modeler.Nodes[2].QueueLength);
  FormStat.SeriesQueueLength4.AddXY(UnitModeler.Time, Modeler.Nodes[3].QueueLength);
end;
procedure UpdateChartTaskWait;
begin
  FormStat.SeriesTaskWait1.AddXY(UnitModeler.Time, Modeler.Nodes[0].MiddleTaskWaitTime);
  FormStat.SeriesTaskWait2.AddXY(UnitModeler.Time, Modeler.Nodes[1].MiddleTaskWaitTime);
  FormStat.SeriesTaskWait3.AddXY(UnitModeler.Time, Modeler.Nodes[2].MiddleTaskWaitTime);
  FormStat.SeriesTaskWait4.AddXY(UnitModeler.Time, Modeler.Nodes[3].MiddleTaskWaitTime);
end;
begin
  Modeler.Takt;

  LabelTakt.Caption := IntToStr(Round(UnitModeler.Time));

  LabelServed1.Caption := IntToStr(Modeler.Nodes[0].ServedTasksCount);
  LabelServed2.Caption := IntToStr(Modeler.Nodes[1].ServedTasksCount);
  LabelServed3.Caption := IntToStr(Modeler.Nodes[2].ServedTasksCount);
  LabelServed4.Caption := IntToStr(Modeler.Nodes[3].ServedTasksCount);

  UpdateChartTasksServed;

  LabelCPULoad1.Caption := IntToStr(Modeler.Nodes[0].CPULoad) + '%';
  LabelCPULoad2.Caption := IntToStr(Modeler.Nodes[1].CPULoad) + '%';
  LabelCPULoad3.Caption := IntToStr(Modeler.Nodes[2].CPULoad) + '%';
  LabelCPULoad4.Caption := IntToStr(Modeler.Nodes[3].CPULoad) + '%';

  UpdateChartCPULoad;

  if Modeler.Nodes[0].CPUIsBusy then LabelCPUMode1.Caption := 'Обработка' else LabelCPUMode1.Caption := 'Ожидание';
  if Modeler.Nodes[1].CPUIsBusy then LabelCPUMode2.Caption := 'Обработка' else LabelCPUMode2.Caption := 'Ожидание';
  if Modeler.Nodes[2].CPUIsBusy then LabelCPUMode3.Caption := 'Обработка' else LabelCPUMode3.Caption := 'Ожидание';
  if Modeler.Nodes[3].CPUIsBusy then LabelCPUMode4.Caption := 'Обработка' else LabelCPUMode4.Caption := 'Ожидание';

  LabelQueue1.Caption := IntToStr(Modeler.Nodes[0].QueueLength);
  LabelQueue2.Caption := IntToStr(Modeler.Nodes[1].QueueLength);
  LabelQueue3.Caption := IntToStr(Modeler.Nodes[2].QueueLength);
  LabelQueue4.Caption := IntToStr(Modeler.Nodes[3].QueueLength);

  UpdateChartQueueLength;

  LabelTaskWait1.Caption := FloatToStrF(Modeler.Nodes[0].MiddleTaskWaitTime, ffGeneral, 5, 5);
  LabelTaskWait2.Caption := FloatToStrF(Modeler.Nodes[1].MiddleTaskWaitTime, ffGeneral, 5, 5);
  LabelTaskWait3.Caption := FloatToStrF(Modeler.Nodes[2].MiddleTaskWaitTime, ffGeneral, 5, 5);
  LabelTaskWait4.Caption := FloatToStrF(Modeler.Nodes[3].MiddleTaskWaitTime, ffGeneral, 5, 5);

  UpdateChartTaskWait;

  CheckBoxSpecPacket.Checked := Modeler.Nodes[0].SpecPacketInQueue;
  LabelQueueAfterSP.Caption := IntToStr(Modeler.Nodes[0].QueueAfterSPLength);

  FormMain.Refresh;

  if SystemStopped
  then begin
    LabelCPUMode1.Caption := 'Останов';
    LabelCPUMode2.Caption := 'Останов';
    LabelCPUMode3.Caption := 'Останов';
    LabelCPUMode4.Caption := 'Останов';

    ButtonTakt.Enabled := false;
    ButtonRun.Enabled := false;
  end;
end;

procedure TFormMain.ButtonStatClick(Sender: TObject);
procedure PrepareDistributionPage;
var
  i: integer;
function CountTasks(Low, High: real; Queue: TQueue): integer;
var
  i: integer;
begin
  Result := 0;
  i := 0;
  while Queue[i].StartTime < Low do Inc(i);
  while (i + Result < Length(Queue)) and (Queue[i + Result].StartTime < High) do Inc(Result);
end;
begin
  FormStat.SeriesQueue1.Clear;
  FormStat.SeriesQueue2.Clear;
  FormStat.SeriesQueue3.Clear;
  FormStat.SeriesQueue4.Clear;

  for i := 1 to Round(UnitModeler.Time) do
  begin
    FormStat.SeriesQueue1.AddXY(i, CountTasks(i - 1, i, Modeler.Nodes[0].Queue) + 0);
    FormStat.SeriesQueue2.AddXY(i, CountTasks(i - 1, i, Modeler.Nodes[1].Queue) + 0.1);
    FormStat.SeriesQueue3.AddXY(i, CountTasks(i - 1, i, Modeler.Nodes[2].Queue) + 0.2);
    FormStat.SeriesQueue4.AddXY(i, CountTasks(i - 1, i, Modeler.Nodes[3].Queue) + 0.3);
  end;
end;
begin
  PrepareDistributionPage;
  FormStat.ShowModal;
end;

procedure TFormMain.ButtonRunClick(Sender: TObject);
begin
  while ButtonTakt.Enabled do ButtonTakt.Click;
end;

end.
