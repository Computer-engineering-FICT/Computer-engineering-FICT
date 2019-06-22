unit mGraphRedaktor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs, StdCtrls, Buttons, ExtCtrls, Menus, MyRombShape, DB,
  DBTables;

type
  TfrmGraphRedaktor = class(TForm)
    MainGraphMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ComponentMenu: TPopupMenu;
    qryStructuraShemi: TQuery;
    DSStructuraShemi: TDataSource;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    SaveDialog1: TSaveDialog;
    qrySave: TQuery;
    DSSave: TDataSource;
    procedure N2Click(Sender: TObject);
    procedure MoveWinControl( Sender : TObject; Button : TMouseButton;
                              Shift : TShiftState; X, Y: integer);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure AddBand(ContStyle: TCompStyle);
function ProrisovkaLinij() : boolean;

var
  frmGraphRedaktor: TfrmGraphRedaktor;
  CurrentControl: TMyRombShape;
  ArrOfComponents : array [1..1000] of TMyRombShape;
  IdOfComp : integer = 0;
  CountOfComp : integer = 0;
implementation

uses mInsertText, mTable;
{$R *.dfm}

procedure AddBand(ContStyle : TCompStyle);
begin
  IdOfComp := CountOfComp + 1;
  ArrOfComponents[IdOfComp] := TMyRombShape.Create(frmGraphRedaktor);
  CountOfComp := CountOfComp + 1;
  with ArrOfComponents[IdOfComp] do
  begin
    Style       := ContStyle;
    Parent      := frmGraphRedaktor;
    Width       := 150;
    Left        := Mouse.CursorPos.X - 200;
    Top         := Mouse.CursorPos.Y - 50;
    DragMode    := dmAutomatic;
    DragCursor  := crHandPoint;
    DragKind    := dkDock;
    Brush.Style := bsClear;
    Pen.Width   := 2;
    Tag         := IdOfComp;
    Text        := '    (' + IntToStr(Tag) + ')';
    PopupMenu   := frmGraphRedaktor.ComponentMenu;
    if Style = csBegin then
      Text := 'Начало' + '    (' + IntToStr(Tag) + ')';
    if Style = csEnd then
      Text := 'Конец'  + '    (' + IntToStr(Tag) + ')';
  end;
end;


function ProrisovkaLinij() : boolean;
var i : integer;
var MovToX  : integer;
    MovToY  : integer;
    LineToX : integer;
    LineToY : integer;
    LineToId : integer;
begin
  for i := 1 to CountOfComp do
  begin
    if ArrOfComponents[i].Style <> csUslovie then
    begin
      if ArrOfComponents[i].Svjaz1 <> 0 then
      begin
      LineToId := ArrOfComponents[i].Svjaz1;
      MovToX := ArrOfComponents[i].Left + (ArrOfComponents[i].Width div 2);
      MovToY := ArrOfComponents[i].Top  + ArrOfComponents[i].Height;
      LineToX := ArrOfComponents[LineToId].Left + (ArrOfComponents[LineToId].Width div 2);
      LineToY := ArrOfComponents[LineToId].Top  ;
      frmGraphRedaktor.Canvas.MoveTo(MovToX, MovToY);
      frmGraphRedaktor.Canvas.LineTo(LineToX, LineToY);
      end;
    end
    else
      if (ArrOfComponents[i].Svjaz1 <> 0) and (ArrOfComponents[i].Svjaz2 <> 0) then
      begin
        LineToId := ArrOfComponents[i].Svjaz1;
        MovToX := ArrOfComponents[i].Left;
        MovToY := ArrOfComponents[i].Top  + (ArrOfComponents[i].Height div 2);
        LineToX := ArrOfComponents[LineToId].Left + (ArrOfComponents[LineToId].Width div 2);
        LineToY := ArrOfComponents[LineToId].Top  ;
        frmGraphRedaktor.Canvas.MoveTo(MovToX, MovToY);
        frmGraphRedaktor.Canvas.LineTo(LineToX, LineToY);

        LineToId := ArrOfComponents[i].Svjaz2;
        MovToX := ArrOfComponents[i].Left + ArrOfComponents[i].Width;
        MovToY := ArrOfComponents[i].Top  + (ArrOfComponents[i].Height div 2);
        LineToX := ArrOfComponents[LineToId].Left + (ArrOfComponents[LineToId].Width div 2);
        LineToY := ArrOfComponents[LineToId].Top  ;
        frmGraphRedaktor.Canvas.MoveTo(MovToX, MovToY);
        frmGraphRedaktor.Canvas.LineTo(LineToX, LineToY);
      end;
  end;
end;


procedure TfrmGraphRedaktor.MoveWinControl( Sender : TObject; Button : TMouseButton;
                          Shift : TShiftState; X, Y: integer);
begin
  if Button <> mbLeft then exit;
  ReleaseCapture;
  ( Sender as TWinControl ).Perform(WM_SysCommand, $F012, 0);
end;

procedure TfrmGraphRedaktor.N2Click(Sender: TObject);
begin
  AddBand(csUslovie);
end;

procedure TfrmGraphRedaktor.N3Click(Sender: TObject);
begin
  AddBand(csOperator);
end;

procedure TfrmGraphRedaktor.N4Click(Sender: TObject);
begin
  AddBand(csBegin);
end;

procedure TfrmGraphRedaktor.N5Click(Sender: TObject);
begin
  AddBand(csEnd);
end;

procedure TfrmGraphRedaktor.N9Click(Sender: TObject);
var IdDeleted : integer;
    i : integer;
    Len : integer;
    sText : string;
begin
  IdDeleted :=  ComponentMenu.PopupComponent.Tag;
  ComponentMenu.PopupComponent.Destroy;
  for i := IdDeleted to (CountOfComp-1) do
  begin
    ArrOfComponents[i+1].Tag := ArrOfComponents[i+1].Tag - 1;
    ArrOfComponents[i] := ArrOfComponents[i+1];
    Len := Length(ArrOfComponents[i].Text) - 5;
    sText := ArrOfComponents[i].Text;
    Delete( sText, Len, 7);
    ArrOfComponents[i].Text := sText;
    ArrOfComponents[i].Text := ArrOfComponents[i].Text + '     (' + IntToStr(ArrOfComponents[i].Tag) + ')';
    ArrOfComponents[i].Repaint;
  end;
  CountOfComp := CountOfComp - 1;
end;

procedure TfrmGraphRedaktor.N10Click(Sender: TObject);
var i : integer;
    buf : integer;
begin
  IdOfComp := ComponentMenu.PopupComponent.Tag;
  frmInsertText.Label1.Visible := False;
  frmInsertText.ShowModal;
  with ArrOfComponents[IdOfComp] do
  begin
    if (Style <> csBegin) and (Style <> csEnd) then
    begin
      text := '';
      for i := 1 to 10 do
        SetPerem(StrToInt(frmInsertText.Edit1.Text[i*2-1]),i);
      if Style = csOperator then
        for i := 1 to 10 do
        begin
          GetPerem(buf,i);
          if buf <> 0 then
            Text := Text + 'Y' + IntToStr(buf) + ' ';
        end
      else
        for i := 1 to 10 do
        begin
          GetPerem(buf,i);
          if buf <> 0 then
            Text := Text + 'X' + IntToStr(buf) + ' ';
        end;
    end;
    Text := Text + '     (' + IntToStr(Tag) + ')';
    Repaint;
  end;
  frmGraphRedaktor.Refresh;
  ProrisovkaLinij;
end;

procedure TfrmGraphRedaktor.N11Click(Sender: TObject);
begin
  with frmInsertText do
  begin
    IdOfComp := ComponentMenu.PopupComponent.Tag;
    if ArrOfComponents[IdOfComp].Style = csUslovie then
      Label1.Visible := True
    else
      Label1.Visible := False;
    ShowModal;
    if (Edit1.Text[1] <> '0') or (Edit1.Text[3] <> '0') then
    begin
      ArrOfComponents[IdOfComp].Svjaz1 := StrToInt(Edit1.Text[1]);
      ArrOfComponents[IdOfComp].Svjaz2 := StrToInt(Edit1.Text[3]);
    end;
  end;
  frmGraphRedaktor.Refresh;
  ProrisovkaLinij;
end;

procedure TfrmGraphRedaktor.FormDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  frmGraphRedaktor.Refresh;
  ProrisovkaLinij;
end;

procedure TfrmGraphRedaktor.N7Click(Sender: TObject);
var i : integer;
    j : integer;
    sPerem : string;
    intPerem : integer;
    sStyle : string;
begin
  qrySave.SQL.Clear;
  qrySave.SQL.Add('DELETE FROM TableSave');
//  qrySave.SQL.Clear;
//  qrySave.SQL.Add('CREATE TABLE TableSave  ' +
//                  '(Priznak CHAR(1),' +
//                  'Id int, Svjaz1 int, Svjaz2 int , Perem CHAR(25))');
  qrySave.ExecSQL;
  for i := 1 to CountOfComp do
  begin
  qrySave.Active := False;
  qrySave.SQL.Clear;
  sPerem := '';
  for j := 1 to 10 do
  begin
    ArrOfComponents[i].GetPerem(intPerem,j);
    sPerem := sPerem + IntToStr(intPerem) + ' ';
  end;
    if ArrOfComponents[i].Style = csUslovie then
      sStyle := 'USLOVIE';
    if ArrOfComponents[i].Style = csEnd then
      sStyle := 'END';
    if ArrOfComponents[i].Style = csBegin then
      sStyle := 'BEGIN';
    if ArrOfComponents[i].Style = csOperator then
      sStyle := 'OPERATOR';
    qrySave.SQL.Add('INSERT INTO TableSave (Priznak,Id,Svjaz1,Svjaz2,Perem) VALUES ' +
                  '(' + chr(39) + sStyle + chr(39) + ',' + IntToStr(ArrOfComponents[i].Tag)+
                  ',' + IntToStr(ArrOfComponents[i].Svjaz1) + ',' +
                  IntToStr(ArrOfComponents[i].Svjaz2) + ',' + chr(39) + sPerem + chr(39) + ')');
    qrySave.ExecSQL;
    qrySave.Active := False;
    end;
end;

procedure TfrmGraphRedaktor.N8Click(Sender: TObject);
begin
  Form1.Table1.Refresh;
  Form1.ShowModal;
end;

end.
