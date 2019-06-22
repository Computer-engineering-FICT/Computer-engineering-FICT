@echo off
ml.exe /c /coff /Cp Sulyma-12.asm
rc Sulyma.rc
link /SUBSYSTEM:WINDOWS  /LIBPATH:E:\masm32\lib  Sulyma-12.obj Sulyma.res
pause
