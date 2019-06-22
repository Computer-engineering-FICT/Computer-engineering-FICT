program Automat;

uses
  Forms,
  GraphForm in 'GraphForm.pas' {MainGraphForm},
  uGraph in 'uGraph.pas',
  FormText in 'FormText.pas' {TextForm},
  FormAbout in 'FormAbout.pas' {AboutForm},
  Lang in 'Lang.pas',
  MainUnit in 'MainUnit.pas';

{$E gsc}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainGraphForm, MainGraphForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TTextForm, TextForm);
  Application.Run;
end.
