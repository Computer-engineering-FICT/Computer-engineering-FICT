program Project1;

uses
  Forms,
  Start in 'Start.pas' {Form1Main},
  DobavlenieSviazi in 'DobavlenieSviazi.pas' {Form2Main},
  RGR_SPZ1 in 'RGR_SPZ1.pas' {Form1},
  RGR_SPZ2 in 'RGR_SPZ2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1Main, Form1Main);
  Application.CreateForm(TForm2Main, Form2Main);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
