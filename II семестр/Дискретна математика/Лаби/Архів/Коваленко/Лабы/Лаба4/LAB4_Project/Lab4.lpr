program Lab4;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Unit5, Unit3, Unit4, Unit6, Unit7, Unit8, Unit9;
  { you can add units after this }

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TOperForm, OperForm);
  Application.CreateForm(TInp1Form, Inp1Form);
  Application.CreateForm(TInp2Form, Inp2Form);
  Application.CreateForm(TInp3Form, Inp3Form);
  Application.CreateForm(TInp4Form, Inp4Form);
  Application.CreateForm(TInp5Form, Inp5Form);
  Application.CreateForm(TDataLabModule, DataLabModule);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

