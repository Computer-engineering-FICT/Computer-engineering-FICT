unit SetElementUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,GraphObj,ListControl;

type
  TSetElement = class(TForm)
    SelBox: TListBox;
    AllBox: TListBox;
    AddBut: TButton;
    DelBut: TButton;
    CancelBut: TButton;
    OkBut: TButton;
    NotRev: TRadioButton;
    Rev: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure CancelButClick(Sender: TObject);
    procedure OkButClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DelButClick(Sender: TObject);
    procedure AddButClick(Sender: TObject);
    procedure SelBoxClick(Sender: TObject);
    procedure NotRevClick(Sender: TObject);
    procedure RevClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AllBoxClick(Sender: TObject);
  private
    NewGraph:Graph;
    gElem:PGraphElement;
    AllAddr,SelAddr:TList;
  public
    { Public declarations }
    procedure EditElement(NG:Graph;PGE:PGraphElement);
  end;

var
  SetElement: TSetElement;

implementation

{$R *.DFM}

procedure TSetElement.EditElement(NG:Graph;PGE:PGraphElement);
Var PgeS,selPGES:PgeSignal;
    WillGoNext:boolean;
    SAddr:pointer;
    s:string;
    ID:integer;
    InSignal:boolean;
begin
  NewGraph:=NG;
  gElem:=PGE;
  InSignal:=PGE.GEType=getCOND;
  if NewGraph.SignalGoFirst(InSignal) then
  repeat
    WillGoNext:=NewGraph.SignalGetAndGoNext(s,SAddr,InSignal);
    AllBox.Items.add(s);
    AllAddr.Add(SAddr);
  until not WillGoNext;
  if gElem.Signals.GoFirst then
  repeat
    PgeS:=gElem.Signals.getCurrent;
    ID:=AllAddr.indexOf(PgeS.signal);
    new(selPGES);
    selPGES^:=PgeS^;
    s:=AllBox.Items[ID];
    if selPGES.reverse then s:=s+' [обратный]'
                       else s:=s+' [прямой]';
    SelBox.Items.Add(s);
    SelAddr.add(selPGES);
    AllBox.items.Delete(ID);
    AllAddr.delete(ID);
  until not gElem.Signals.goNext;

  showmodal
end;

procedure TSetElement.CancelButClick(Sender: TObject);
begin
 close
end;

procedure TSetElement.OkButClick(Sender: TObject);
var PGES:PgeSignal;
    i:integer;
begin
 gElem.Signals.Clear;
 for i:=0 to SelAddr.count-1 do
 begin
   new(PGES);
   PGES^:=PgeSignal(SelAddr[i])^;
   gElem.Signals.add(PGES)
 end;
 close
end;

procedure TSetElement.FormCreate(Sender: TObject);
begin
 AllAddr:=TList.create;
 SelAddr:=TList.create
end;

procedure TSetElement.DelButClick(Sender: TObject);
var ID:integer;
    selPGES:PgeSignal;
begin
 ID:=SelBox.ItemIndex;
 if ID<>-1 then
 begin
   selPGES:=SelAddr[ID];
   SelAddr.delete(ID);
   SelBox.items.delete(ID);
   AllAddr.add(selPGES.signal);
   AllBox.items.add(PSignal(selPGES.signal).sign);
   dispose(selPGES);
   SelBox.ItemIndex:=0
 end;
end;

procedure TSetElement.AddButClick(Sender: TObject);
var ID:integer;
    selPGES:PgeSignal;
    s:string;
begin
 if not((gElem.GEType=getCOND)and(SelBox.items.Count<>0)) then
 begin
  ID:=AllBox.ItemIndex;
  if ID<>-1 then
  begin
   new(selPGES);
   selPGES.signal:=AllAddr[ID];
   selPGES.reverse:=false;
   AllAddr.delete(ID);
   AllBox.items.delete(ID);
   SelAddr.add(selPGES);
   s:=PSignal(selPGES.signal).sign+' [прямой]';;
   SelBox.items.add(s);
   AllBox.ItemIndex:=0
  end;
 end; 
end;

procedure TSetElement.SelBoxClick(Sender: TObject);
var ID:integer;
    selPGES:PgeSignal;
begin
 Rev.enabled:=true;
 NotRev.enabled:=true;
 ID:=SelBox.ItemIndex;
 if ID<>-1 then
 begin
   selPGES:=SelAddr[ID];
   Rev.Checked:=selPGES.reverse;
   NotRev.Checked:=not selPGES.reverse;
 end;
end;

procedure TSetElement.NotRevClick(Sender: TObject);
var ID:integer;
    selPGES:PgeSignal;
begin
 ID:=SelBox.ItemIndex;
 if ID<>-1 then
 begin
   selPGES:=SelAddr[ID];
   selPGES.reverse:=false;
   SelBox.items[id]:=PSignal(selPGES.signal).sign+' [прямой]'
 end;
end;

procedure TSetElement.RevClick(Sender: TObject);
var ID:integer;
    selPGES:PgeSignal;
begin
 ID:=SelBox.ItemIndex;
 if ID<>-1 then
 begin
   selPGES:=SelAddr[ID];
   selPGES.reverse:=true;
   SelBox.items[id]:=PSignal(selPGES.signal).sign+' [обратный]'
 end;
end;

procedure TSetElement.FormClose(Sender: TObject; var Action: TCloseAction);
var selPGES:PgeSignal;
    i:integer;
begin
  SelBox.Items.clear;
  AllBox.Items.clear;
  AllAddr.clear;
  for i:=0 to SelAddr.Count-1 do
  begin
    selPGES:=selAddr[i];
    dispose(selPGES)
  end;
  SelAddr.clear;
end;

procedure TSetElement.AllBoxClick(Sender: TObject);
begin
 Rev.enabled:=false;
 NotRev.enabled:=false;
end;

end.
