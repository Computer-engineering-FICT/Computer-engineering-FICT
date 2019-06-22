program ProcessControl;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ElementUnit in 'ElementUnit.pas',
  RebroUnit in 'RebroUnit.pas' {RebroForm},
  RandomUnit in 'RandomUnit.pas' {RandomForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TRebroForm, RebroForm);
  Application.CreateForm(TRandomForm, RandomForm);
  Application.Run;
end.
