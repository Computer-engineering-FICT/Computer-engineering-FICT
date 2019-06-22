program Lab1;

uses
  Forms,
  Lab1_1 in 'Lab1_1.pas' {Form1},
  Editor in 'Editor.pas' {EditForm},
  edit1form in 'edit1form.pas' {Change};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TEditForm, EditForm);
  Application.CreateForm(TChange, Change);
  Application.Run;
end.
