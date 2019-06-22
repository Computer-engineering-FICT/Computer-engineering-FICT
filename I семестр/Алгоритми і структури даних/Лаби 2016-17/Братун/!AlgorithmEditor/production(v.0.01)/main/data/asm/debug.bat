cd data\asm\result
del program.obj program.exe
GoAsm /fo program.obj program.asm
GoLink /console program.obj kernel32.dll
program.exe
pause
exit
cls