unit uPart2;

interface

uses
  uMarker,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, ComCtrls;

type
  TFormPart2 = class(TForm)
    MainMenu: TMainMenu;
    Menu: TMenuItem;
    OpenDialog: TOpenDialog;
    MenuOpen: TMenuItem;
    PageControl: TPageControl;
    TabSheetMili: TTabSheet;
    TabSheetMur: TTabSheet;
    StringGridMili: TStringGrid;
    StringGrid2: TStringGrid;
    MenuMark: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuOpenClick(Sender: TObject);
    procedure MenuMarkClick(Sender: TObject);
  private
    procedure ShowMili;
  public
    { Public declarations }
  end;

var
  FormPart2: TFormPart2;

implementation

{$R *.DFM}

procedure TFormPart2.MenuOpenClick(Sender: TObject);
var
  F: TextFile;
  Buf: Char;
  i: integer;
begin
  if OpenDialog.Execute
  then begin
    AssignFile(F, OpenDialog.FileName);
    Reset(F);
    ReadLn(F);

    Marker.Conn := nil;
    Buf := ' ';
    while Buf <> '#' do
    begin
      SetLength(Marker.Conn, Length(Marker.Conn) + 1);
      ReadLn(F, Buf);
    end;
    SetLength(Marker.Conn, Length(Marker.Conn) - 1);

    Reset(F);
    ReadLn(F);

    for i := 0 to High(Marker.Conn) do
    begin
      while not Eoln(F) do
      begin
        SetLength(Marker.Conn[i], Length(Marker.Conn[i]) + 1);
        Read(F, Marker.Conn[i][High(Marker.Conn[i])]);
      end;
      ReadLn(F);
    end;

    ReadLn(F);

    Marker.Nodes := nil;
    while not Eof(F) do
    begin
      SetLength(Marker.Nodes, Length(Marker.Nodes) + 1);
      ReadLn(F, Marker.Nodes[High(Marker.Nodes)].Name);
    end;
  end;
end;

procedure TFormPart2.FormCreate(Sender: TObject);
begin
  Marker := TMarker.Create;
  Marker.Mili := TMili.Create;
  Marker.Mur := TMur.Create;
end;

procedure TFormPart2.MenuMarkClick(Sender: TObject);
begin
  Marker.Mark;

  ShowMili;
end;

procedure TFormPart2.ShowMili;
var
  i, j: integer;
function GetBit(Value, Bit: integer): integer;
begin
  Result := Value;
  asm
    mov ecx,Bit
    shr Result,cl
    and Result,1
  end;
end;
begin
  StringGridMili.ColCount := Marker.Mili.CodeCount * (2 + 3) + 2 + Length(Marker.XTable) + Length(Marker.YTable);
  StringGridMili.RowCount := Length(Marker.Mili.Table) + 1;

  StringGridMili.Cells[0,0] := 'ÈÑ';
  StringGridMili.Cells[Marker.Mili.CodeCount + 1, 0] := 'ÑÏ';
  for i := 1 to Marker.Mili.CodeCount do
  begin
    StringGridMili.Cells[i, 0] := 'Q' + IntToStr(Marker.Mili.CodeCount - i + 1);
    StringGridMili.Cells[Marker.Mili.CodeCount + 1 + i, 0] := 'Q' + IntToStr(Marker.Mili.CodeCount - i + 1);

    StringGridMili.Cells[Marker.Mili.CodeCount * 2 + 1 + Length(Marker.XTable) + Length(Marker.YTable) + i, 0] := 'R' + IntToStr(Marker.Mili.CodeCount - i + 1);
    StringGridMili.Cells[Marker.Mili.CodeCount * 3 + 1 + Length(Marker.XTable) + Length(Marker.YTable) + i, 0] := 'S' + IntToStr(Marker.Mili.CodeCount - i + 1);
    StringGridMili.Cells[Marker.Mili.CodeCount * 4 + 1 + Length(Marker.XTable) + Length(Marker.YTable) + i, 0] := 'D' + IntToStr(Marker.Mili.CodeCount - i + 1);
  end;

  for i := 0 to High(Marker.XTable) do
    StringGridMili.Cells[Marker.Mili.CodeCount * 2 + 2 + i, 0] := Marker.XTable[High(Marker.XTable) - i];

  for i := 0 to High(Marker.YTable) do
    StringGridMili.Cells[Marker.Mili.CodeCount * 2 + 2 + Length(Marker.XTable) + i, 0] := Marker.YTable[High(Marker.YTable) - i];

//

  for i := 0 to High(Marker.Mili.Table) do
  begin
    StringGridMili.Cells[0, i + 1] := 'a' + IntToStr(Marker.Mili.Table[i].Source);
    StringGridMili.Cells[Marker.Mili.CodeCount + 1, i + 1] := 'a' + IntToStr(Marker.Mili.Table[i].Dest);

    for j := 1 to Marker.Mili.CodeCount do
    begin
      StringGridMili.Cells[j, i + 1] := IntToStr(GetBit(Marker.Mili.Table[i].Source - 1, Marker.Mili.CodeCount - j));
      StringGridMili.Cells[j + Marker.Mili.CodeCount + 1, i + 1] := IntToStr(GetBit(Marker.Mili.Table[i].Dest - 1, Marker.Mili.CodeCount - j));

      RS.GetRS(GetBit(Marker.Mili.Table[i].Source - 1, Marker.Mili.CodeCount - j) = 1, GetBit(Marker.Mili.Table[i].Dest - 1, Marker.Mili.CodeCount - j) = 1);

      StringGridMili.Cells[j + Marker.Mili.CodeCount * 2 + 1 + Length(Marker.XTable) + Length(Marker.YTable), i + 1] := RS.R;
      StringGridMili.Cells[j + Marker.Mili.CodeCount * 3 + 1 + Length(Marker.XTable) + Length(Marker.YTable), i + 1] := RS.S;
      StringGridMili.Cells[j + Marker.Mili.CodeCount * 4 + 1 + Length(Marker.XTable) + Length(Marker.YTable), i + 1] := IntToStr(GetBit(Marker.Mili.Table[i].Dest - 1, Marker.Mili.CodeCount - j));
    end;

    for j := 0 to High(Marker.Mili.Table[i].Input) do
      if Marker.Mili.Table[i].Input[High(Marker.Mili.Table[i].Input) - j]
      then StringGridMili.Cells[Marker.Mili.CodeCount * 2 + 2 + j, i + 1] := '1'
      else StringGridMili.Cells[Marker.Mili.CodeCount * 2 + 2 + j, i + 1] := '0';

    for j := 0 to High(Marker.Mili.Table[i].Output) do
      if Marker.Mili.Table[i].Output[High(Marker.Mili.Table[i].Output) - j]
      then StringGridMili.Cells[Marker.Mili.CodeCount * 2 + 2 + Length(Marker.Mili.Table[i].Input) + j, i + 1] := '1'
      else StringGridMili.Cells[Marker.Mili.CodeCount * 2 + 2 + Length(Marker.Mili.Table[i].Input) + j, i + 1] := '0';
  end;
end;

end.
