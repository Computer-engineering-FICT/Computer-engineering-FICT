program Lab5;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Unit5, Unit3, Unit9;
  { you can add units after this }

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TOperForm, OperForm);
  Application.CreateForm(TInp1Form, Inp1Form);
  Application.CreateForm(TDataLabModule, DataLabModule);
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.

