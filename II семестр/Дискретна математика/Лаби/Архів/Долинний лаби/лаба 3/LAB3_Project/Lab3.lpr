program Lab3;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit5, Unit2, Unit3, Unit4, Unit6, Unit7, Unit8, Unit9, Unit10,
  Unit11, Unit12, Unit13, Unit14, Unit15;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInp1_2Form, Inp1_2Form);
  Application.CreateForm(TInp3Form, Inp3Form);
  Application.CreateForm(TInp5Form, Inp5Form);
  Application.CreateForm(TInp6Form, Inp6Form);
  Application.CreateForm(TInp7Form, Inp7Form);
  Application.CreateForm(TInp8Form, Inp8Form);
  Application.CreateForm(TInp9Form, Inp9Form);
  Application.CreateForm(TInp10Form, Inp10Form);
  Application.CreateForm(TInp11Form, Inp11Form);
  Application.CreateForm(TInp12Form, Inp12Form);
  Application.CreateForm(TInp13Form, Inp13Form);
  Application.CreateForm(TInp14Form, Inp14Form);
  Application.CreateForm(TDataLabModule, DataLabModule);
  Application.CreateForm(TOperForm, OperForm);
  Application.Run;
end.

