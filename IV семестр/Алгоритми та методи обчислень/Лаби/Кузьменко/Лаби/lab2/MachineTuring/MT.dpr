program MT;

uses
  Forms,
  UnMain in 'UnMain.pas' {FMain},
  UnPanel in 'UnPanel.pas' {FMT},
  UnMT in 'UnMT.pas' {FList},
  UnLIST in 'UnLIST.pas' {FPanel},
  UnLog in 'UnLog.pas' {FLog};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFMT, FMT);
  Application.CreateForm(TFList, FList);
  Application.CreateForm(TFPanel, FPanel);
  Application.CreateForm(TFLog, FLog);
  Application.Run;
end.
