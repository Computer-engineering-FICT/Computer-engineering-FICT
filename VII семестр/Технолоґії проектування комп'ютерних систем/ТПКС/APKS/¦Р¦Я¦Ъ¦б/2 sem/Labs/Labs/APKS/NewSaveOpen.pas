//READY
unit NewSaveOpen;

interface

uses
  Dialogs,Classes,Windows;

type
  TNewSaveOpen = class(TObject)
  private
    FNeedSave : Boolean;
    FFileName : String;
    FOpenDialog : TOpenDialog;
    FSaveDialog : TSaveDialog;
    FHWND : HWND;
    function CanContinue(AStream : TStream) : Boolean;
    function GetFileName : String;
    function Save_(AFileName : String; AStream : TStream) : Boolean;
    function Open_(AFileName : String; AStream : TStream) : Boolean;
  public
    constructor Create(ATitle : String; AOpenDialog : TOpenDialog; ASaveDialog : TSaveDialog; AHWND : HWND);
    destructor Destroy; override;
    function New(AStream : TStream) : Boolean;
    function Open(AStream,AStream2 : TStream) : Boolean;
    function Save(AStream : TStream) : Boolean;
    function SaveAs(AStream : TStream) : Boolean;
    procedure Modify;
    property FileName : String read GetFileName;
  end;

implementation

uses
  Controls,FileOperations;

//PUBLIC

//Constructor & destructor
constructor TNewSaveOpen.Create(ATitle : String; AOpenDialog : TOpenDialog; ASaveDialog : TSaveDialog; AHWND : HWND);
begin
  FOpenDialog:= AOpenDialog;
  FSaveDialog:= ASaveDialog;
  FNeedSave:= False;
  FFileName:= '';
  FHWND:= AHWND;
end;

destructor TNewSaveOpen.Destroy;
begin
  inherited Destroy;
end;

//New, open, save, saveas
function TNewSaveOpen.New(AStream : TStream) : Boolean;
begin
  Result:= False;
  if CanContinue(AStream) then
  begin
    FFileName:= '';
    FNeedSave:= False;
    Result:= True;
  end;
end;

function TNewSaveOpen.Open(AStream,AStream2 : TStream) : Boolean;
begin
  Result:= CanContinue(AStream) and (FOpenDialog.Execute)
    and (FOpenDialog.FileName <> '') and Open_(FOpenDialog.FileName,AStream2);
end;

function TNewSaveOpen.Save(AStream : TStream) : Boolean;
begin
  if FFileName = '' then Result:= SaveAs(AStream)
  else Result:= Save_(FFileName,AStream);
end;

function TNewSaveOpen.SaveAs(AStream : TStream) : Boolean;
begin
  Result:= (FSaveDialog.Execute) and (FSaveDialog.FileName <> '')
    and Save_(FSaveDialog.FileName,AStream);
end;

procedure TNewSaveOpen.Modify;
begin
  FNeedSave:= True;
end;

//PRIVATE
function TNewSaveOpen.CanContinue(AStream : TStream) : Boolean;
begin
  Result:= True;
  if FNeedSave then
    case MessageBox(FHWND,'Сохранить изменения в файле?','',MB_YESNOCANCEL+MB_ICONQUESTION) of
    MRYES :  Result:= Save(AStream);
    MRCANCEL : Result:= False;
    end;
end;

function TNewSaveOpen.Save_(AFileName : String; AStream : TStream) : Boolean;
begin
  Result:= False;
  if MakeSave(AFileName,AStream) then
  begin
    FFileName:= AFileName;
    FNeedSave:= False;
    Result:= True;
  end
  else MessageBox(FHWND,'Ошибка при сохранении файла','',MB_OK+MB_ICONERROR)
end;

function TNewSaveOpen.Open_(AFileName : String; AStream : TStream) : Boolean;
begin
  Result:= False;
  if MakeOpen(AFileName,AStream) then
  begin
    FFileName:= AFileName;
    FNeedSave:= False;
    Result:= True;
  end
  else MessageBox(FHWND,'Ошибка при открытии файла','',MB_OK+MB_ICONERROR)
end;

function TNewSaveOpen.GetFileName : String;
begin
  Result:= FFileName;
end;

end.
