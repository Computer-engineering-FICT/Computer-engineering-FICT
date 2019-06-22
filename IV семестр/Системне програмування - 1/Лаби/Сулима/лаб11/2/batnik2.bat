@echo off
ml.exe /c /coff /Cp SulymaLibv2.asm
link /DLL /DEF:def.def /NOENTRY /SUBSYSTEM:WINDOWS  /LIBPATH:D:\masm32\lib  SulymaLibv2.obj
pause
