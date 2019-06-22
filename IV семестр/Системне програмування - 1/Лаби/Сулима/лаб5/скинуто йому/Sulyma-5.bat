@ECHO off

for /f "tokens=*" %%w in('Dir /b/s E:\Sulyma-5.asm') Do(
Set name=%%w
)
if not defined name (pause&&exit)
Set n2 = %name:Sulyma-5.asm=%
cd %n2
ml /c Sulyma-5.asm
link16
Sulyma-5.obj
Sulyma-5.com
nul