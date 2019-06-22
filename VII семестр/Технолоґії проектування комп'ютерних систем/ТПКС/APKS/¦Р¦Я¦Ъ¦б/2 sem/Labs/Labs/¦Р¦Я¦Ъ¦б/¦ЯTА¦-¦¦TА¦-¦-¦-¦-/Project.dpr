program Project;

uses
  Forms,
  uMenu in 'uMenu.pas' {Form1},
  uPart1 in 'uPart1.pas' {FormPart1},
  uAnalyzer in 'uAnalyzer.pas',
  uPart2 in 'uPart2.pas' {FormPart2},
  uMarker in 'uMarker.pas',
  uTypes in 'uTypes.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormPart1, FormPart1);
  Application.CreateForm(TFormPart2, FormPart2);
  Application.Run;
end.
