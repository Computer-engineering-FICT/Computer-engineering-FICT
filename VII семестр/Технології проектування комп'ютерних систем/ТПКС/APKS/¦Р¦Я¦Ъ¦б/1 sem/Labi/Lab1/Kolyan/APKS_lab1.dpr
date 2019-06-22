program APKS_lab1;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  MainUnit in 'MainUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
