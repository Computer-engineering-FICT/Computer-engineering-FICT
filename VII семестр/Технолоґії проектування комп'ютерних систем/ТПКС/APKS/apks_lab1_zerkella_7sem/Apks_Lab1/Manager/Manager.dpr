program Manager;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Менеджер';
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
