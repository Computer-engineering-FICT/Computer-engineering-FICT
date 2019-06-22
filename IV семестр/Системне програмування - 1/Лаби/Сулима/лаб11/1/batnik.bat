@echo off
ml.exe /c /coff /Cp SulymaLib.asm
link /DLL /DEF:def.def /SUBSYSTEM:WINDOWS  /LIBPATH:D:\masm32\lib  SulymaLib.obj
pause
