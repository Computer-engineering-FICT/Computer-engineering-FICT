program Project1;

uses
  Forms,
  Kurs1 in 'Kurs1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
