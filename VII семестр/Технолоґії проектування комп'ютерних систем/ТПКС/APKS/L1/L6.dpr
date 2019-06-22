program L6;

uses
  Forms,
  L6P in 'L6P.pas' {MainForm},
  L6U in 'L6U.pas',
  UAbout in 'UAbout.pas' {DAbout},
  UDIDQ in 'UDIDQ.pas' {DDIDQ},
  UMarking in 'UMarking.pas' {DMarking},
  OKCANCL1 in 'C:\Program Files\Borland\Delphi7\ObjRepos\OKCANCL1.pas' {OKBottomDlg},
  UCycles in 'UCycles.pas' {CycleDialog},
  UGraph in 'UGraph.pas' {DGraph};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDAbout, DAbout);
  Application.CreateForm(TDDIDQ, DDIDQ);
  Application.CreateForm(TDMarking, DMarking);
  Application.CreateForm(TCycleDialog, CycleDialog);
  Application.CreateForm(TDGraph, DGraph);
  Application.Run;
end.
