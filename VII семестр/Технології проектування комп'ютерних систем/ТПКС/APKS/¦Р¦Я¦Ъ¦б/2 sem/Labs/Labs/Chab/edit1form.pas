unit edit1form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Lab1_1,
  StdCtrls;

type
  TChange = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Ok: TButton;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Change: TChange;
implementation

{$R *.DFM}

procedure TChange.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if (Key<'0')or(Key>'9')then
    begin
     if Key=#13 then
      begin
     Key:=#0;
      if (Edit1.Text='') then
        begin
        Change.Edit1.SetFocus;
        MessageDlg('Повторте ввод',mtError,[mbOK],0);
        Change.Edit1.text:='';
        exit
        end;
      if (strtoint(Edit1.Text)>=no) then
        begin
        Change.Edit1.SetFocus;
        MessageDlg('Нет такой вершины',mtError,[mbOK],0);
        Change.Edit1.text:='';
        exit
        end;

     c:=p;
      while (c<>nil) do
       begin
       if c^.marker.Caption=Change.Edit1.Text then
        begin
          Change.Edit2.text:=C^.signals.caption;
          If (C^.tipe=beg) then
                begin
                Change.Label3.Caption:='переход в    a';
                Change.Edit3.Enabled:=True;
                Change.Edit3.SetFocus;
                exit
                end;
          if (C^.tipe=oper) then
                begin
                Change.Label2.Caption:='сигналы      y';
                Change.Label3.Caption:='переход в    a';
                Change.Edit2.Enabled:=True;
                Change.Edit3.Enabled:=True;
                Change.Edit2.SetFocus;
                exit
                end;
          if  (C^.tipe=cond)then
                begin
                Change.Label2.Caption:='усдовие      x';
                Change.Label3.Caption:='переход по   1';
                Change.Label4.Caption:='переход по   0';
                Change.Edit2.Enabled:=True;
                Change.Edit3.Enabled:=True;
                Change.Edit4.Visible:=True;
                Change.Edit2.SetFocus;
                exit
                end;
        end
        else C:=C^.Next;
       end
      end
      else Key:=#0
     end

     end;
{-------------------}
procedure TChange.OkClick(Sender: TObject);
begin
 C^.yes:=E;
 if D<>Nil then C^.no:=D;
 D:=nil;
 Change.Label3.caption:='';
 Change.Label4.caption:='';
 Change.Edit1.Text:='';
 Change.Edit2.Text:='';
 Change.Edit3.Text:='';
 Change.Edit4.Text:='';
 Change.Edit2.Enabled:=False;
 Change.Edit3.Enabled:=False;
 Change.Edit4.Visible:=False;
 Change.ok.Enabled:=False;
 Change.close;
 if C^.tipe=cond then draw_lines
 else draw_line;
end;
{--------------------------}
procedure TChange.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if (Key<'0')or(Key>'9')then
    begin
     if Key=#13 then
      begin
      Key:=#0;
      if (Edit3.Text='') then
        begin
        Change.Edit3.SetFocus;
        MessageDlg('Повторите ввод',mtError,[mbOK],0);
        Change.Edit3.text:='';
        exit
        end;
      if (strtoint(Edit3.Text)>no) then
        begin
        Change.Edit3.SetFocus;
        MessageDlg('Нет такой вершины',mtError,[mbOK],0);
        Change.Edit3.text:='';
        exit
        end;
      E:=p;
      while (c<>nil) do
       if E^.marker.Caption=Change.Edit3.Text then
          begin
           if(C^.tipe<>cond)then
             begin
             Change.Ok.Enabled:=True;
             exit;
             end
           else
             begin
             Change.Edit4.SetFocus;
             exit;
             end;
          end
       else E:=E^.next;
      end
     else Key:=#0
    end ;
end;

procedure TChange.FormCreate(Sender: TObject);
begin
 Change.Edit2.Enabled:=False;
 Change.Edit3.Enabled:=False;
 Change.ok.Enabled:=False;
Change.Label1.Caption:='вершина     a';
Change.Label2.Caption:='сигналы';
end;
{------------------------------}
procedure TChange.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (Key<'0')or(Key>'9')then
    begin
     if Key=#13 then
      begin
        Key:=#0;
        if (Edit2.Text='') then
        begin
        Change.Edit2.SetFocus;
        MessageDlg('Повторите ввод',mtError,[mbOK],0);
        Change.Edit2.text:='';
        exit
        end;
        C^.signals.font.Color:=clblack;
        C^.signals.Caption:=Change.Edit2.Text;
        Change.Edit3.SetFocus;
      end
     else Key:=#0
     end;
end;
{-------------------------------}
procedure TChange.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if (Key<'0')or(Key>'9')then
    begin
     if Key=#13 then
      begin
      Key:=#0;
      if (Edit4.Text='') then
        begin
        Change.Edit4.SetFocus;
        MessageDlg('Повторите ввод',mtError,[mbOK],0);
        Change.Edit4.text:='';
        exit
        end;
      if (strtoint(Edit4.Text)>no) then
        begin
        Change.Edit4.SetFocus;
        MessageDlg('Нет такой вершины',mtError,[mbOK],0);
        Change.Edit4.text:='';
        exit
        end;
      D:=p;
      while (c<>nil) do
       if D^.marker.Caption=Change.Edit4.Text then
          begin
             Change.Ok.Enabled:=True;
             exit;
          end
       else D:=D^.next;
      end
     else Key:=#0
    end ;

end;

end.
