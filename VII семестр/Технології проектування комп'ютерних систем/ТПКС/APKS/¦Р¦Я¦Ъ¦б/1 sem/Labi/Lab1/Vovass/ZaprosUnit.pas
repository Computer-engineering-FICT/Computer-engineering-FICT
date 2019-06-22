unit ZaprosUnit;
//==============================================================================
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;
type
//==============================================================================
 TZapros1Form = class(TForm)
  Edit1: TEdit;
  Edit2: TEdit;
  CloseBut: TBitBtn;
  Label1: TLabel;
  procedure CloseButClick(Sender: TObject);
  procedure FormActivate(Sender: TObject);
  procedure Edit1Click(Sender: TObject);
  procedure Repaint;override;
 private
  { Private declarations }
 public
  { Public declarations }
 end;
var
 Zapros1Form: TZapros1Form;
implementation
{$R *.dfm}
//==============================================================================
procedure TZapros1Form.CloseButClick(Sender: TObject);
begin
 Close
end;
//==============================================================================
procedure TZapros1Form.FormActivate(Sender: TObject);
begin
 Repaint
end;
//==============================================================================
procedure TZapros1Form.Edit1Click(Sender: TObject);
begin
 if Edit1.Text='0' then
  begin
   Edit1.Text:='1';
   Edit2.Text:='0'
  end
 else
  begin
   Edit1.Text:='0';
   Edit2.Text:='1'
  end;
 Repaint
end;
//==============================================================================
procedure TZapros1Form.Repaint;
begin
 inherited Repaint;
 with Zapros1Form.Canvas do
  begin
   MoveTo(Round(Zapros1Form.Width/2),0);
   LineTo(0,Round(Zapros1Form.Height/2)-20);
   LineTo(Round(Zapros1Form.Width/2),Zapros1Form.Height-40);
   LineTo(Zapros1Form.Width-10,Round(Zapros1Form.Height/2)-20);
   LineTo(Round(Zapros1Form.Width/2),0)
  end
end;
//==============================================================================
end.
