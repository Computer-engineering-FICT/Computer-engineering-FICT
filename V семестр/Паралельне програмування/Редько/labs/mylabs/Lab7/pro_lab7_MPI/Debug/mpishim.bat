@echo off

@rem cmdLine will store the arguments to this bat file, without the first two arguments.
@rem The first two arguments are the mpishim path and the computer name. Those arguments
@rem are already in the string below.
set cmdLine=
shift
shift
:VarLoop
  if (%1)==() goto VarLoopEnd
  set cmdLine=%cmdLine%%1 
  shift
goto VarLoop
:VarLoopEnd

"mpiexec.exe" -n 4 -wdir "E:\SkyDrive\Documents\Science\PRO\labs\Lab7\pro_lab7_MPI\Debug\RED\pro_lab7_MPI"  "E:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\Remote Debugger\x86\mpishim100.exe" 31572 127.0.0.1
