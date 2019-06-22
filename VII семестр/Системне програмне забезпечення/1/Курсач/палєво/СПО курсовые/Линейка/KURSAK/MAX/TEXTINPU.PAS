unit TextInput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,MainGraphUnit, Spin;

type
  TInTextForm = class(TForm)
    OkBut: TButton;
    CancelBut: TButton;
    InEdit: TSpinEdit;
    procedure CancelButClick(Sender: TObject);
    procedure OkButClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Elem:CurElement;
  public
    procedure ShowModalWithText(InElem:CurElement);
  end;

var
  InTextForm: TInTextForm;

implementation

uses GraphWin;

{$R *.DFM}

procedure TInTextForm.ShowModalWithText(InElem:CurElement);
begin
  if not visible then
  begin
    Elem:=InElem;
    case Elem.ceType of
      stPOINT:InEdit.Value:=PPoint(Elem.element).Value;
      stCON  :InEdit.Value:=PConnection(Elem.element).Value;
    end;
    ShowModal
  end;
end;


procedure TInTextForm.CancelButClick(Sender: TObject);
begin
 close
end;

procedure TInTextForm.OkButClick(Sender: TObject);
begin
 MainForm.Graph.ChangeValue(Elem,InEdit.Value);
 close
end;

procedure TInTextForm.FormShow(Sender: TObject);
begin
 ActiveControl:=InEdit
end;

procedure TInTextForm.InEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then OkBut.Click
end;

end.
