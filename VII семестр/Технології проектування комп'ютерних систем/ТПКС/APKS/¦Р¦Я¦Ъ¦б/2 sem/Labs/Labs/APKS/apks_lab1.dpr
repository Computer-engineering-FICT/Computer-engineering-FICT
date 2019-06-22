program apks_lab1;

uses
  Forms,
  Main in 'Main.pas' {fmMain},
  About in 'About.pas' {fmAbout},
  More in 'More.pas' {fmMore},
  NewSaveOpen in 'NewSaveOpen.pas',
  FileOperations in 'FileOperations.pas',
  GSA in 'GSA.pas',
  EditText in 'EditText.pas' {fmEdit},
  GSAEdit in 'GSAEdit.pas',
  GSADraw in 'GSADraw.pas',
  Check1 in 'Check1.pas' {fmCheck1},
  Checking in 'Checking.pas',
  GSADrawConst in 'GSADrawConst.pas',
  GSAShow in 'GSAShow.pas',
  Razmetka in 'Razmetka.pas',
  Tab in 'Tab.pas',
  Build22 in 'Build22.pas' {fmBuild};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmAbout, fmAbout);
  Application.CreateForm(TfmMore, fmMore);
  Application.CreateForm(TfmEdit, fmEdit);
  Application.CreateForm(TfmCheck1, fmCheck1);
  Application.CreateForm(TfmBuild, fmBuild);
  Application.Run;
end.
