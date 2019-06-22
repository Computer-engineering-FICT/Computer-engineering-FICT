program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  grph in 'grph.pas',
  mtrx in 'mtrx.pas',
  Unit3 in 'Unit3.pas' {MatrixView},
  Unit2 in 'Unit2.pas' {GraphView};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
