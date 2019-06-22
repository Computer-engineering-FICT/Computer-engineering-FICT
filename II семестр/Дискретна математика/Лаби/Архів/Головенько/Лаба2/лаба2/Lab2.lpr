program Lab2;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Unit3, Unit4;

{$R *.res}

begin
  Application.Title:='Женско - Мужские отношения от '
    +'Димона)';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInpForm, InpForm);
  Application.CreateForm(TOperForm, OperForm);
  Application.CreateForm(TActionForm, ActionForm);
  Application.Run;
end.

