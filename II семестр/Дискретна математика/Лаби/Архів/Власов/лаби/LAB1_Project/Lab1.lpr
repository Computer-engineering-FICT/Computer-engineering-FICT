program Lab1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Unit9, Unit10,
  Unit11, Unit12;

{$R *.res}

begin

  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInp0Form, Inp0Form);
  Application.CreateForm(TInp1Form, Inp1Form);
  Application.CreateForm(TInp2Form, Inp2Form);
  Application.CreateForm(TInp3Form, Inp3Form);
  Application.CreateForm(TInp4Form, Inp4Form);
  Application.CreateForm(TInp5Form, Inp5Form);
  Application.CreateForm(TInp6Form, Inp6Form);
  Application.CreateForm(TInp7Form, Inp7Form);
  Application.CreateForm(TInp8Form, Inp8Form);
  Application.CreateForm(TInp9Form, Inp9Form);
  Application.CreateForm(TOperForm, OperForm);
  Application.Run;
end.
