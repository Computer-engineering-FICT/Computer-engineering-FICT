{$S-,R-,I-,X+}
{ disable stack, I/O and range checking, enable extended syntax }

unit DrvTypes;
{ drive types }

interface

const
  dtError      = $00; { Invalid drive, letter not assigned }
  dtFixed      = $01; { Fixed drive }
  dtRemovable  = $02; { Removeable (floppy, etc.) drive }
  dtRemote     = $03; { Remote (network) drive }
  dtCDROM      = $04; { MSCDEX V2.00+ driven CD-ROM drive }
  dtSUBST      = $05; { SUBST'ed drive }
  dtRAMDrive   = $06; { RAM drive }


function GetDriveType(Drive : byte) : byte;


implementation

function GetDriveType; assembler;
{ Detects the type for a specified drive. Drive is a drive number to detect the
  type for (0=detect current (default) drive, 1=A, 2=B, 3=C...)

  Returns: One of the dtXXX-constants.}

asm
	cmp	Drive,0

        jne     @CDROMcheck
	mov	ah,19h    { get active drive number in al }
	int	21h
	mov	Drive,al
	inc	Drive
@CDROMcheck:
	mov	ax,1500h  { check for CD-ROM v2.00+ }
	sub	bx,bx
	int	2Fh
	or	bx,bx
	jz	@@2
	mov	ax,150Bh
	sub	ch,ch
	mov	cl,Drive
        dec     cl      { bug fixed with CD-ROM drives, thanx to Ralf Quint }
	int	2Fh     { drives for this function start with 0 for A: }
	cmp	bx,0ADADh
	jne	@@2
	or	ax,ax
	jz	@@2
	mov	bl,dtCDROM
	jmp	@@7
@@2:
	mov	ax,4409h { check for SUBST'ed drive }
	mov	bl,Drive
	int	21h

        jc	@@3
	test	dh,80h

        jz	@@3
	mov	bl,dtSUBST
	jmp	@@7
@@3:
	mov	ax,4409h     { check for remote drive }
	mov	bl,Drive
	int	21h
	jc	@@5
	and	dh,10h

	jz	@@8
	mov	bl,dtRemote
	jmp	@@7
@@8:
        mov     ax,4408h     { check for fixed (hard) drive }
        mov     bl,Drive
        int     21h
        jc      @@5
        or      al,al
        jz      @@6

        push    ds           { check for RAM drive }
        mov     ax,ss
        mov     ds,ax
        mov     si,sp
        sub     sp,28h	     { allocate 28h bytes on stack }
        mov     dx,sp
        mov     ax,440Dh     { generic IOCTL }
        mov     cx,860h      { get device parameters }
        int     21h          { RAMDrive and VDISK don't support this command }
        mov     sp,si
        pop     ds
        mov     bl,dtRAMDrive
        jc      @@7
        mov     bl,dtfixed
        jmp     @@7
@@5:
	sub	bl,bl        { mov bl,dtError cuz dtError=0 }
	jmp	@@7
@@6:
	mov	bl,dtRemovable   { else - removeable media }
@@7:
	mov	al,bl
end; { GetDriveType }

end.
