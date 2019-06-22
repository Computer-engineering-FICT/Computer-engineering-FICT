unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  UnitGenerators;

const
  MaxTurnLength = 100;
//  ProcTimeQuant = 2;
  MaxPackageCount = 100;
  FinishTime = 1000;

type
  TMainForm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    eS1PC: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    eS2PC: TEdit;
    cbDistr1: TComboBox;
    Label5: TLabel;
    Label11: TLabel;
    cbDistr2: TComboBox;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    eS3PC: TEdit;
    cbDistr3: TComboBox;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    eEP: TEdit;
    Label1: TLabel;
    eP1State: TEdit;
    Label3: TLabel;
    eP1CPN: TEdit;
    Label6: TLabel;
    eP1PP: TEdit;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    eP2State: TEdit;
    eP2CPN: TEdit;
    eP2PP: TEdit;
    btReset: TButton;
    btStep: TButton;
    btFinish: TButton;
    btStat: TButton;
    Label14: TLabel;
    eS1Int: TEdit;
    Label15: TLabel;
    eS2Int: TEdit;
    Label16: TLabel;
    eS3Int: TEdit;
    btExit: TButton;
    Label17: TLabel;
    eTurn: TEdit;
    eP1TR: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    eP2TR: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btStepClick(Sender: TObject);
    procedure btResetClick(Sender: TObject);
    procedure btFinishClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure btStatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TPackage = class
  public
    Num : integer;
    PackLength: integer;
    WaitTime : integer;
    constructor Create(Num: integer; PackLength: integer);
    procedure IncWaitTime;
  end;

  TTurn = class
  public
    Count : integer;
    constructor Create;
    procedure Reset;
    function GetPackage: TPackage;
    function AddPackage(Package : TPackage): boolean;
    procedure Step;
  private
    Turn : array of TPackage;
    procedure Shift;
  end;

  TSource = class
    public
      GeneratedPackagesCount: integer;
      procedure Reset;
      procedure SetDistribution(Distr: integer);
      procedure SetIntensivity(Intensivity: real);
      function Step(var LastPackageNum: integer): TPackage;
    private
      Gen: TGenerator;
      Distribution: integer;
      Intensivity: real;
  end;

  TProcessor = class
    public
      IsEmpty: boolean;
      ProcessedPackagesCount : integer;
      procedure Reset;
      function GetPackNum: integer;
      function Step: TPackage;
      procedure SetPackage(Package: TPackage);
    private
      TimeReleased : integer;
      Package: TPackage;
  end;

  TPlaner = class
  public
    constructor Create;
    procedure UpdateText;
    procedure UpdateSourceData;
    procedure Reset;
    function Step: boolean;
    procedure Finish;
//    procedure Setup(Distribution)
    procedure Statistics;
  private
    LastPackageNum: integer;
    Sources: array[1..3] of TSource;
    Turn: TTurn;
    Processors: array[1..2] of TProcessor;
    SPCounts: array[1..3] of TEdit;
    Distributions: array [1..3] of TComboBox;
    Intensivities: array [1..3] of TEdit;
    ExpPackages: TEdit;
    States: array[1..2] of TEdit;
    CurrPacks: array[1..2] of TEdit;
    PPCounts: array[1..2] of TEdit;
    PTimeReleased: array[1..2] of TEdit;
    eTurnNum: TEdit;
    packages: TList;
    TurnNum: word;
  end;

var
  MainForm: TMainForm;
  Planer: TPlaner;

implementation

uses FormStatistics;

{$R *.dfm}

constructor TPackage.Create(Num: integer; PackLength: integer);
begin
  inherited Create;
  self.Num := Num;
  self.PackLength := PackLength;
end;

procedure TPackage.IncWaitTime;
begin
  inc(WaitTime);
end;

constructor TTurn.Create;
begin
  inherited Create;
  SetLength(Turn, MaxTurnLength);
  Count := 0;
end;

function TTurn.AddPackage(Package: TPackage): boolean;
begin
  if Count<MaxTurnLength then
  begin
    inc(Count);
    Turn[Count-1] := Package;
    result := true;
  end                    else
  begin
    Result := false;
  end;
end;

procedure TTurn.Step;
var
  i: integer;
begin
  for i:=0 to Count-1 do Turn[i].IncWaitTime;
end;

procedure TTurn.Reset;
var
  i: integer;
begin
  for i:=0 to Count-1 do Turn[i].Free;
  Count := 0;
end;

function TTurn.GetPackage: TPackage;
begin
  Result := nil;
  if count<>0 then
  begin
    Result := Turn[0];
    Shift;
  end;
end;

procedure TTurn.Shift;
var
  i: integer;
begin
  for i:=1 to Count-1 do Turn[i-1] := Turn[i];
  dec(Count);
end;

procedure TSource.Reset;
begin
  GeneratedPackagesCount := 0;
  Gen := TGenerator.Create;
  Gen.Setup(Distribution, Intensivity);
end;

procedure TSource.SetDistribution(Distr: integer);
begin
  Distribution := Distr;
  Gen.Setup(Distribution, Intensivity);
end;

procedure TSource.SetIntensivity(Intensivity: real);
begin
  self.Intensivity := Intensivity;
  Gen.Setup(Distribution, Intensivity);
end;

function TSource.Step(var LastPackageNum: integer): TPackage;
var
  PackLength: integer;
begin
  if Random < intensivity then
  begin
    inc(LastPackageNum);
    PackLength := 1+ trunc(Gen.Generate*3);
    result := TPackage.Create(LastPackageNum, PackLength);
    inc(GeneratedPackagesCount);
  end                     else
  begin
    result := nil;
  end;
end;

procedure TProcessor.Reset;
begin
  IsEmpty := true;
  ProcessedPackagesCount := 0;
  TimeReleased := 0;
  Package := nil;
end;

function TProcessor.GetPackNum: integer;
begin
  if Package <> nil
  then Result := Package.Num
  else Result := -1;
end;

procedure TProcessor.SetPackage(Package: TPackage);
begin
  self.Package := Package;
  TimeReleased := Package.PackLength;
  isEmpty := false;
end;

function TProcessor.Step: TPackage;
begin
  Result := nil;
  if Package = nil then exit;
  Dec(TimeReleased);
  if TimeReleased=0 then
  begin
    Result := Package;
    Package := nil;
    isEmpty := true;
    inc(ProcessedPackagesCount);
  end;
end;

constructor TPlaner.Create;
var
  i:integer;
begin
  inherited Create;
  with MainForm do
  begin
  SPCounts[1] := eS1PC;
  SPCounts[2] := eS2PC;
  SPCounts[3] := eS3PC;
  Distributions[1] := cbDistr1;
  Distributions[2] := cbDistr2;
  Distributions[3] := cbDistr3;
  Intensivities[1] := eS1Int;
  Intensivities[2] := eS2Int;
  Intensivities[3] := eS3Int;
  ExpPackages := eEP;
  States[1] := eP1State;
  States[2] := eP2State;
  CurrPacks[1] := eP1CPN;
  CurrPacks[2] := eP2CPN;
  PPCounts[1] := eP1PP;
  PPCounts[2] := eP2PP;
  eTurnNum := eTurn;
  PTimeReleased[1] := eP1TR;
  PTimeReleased[2] := eP2TR;
  end;
  for i:=1 to 3 do Sources[i] := TSource.Create;
  Turn := TTurn.Create;
  for i:=1 to 2 do Processors[i] := TProcessor.Create;
  packages := TList.Create();
  Reset;
end;

procedure TPlaner.UpdateText;
var
  i:integer;
begin
  eTurnNum.Text := IntToStr(TurnNum);
  for i:=1 to 3 do
  begin
    SPCounts[i].Text := IntToStr(Sources[i].GeneratedPackagesCount);
    Intensivities[i].Text := FloatToStrF(Sources[i].Intensivity, ffGeneral, 7, 5);
    Distributions[i].ItemIndex := Sources[i].Distribution;
  end;
  ExpPackages.Text := IntToStr(Turn.Count);
  for i:=1 to 2 do
  begin
    if Processors[i].isEmpty then
    begin
      States[i].Text := 'Empty';
      CurrPacks[i].Text := '';
      PTimeReleased[i].Text := ''
    end
                             else
    begin
      States[i].Text := 'Work';
      CurrPacks[i].Text := IntToStr(Processors[i].GetPackNum);
      PTimeReleased[i].Text := IntToStr(Processors[i].TimeReleased);
    end;
    PPCounts[i].Text := IntToStr(Processors[i].ProcessedPackagesCount);
  end;
end;

procedure TPlaner.UpdateSourceData;
var
  i:integer;
begin
  Distributions[2].ItemIndex := Distributions[1].ItemIndex;
  Intensivities[2].Text := Intensivities[1].Text;
  for i:=1 to 3 do
  begin
    Sources[i].SetDistribution(Distributions[i].ItemIndex);
    Sources[i].SetIntensivity(StrToFloat(Intensivities[i].Text));
  end;
end;

procedure TPlaner.Reset;
var
  i: integer;
begin
  TurnNum := 0;
  for i:=1 to 3 do
  begin
    Sources[i].Reset;
    Sources[i].SetDistribution(DistCongruent);
    Sources[i].SetIntensivity(0.3);
  end;
  Turn.Reset;
  for i:=1 to 2 do Processors[i].Reset;
  LastPackageNum := -1;
  UpdateText;
end;

function TPlaner.Step: boolean;
var
  Package: TPackage;
  i: integer;
begin
  Result := true;
  inc(TurnNum);
  for i:=1 to 3 do
  begin
    package := Sources[i].Step(LastPackageNum);
    if package<>nil then Result := Turn.AddPackage(package);
    if not(Result) then exit;
  end;
  for i:=1 to 2 do
  begin
    Package := Processors[i].Step;
    if Package<>nil then packages.Add(package);
    if Processors[i].IsEmpty then
    begin
      Package := Turn.GetPackage;
      if Package<>nil then Processors[i].SetPackage(Package);
    end;
  end;
  Result := true;
end;

procedure TPlaner.Finish;
begin
end;

procedure TPlaner.Statistics;
begin
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Planer := TPlaner.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Planer.Free;
end;

procedure TMainForm.btStepClick(Sender: TObject);
var
  isOk: boolean;
begin
  Planer.UpdateSourceData;
  isOk := Planer.Step;
  if not isOk then
  begin
    Application.MessageBox('Turn overflow, system is crashed!', 'Result', MB_OK + MB_ICONERROR);
    btStep.Enabled := false;
    btFinish.Enabled := false;
  end;
  Planer.UpdateText;
end;

procedure TMainForm.btFinishClick(Sender: TObject);
var
  isOk: boolean;
  i: integer;
begin
  Planer.UpdateSourceData;
  for i:=1 to FinishTime do
  begin
    isOk := Planer.Step;
    if not isOk then
    begin
      Application.MessageBox('Turn overflow, system is crashed!', 'Result', MB_OK + MB_ICONERROR);
      btStep.Enabled := false;
      btFinish.Enabled := false;
      break;
    end;
  end;
  Planer.UpdateText;
end;

procedure TMainForm.btResetClick(Sender: TObject);
begin
  Planer.Reset;
  btStep.Enabled := true;
  btFinish.Enabled := true;
end;

procedure TMainForm.btExitClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.btStatClick(Sender: TObject);
begin
  StatForm.Reset;
  StatForm.ShowModal;
end;

end.
