program ProjectLab2;

uses
  Forms,
  UnitMainForm in 'UnitMainForm.pas' {FormMain},
  UnitModeler in 'UnitModeler.pas',
  UnitGenerators in 'UnitGenerators.pas',
  UnitStatForm in 'UnitStatForm.pas' {FormStat};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormStat, FormStat);
  Application.Run;
end.
