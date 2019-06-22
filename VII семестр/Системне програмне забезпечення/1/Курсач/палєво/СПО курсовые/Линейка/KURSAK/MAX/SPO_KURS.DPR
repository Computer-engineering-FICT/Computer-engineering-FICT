program SPO_kurs;

uses
  Forms,
  GraphWin in 'GraphWin.pas' {MainForm},
  MainGraphUnit in 'MainGraphUnit.pas',
  TextInput in 'TextInput.pas' {InTextForm},
  AutoGenUnit in 'AutoGenUnit.pas' {AutoGenForm},
  ListControl in 'ListControl.pas',
  SetupUnit in 'SetupUnit.pas' {SetupForm},
  OptimFormUnit in 'OptimFormUnit.pas' {OptimForm},
  AboutUnit in 'AboutUnit.pas' {AboutForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Процессорная линейка';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInTextForm, InTextForm);
  Application.CreateForm(TAutoGenForm, AutoGenForm);
  Application.CreateForm(TSetupForm, SetupForm);
  Application.CreateForm(TOptimForm, OptimForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
