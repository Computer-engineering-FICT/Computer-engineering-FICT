//READY
unit FileOperations;

interface

uses
  Classes;

function MakeSave(AFileName : String; AStream : TStream) : Boolean;
function MakeOpen(AFileName : String; AStream : TStream) : Boolean;

implementation

uses
  SysUtils;

//UNIT PRIVATE
const
  FILE_SIG_BYTES = 14;
  FILE_SIG : array [0..FILE_SIG_BYTES-1] of Char =
  ('A','P','K','S','_','L','A','B','1','_','V','1','.','0');

function CountCode(AStream : TStream) : Cardinal;
var
  Code : Cardinal;
  Tmp : Byte;
  I,Len : Integer;
begin
  AStream.Position:= 0;
  Len:= AStream.Size;
  Code:= 0;
  for I:= 1 to Len do
  begin
    AStream.ReadBuffer(Tmp,SizeOf(Tmp));
    Code:= Code+Tmp;
  end;
  Result:= Code;
end;

//UNIT PUBLIC
function MakeSave(AFileName : String; AStream : TStream) : Boolean;
var
  SaveStream : TFileStream;
  Len : Integer;
  Code : Cardinal;
begin
  Result:= False;
  Len:= AStream.Size;
  try
    Code:= CountCode(AStream);
    SaveStream:= TFileStream.Create(AFileName,fmCreate);
    SaveStream.WriteBuffer(FILE_SIG,SizeOf(FILE_SIG));
    SaveStream.WriteBuffer(Len,SizeOf(Len));
    SaveStream.WriteBuffer(Code,SizeOf(Code));
    SaveStream.CopyFrom(AStream,0);
  except
    try
      SaveStream.Destroy;
    except
    end;
    Exit;
  end;
 try
   SaveStream.Destroy;
   Result:= True;
 except
 end;
end;


function MakeOpen(AFileName : String; AStream : TStream) : Boolean;
var
  OpenStream : TFileStream;
  Len : Integer;
  Code : Cardinal;
  Sig : array [0..FILE_SIG_BYTES-1] of Char;
begin
  Result:= False;
  try
    OpenStream:= TFileStream.Create(AFileName,fmOpenRead);
    OpenStream.ReadBuffer(Sig,SizeOf(Sig));
    OpenStream.ReadBuffer(Len,SizeOf(Len));
    OpenStream.ReadBuffer(Code,SizeOf(Code));
    AStream.Position:= 0;
    AStream.CopyFrom(OpenStream,Len);
    if (Sig <> FILE_SIG) or (Len <> AStream.Size) or (Code <> CountCode(AStream)) then
    try
      OpenStream.Destroy;
      Exit;
    except
      Exit;
    end;
  except
    try
      OpenStream.Destroy;
    except
    end;
    Exit;
  end;
  try
    OpenStream.Destroy;
    Result:= True;
  except
  end;
end;

end.
