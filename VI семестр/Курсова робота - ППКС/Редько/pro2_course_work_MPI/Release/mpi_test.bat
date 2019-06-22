setlocal enabledelayedexpansion

set fileName=testResultsMPI.txt
if not exist %fileName% (
	@echo Tests MPI %time:~0,8% %date:~-10%> %fileName%
) else (
	@echo.>> %fileName%
	@echo Tests MPI %time:~0,8% %date:~-10%>> %fileName%
)
goto next1

# pro2_course_work_Win32.exe fileName N P affinityMask
# 
# Number of cores (affinityMask):
# 1 (1, 2, 4, 8, 16, 32)
# 2 (3, 5, 9, 10, 17, 18, 33, 34, 36, 40, 48)
# 3 (7...)
# 4 (15...)
# 5 (31...)
# 6 (63...)

:next1
rem Hexadecimal values
set afMask[1]=0x1
set afMask[2]=0x3
set afMask[3]=0x7
set afMask[4]=0xF
set afMask[5]=0x1F
set afMask[6]=0x3F

set P=6
set N=400

FOR /L %%I IN (1,1,6) DO (
	start /wait /affinity !afMask[%%I]! mpiexec -n 6 pro2_course_work_MPI.exe %fileName% %N% %P%
	@echo Cores: %%I >>%fileName%
)
@echo.>> %fileName%

set N=600
FOR /L %%I IN (1,1,6) DO (
	start /wait /affinity !afMask[%%I]! mpiexec -n 6 pro2_course_work_MPI.exe %fileName% %N% %P%
	@echo Cores: %%I >>%fileName%
)
@echo.>> %fileName%

set N=800
FOR /L %%I IN (1,1,6) DO (
	start /wait /affinity !afMask[%%I]! mpiexec -n 6 pro2_course_work_MPI.exe %fileName% %N% %P%
	@echo Cores: %%I >>%fileName%
)

endlocal