Program Drives;

{$M 2048,0,0} { stacksize = 2048 bytes, safe }
{$S-,I-,R-}   { disable stack, I/O and range checking }

uses DrvTypes;

function FloppyDrives : byte; assembler;
{ - returns number of floppy drives in system }
asm
        int 11h
        test al,00000001b
        jz  @@1
        mov cl,6
        shr al,cl
        and al,3
        inc al
        retn
@@1:
        xor al,al
        retn
end;

var C : Char;
    T : array[1..26] of Byte;
    D : Word;

procedure WriteDescription( C : Char; const Desc : String );
 begin
  WriteLn('Drive ',C,': is ',Desc);
 end;

begin
 for C := #1 to #26 do
  T[Byte(C)] := GetDriveType(Byte(C));
 Writeln(#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8#8);
 for C := 'A' to 'Z' do
  case T[Byte(C)-Byte('A')+1] of
   dtCDROM : WriteDescription(C,'CD-ROM drive.');
   dtSUBST : WriteDescription(C,'SUBST''ed drive.');
   dtRemote: WriteDescription(C,'remote (network) drive.');
   dtFixed : WriteDescription(C,'local hard drive.');
   dtRemovable:
       if (Byte(C)-Byte('A')+1) in [1..FloppyDrives] then
        WriteDescription(C,'removable (floppy) drive.');
   dtRAMDrive: WriteDescription(C,'RAM drive.');
  end
end. { Drives }
