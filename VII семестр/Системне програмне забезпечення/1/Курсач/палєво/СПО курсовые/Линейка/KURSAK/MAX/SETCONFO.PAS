unit SetConFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,GraphObj;

type
  TSetConForm = class(TForm)
    VHcheck: TRadioGroup;
    OnWhat: TRadioGroup;
    OkBut: TButton;
    CancelBut: TButton;
    Panel1: TPanel;
    WText: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure CancelButClick(Sender: TObject);
    procedure OkButClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    InAddMode:boolean;
    StartPoint,EndPoint:PGraphElement;
    Connection:PConnection;
    { Private declarations }
  public
    procedure AddConnection(SP,EP:PGraphElement);
    procedure EditConnection(PC:PConnection);
  end;

var
  SetConForm: TSetConForm;

implementation

uses GraphWin;

{$R *.DFM}

procedure TSetConForm.CancelButClick(Sender: TObject);
begin
 Close
end;

procedure TSetConForm.AddConnection(SP,EP:PGraphElement);
begin
  InAddMode:=true;
  VHcheck.ItemIndex:=0;
  if SP.nextTrue=nil then OnWhat.ItemIndex:=0
                     else OnWhat.ItemIndex:=1;
  OnWhat.Enabled:=not ((SP.nextTrue<>nil)or(SP.nextFalse<>nil)or(SP.GEType=getBEG)or(SP.GEType=getOPER));
  WText.text:='0,5';
  StartPoint:=SP;
  EndPoint:=EP;
  ShowModal
end;

procedure TSetConForm.EditConnection(PC:PConnection);
begin
  InAddMode:=false;
  Connection:=PC;
  if PC.ConType = conHORZ then VHcheck.ItemIndex:=0
                          else VHcheck.ItemIndex:=1;
  if PC.trueWay then OnWhat.ItemIndex:=0
                else OnWhat.ItemIndex:=1;
  OnWhat.Enabled:=not (((PC.StartPoint.nextTrue<>nil)and(PC.StartPoint.nextFalse<>nil))or(PC.StartPoint.GEType=getBEG)or(PC.StartPoint.GEType=getOPER));
  WText.text:=floatToStr(PC.W);
  ShowModal
end;

procedure TSetConForm.OkButClick(Sender: TObject);
var CT:ConnectionType;
    onTrue:boolean;
begin
  if InAddMode then
  begin
   if VHcheck.ItemIndex = 0 then CT:=conHORZ
                            else CT:=conVERT;
   onTrue:=onWhat.ItemIndex=0;
   MainForm.addCon(CT,strToFloat(WText.text),StartPoint,EndPoint,onTrue);
  end
  else
  begin
   if VHcheck.ItemIndex = 0 then CT:=conHORZ
                            else CT:=conVERT;
   onTrue:=onWhat.ItemIndex=0;
   Connection.W:=StrToFloat(WText.text);
   Connection.ConType:=CT;
   if OnTrue<>Connection.trueWay then
   begin
     if OnTrue then
     begin
      Connection.StartPoint.nextTrue:=Connection.EndPoint;
      Connection.StartPoint.nextFalse:=nil;
     end
     else
     begin
      Connection.StartPoint.nextFalse:=Connection.EndPoint;
      Connection.StartPoint.nextTrue:=nil;
     end
   end;
   Connection.trueWay:=OnTrue
  end;
  close
end;

procedure TSetConForm.FormShow(Sender: TObject);
begin
ActiveControl:=OkBut
end;

end.
