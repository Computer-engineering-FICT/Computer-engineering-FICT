program Courser;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  ServiceUnit in 'ServiceUnit.pas',
  sserv1 in 'sserv1.pas',
  Variants in 'Variants.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
