program prgChebanenko1;

uses
  Forms,
  mMain in 'mMain.pas' {frmMain},
  mGraphRedaktor in 'mGraphRedaktor.pas' {frmGraphRedaktor},
  mStructura in 'mStructura.pas' {frmStructura},
  mInsertText in 'mInsertText.pas' {frmInsertText},
  mTable in 'mTable.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGraphRedaktor, frmGraphRedaktor);
  Application.CreateForm(TfrmStructura, frmStructura);
  Application.CreateForm(TfrmInsertText, frmInsertText);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
