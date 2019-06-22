program Lab2;

uses
  Forms,
  FormMain in 'FormMain.pas' {MainForm},
  UnitGenerators in 'UnitGenerators.pas',
  FormStatistics in 'FormStatistics.pas' {StatForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TStatForm, StatForm);
  Application.Run;
end.
