unit UAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TDAbout = class(TForm)
    LText1: TLabel;
    LText2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DAbout: TDAbout;

implementation

{$R *.dfm}

end.
