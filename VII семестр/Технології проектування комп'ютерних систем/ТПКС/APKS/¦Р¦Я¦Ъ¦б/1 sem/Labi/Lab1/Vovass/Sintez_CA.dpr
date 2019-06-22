program Sintez_CA;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ElementUnit in 'ElementUnit.pas',
  GrafUnit in 'GrafUnit.pas',
  IfUnit in 'IfUnit.pas' {IfForm},
  ZaprosUnit in 'ZaprosUnit.pas' {Zapros1Form},
  MyTables in 'MyTables.pas',
  FunctionsUnit in 'FunctionsUnit.pas',
  ErrorUnit in 'ErrorUnit.pas' {ErrorForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TIfForm, IfForm);
  Application.CreateForm(TZapros1Form, Zapros1Form);
  Application.CreateForm(TErrorForm, ErrorForm);
  Application.Run;
end.
