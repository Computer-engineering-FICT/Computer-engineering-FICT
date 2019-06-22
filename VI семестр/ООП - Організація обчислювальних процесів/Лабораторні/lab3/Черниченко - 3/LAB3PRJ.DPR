program lab3prj;

uses
  Forms,
  lab3 in 'lab3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
