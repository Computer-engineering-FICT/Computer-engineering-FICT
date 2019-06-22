unit FormText;

interface

uses
  Windows, SysUtils, Classes, Forms, Controls, StdCtrls, ExtCtrls;

const
  {Characters}
  cZero = #0;
  cComma = ',';
  cSignalX = 'x';
  cSignalY = 'y';

type
  TSignal = (sX, sY, sNum);

  TTextForm = class(TForm)
    eText: TEdit;
    lText: TLabel;
    pButtons: TPanel;
    bSignal: TButton;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    b7: TButton;
    b8: TButton;
    b9: TButton;
    b0: TButton;
    bComma: TButton;
    bBack: TButton;
    bOk: TButton;
    bCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bSignalClick(Sender: TObject);
    procedure bNumClick(Sender: TObject);
    procedure bCommaClick(Sender: TObject);
    procedure bBackClick(Sender: TObject);
  private
    SType: TSignal;
    SChar: Char;
    procedure SetSignal(NewSignal: TSignal);
  public
    procedure SetupForm(StringText,LabelText: string; SignalType: TSignal);
  end;

var
  TextForm : TTextForm;

implementation

{$R *.DFM}

procedure TTextForm.FormCreate(Sender: TObject);
begin
  bComma.Caption := cComma;
end;

procedure TTextForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose :=true;
  with eText do
    if (ModalResult=mrOk) and (length(Text)<>0) and
       (Text[length(Text)] in [cComma, cSignalX, cSignalY]) then
    begin
      CanClose := false;
      Application.MessageBox('Некорректное значение!','Ошибка ввода',
                              MB_OK + MB_ICONERROR);
    end;
end;

procedure TTextForm.bSignalClick(Sender: TObject);
begin
  with eText do
    if (length(Text)=0) or ((sType=sY) and (Text[length(Text)]=cComma))
      then Text := Text+SChar;
end;

procedure TTextForm.bNumClick(Sender: TObject);
begin
  with eText do
    if (SType=SNum) or ((length(Text)>0) and (Text[length(Text)]<>cComma))
      then Text := Text+IntToStr((Sender as TButton).Tag);
end;

procedure TTextForm.bCommaClick(Sender: TObject);
begin
  with eText do
    if (length(Text)<>0) and not(Text[length(Text)] in [SChar,cComma])
      then Text := Text+cComma;
end;

procedure TTextForm.bBackClick(Sender: TObject);
begin
  with eText do if (length(Text)>0) then Text := copy(Text,1,Length(Text)-1);
end;

procedure TTextForm.SetSignal(NewSignal: TSignal);
begin
  SType := NewSignal;
  case SType of
    sX:
    begin
      SChar := cSignalX;
      bSignal.Caption := SChar;
      bSignal.Enabled := true;
      bComma.Enabled := false;
    end;
    sY:
    begin
      SChar := cSignalY;
      bSignal.Caption := SChar;
      bSignal.Enabled := true;
      bComma.Enabled := false;
    end;
    sNum:
    begin
      SChar := cZero;
      bSignal.Caption := '';
      bSignal.Enabled := false;
      bComma.Enabled := false;
    end;
  end;
end;

procedure TTextForm.SetupForm(StringText,LabelText: string; SignalType: TSignal);
begin
  lText.Caption := LabelText;
  eText.Text := StringText;
  SetSignal(SignalType);
end;

end.
