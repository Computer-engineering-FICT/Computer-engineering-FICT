@ECHO Off

Set folder=E:\Lab-Sulyma

If Exist "%folder%\*.*" ECHO %folder% exist
If Not Exist "%folder%\*.*" (
MD E:\Lab-Sulyma
ECHO %folder% create...
)

ECHO find file...
for /f "tokens=*" %%a in ('Dir /b/s/a-d E:\Sulyma-3.asm') Do Set $Path=%%a
ECHO Path: %$Path%

COPY %$Path% E:\Lab-Sulyma\Sulyma-3.asm

ECHO files deleted...
for /f "tokens=*" %%b in ('Dir /b/s/a-d E:\Sulyma-3.obj') Do del %%b
for /f "tokens=*" %%c in ('Dir /b/s/a-d E:\Sulyma-3.exe') Do del %%c

CD /d E:\Lab-Sulyma

@CHOICE /C:123
IF ERRORLEVEL 3 exit
IF ERRORLEVEL 2 ml /c /coff E:\Lab-Sulyma\Sulyma-3.asm && link /subsystem:console Sulyma-3.obj
IF ERRORLEVEL 1 ml /c /coff E:\Lab-Sulyma\Sulyma-3.asm
pause